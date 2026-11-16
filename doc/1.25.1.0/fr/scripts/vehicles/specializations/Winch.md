# vehicles/specializations/Winch.lua

*[English version](../../../../scripts/vehicles/specializations/Winch.md)*

Source: `dataS/scripts/vehicles/specializations/Winch.lua` — FS25 1.25.1.0

✍ Spécialisation de treuil forestier : une ou plusieurs cordes (XML `vehicle.winch.rope`, aussi par `winchConfiguration`) peuvent être accrochées par le joueur à des arbres abattus, puis tirées ou relâchées. Elle utilise `ForestryPhysicsRope` (corde principale et corde de préparation temporaire), `ForestryHook`, `TargetTreeMarker`, des activables, et synchronise l'accroche/décroche via `TreeAttachEvent`, `TreeDetachEvent` et `TreeAttachRequestEvent`. Les arbres accrochés sont sauvegardés par identifiants de split shape sauvegardables ; tous les arbres se décrochent quand l'un est coupé ou monté ailleurs. Les classes d'activables `WinchAttachTreeActivatable` et `WinchControlRopeActivatable` sont utilisées mais non définies dans ce fichier (NON VÉRIFIÉ).


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Winch.prerequisitesPresent(specializations: table) → boolean` | 30 | ✍ Renvoie toujours true : aucun prérequis. |
| `Winch.initSpecialization()` | 36 | ✍ Ajoute le type de configuration `winch` (sauf lors de la génération d'icônes), la spec boutique `winchMaxMass`, et enregistre les chemins XML du treuil et de ses configurations, ainsi que les chemins de changement d'objets. |
| `Winch.registerXMLPaths(schema: any, baseKey: any)` | 56 | ✍ Enregistre tous les chemins XML et de sauvegarde des cordes (limites, vitesse, accélération, nœuds, corde principale/de préparation, articulations, marqueur, crochet, sons, nœuds d'animation, arbres accrochés) et l'option `winch#ropeIndices` pour les outils et pièces mobiles de Cylindered. |
| `Winch.registerFunctions(vehicleType: any)` | 114 | ✍ Ajoute au type de véhicule les fonctions du treuil (accroche/décroche d'arbre, commande, mode d'accroche, rappels de déclencheur et de raycast, gestionnaires d'arbre coupé/monté). |
| `Winch.registerOverwrittenFunctions(vehicleType: any)` | 135 | ✍ Surcharge le chargement/la mise à jour des pièces dépendantes, la consommation et l'activité de la prise de force, la charge consommée et addToPhysics/removeFromPhysics. |
| `Winch.registerEventListeners(vehicleType: any)` | 147 | ✍ S'abonne au chargement, à la fin du chargement, à la suppression, aux quatre événements de flux, à onPostUpdate et à onRegisterActionEvents. |
| `Winch:onLoad(savegame: any)` | 161 | ✍ Applique les changements d'objets de la configuration, charge les cordes depuis le XML de base et de configuration et, s'il y en a, prépare textes, état du raycast d'arbre, abonnements au centre de messages (arbre coupé, monté, pré-téléportation du joueur) et deux drapeaux de modification ; sinon retire tous ses écouteurs. À noter : PLAYER_PRE_TELEPORT est abonné à `onWinchTreeShapeMounted` et non à `onPlayerPreTeleport` (oubli apparent). |
| `Winch:onLoadFinished(savegame: any)` | 235 | ✍ Restaure les arbres accrochés dans la sauvegarde (sauf réinitialisation des véhicules) : résout l'identifiant de split shape sauvegardé et appelle `attachTreeToWinch` avec la position du crochet et des cordes sauvegardée. |
| `Winch:onDelete()` | 264 | ✍ Décroche tous les arbres, retire les déclencheurs, supprime cordes, marqueur et données de crochet, sons et animations côté client, et retire les deux activables de chaque corde. |
| `Winch:onReadStream(streamId: integer, connection: Connection)` | 295 | ✍ Connexion d'un client : pour chaque corde avec des arbres, lit le nombre d'arbres, la position du crochet et l'identifiant de split shape ; accroche tout de suite si la forme est connue, sinon la met en file dans `splitShapesToAttach` pour onPostUpdate. |
| `Winch:onWriteStream(streamId: integer, connection: Connection)` | 320 | ✍ Côté serveur lors d'une connexion : écrit, par corde, la présence d'arbres, leur nombre moins un, la position du crochet dans le repère de l'arbre et l'identifiant de split shape. |
| `Winch:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 344 | ✍ Le serveur lit la commande des clients (2 bits par corde, moins 1). Les clients lisent la direction de commande de la corde (démarrant sons et animations de tirage/relâchement) et l'état physique de la corde principale. |
| `Winch:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 387 | ✍ Les clients envoient leur commande quand le drapeau de modification est posé. Le serveur écrit la direction de commande et, sous le drapeau de corde, l'état de la corde principale. |
| `Winch:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 414 | ✍ Sauvegarde, pour chaque corde avec des arbres, l'indice de corde et, pour chaque arbre, la translation monde du crochet, les parties de l'identifiant de split shape sauvegardable et les données de la corde physique. |
| `Winch:onPostUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 446 | ✍ Client : termine les accroches en file dès que l'identifiant de forme est résolu. Serveur : décroche tout si un arbre n'existe plus. En local, en mode d'accroche, lance un raycast asynchrone d'arbre depuis la caméra du joueur, gère la corde de préparation (contrôle de longueur, couleur verte/rouge, annulation automatique si trop longue), le marqueur de cible et l'activité ; décompte aussi le minuteur de commande et arrête sons et animations à son terme. |
| `Winch:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 574 | ✍ Client : quand actif pour l'entrée et que le groupe de commande de Cylindered correspond (si configuré), enregistre les actions alimentées WINCH_CONTROL_VEHICLE (tirer/relâcher) et WINCH_DETACH, puis met à jour leur état. |
| `Winch.actionEventControl(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 604 | ✍ Rappel d'entrée : envoie la valeur analogique de commande à chaque corde via `setWinchControlInput`. |
| `Winch.actionEventDetach(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 613 | ✍ Rappel d'entrée : décroche les arbres de toutes les cordes. |
| `Winch.updateActionEvents(self: any)` | 619 | ✍ Client : n'active les actions de commande et de décrochage que si au moins un arbre est accroché. |
| `Winch:loadWinchRopeFromXML(xmlFile: any, key: any, rope: any)` | 645 | ✍ Charge une corde depuis le XML (nœuds, limites, vitesse en m/ms, accélération, `ForestryPhysicsRope` principale et de préparation, articulations, marqueur, crochet, changements d'objets, sons, animations, activables). Renvoie false s'il manque le nœud, le déclencheur ou le nœud d'accroche. À noter : `maxTreeBits` vaut ceil(sqrt(maxNumTrees)) (déduit du code). |
| `Winch:setWinchTreeAttachMode(rope: any, state: any)` | 729 | ✍ Active, désactive ou inverse (si state est nil) le mode d'accroche d'une corde. L'activer met en place l'activable d'accroche ; le désactiver masque le marqueur, détruit la corde de préparation et rétablit les activables selon la portée du joueur et les arbres accrochés. |
| `Winch:getIsWinchAttachModeActive(rope: any)` | 760 | ✍ Indique si la corde donnée est en mode d'accroche. |
| `Winch:getCanAttachWinchTree(rope: any)` | 766 | ✍ Renvoie true quand la corde est en mode d'accroche et que le raycast a trouvé un arbre valide. |
| `Winch:onAttachTreeInputEvent(rope: any)` | 777 | ✍ Confirme l'accroche de l'arbre ciblé : sur un serveur, vérifie `getIsWinchTreeAttachAllowed` puis accroche ou affiche l'avertissement d'échec ; sur un client, envoie un `TreeAttachRequestEvent`. Quitte ensuite le mode d'accroche. |
| `Winch:getWinchRopeSpeedFactor(param: any)` | 800 | ✍ Renvoie la direction de commande de la corde dont l'indice (en chaîne) correspond à `param`, ou 1 sinon ; sert de paramètre au code d'animation dépendant (NON VÉRIFIÉ : appelant inconnu). |
| `Winch:getIsWinchTreeAttachAllowed(ropeIndex: any, splitShapeId: any)` | 813 | ✍ Vérifie un arbre candidat : échec TOO_HEAVY si la masse totale, arbres déjà accrochés inclus, dépasse `maxTreeMass`, ou TOO_MANY si `maxNumTrees` est atteint. Renvoie un booléen et une constante de raison de `TreeAttachResponseEvent`. |
| `Winch:showWinchTreeMountFailedWarning(ropeIndex: any, reason: any)` | 836 | ✍ Affiche un avertissement clignotant (2,5 s) pour la raison d'échec donnée : arbre trop lourd (avec la masse max) ou trop d'arbres. |
| `Winch:attachTreeToWinch(splitShapeId: any, x: any, y: any, z: any, ropeIndex: any, setupRopeData: any, noEventSend: any)` | 850 | ✍ Accroche un arbre (split shape) à une corde : monte un crochet cloné, crée la corde principale pour le premier arbre ou une sous-corde vers le premier, applique limites d'articulation actives et changements d'objets, joue le son, enregistre l'activable de commande, publie TREE_SHAPE_MOUNTED et envoie `TreeAttachEvent` sauf `noEventSend`. Ne fait rien si le crochet ne peut pas se monter. |
| `Winch:detachTreeFromWinch(ropeIndex: any, noEventSend: any)` | 919 | ✍ Décroche tous les arbres d'une corde (ou de toutes si l'indice est nil) : quitte le mode d'accroche, détruit sous-cordes et corde principale, supprime les crochets, remet les limites d'articulation sur le serveur, réinitialise changements d'objets et activables, puis envoie `TreeDetachEvent` sauf `noEventSend`. |
| `Winch:setWinchControlInput(ropeIndex: any, direction: any)` | 981 | ✍ Applique la commande tirer/relâcher à une corde (seulement si le treuil n'est pas attachable ou est attelé). Serveur : accélère et appelle `adjustLength` sur la corde principale, met à jour sons/animations et pose les drapeaux. Client : mémorise la commande à envoyer. Utilise la globale `g_currentDt`. |
| `Winch:onWinchPlayerTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 1034 | ✍ Rappel de déclencheur : quand le joueur local entre ou sort du nœud de déclenchement d'une corde, règle `isPlayerInRange` et ajoute ou retire l'activable d'accroche (conservé en mode d'accroche). |
| `Winch:onWinchTreeRaycastCallback(hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 1063 | ✍ Rappel de raycast asynchrone : valide la forme touchée comme arbre (pas déjà accroché, arbres statiques seulement pour le premier), calcule la cible et la position du marqueur avec `SplitShapeUtil.getTreeOffsetPosition` et la marque valide ou non selon la distance au départ de la corde. Renvoie false pour les arbres. |
| `Winch:onWinchTreeShapeCut(oldShape: any, shape: any)` | 1127 | ✍ Serveur uniquement : quand un arbre est coupé et que l'ancienne forme était accrochée, décroche tous les arbres. |
| `Winch:onWinchTreeShapeMounted(shape: any, mountVehicle: any)` | 1145 | ✍ Serveur uniquement : quand un arbre accroché est monté sur un autre véhicule, décroche tous les arbres. |
| `Winch:onPlayerPreTeleport(player: Player)` | 1164 | ✍ Avant la téléportation du joueur local, détruit toutes les cordes de préparation pour éviter des problèmes de physique dus à une corde trop longue. À noter : elle n'est pas reliée dans onLoad (voir Winch:onLoad). |
| `Winch:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 1176 | ✍ Surcharge : après le chargement de base, lit la liste facultative `winch#ropeIndices` d'une pièce ou d'un outil mobile. |
| `Winch:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 1188 | ✍ Surcharge : après la mise à jour de base, rafraîchit les nœuds d'ancrage des cordes principales listées dans les indices de corde de la pièce. |
| `Winch:getDoConsumePtoPower(superFunc: any) → boolean` | 1205 | ✍ Surcharge : renvoie true tant qu'une corde a un arbre accroché, sinon le résultat précédent. |
| `Winch:getConsumingLoad(superFunc: any)` | 1220 | ✍ Surcharge : ajoute une charge pleine (1) à la valeur précédente tant qu'une corde a été commandée récemment, et incrémente le compteur de un. |
| `Winch:getIsPowerTakeOffActive(superFunc: any)` | 1238 | ✍ Surcharge : renvoie true tant qu'une corde a un arbre accroché, sinon le résultat précédent. |
| `Winch:addToPhysics(superFunc: any)` | 1253 | ✍ Surcharge : une fois l'appel de base réussi, recrée la corde principale pour chaque corde ayant un arbre accroché (utile quand le véhicule revient dans la physique). |
| `Winch:removeFromPhysics(superFunc: any)` | 1270 | ✍ Surcharge : détruit la corde principale de chaque corde ayant des arbres accrochés, puis appelle l'implémentation précédente. |
| `Winch.loadSpecValueMaxMass(xmlFile: any, customEnvironment: any, baseDir: any)` | 1282 | ✍ Chargeur de spec boutique : lit la plus grande valeur `maxTreeMass` sur les cordes de base et, séparément, par configuration de treuil. Renvoie une table avec `maxTreeMass` et `massByConfig`. |
| `Winch.getSpecValueMaxMass(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 1302 | ✍ Accesseur de spec boutique : choisit la masse d'arbre max de la configuration retenue (ou la plus haute parmi les configurations) et la renvoie formatée avec l'unité tonnes, en valeur(s) ou chaîne selon `returnValues`/`returnRange`. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadWinchRopeFromXML` | 115 |
| registerFunction | `setWinchTreeAttachMode` | 116 |
| registerFunction | `getIsWinchAttachModeActive` | 117 |
| registerFunction | `getCanAttachWinchTree` | 118 |
| registerFunction | `onAttachTreeInputEvent` | 119 |
| registerFunction | `getWinchRopeSpeedFactor` | 120 |
| registerFunction | `getIsWinchTreeAttachAllowed` | 121 |
| registerFunction | `showWinchTreeMountFailedWarning` | 122 |
| registerFunction | `attachTreeToWinch` | 123 |
| registerFunction | `detachTreeFromWinch` | 124 |
| registerFunction | `setWinchControlInput` | 125 |
| registerFunction | `onWinchPlayerTriggerCallback` | 126 |
| registerFunction | `onWinchTreeRaycastCallback` | 127 |
| registerFunction | `onWinchTreeShapeCut` | 128 |
| registerFunction | `onWinchTreeShapeMounted` | 129 |
| registerFunction | `onPlayerPreTeleport` | 130 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 136 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 137 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 138 |
| registerOverwrittenFunction | `getConsumingLoad` | 139 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 140 |
| registerOverwrittenFunction | `addToPhysics` | 141 |
| registerOverwrittenFunction | `removeFromPhysics` | 142 |
| registerEventListener | `onLoad` | 148 |
| registerEventListener | `onLoadFinished` | 149 |
| registerEventListener | `onDelete` | 150 |
| registerEventListener | `onReadStream` | 151 |
| registerEventListener | `onWriteStream` | 152 |
| registerEventListener | `onReadUpdateStream` | 153 |
| registerEventListener | `onWriteUpdateStream` | 154 |
| registerEventListener | `onPostUpdate` | 155 |
| registerEventListener | `onRegisterActionEvents` | 156 |

## Messages

- s'abonne à `MessageType.TREE_SHAPE_CUT` (l.215)
- s'abonne à `MessageType.TREE_SHAPE_MOUNTED` (l.216)
- s'abonne à `MessageType.PLAYER_PRE_TELEPORT` (l.217)
- publie `MessageType.TREE_SHAPE_MOUNTED` (l.910)
