# vehicles/specializations/AIAutomaticSteering.lua

*[English version](../../../../scripts/vehicles/specializations/AIAutomaticSteering.md)*

Source: `dataS/scripts/vehicles/specializations/AIAutomaticSteering.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule qui réalise l'assistance à la conduite (direction automatique le long des lignes d'un parcours de champ) pour les véhicules conduisibles ; elle exige la spécialisation Drivable. Elle demande au serveur de générer un parcours via g_fieldCourseManager, suit la ligne courante en remplaçant l'entrée de direction et la physique du véhicule, et joue les sons d'activation, de désactivation et de fin de ligne. Le parcours est sauvegardé avec le véhicule, transmis aux clients qui rejoignent et synchronisé par des événements. Les constantes comme STATE, HEADING_LETTERS et les seuils de distance ne sont pas visibles dans le dump (NON VÉRIFIÉ).

- **AIAutomaticSteering** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIAutomaticSteering.prerequisitesPresent(specializations: table) → boolean` | 43 | ✍ Renvoie vrai uniquement si le type de véhicule contient la spécialisation Drivable, seul prérequis de la direction automatique. |
| `AIAutomaticSteering.initSpecialization()` | 49 | ✍ Déclare les entrées du schéma XML : sons engage, disengage et lineEnd, quatre valeurs de tableau de bord et l'option lookAheadDistance sous vehicle.ai.automaticSteering. Déclare aussi les chemins de sauvegarde des parcours de champ et des drapeaux isOnField et courseWasActive. |
| `AIAutomaticSteering.registerEvents(vehicleType: any)` | 72 | ✍ Enregistre l'événement de véhicule onAIAutomaticSteeringLineEnd, déclenché côté serveur quand le véhicule approche de la fin d'une ligne. |
| `AIAutomaticSteering.registerFunctions(vehicleType: table)` | 80 | ✍ Ajoute au type de véhicule les fonctions publiques de la spécialisation : largeur de travail, tests d'autorisation, activation de la direction, définition ou génération du parcours, état, distance d'anticipation et inversion du décalage latéral. |
| `AIAutomaticSteering.registerOverwrittenFunctions(vehicleType: table)` | 95 | ✍ Surcharge setSteeringInput et updateVehiclePhysics du type de véhicule pour que l'assistance se coupe à l'entrée manuelle et injecte sa propre valeur de direction. |
| `AIAutomaticSteering.registerEventListeners(vehicleType: table)` | 103 | ✍ Abonne la spécialisation aux rappels de chargement, post-chargement, suppression, flux réseau, mise à jour, changement d'état, mode IA, activation, sortie du véhicule, tableau de bord et événements d'action. |
| `AIAutomaticSteering:onLoad(savegame: table)` | 126 | ✍ Initialise l'état de direction dans spec_aiAutomaticSteering, lit l'option lookAheadDistance du XML, charge les trois sons côté client et enregistre le réglage de véhicule STEERING_ASSIST_CRUISE_CONTROL. Réserve aussi le drapeau de modification pour la synchro des états de segments. |
| `AIAutomaticSteering:onPostLoad(savegame: any)` | 164 | ✍ Au chargement d'une sauvegarde non réinitialisée, restaure le drapeau isOnField, le dernier parcours actif et le parcours courant, en appliquant ce dernier via setAIAutomaticSteeringCourse sans envoyer d'événement. |
| `AIAutomaticSteering:onRegisterDashboardValueTypes()` | 192 | ✍ Enregistre quatre valeurs de tableau de bord : steeringEngaged, steeringState (état moins un), heading en degrés et headingLetter (lettre de boussole selon huit secteurs de 45 degrés). À noter : headingLetter utilise la direction arrière alors que heading utilise l'avant. |
| `AIAutomaticSteering:onDelete()` | 251 | ✍ Libère les échantillons sonores chargés à la suppression du véhicule. |
| `AIAutomaticSteering:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 260 | ✍ Écrit dans l'entrée de sauvegarde du véhicule les drapeaux courseWasActive et isOnField, le parcours courant et le dernier parcours actif s'il diffère du courant. |
| `AIAutomaticSteering:onReadStream(streamId: integer, connection: Connection)` | 279 | ✍ Côté client à la connexion : lit un booléen et, s'il est vrai, le parcours de champ complet du flux, l'applique sans envoyer d'événement et marque le véhicule comme sur un champ. |
| `AIAutomaticSteering:onWriteStream(streamId: integer, connection: Connection)` | 293 | ✍ Côté serveur à la connexion : écrit si un parcours existe puis, le cas échéant, le parcours entier dans le flux. |
| `AIAutomaticSteering:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 302 | ✍ Sur un client recevant du serveur, lit le drapeau puis les états par segment dans le parcours courant. |
| `AIAutomaticSteering:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 312 | ✍ Sur le serveur, écrit les états des segments quand le drapeau de modification de la spécialisation est dans le masque. À noter : steeringFieldCourse est utilisé sans test de nil, on suppose donc que le drapeau n'est levé que si un parcours existe. |
| `AIAutomaticSteering:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 326 | ✍ En mode assistance, fournit au parcours la position et le cap du véhicule depuis un point d'anticipation dépendant de la vitesse. Le serveur calcule alors une valeur de direction cible, la fait évoluer à la vitesse de direction IA, déclenche l'événement de fin de ligne et peut couper le régulateur près de la fin. Marque aussi les états de segments pour la synchro réseau. |
| `AIAutomaticSteering:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 437 | ✍ Pour le véhicule actif localement, vérifie via la carte de densité du terrain et l'accès aux terres de la ferme s'il est sur un champ ; si cela change ou si une mise à jour est forcée, il demande un nouveau parcours au serveur (AIAutomaticSteeringRequestEvent) ou lance un minuteur pour l'effacer. Sur le serveur, il coupe la direction si le sens de marche s'inverse en roulant. |
| `AIAutomaticSteering:onStateChange(state: any, data: any)` | 532 | ✍ À l'attelage (hors sauvegarde) ou au dételage, force le rafraîchissement du parcours et oublie le dernier parcours actif ; le serveur repasse du mode assistance au mode WORKER si la direction automatique n'est plus autorisée. |
| `AIAutomaticSteering:onAIModeChanged(aiMode: any)` | 548 | ✍ Efface le parcours quand le mode IA quitte l'assistance ; à l'entrée dans ce mode sur un véhicule actif en entrée, programme une mise à jour du parcours. |
| `AIAutomaticSteering:onAIModeSettingsChanged(aiMode: any)` | 560 | ✍ Quand les réglages de l'assistance changent sur le véhicule contrôlé, abandonne le parcours courant et en programme un nouveau. |
| `AIAutomaticSteering:onAIAutomaticSteeringLineEnd()` | 572 | ✍ Gestionnaire d'événement qui joue le son de fin de ligne. |
| `AIAutomaticSteering:onActivate()` | 579 | ✍ Quand le véhicule devient actif en mode assistance et possède un parcours, enregistre ce parcours comme parcours actif dans g_fieldCourseManager. |
| `AIAutomaticSteering:onLeaveVehicle(wasEntered: any)` | 592 | ✍ Serveur uniquement : quand le joueur quitte un véhicule non en cours de suppression, efface le parcours actif du gestionnaire de parcours et désactive la direction automatique. |
| `AIAutomaticSteering:getAttacherToolWorkingWidth()` | 607 | ✍ Renvoie la plus grande largeur de travail parmi les véhicules enfants du véhicule racine, d'après leurs marqueurs IA ou la largeur de zone de travail IA ; 0 si aucune n'est fournie. Met à jour la largeur de chaque marqueur au passage. |
| `AIAutomaticSteering:getIsAutomaticSteeringAllowed()` | 629 | ✍ Renvoie vrai si le véhicule racine ou l'un de ses véhicules enfants indique getImplementAllowAutomaticSteering à vrai, faux sinon. |
| `AIAutomaticSteering:setAIAutomaticSteeringEnabled(isEnabled: any, segmentIndex: any, segmentIsLeft: any, noEventSend: any)` | 649 | ✍ Active, désactive ou bascule (nil) la direction, joue le son d'activation ou de désactivation et met à jour les tableaux de bord côté client, et synchronise le segment de ligne courant. Envoie AIAutomaticSteeringStateEvent sauf si noEventSend est vrai ; renvoie l'index et le côté du segment. |
| `AIAutomaticSteering:setAIAutomaticSteeringCourse(steeringFieldCourse: any, noEventSend: any)` | 705 | ✍ Définit ou efface le parcours de direction, désactive la direction si on l'efface, met à jour le parcours actif du gestionnaire et l'interface, et diffuse AIAutomaticSteeringCourseEvent (serveur) ou l'envoie au serveur (client) sauf si noEventSend est vrai. |
| `AIAutomaticSteering:generateSteeringFieldCourse(x: any, z: any, fieldCourseSettings: any)` | 738 | ✍ Réutilise le dernier parcours actif si le point est dedans et que les réglages sont identiques ; sinon demande à g_fieldCourseManager de générer un parcours à cette position, en mettant en attente une seule requête pendant une génération. En cas d'échec, le parcours est effacé. |
| `AIAutomaticSteering:getIsAIAutomaticSteeringAllowed()` | 781 | ✍ Renvoie vrai si un parcours avec un segment courant existe ; sinon renvoie faux accompagné d'un texte d'avertissement localisé (pas de parcours ou pas de segment). |
| `AIAutomaticSteering:getAIAutomaticSteeringState()` | 796 | ✍ Renvoie ACTIVE si un parcours existe et la direction est active, AVAILABLE si un parcours existe mais la direction est coupée, DISABLED sans parcours. Les valeurs numériques de STATE ne sont pas dans le dump (NON VÉRIFIÉ). |
| `AIAutomaticSteering:getAIAutomaticSteeringLookAheadDistance()` | 811 | ✍ Renvoie la lookAheadDistance configurée dans le XML ou, par défaut, le décalage Z maximal du nœud racine IA en marche avant et son décalage Z minimal en marche arrière. |
| `AIAutomaticSteering:getIsSideOffsetReversed()` | 822 | ✍ Cherche une charrue parmi les véhicules enfants et renvoie sa valeur rotationMax ; renvoie faux s'il n'y en a pas. Indique au parcours si le décalage latéral est inversé. |
| `AIAutomaticSteering:setSteeringInput(superFunc: any, inputValue: any, isAnalog: any, deviceCategory: any)` | 834 | ✍ Surcharge de setSteeringInput. Quand l'assistance est active, une entrée clavier/souris la coupe aussitôt ; pour les autres périphériques, une variation supérieure à 0,1 après un délai de grâce de 2,5 s la coupe. Appelle ensuite la fonction parente. |
| `AIAutomaticSteering:updateVehiclePhysics(superFunc: any, axisForward: any, axisSide: any, doHandbrake: any, dt: any)` | 860 | ✍ Surcharge de updateVehiclePhysics : quand la direction est active, remplace l'axe latéral par la valeur issue de la cible de direction calculée, appelle le parent, puis impose cette valeur à rotatedTime et à l'axe latéral de Drivable. |
| `AIAutomaticSteering:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 881 | ✍ Côté client : enregistre l'action TOGGLE_AI_STEERING (priorité haute, avec le libellé d'assistance à la conduite) et l'action masquée TOGGLE_AI_STEERING_LINES pour le véhicule actif en entrée. |
| `AIAutomaticSteering.actionEventSteering(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 905 | ✍ Rappel d'entrée qui active ou désactive la direction automatique. |
| `AIAutomaticSteering.updateActionEvents(self: any)` | 911 | ✍ Active l'action de bascule de la direction seulement si un parcours avec un segment courant existe. |
| `AIAutomaticSteering.actionEventSteeringLines(self: any)` | 922 | ✍ Rappel d'entrée qui inverse le réglage de jeu STEERING_ASSIST_LINES (afficher ou masquer les lignes de guidage) et l'enregistre. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onAIAutomaticSteeringLineEnd` | 73 |
| registerFunction | `getAttacherToolWorkingWidth` | 81 |
| registerFunction | `getIsAutomaticSteeringAllowed` | 82 |
| registerFunction | `setAIAutomaticSteeringEnabled` | 83 |
| registerFunction | `setAIAutomaticSteeringCourse` | 84 |
| registerFunction | `generateSteeringFieldCourse` | 85 |
| registerFunction | `getIsAIAutomaticSteeringAllowed` | 86 |
| registerFunction | `getAIAutomaticSteeringState` | 87 |
| registerFunction | `getAIAutomaticSteeringLookAheadDistance` | 88 |
| registerFunction | `getIsSideOffsetReversed` | 89 |
| registerOverwrittenFunction | `setSteeringInput` | 96 |
| registerOverwrittenFunction | `updateVehiclePhysics` | 97 |
| registerEventListener | `onLoad` | 104 |
| registerEventListener | `onPostLoad` | 105 |
| registerEventListener | `onRegisterDashboardValueTypes` | 106 |
| registerEventListener | `onDelete` | 107 |
| registerEventListener | `onReadStream` | 108 |
| registerEventListener | `onWriteStream` | 109 |
| registerEventListener | `onReadUpdateStream` | 110 |
| registerEventListener | `onWriteUpdateStream` | 111 |
| registerEventListener | `onUpdate` | 112 |
| registerEventListener | `onUpdateTick` | 113 |
| registerEventListener | `onStateChange` | 114 |
| registerEventListener | `onAIModeChanged` | 115 |
| registerEventListener | `onAIModeSettingsChanged` | 116 |
| registerEventListener | `onAIAutomaticSteeringLineEnd` | 117 |
| registerEventListener | `onActivate` | 118 |
| registerEventListener | `onLeaveVehicle` | 119 |
| registerEventListener | `onRegisterActionEvents` | 120 |
