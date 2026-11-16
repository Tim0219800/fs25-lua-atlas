# vehicles/specializations/AttacherJointControl.lua

*[English version](../../../../scripts/vehicles/specializations/AttacherJointControl.md)*

Source: `dataS/scripts/vehicles/specializations/AttacherJointControl.lua` — FS25 1.25.1.0

✍ Spécialisation pour les outils dont la hauteur et l'inclinaison de l'attache peuvent être réglées en continu par le joueur (axe analogique ou touche lever/abaisser) au lieu d'une simple bascule haut/bas. Elle exige Attachable et lit ses réglages dans vehicle.attacherJointControl du XML (angle d'inclinaison maximal, amortissement Y optionnel, une entrée de commande par axe, son hydraulique). Elle modifie l'attache côté tracteur pendant l'attelage, sauvegarde et restaure les valeurs de l'attache au dételage, et synchronise en multijoueur les valeurs de commande (alpha de 0 à 1 compressé dans un flux). Les constantes ALPHA_NUM_BITS et ALPHA_MAX_VALUE ne sont pas visibles dans ce dump (NON VÉRIFIÉ).

- **AttacherJointControl** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AttacherJointControl.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Vérification des prérequis : retourne true seulement si le type de véhicule inclut déjà la spécialisation Attachable. |
| `AttacherJointControl.initSpecialization()` | 26 | ✍ Déclare le schéma XML de vehicle.attacherJointControl (angle d'inclinaison, amortissement, entrées de commande avec fonction, axe, icône, inversion et facteur souris, son hydraulique) et l'indicateur isControllable sur les attaches d'entrée et leurs configurations. |
| `AttacherJointControl.registerFunctions(vehicleType: any)` | 50 | ✍ Enregistre les fonctions ajoutées par cette spécialisation : controlAttacherJoint, controlAttacherJointHeight, controlAttacherJointTilt, getControlAttacherJointDirection et getIsAttacherJointControlDampingAllowed. |
| `AttacherJointControl.registerOverwrittenFunctions(vehicleType: any)` | 60 | ✍ Enregistre les surcharges de fonctions d'Attachable : loadInputAttacherJoint, registerLoweringActionEvent, getLoweringActionEventState et getCanBeSelected. |
| `AttacherJointControl.registerEventListeners(vehicleType: any)` | 69 | ✍ Abonne la spécialisation aux événements de chargement, suppression, lecture/écriture de flux, mise à jour, enregistrement des événements d'action, post-attelage et pré-dételage. |
| `AttacherJointControl:onLoad(savegame: table)` | 85 | ✍ Charge l'angle d'inclinaison maximal, les options d'amortissement et chaque entrée de commande (nom de fonction, action d'entrée, icône, inversion, facteur souris). Une fonction ou un axe inconnu émet un avertissement et arrête le chargement des commandes suivantes. Charge le son hydraulique côté client, crée deux indicateurs de modification et retire la plupart des écouteurs s'il n'y a aucune commande. |
| `AttacherJointControl:onDelete()` | 181 | ✍ Supprime l'échantillon sonore hydraulique côté client. |
| `AttacherJointControl:onReadStream(streamId: integer, connection: Connection)` | 192 | ✍ Côté client lors de la connexion : quand l'indicateur serveur est vrai, lit l'alpha mémorisé de chaque commande et l'applique via controlAttacherJoint sans envoi d'événement. |
| `AttacherJointControl:onWriteStream(streamId: integer, connection: Connection)` | 208 | ✍ Côté serveur lors de la connexion : écrit si une attache est actuellement pilotée et, le cas échéant, l'alpha de chaque commande. |
| `AttacherJointControl:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 224 | ✍ Lit dans le flux de mise à jour les valeurs alpha de chaque commande, du client vers le serveur ou du serveur vers le client, et les applique sans renvoyer d'événement. |
| `AttacherJointControl:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 248 | ✍ Écrit l'alpha de chaque commande quand l'indicateur de modification correspondant à la direction est levé : l'indicateur client en envoi vers le serveur, l'indicateur serveur (changements d'amortissement) en envoi vers les clients. |
| `AttacherJointControl:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 270 | ✍ Mise à jour à chaque image. Déplace l'alpha de hauteur vers sa cible à la vitesse de déplacement de l'attache. Côté serveur, avec l'amortissement activé, compense aussi la vitesse verticale au point de référence d'amortissement et peut ajuster l'inclinaison. Joue le son hydraulique peu de temps après le dernier mouvement. À noter : spec.samples et spec.lastMoveTime ne sont définis que côté client, donc un serveur sans partie cliente pourrait échouer ici (NON VÉRIFIÉ). |
| `AttacherJointControl:controlAttacherJoint(control: table, moveAlpha: number, automaticControl: any, noEventSend: any)` | 344 | ✍ Définit l'alpha d'une commande. Côté serveur, appelle la fonction de commande, met à jour la rotation et le repère du joint. Mémorise la valeur bornée entre 0 et 1, enregistre l'instant manuel pour l'amortissement, et lève un indicateur de modification client ou serveur si le changement est assez grand, sauf si noEventSend est fourni. |
| `AttacherJointControl:controlAttacherJointHeight(moveAlpha: number) → number` | 386 | ✍ Fonction de commande de hauteur : borne l'alpha entre l'alpha haut et l'alpha bas de l'attache, met à jour les nœuds de rotation et la rotation de l'attache, et retourne l'alpha limité. Utilise l'alpha courant de l'attache si appelée avec nil. |
| `AttacherJointControl:controlAttacherJointTilt(moveAlpha: number) → number` | 409 | ✍ Fonction de commande d'inclinaison : borne l'alpha entre 0 et 1 (0,5 si nil), le convertit en angle autour du neutre avec l'angle d'inclinaison maximal et décale les décalages de rotation haut et bas de l'attache par rapport à leurs sauvegardes. Retourne l'alpha limité. |
| `AttacherJointControl:getControlAttacherJointDirection() → boolean` | 428 | ✍ Retourne true quand le prochain appui lever/abaisser doit abaisser l'outil : d'après la cible courante si elle existe, sinon selon que la hauteur est plus proche de la position haute. |
| `AttacherJointControl:getIsAttacherJointControlDampingAllowed() → boolean` | 441 | ✍ Indique si l'amortissement Y peut s'exécuter : false si la dernière vitesse du véhicule porteur est inférieure à 0,5 ou si l'outil n'avance pas. |
| `AttacherJointControl:loadInputAttacherJoint(superFunc: table, xmlFile: any, key: any, inputAttacherJoint: any, i: any)` | 457 | ✍ Surcharge : après le chargement d'une attache d'entrée par la base, lit aussi son indicateur isControllable. Retourne false si la base échoue. |
| `AttacherJointControl:registerLoweringActionEvent(superFunc: any, actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any)` | 469 | ✍ Surcharge : quand un contrôleur de hauteur existe, enregistre l'action lever/abaisser avec le rappel de point de consigne et une priorité de texte élevée, et s'arrête là si l'action demandée est l'abaissement. Sinon délègue à la base. |
| `AttacherJointControl:getLoweringActionEventState(superFunc: any)` | 485 | ✍ Surcharge : avec un contrôleur de hauteur, l'action n'est affichée que tant qu'une attache est pilotée et son texte indique abaisser ou lever selon la direction de commande ; sinon délègue à la base. |
| `AttacherJointControl:getCanBeSelected(superFunc: any)` | 507 | ✍ Surcharge : le véhicule peut toujours être sélectionné ; retourne true. |
| `AttacherJointControl:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 513 | ✍ Côté client uniquement : vide les événements d'action et, quand le véhicule est actif pour la saisie et qu'une attache est pilotée, enregistre un événement d'action analogique alimenté par commande avec son action d'entrée et son icône d'axe. |
| `AttacherJointControl:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer, loadFromSavegame: any)` | 534 | ✍ Si l'attache d'entrée active est pilotable et que l'attache du tracteur a une plage de hauteur, désactive son abaissement normal, sauvegarde ses décalages de rotation, la mémorise comme attache pilotée et réinitialise les commandes. Relève ensuite l'outil (cible l'alpha haut, ou l'applique immédiatement si chargé depuis une sauvegarde). |
| `AttacherJointControl:onPreDetach(attacherVehicle: table, implement: table)` | 577 | ✍ Avant le dételage, restaure depuis leurs sauvegardes l'indicateur allowsLowering et les décalages de rotation de l'attache du tracteur, et efface l'attache pilotée. |
| `AttacherJointControl.actionEventAttacherJointControl(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 590 | ✍ Rappel d'entrée pour un axe de commande analogique : met l'entrée à l'échelle avec le facteur souris (et un facteur fixe de 0,025), l'inverse si configuré, l'applique à l'alpha de la commande comme changement manuel et annule toute cible de hauteur. |
| `AttacherJointControl.actionEventAttacherJointControlSetPoint(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 608 | ✍ Rappel d'entrée pour la touche lever/abaisser : fixe la cible de hauteur à l'alpha bas ou haut selon la direction courante et retarde les mises à jour d'amortissement du temps de déplacement de l'attache. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `controlAttacherJoint` | 51 |
| registerFunction | `controlAttacherJointHeight` | 52 |
| registerFunction | `controlAttacherJointTilt` | 53 |
| registerFunction | `getControlAttacherJointDirection` | 54 |
| registerFunction | `getIsAttacherJointControlDampingAllowed` | 55 |
| registerOverwrittenFunction | `loadInputAttacherJoint` | 61 |
| registerOverwrittenFunction | `registerLoweringActionEvent` | 62 |
| registerOverwrittenFunction | `getLoweringActionEventState` | 63 |
| registerOverwrittenFunction | `getCanBeSelected` | 64 |
| registerEventListener | `onLoad` | 70 |
| registerEventListener | `onDelete` | 71 |
| registerEventListener | `onReadStream` | 72 |
| registerEventListener | `onWriteStream` | 73 |
| registerEventListener | `onReadUpdateStream` | 74 |
| registerEventListener | `onWriteUpdateStream` | 75 |
| registerEventListener | `onUpdate` | 76 |
| registerEventListener | `onRegisterActionEvents` | 77 |
| registerEventListener | `onPostAttach` | 78 |
| registerEventListener | `onPreDetach` | 79 |
