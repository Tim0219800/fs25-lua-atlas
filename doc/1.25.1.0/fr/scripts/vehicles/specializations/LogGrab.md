# vehicles/specializations/LogGrab.lua

*[English version](../../../../scripts/vehicles/specializations/LogGrab.md)*

Source: `dataS/scripts/vehicles/specializations/LogGrab.lua` — FS25 1.25.1.0

✍ Spécialisation pour les grappins et pinces à grumes qui tiennent arbres ou billes. Chaque `vehicle.logGrab.grab` (éventuellement par configuration `logGrab`) possède un déclencheur d'arbres, des pinces liées à des joints de composant, une animation de pince et une animation de verrouillage optionnelles, et une boîte de détection d'arbre. Quand les pinces se ferment, les arbres dans le déclencheur sont fixés par un joint physique (serveur uniquement), et limites de joint et forces d'entraînement s'adaptent à la masse montée. Coopère avec les moving tools de Cylindered, Foldable et WoodHarvester si présents, et lève `onLogGrabMountedTreesChanged`. Aucun prérequis.


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `LogGrab.prerequisitesPresent(specializations: table) → boolean` | 23 | ✍ Renvoie toujours vrai : aucune autre spécialisation n'est requise. |
| `LogGrab.initSpecialization()` | 29 | ✍ Enregistre le type de configuration `logGrab`, les chemins XML de grappin (de base et par configuration) et l'attribut de sauvegarde de l'état de pince de chaque grappin. |
| `LogGrab.registerLogGrabXMLPaths(schema: any, basePath: any)` | 47 | ✍ Enregistre tous les chemins XML d'un grappin : nœuds de joint, limites, pinces et leurs moving tools, animations de pince et de verrouillage, détection d'arbre, limites de joints de composant et forces d'entraînement selon la masse. À noter : `clawAnimation#foldMaxLimit` vaut 1 par défaut dans le schéma mais 0 dans le chargeur. |
| `LogGrab.registerEvents(vehicleType: table)` | 104 | ✍ Enregistre l'événement de spécialisation `onLogGrabMountedTreesChanged`. |
| `LogGrab.registerFunctions(vehicleType: table)` | 111 | ✍ Enregistre sur le type de véhicule les fonctions de chargement du grappin, d'état de pince, de montage et de démontage. |
| `LogGrab.registerOverwrittenFunctions(vehicleType: table)` | 125 | ✍ Surcharge `setComponentJointFrame`, `getMovingToolMoveValue` et `onDelimbTree`. À noter : `addNodeObjectMapping`, `removeNodeObjectMapping` et `updateDebugValues` sont définies plus bas mais non enregistrées ici (NON VÉRIFIÉ si enregistrées ailleurs). |
| `LogGrab.registerEventListeners(vehicleType: table)` | 134 | ✍ S'abonne aux événements onLoad, onPostLoad, onDelete, onReadStream, onWriteStream, onUpdateTick, onCutTree, onTurnedOn, onRegisterActionEvents, onLogGrabMountedTreesChanged, onFoldStateChanged et onFoldTimeChanged. À noter : onTurnedOff n'est pas abonné ici. |
| `LogGrab:onLoad(savegame: table)` | 152 | ✍ Charge les grappins de la configuration choisie et du bloc de base `vehicle.logGrab`. Si aucun ne se charge, retire tous les autres écouteurs d'événements de la spécialisation. |
| `LogGrab:onPostLoad(savegame: table)` | 204 | ✍ Restaure l'état de pince sauvegardé (ou initial) et joue instantanément l'animation de fermeture si fermée ; résout les références de moving tools et supprime celles introuvables. |
| `LogGrab:onDelete()` | 238 | ✍ Supprime les callbacks de déclencheur d'arbres de tous les grappins. |
| `LogGrab:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 252 | ✍ Sauvegarde l'état de l'animation de pince de chaque grappin qui en possède une. |
| `LogGrab:onReadStream(streamId: integer, connection: Connection)` | 268 | ✍ Connexion client : lit l'état de pince de chaque grappin animé et l'applique sans envoyer d'événement. |
| `LogGrab:onWriteStream(streamId: integer, connection: Connection)` | 283 | ✍ Connexion côté serveur : écrit l'état de pince de chaque grappin animé. |
| `LogGrab:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 298 | ✍ Serveur uniquement. Détermine pour chaque grappin s'il est fermé (angles de joints des pinces ou animation de pince), monte les arbres en attente avec des joints quand il est fermé, les démonte quand il est ouvert, ajuste l'amortissement des joints, l'animation de verrouillage et les limites de joints de composant. |
| `LogGrab:loadLogGrabFromXML(xmlFile: any, key: any, logGrab: any)` | 454 | ✍ Charge un grappin dans la table donnée : pinces, animations, nœuds de joint, déclencheur d'arbres (doit avoir uniquement le bit de collision Tree), nœud de détection, limites de joints et réglages de masse. Renvoie faux si le déclencheur ou le nœud de détection manque ; un mauvais masque de déclencheur renvoie nil. |
| `LogGrab:updateLogGrabClawState(claw: any, dt: any, ignoreTiming: any, forceDirty: any)` | 615 | ✍ Mesure la rotation du joint de pince sur son axe et renvoie vrai quand la pince est considérée fermée (au-delà du seuil, ou moving tool totalement fermé) assez longtemps, ou après un délai suite à un mouvement du joint ; sinon faux. `ignoreTiming` ignore les minuteurs. |
| `LogGrab:onCutTree(radius: any, isNewTree: any)` | 685 | ✍ Serveur uniquement : quand un nouvel arbre est coupé avec un rayon positif, ferme chaque grappin dont le changement d'état est autorisé. |
| `LogGrab:onTurnedOn()` | 700 | ✍ Serveur uniquement : ouvre chaque grappin dont le changement d'état est autorisé. |
| `LogGrab:onTurnedOff()` | 713 | ✍ Serveur uniquement : ferme chaque grappin dont le changement d'état est autorisé. À noter : non enregistrée comme écouteur dans `registerEventListeners`, elle peut ne jamais être appelée par cette spécialisation (NON VÉRIFIÉ). |
| `LogGrab:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 726 | ✍ Client : enregistre une action d'entrée par grappin possédant une animation de pince (en respectant le groupe de contrôle) et met à jour les libellés. |
| `LogGrab.actionEventClawAnimation(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 748 | ✍ Callback d'entrée : bascule l'état de pince du grappin dont l'index est passé en état de callback, si autorisé. |
| `LogGrab.updateActionEvents(self: any)` | 756 | ✍ Met à jour le texte d'aide d'entrée de chaque grappin (ouvrir ou fermer) et ne l'active que si le changement d'état est autorisé. |
| `LogGrab:setComponentJointFrame(superFunc: any, jointDesc: any, anchorActor: any)` | 772 | ✍ Surcharge : après le parent, enregistre l'instant où un joint de composant de pince a été recadré, pour ignorer un temps les changements d'état de pince. |
| `LogGrab:getMovingToolMoveValue(superFunc: any, movingTool: any)` | 790 | ✍ Surcharge : mémorise la dernière valeur de mouvement des moving tools de pince et bloque le mouvement dans le sens de fermeture une fois le seuil de fermeture dépassé. |
| `LogGrab:onDelimbTree(superFunc: any, state: any, ...: any)` | 817 | ✍ Surcharge : ouvre tout grappin à animation de pince fermée avant de déléguer au comportement d'ébranchage du parent. |
| `LogGrab:getGrabCanMountSplitShape(grab: any, shapeId: any)` | 830 | ✍ Renvoie faux si le temps de pliage du véhicule est hors des limites de montage du grappin, vrai sinon. |
| `LogGrab:mountSplitShape(grab: any, shapeId: any)` | 843 | ✍ Crée un joint physique entre la racine du grappin et l'arbre, placé sur la zone d'arbre détectée (ou sur le nœud de joint, verrouillé, si le test échoue). Publie `TREE_SHAPE_MOUNTED`, lève `onLogGrabMountedTreesChanged` et renvoie l'index et le transform du joint. |
| `LogGrab:unmountSplitShape(grab: any, shapeId: any, jointIndex: any, jointTransform: any, isDeleting: any)` | 897 | ✍ Supprime le joint et son transform pour un arbre. L'arbre retourne dans la liste en attente sauf si `isDeleting` est vrai. Lève `onLogGrabMountedTreesChanged`. |
| `LogGrab:onLogGrabMountedTreesChanged(grab: any)` | 915 | ✍ Serveur uniquement : additionne la masse des arbres montés et ajuste par interpolation la force maximale d'entraînement angulaire des joints de composant configurés. À noter : le code affecte deux fois l'indice 1 et jamais l'indice 2 du tableau de forces, ce qui ressemble à un bug. |
| `LogGrab:onFoldStateChanged(direction: any, moveToMiddle: any)` | 942 | ✍ Ouvre ou ferme les grappins configurés pour s'ouvrir/se fermer pendant le pliage quand le pliage va à l'opposé du sens de mise en marche. |
| `LogGrab:onFoldTimeChanged(time: any)` | 961 | ✍ Rafraîchit les aides d'entrée quand le temps de pliage change. |
| `LogGrab:getIsLogGrabClawStateChangeAllowed(grabIndex: any)` | 967 | ✍ Renvoie faux si le temps de pliage est hors des limites de pliage de l'animation de pince de ce grappin, sinon vrai. |
| `LogGrab:setLogGrabClawState(grabIndex: any, state: any, noEventSend: any)` | 984 | ✍ Définit l'état de pince d'un grappin (nil bascule) et joue l'animation de pince en avant ou en arrière, rafraîchit les aides et appelle `LogGrabClawStateEvent.sendEvent` pour la synchronisation réseau. |
| `LogGrab:logGrabTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1002 | ✍ Callback de déclencheur : ajoute à la liste en attente les arbres dynamiques ou cinématiques entrant dans le déclencheur du grappin ; à la sortie, les retire de l'attente ou les démonte s'ils sont montés. |
| `LogGrab:addNodeObjectMapping(superFunc: any, list: any)` | 1029 | ✍ Fonction de type surcharge : après le parent, associe chaque nœud de déclencheur de grappin à ce véhicule dans la liste donnée. |
| `LogGrab:removeNodeObjectMapping(superFunc: any, list: any)` | 1043 | ✍ Fonction de type surcharge : après le parent, retire de la liste donnée les entrées des nœuds de déclencheur de grappin. |
| `LogGrab:updateDebugValues(values: any)` | 1057 | ✍ Serveur uniquement : ajoute à la liste de valeurs données des lignes de débogage (décalages et seuils de pince, état de fermeture des moving tools, arbres montés et en attente). |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onLogGrabMountedTreesChanged` | 105 |
| registerFunction | `loadLogGrabFromXML` | 112 |
| registerFunction | `updateLogGrabClawState` | 113 |
| registerFunction | `getGrabCanMountSplitShape` | 114 |
| registerFunction | `mountSplitShape` | 115 |
| registerFunction | `unmountSplitShape` | 116 |
| registerFunction | `getIsLogGrabClawStateChangeAllowed` | 118 |
| registerFunction | `setLogGrabClawState` | 119 |
| registerOverwrittenFunction | `setComponentJointFrame` | 126 |
| registerOverwrittenFunction | `getMovingToolMoveValue` | 127 |
| registerOverwrittenFunction | `onDelimbTree` | 128 |
| registerEventListener | `onLoad` | 135 |
| registerEventListener | `onPostLoad` | 136 |
| registerEventListener | `onDelete` | 137 |
| registerEventListener | `onReadStream` | 138 |
| registerEventListener | `onWriteStream` | 139 |
| registerEventListener | `onUpdateTick` | 140 |
| registerEventListener | `onCutTree` | 141 |
| registerEventListener | `onTurnedOn` | 142 |
| registerEventListener | `onRegisterActionEvents` | 143 |
| registerEventListener | `onLogGrabMountedTreesChanged` | 144 |
| registerEventListener | `onFoldStateChanged` | 145 |
| registerEventListener | `onFoldTimeChanged` | 146 |

## Messages

- publie `MessageType.TREE_SHAPE_MOUNTED` (l.889)
