# vehicles/specializations/ReverseDriving.lua

*[English version](../../../../scripts/vehicles/specializations/ReverseDriving.md)*

Source: `dataS/scripts/vehicles/specializations/ReverseDriving.lua` — FS25 1.25.1.0

✍ Spécialisation de véhicule pour les tracteurs à poste de conduite réversible (conduite inversée). Exige Drivable, Enterable et AnimatedVehicle. Une animation nommée (par défaut reverseDriving) retourne la cabine, le volant et les cibles IK du personnage sont échangés, la direction du réversible et celle des feux suivent, et l'IA utilise un nœud de direction dédié. L'état est sauvegardé (isActive), envoyé aux clients qui rejoignent via le flux et synchronisé par ReverseDrivingSetStateEvent. Déclenche onStartReverseDirectionChange et onReverseDirectionChanged.

- **ReverseDriving** (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ReverseDriving.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Retourne true seulement si Drivable, Enterable et AnimatedVehicle sont toutes présentes sur le type de véhicule. |
| `ReverseDriving.initSpecialization()` | 27 | ✍ Enregistre les entrées du schéma XML sous vehicle.reverseDriving (cibles IK, volant, nom d'animation, masquage du personnage, transmission inversée, état initial, attaches bloquantes, nœuds IA), un indicateur de groupe de dashboard, enableDirection par feu, et la clé de sauvegarde isActive. |
| `ReverseDriving.postInitSpecialization()` | 63 | ✍ Pour chaque type de configuration de véhicule, enregistre le booléen optionnel reverseDriving#isAllowed (true par défaut) permettant à une configuration d'interdire la conduite inversée. |
| `ReverseDriving.registerEvents(vehicleType: any)` | 76 | ✍ Déclare les événements onStartReverseDirectionChange et onReverseDirectionChanged sur le type de véhicule. |
| `ReverseDriving.registerFunctions(vehicleType: any)` | 83 | ✍ Enregistre reverseDirectionChanged, setIsReverseDriving et getIsReverseDrivingAllowed sur le type de véhicule. |
| `ReverseDriving.registerOverwrittenFunctions(vehicleType: any)` | 91 | ✍ Surcharge le volant et la direction, la visibilité du personnage, le démarrage de l'IA et ses getters de nœuds, le chargement et l'activité des groupes de dashboard, la sélection, les attributs de feux additionnels et l'activité des feux. |
| `ReverseDriving.registerEventListeners(vehicleType: any)` | 108 | ✍ S'abonne à onLoad, onPostLoad, onReadStream, onWriteStream, onUpdate, onVehicleCharacterChanged et onRegisterActionEvents. |
| `ReverseDriving:onLoad(savegame: table)` | 121 | ✍ Lit les réglages XML (cibles IK inversées, volant, nom d'animation, options, nœud de direction IA et déclencheur de collision) et applique les restrictions de configuration. hasReverseDriving n'est vrai que si l'animation existe et qu'aucune configuration ne l'interdit ; sinon la plupart des écouteurs sont retirés. |
| `ReverseDriving:onPostLoad(savegame: table)` | 182 | ✍ Mémorise les cibles IK par défaut du personnage, restaure l'état isActive sauvegardé (ou l'état initial) et l'applique via setIsReverseDriving sans envoi d'événement et avec mise à jour forcée. |
| `ReverseDriving:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 201 | ✍ Écrit l'état de conduite inversée dans la sauvegarde, seulement si le véhicule la supporte. |
| `ReverseDriving:onReadStream(streamId: integer, connection: Connection)` | 212 | ✍ Côté client à la connexion : lit un booléen du flux et l'applique comme état de conduite inversée sans envoyer d'événement. |
| `ReverseDriving:onWriteStream(streamId: integer, connection: Connection)` | 223 | ✍ Côté serveur à la connexion : écrit l'état courant de conduite inversée sous forme de booléen. |
| `ReverseDriving:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 232 | ✍ Pendant le changement de sens : masque le personnage si configuré, avance l'animation d'un coup pour un véhicule inoccupé, appelle reverseDirectionChanged à la fin de l'animation et fait évoluer smoothReverserDirection vers sa cible. |
| `ReverseDriving:reverseDirectionChanged(direction: number)` | 262 | ✍ Termine le changement : fixe la direction du réversible (-1 inversé, 1 normal), restaure les bonnes cibles IK et la visibilité du personnage, rafraîchit le masque de feux et déclenche onReverseDirectionChanged avec la direction donnée. |
| `ReverseDriving:setIsReverseDriving(isReverseDriving: boolean, noEventSend: boolean, forceUpdate: any)` | 300 | ✍ Bascule la conduite inversée : joue l'animation dans un sens ou l'autre, gèle les mises à jour IK du personnage, inverse éventuellement la transmission, met le réversible à zéro, déclenche onStartReverseDirectionChange, envoie ReverseDrivingSetStateEvent sauf noEventSend et marque le nœud racine IA comme à recalculer. S'exécute aussi avec forceUpdate, qui termine l'animation instantanément. |
| `ReverseDriving:getIsReverseDrivingAllowed(newState: any)` | 335 | ✍ Retourne false si l'on demande d'activer la conduite inversée alors qu'un outil est attaché sur l'une des attaches bloquantes ; true sinon. |
| `ReverseDriving:updateSteeringWheel(superFunc: any, steeringWheel: any, dt: any, direction: any)` | 352 | ✍ Surchargée : en conduite inversée, utilise le volant dédié (s'il existe) et inverse la direction de braquage avant d'appeler le parent. |
| `ReverseDriving:getSteeringDirection(superFunc: any)` | 368 | ✍ Surchargée : retourne la direction lissée du réversible si la conduite inversée est supportée, sinon la valeur du parent. |
| `ReverseDriving:getAllowCharacterVisibilityUpdate(superFunc: any)` | 379 | ✍ Surchargée : résultat du parent, mais false pendant le changement de sens si le personnage doit être masqué pendant ce changement. |
| `ReverseDriving:getCanStartAIVehicle(superFunc: any, jobClass: any)` | 386 | ✍ Surchargée : si le véhicule n'a pas de nœud de direction IA mais supporte la conduite inversée, l'IA ne peut pas démarrer en mode inversé ou pendant un changement de sens. Sinon, délègue au parent. |
| `ReverseDriving:loadDashboardGroupFromXML(superFunc: any, xmlFile: any, key: any, group: any)` | 406 | ✍ Surchargée : après le chargement du groupe de dashboard par le parent, lit aussi sa condition isReverseDriving. Retourne false si le parent échoue. |
| `ReverseDriving:getIsDashboardGroupActive(superFunc: any, group: any)` | 418 | ✍ Surchargée : un groupe ayant une condition isReverseDriving est inactif si elle ne correspond pas à l'état courant ; sinon le parent décide. |
| `ReverseDriving:getCanBeSelected(superFunc: any)` | 430 | ✍ Surchargée pour toujours retourner true. |
| `ReverseDriving:loadAdditionalLightAttributesFromXML(superFunc: any, xmlFile: any, key: any, light: any)` | 436 | ✍ Surchargée : après le parent, lit l'attribut optionnel enableDirection d'un feu. Retourne false si le parent échoue. |
| `ReverseDriving:getIsLightActive(superFunc: any, light: any)` | 448 | ✍ Surchargée : un feu ayant enableDirection est inactif sauf s'il correspond à la direction courante du réversible ; sinon le parent décide. |
| `ReverseDriving:getAIDirectionNode(superFunc: any)` | 460 | ✍ Surchargée : en mode inversé, retourne le nœud de direction IA s'il est défini, sinon celui du parent. |
| `ReverseDriving:getAIRootNode(superFunc: any)` | 471 | ✍ Surchargée : en mode inversé, retourne le nœud de direction IA s'il est défini, sinon celui du parent. |
| `ReverseDriving:getAIImplementCollisionTrigger(superFunc: any)` | 482 | ✍ Surchargée : en mode inversé, retourne le déclencheur de collision IA inversé s'il a été chargé, sinon celui du parent. |
| `ReverseDriving:onVehicleCharacterChanged(character: any)` | 493 | ✍ Quand un personnage est défini, termine toute mise à jour d'animation en attente et lui attribue les cibles IK inversées ou par défaut. |
| `ReverseDriving:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 512 | ✍ Côté client, enregistre l'action CHANGE_DRIVING_DIRECTION (action nécessitant le moteur) quand actif pour l'entrée, avec son libellé. |
| `ReverseDriving.actionEventToggleReverseDriving(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 526 | ✍ Callback d'entrée : bascule la conduite inversée si getIsReverseDrivingAllowed accepte le nouvel état. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onStartReverseDirectionChange` | 77 |
| registerEvent | `onReverseDirectionChanged` | 78 |
| registerFunction | `reverseDirectionChanged` | 84 |
| registerFunction | `setIsReverseDriving` | 85 |
| registerFunction | `getIsReverseDrivingAllowed` | 86 |
| registerOverwrittenFunction | `updateSteeringWheel` | 92 |
| registerOverwrittenFunction | `getSteeringDirection` | 93 |
| registerOverwrittenFunction | `getAllowCharacterVisibilityUpdate` | 94 |
| registerOverwrittenFunction | `getCanStartAIVehicle` | 95 |
| registerOverwrittenFunction | `loadDashboardGroupFromXML` | 96 |
| registerOverwrittenFunction | `getIsDashboardGroupActive` | 97 |
| registerOverwrittenFunction | `getCanBeSelected` | 98 |
| registerOverwrittenFunction | `loadAdditionalLightAttributesFromXML` | 99 |
| registerOverwrittenFunction | `getIsLightActive` | 100 |
| registerOverwrittenFunction | `getAIDirectionNode` | 101 |
| registerOverwrittenFunction | `getAIRootNode` | 102 |
| registerOverwrittenFunction | `getAIImplementCollisionTrigger` | 103 |
| registerEventListener | `onLoad` | 109 |
| registerEventListener | `onPostLoad` | 110 |
| registerEventListener | `onReadStream` | 111 |
| registerEventListener | `onWriteStream` | 112 |
| registerEventListener | `onUpdate` | 113 |
| registerEventListener | `onVehicleCharacterChanged` | 114 |
| registerEventListener | `onRegisterActionEvents` | 115 |
