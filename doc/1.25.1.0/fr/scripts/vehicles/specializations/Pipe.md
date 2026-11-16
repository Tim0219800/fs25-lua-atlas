# vehicles/specializations/Pipe.lua

*[English version](../../../../scripts/vehicles/specializations/Pipe.md)*

Source: `dataS/scripts/vehicles/specializations/Pipe.lua` — FS25 1.25.1.0

✍ Spécialisation pour les véhicules qui déchargent par un tuyau mobile (moissonneuses, récolteuses, bennes à vis). Elle requiert FillUnit et Dischargeable. Le tuyau a des états numérotés (1 = replié) pilotés par des nœuds de tuyau et/ou une animation, avec visée automatique optionnelle du véhicule remplissable le plus proche détecté par des déclencheurs de déchargement. Elle lit vehicle.pipe (éventuellement par configuration de tuyau), sauvegarde l'état et le synchronise par SetPipeStateEvent et un flux à drapeau modifié pour la cible la plus proche. Enregistrée mais non définie dans le dump : setIsPipeStateChangeAllowed (NON VÉRIFIÉ).

- **Pipe** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Pipe.prerequisitesPresent(specializations: any)` | 18 | ✍ Retourne true uniquement si le type de véhicule possède FillUnit et Dischargeable. |
| `Pipe.initSpecialization()` | 24 | ✍ Ajoute le type de configuration « pipe », enregistre les chemins XML des nœuds d'animation, la clé freezingPipeStates de Cylindered, les clés d'état min/max du tuyau pour les bâches, les chemins XML du tuyau (de base et par configuration) et les clés de sauvegarde state et isStateChangeAllowed. |
| `Pipe.registers(schema: any, basePath: any)` | 51 | ✍ Enregistre tous les attributs XML du tuyau sous un chemin de base : textes, index du nœud de déchargement, déchargement automatique, déclencheurs, animation, états, nœuds de tuyau avec transformations par état, vitesses, limites, régulation de flexion, sons, limites de pliage et autoFoldWithFoldable. |
| `Pipe.registerFunctions(vehicleType: any)` | 111 | ✍ Ajoute l'API du tuyau au type de véhicule (chargeurs, setPipeState, getCurrentPipeState, updatePipeNodes, rappel de déclencheur, recherche de l'objet le plus proche, etc.). À noter : elle enregistre aussi setIsPipeStateChangeAllowed, dont le corps est absent de ce dump. |
| `Pipe.registerOverwrittenFunctions(vehicleType: any)` | 130 | ✍ Surcharge les fonctions de déchargement, de mise en marche, de pliage, d'outil mobile, de bâche, de sélection et de disponibilité IA afin que l'état du tuyau les influence. |
| `Pipe.registerEventListeners(vehicleType: any)` | 151 | ✍ Abonne aux événements de chargement, suppression, flux réseau, mise à jour, outil mobile, événements d'action, état de déchargement, état de pliage, transport IA et changement de véhicule racine. |
| `Pipe:onLoad(savegame: any)` | 171 | ✍ Charge les réglages du tuyau depuis la clé de configuration (repli vehicle.pipe) : déclencheurs de déchargement (ajoutés comme triggers moteur), animation, états, nœuds de tuyau, ensembles d'états de déchargement/visée/mise en marche, correspondance des nœuds de déchargement, limites de pliage, textes, barre de notification latérale et drapeau modifié. Retire le tick de mise à jour côté client et l'écouteur de pliage sauf si autoFoldWithFoldable. |
| `Pipe:onPostLoad(savegame: any)` | 319 | ✍ Restaure state et isStateChangeAllowed depuis la sauvegarde et place immédiatement le tuyau dans cet état. Sans sauvegarde et avec autoFoldWithFoldable, détermine l'état du tuyau d'après la position de pliage actuelle du pliable. |
| `Pipe:onDelete()` | 360 | ✍ Retire les écouteurs de suppression des objets suivis, supprime les déclencheurs de déchargement, les sons de mouvement du tuyau, la barre de notification latérale et les nœuds d'animation. |
| `Pipe:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 403 | ✍ Sauvegarde l'état actuel du tuyau (borné à 1..numStates, seulement s'il y a des états) et isStateChangeAllowed. |
| `Pipe:onReadStream(streamId: any, connection: any)` | 414 | ✍ Client à la connexion : lit l'état du tuyau (2 bits) et l'applique sans envoyer d'événement, puis lit la cible la plus proche (id d'objet, unité de remplissage, indicateur de déchargement) si elle existe. |
| `Pipe:onWriteStream(streamId: any, connection: any)` | 429 | ✍ Serveur à la connexion : écrit l'état cible du tuyau (2 bits) et, s'il existe, les données de la cible la plus proche. |
| `Pipe:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 443 | ✍ Client : quand le bit du drapeau modifié est présent, lit la cible la plus proche (id d'objet, unité de remplissage, indicateur de déchargement) ou l'efface. |
| `Pipe:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 462 | ✍ Serveur : si le drapeau modifié du tuyau est actif, écrit pour les clients les dernières données de cible la plus proche envoyées. |
| `Pipe:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 477 | ✍ Rafraîchit le texte d'action et déplace les nœuds si le tuyau est mobile. Côté client, affiche une barre de notification latérale avec le nom, le niveau et le type de remplissage de la cible remplie, conservée 5 secondes après son départ. |
| `Pipe:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 538 | ✍ Serveur uniquement. Met à jour la cible la plus proche et marque l'état réseau modifié si elle change. Si Platform.gameplay.automaticPipeUnfolding est actif, qu'aucun état de visée n'existe et qu'aucune IA n'est active, déplie le tuyau quand une cible ou un déclencheur est à portée (et que le véhicule est rempli ou en marche), et le replie sinon. |
| `Pipe:loadUnloadingTriggers(unloadingTriggers: any, xmlFile: any, baseKey: any)` | 590 | ✍ Lit les nœuds de déclencheur de déchargement du XML dans une liste. Un nœud sans le bit de masque de collision FILLABLE est rejeté avec un avertissement. |
| `Pipe:loadPipeNodes(pipeNodes: any, xmlFile: any, baseKey: any)` | 614 | ✍ Charge chaque nœud de tuyau : translation et rotation par état, vitesses (converties de par seconde en par ms), limites de rotation, priorité de pliage, indicateurs de visée, ratio du sous-nœud, nœuds de régulation de flexion et sons de mouvement. Calcule aussi les priorités de pliage inverses. |
| `Pipe:getIsPipeStateChangeAllowed(pipeState: any)` | 732 | ✍ Retourne false si les changements d'état sont désactivés ou si le temps d'animation de pliage du pliable est hors de foldMinLimit/foldMaxLimit ; sinon true. L'argument pipeState n'est pas utilisé. |
| `Pipe:setPipeState(pipeState: any, noEventSend: any)` | 758 | ✍ Définit l'état cible (plafonné à numStates), envoie SetPipeStateEvent sauf si noEventSend, joue l'animation du tuyau en avant ou en arrière et sélectionne le nœud de déchargement de cet état si c'est forcé. |
| `Pipe:getCurrentPipeState()` | 789 | ✍ Retourne l'indice de l'état actuel du tuyau ; il vaut 0 tant que le tuyau se déplace vers une nouvelle cible. |
| `Pipe:updatePipeNodes(dt: any)` | 795 | ✍ Déplace chaque nœud de tuyau vers son état cible selon les vitesses de translation et de rotation, avec visée automatique de la cible la plus proche si autorisée, limites de rotation, priorités de pliage, régulation de flexion et sons de mouvement. Marque l'état atteint quand plus rien ne bouge. |
| `Pipe:updateBendingRegulationNodes(pipeNode: any, distance: any)` | 1003 | ✍ Fait pivoter les nœuds de régulation selon la direction vers le haut du nœud de tuyau multipliée par son bendingRegulation, et retourne le décalage vertical (sinus de cet angle fois la distance) utilisé pour corriger la visée. |
| `Pipe:unloadingTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1026 | ✍ Rappel de déclencheur à l'entrée et à la sortie. Compte les véhicules à portée qui acceptent au moins un des types de remplissage déchargés, ainsi que les objets UnloadTrigger. Enregistre des écouteurs de suppression et réveille le véhicule avec raiseActive. |
| `Pipe:updateNearestObjectInTriggers()` | 1104 | ✍ Trouve la cible la plus proche dans les déclencheurs : une unité de remplissage acceptant le type d'outil déchargeable et le type de remplissage de sortie, avec capacité libre. La distance est mesurée jusqu'à son nœud de visée ou sa racine de remplissage exact. Remplit nearestObjectInTriggers ; avertit si le nœud de déchargement manque. |
| `Pipe:updateActionEventText()` | 1154 | ✍ Met à jour le texte de l'action TOGGLE_PIPE (rentrer le tuyau, ou sortir avec numéro d'état et type de remplissage quand plusieurs états de déchargement existent) et n'affiche l'action que si le changement est autorisé. |
| `Pipe:getIsDischargeNodeActive(superFunc: any, dischargeNode: any)` | 1194 | ✍ Pour le nœud de déchargement du tuyau, retourne true uniquement quand l'état actuel est un état de déchargement ; les autres nœuds passent au parent. |
| `Pipe:getCanBeTurnedOn(superFunc: any)` | 1206 | ✍ Retourne false si des états de mise en marche autorisés sont définis et que l'état actuel du tuyau n'en fait pas partie ; sinon délègue au parent. |
| `Pipe:getTurnedOnNotAllowedWarning(superFunc: any)` | 1229 | ✍ Retourne l'avertissement « régler d'abord le tuyau » quand l'état actuel n'est pas un état de mise en marche autorisé ; sinon délègue au parent. |
| `Pipe:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 1252 | ✍ Retourne false avec un texte d'avertissement si l'état du tuyau est hors de foldMinState..foldMaxState ; sinon délègue au parent. |
| `Pipe:handleDischarge(superFunc: any, dischargeNode: any, dischargedLiters: any, minDropReached: any, hasMinDropFillLevel: any)` | 1266 | ✍ Avec automaticDischarge, ignore le traitement du déchargement pour le nœud propre au tuyau et laisse le parent traiter les autres. Sans cela, délègue toujours au parent. |
| `Pipe:handleDischargeRaycast(superFunc: any, dischargeNode: any, hitObject: any, hitShape: any, hitDistance: any, hitFillUnitIndex: any, hitTerrain: any)` | 1280 | ✍ Avec automaticDischarge, démarre le déchargement vers un objet quand le véhicule est alimenté et que la cible touchée accepte le type avec de la capacité libre, décharge au sol si ce mode est activé, et arrête le déchargement vers un objet sinon. Sans cela, utilise le parent. |
| `Pipe:getCanToggleDischargeToObject(superFunc: any)` | 1310 | ✍ Retourne false quand automaticDischarge est actif ; sinon délègue au parent. |
| `Pipe:getCanToggleDischargeToGround(superFunc: any)` | 1321 | ✍ Retourne false quand automaticDischarge et toggleableDischargeToGround sont tous deux actifs ; sinon délègue au parent. |
| `Pipe:getRequiresPower(superFunc: any)` | 1332 | ✍ Retourne true pendant que le tuyau change d'état ou, avec automaticDischarge, tant qu'une cible de déchargement existe ; sinon délègue au parent. |
| `Pipe:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1354 | ✍ Après le chargement de l'outil mobile par le parent, lit sa liste freezingPipeStates. Retourne false si le parent a échoué. |
| `Pipe:getIsMovingToolActive(superFunc: any, movingTool: any)` | 1366 | ✍ Retourne false pour un outil mobile quand le tuyau est dans l'un de ses états de blocage, ou se déplace vers l'un d'eux, ou est en transit (état 0) ; sinon délègue au parent. |
| `Pipe:loadCoverFromXML(superFunc: any, xmlFile: any, key: any, cover: any)` | 1381 | ✍ Lit minPipeState et maxPipeState sur une bâche (0 et l'infini par défaut), puis appelle le chargeur parent. |
| `Pipe:getIsNextCoverStateAllowed(superFunc: any, nextState: any)` | 1390 | ✍ Refuse un changement d'état de bâche si le parent le refuse, ou si la bâche cible (hors état 0) exige une plage d'états de tuyau qui n'inclut pas l'état actuel. |
| `Pipe:onDeletePipeObject(object: any)` | 1408 | ✍ Rappel d'écouteur de suppression : retire un objet supprimé des tables de véhicules et de déclencheurs suivis et ajuste les compteurs. |
| `Pipe:getPipeDischargeNodeIndex(state: any)` | 1423 | ✍ Retourne l'indice du nœud de déchargement associé à l'état de tuyau donné (par défaut l'état actuel), ou l'indice de nœud par défaut s'il n'existe aucune association. |
| `Pipe:setPipeDischargeToGround(state: any, noEventSend: any)` | 1439 | ✍ Définit ou bascule (nil) l'indicateur de déchargement au sol, met à jour le texte d'action et envoie SetPipeDischargeToGroundEvent sauf si noEventSend. |
| `Pipe:getCanBeSelected(superFunc: any)` | 1459 | ✍ Retourne toujours true : un véhicule équipé d'un tuyau peut être sélectionné. |
| `Pipe:getIsAIReadyToDrive(superFunc: any)` | 1465 | ✍ Pour un tuyau mobile, retourne false tant que le tuyau n'est pas replié (état 1) ; sinon délègue au parent. |
| `Pipe:getIsAIPreparingToDrive(superFunc: any)` | 1478 | ✍ Pour un tuyau mobile, retourne true tant que le tuyau n'a pas atteint son état cible ; sinon délègue au parent. |
| `Pipe:onMovingToolChanged(tool: any, transSpeed: any, dt: any)` | 1491 | ✍ Copie la translation et la rotation courantes d'un outil mobile vers le nœud de tuyau correspondant afin de les garder synchronisés. |
| `Pipe:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1503 | ✍ Client uniquement. Pour un tuyau mobile, enregistre TOGGLE_PIPE (sauf si autoFoldWithFoldable) et, si c'est activable, TOGGLE_TIPSTATE_GROUND avec leurs textes. |
| `Pipe:onDischargeStateChanged(state: any)` | 1528 | ✍ Client uniquement. Quand le nœud de déchargement du tuyau change d'état, arrête les nœuds d'animation si le déchargement est coupé, sinon les démarre et définit leur type de remplissage. |
| `Pipe:onFoldStateChanged(direction: integer, moveToMiddle: boolean)` | 1552 | ✍ Avec autoFoldWithFoldable, place le tuyau dans son dernier état lors d'un pliage vers la direction de mise en marche, sinon à l'état 1. Ignoré pendant la montée vers la position de pliage intermédiaire. |
| `Pipe:onAIImplementPrepareForTransport()` | 1573 | ✍ Replie le tuyau à l'état 1 pour le transport IA si un tuyau mobile est présent et que le changement est autorisé. |
| `Pipe:onRootVehicleChanged(rootVehicle: table)` | 1585 | ✍ Pour les tuyaux avec états de visée, crée ou rattache une entrée « pipe » du contrôleur d'actions au nouveau véhicule racine, ou la supprime s'il n'y en a pas. L'écouteur de fin IA est ajouté sauf si autoFoldWithFoldable. |
| `Pipe.actionControllerPipeEvent(self: any, direction: any)` | 1614 | ✍ Rappel du contrôleur d'actions : place le premier état de visée pour une direction positive, ou l'état 1 sinon. Retourne true. |
| `Pipe.actionEventTogglePipe(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1628 | ✍ Callback d'entrée passant à l'état de tuyau suivant (retour à 1 après le dernier). Si cet état est refusé, tente de replier à l'état 1. |
| `Pipe.actionEventToggleDischargeToGround(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1644 | ✍ Callback d'entrée qui bascule l'indicateur de déchargement au sol via setPipeDischargeToGround. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadUnloadingTriggers` | 112 |
| registerFunction | `loadPipeNodes` | 113 |
| registerFunction | `getIsPipeStateChangeAllowed` | 114 |
| registerFunction | `setPipeState` | 115 |
| registerFunction | `getCurrentPipeState` | 116 |
| registerFunction | `updatePipeNodes` | 117 |
| registerFunction | `updateBendingRegulationNodes` | 118 |
| registerFunction | `unloadingTriggerCallback` | 119 |
| registerFunction | `updateNearestObjectInTriggers` | 120 |
| registerFunction | `updateActionEventText` | 121 |
| registerFunction | `onDeletePipeObject` | 122 |
| registerFunction | `getPipeDischargeNodeIndex` | 123 |
| registerFunction | `setPipeDischargeToGround` | 124 |
| registerFunction | `setIsPipeStateChangeAllowed` | 125 |
| registerOverwrittenFunction | `getIsDischargeNodeActive` | 131 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 132 |
| registerOverwrittenFunction | `getTurnedOnNotAllowedWarning` | 133 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 134 |
| registerOverwrittenFunction | `handleDischarge` | 135 |
| registerOverwrittenFunction | `handleDischargeRaycast` | 136 |
| registerOverwrittenFunction | `getCanToggleDischargeToObject` | 137 |
| registerOverwrittenFunction | `getCanToggleDischargeToGround` | 138 |
| registerOverwrittenFunction | `getRequiresPower` | 139 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 140 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 141 |
| registerOverwrittenFunction | `loadCoverFromXML` | 142 |
| registerOverwrittenFunction | `getIsNextCoverStateAllowed` | 143 |
| registerOverwrittenFunction | `getCanBeSelected` | 144 |
| registerOverwrittenFunction | `getIsAIReadyToDrive` | 145 |
| registerOverwrittenFunction | `getIsAIPreparingToDrive` | 146 |
| registerEventListener | `onLoad` | 152 |
| registerEventListener | `onPostLoad` | 153 |
| registerEventListener | `onDelete` | 154 |
| registerEventListener | `onReadStream` | 155 |
| registerEventListener | `onWriteStream` | 156 |
| registerEventListener | `onReadUpdateStream` | 157 |
| registerEventListener | `onWriteUpdateStream` | 158 |
| registerEventListener | `onUpdate` | 159 |
| registerEventListener | `onUpdateTick` | 160 |
| registerEventListener | `onMovingToolChanged` | 161 |
| registerEventListener | `onRegisterActionEvents` | 162 |
| registerEventListener | `onDischargeStateChanged` | 163 |
| registerEventListener | `onFoldStateChanged` | 164 |
| registerEventListener | `onAIImplementPrepareForTransport` | 165 |
| registerEventListener | `onRootVehicleChanged` | 166 |
