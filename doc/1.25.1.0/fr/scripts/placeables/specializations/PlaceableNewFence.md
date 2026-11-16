# placeables/specializations/PlaceableNewFence.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableNewFence.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableNewFence.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour le système de clôtures par segments : elle encapsule un objet Fence (créé depuis placeable.fence et l'i3d de placeable.base.filename), lui transmet réseau, mise à jour et sauvegarde, et fusionne avec une instance existante de la même configuration de clôture. Le propriétaire suit toujours la parcelle, la sélection se fait par segment, la destruction par nœud, et un verrou de construction compté empêche de vendre une clôture utilisée par une construction. Plusieurs fonctions qu'elle enregistre (getFence, onSegmentCreated, getIsOnFarmland, getOwnerFarmId, deletePanel, getNodesToDeleteForPanel) ne sont pas définies dans ce fichier : origine NON VÉRIFIÉE.

- **PlaceableNewFence** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableNewFence.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Renvoie toujours true : aucune spécialisation prérequise. |
| `PlaceableNewFence.registerEvents(placeableType: any)` | 23 | ✍ Enregistre l'événement de placeable onCreateSegment. |
| `PlaceableNewFence.registerFunctions(placeableType: any)` | 29 | ✍ Enregistre sur le type de placeable les fonctions liées aux clôtures (getFence, onSegmentCreated, accesseurs de panneau et d'aimantation, updateDirtyAreas, verrou de construction). getFence et onSegmentCreated n'ont pas de définition dans ce fichier. |
| `PlaceableNewFence.registerOverwrittenFunctions(placeableType: any)` | 49 | ✍ Surcharge getIsOnFarmland, collectPickObjects, getDestructionMethod, performNodeDestruction, previewNodeDestructionNodes, setOwnerFarmId, getOwnerFarmId et canBeSold. getIsOnFarmland et getOwnerFarmId ne sont pas définies dans ce fichier. |
| `PlaceableNewFence.registerEventListeners(placeableType: any)` | 62 | ✍ S'abonne à onLoad, onDelete, onReadStream, onWriteStream, onUpdate et onFinalizePlacement (aucun gestionnaire onFinalizePlacement n'est défini dans ce fichier). |
| `PlaceableNewFence.registerXMLPaths(schema: any, basePath: any)` | 73 | ✍ Déclare les clés XML en déléguant à Fence.registerXMLPaths. |
| `PlaceableNewFence.registerSavegameXMLPaths(schema: any, basePath: any)` | 81 | ✍ Déclare les clés XML de sauvegarde en déléguant à Fence.registerSavegameXMLPaths. |
| `PlaceableNewFence:onLoad(savegame: table)` | 90 | ✍ Initialise le compteur de verrou de construction, exige placeable.base.filename (état ERROR sinon) et s'arrête si un autre placeable de même configuration existe (mode fusion). Sinon crée un groupe de transformation des segments et l'objet Fence, et pour une clôture préplacée supprime les nœuds enfants de segments et de clôture statique déjà présents sur la carte. |
| `PlaceableNewFence:onDelete()` | 148 | ✍ Supprime l'objet Fence s'il a été créé. |
| `PlaceableNewFence:onReadStream(streamId: any, connection: any)` | 167 | ✍ Côté client à la connexion : fait lire à la Fence ses données de flux. À noter : pas de test de nil sur la clôture, qui est nil si le placeable a fusionné avec une instance existante. |
| `PlaceableNewFence:onWriteStream(streamId: any, connection: any)` | 175 | ✍ Côté serveur à la connexion : fait écrire à la Fence ses données de flux. À noter : pas de test de nil sur la clôture (voir onReadStream). |
| `PlaceableNewFence:onUpdate(dt: any)` | 183 | ✍ Mise à jour à chaque image : transmet dt à la Fence si elle existe. |
| `PlaceableNewFence:setOwnerFarmId(superFunc: any, ownerFarmId: any, noEventSend: any)` | 196 | ✍ Surcharge qui ne fait volontairement rien : une clôture ne reçoit jamais de ferme propriétaire directement, elle suit la parcelle. |
| `PlaceableNewFence:loadFromXMLFile(xmlFile: any, key: any)` | 206 | ✍ Chargement de sauvegarde : charge dans cette clôture, ou dans celle de l'instance existante si ce placeable a été fusionné. |
| `PlaceableNewFence:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 221 | ✍ Écriture de sauvegarde : délègue à l'objet Fence. |
| `PlaceableNewFence:getSegmentLength(segment: any)` | 238 | ✍ Renvoie la distance horizontale entre les deux extrémités d'un segment (x1/z1 vers x2/z2). |
| `PlaceableNewFence:getPanelLength()` | 244 | ✍ Renvoie spec.panelLength. À noter : ce fichier n'affecte jamais ce champ, il est donc probablement nil sauf s'il est défini ailleurs (NON VÉRIFIÉ). |
| `PlaceableNewFence:getIsPanelLengthFixed()` | 250 | ✍ Renvoie spec.panelLengthFixed, champ non affecté dans ce fichier (NON VÉRIFIÉ). |
| `PlaceableNewFence:updateDirtyAreas(x1: any, z1: any, x2: any, z2: any)` | 256 | ✍ Marque la boîte englobante du segment donné comme modifiée dans la carte de collision des density maps et dans le système de navigation IA. |
| `PlaceableNewFence:getNumSequments()` | 268 | ✍ Renvoie le nombre de segments de clôture fourni par l'objet Fence (le nom est mal orthographié dans la source). |
| `PlaceableNewFence:getMaxVerticalAngle()` | 275 | ✍ Renvoie spec.maxVerticalAngle, non affecté dans ce fichier (NON VÉRIFIÉ) ; non enregistrée via registerFunctions ici. |
| `PlaceableNewFence:getMaxVerticalGateAngle()` | 282 | ✍ Renvoie spec.maxVerticalGateAngle, non affecté dans ce fichier (NON VÉRIFIÉ) ; non enregistrée via registerFunctions ici. |
| `PlaceableNewFence:getSnapDistance() → number?` | 290 | ✍ Renvoie la distance d'aimantation en mètres du premier segment, ou du premier modèle de segment (valeur de parallelSnapping d'abord, sinon snapDistance) ; nil s'il n'y a ni clôture ni modèle. |
| `PlaceableNewFence:getSnapAngle()` | 318 | ✍ Fonction obsolète : renvoie toujours nil. |
| `PlaceableNewFence:getSnapCheckDistance()` | 325 | ✍ Fonction obsolète : renvoie toujours nil. |
| `PlaceableNewFence:getAllowExtendingOnly()` | 332 | ✍ Fonction obsolète : renvoie toujours nil. |
| `PlaceableNewFence:getMaxCornerAngle()` | 339 | ✍ Fonction obsolète : renvoie toujours nil. |
| `PlaceableNewFence:getHasParallelSnapping()` | 346 | ✍ Fonction obsolète : renvoie toujours false. |
| `PlaceableNewFence:getSupportsParallelSnapping()` | 353 | ✍ Fonction obsolète : renvoie toujours false. |
| `PlaceableNewFence:addPickingNodesForSegment(segment: any)` | 359 | ✍ Enregistre les nœuds à corps rigide du segment comme objets-nœuds de ce placeable pour qu'ils soient sélectionnables ; ignore le segment d'aperçu et remet overlayColorNodes à nil. |
| `PlaceableNewFence:removePickingNodesForSegment(segment: any)` | 379 | ✍ Retire les nœuds à corps rigide du segment des objets-nœuds de la mission ; ignore le segment d'aperçu. |
| `PlaceableNewFence:recursivelyAddPickingNodes(objects: any, node: any)` | 396 | ✍ Collecte récursivement dans la table donnée chaque nœud sous (et y compris) le nœud donné dont le type de corps rigide n'est pas NONE. |
| `PlaceableNewFence:getDestructionMethod(superFunc: any)` | 409 | ✍ Surcharge : renvoie Placeable.DESTRUCTION.PER_NODE, la clôture est donc démolie morceau par morceau et non d'un coup. |
| `PlaceableNewFence:previewNodeDestructionNodes(superFunc: any, node: any)` | 415 | ✍ Surcharge : renvoie les nœuds du panneau contenant le nœud donné via getNodesToDeleteForPanel (défini ailleurs, NON VÉRIFIÉ). |
| `PlaceableNewFence:performNodeDestruction(superFunc: any, node: any)` | 421 | ✍ Surcharge : supprime le panneau du nœud donné via deletePanel (défini ailleurs, NON VÉRIFIÉ) et renvoie le nœud détruit plus true s'il ne reste aucun segment, afin de supprimer le placeable. |
| `PlaceableNewFence:collectPickObjects(superFunc: any, node: any)` | 429 | ✍ Surcharge qui ne fait rien : la sélection par défaut est désactivée car les nœuds sélectionnables sont ajoutés par segment. |
| `PlaceableNewFence:canBeSold(superFunc: function) → boolean, string?` | 439 | ✍ Surcharge : renvoie false avec un message « objet utilisé » tant qu'un verrou de construction est tenu, sinon délègue au parent. |
| `PlaceableNewFence:getIsBuildLocked() → boolean` | 450 | ✍ Renvoie true tant qu'au moins une construction tient un verrou sur cette clôture. |
| `PlaceableNewFence:setBuildLocked(isLocked: boolean)` | 460 | ✍ Prend (true) ou relâche (false) un verrou de construction ; le compteur ne descend jamais sous zéro, donc des constructions simultanées ne se déverrouillent pas mutuellement. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onCreateSegment` | 24 |
| registerFunction | `getFence` | 30 |
| registerFunction | `onSegmentCreated` | 31 |
| registerFunction | `getNumSequments` | 32 |
| registerFunction | `getPanelLength` | 33 |
| registerFunction | `getIsPanelLengthFixed` | 34 |
| registerFunction | `updateDirtyAreas` | 35 |
| registerFunction | `getSupportsParallelSnapping` | 36 |
| registerFunction | `getSnapDistance` | 37 |
| registerFunction | `getSnapAngle` | 38 |
| registerFunction | `getSnapCheckDistance` | 39 |
| registerFunction | `getAllowExtendingOnly` | 40 |
| registerFunction | `getMaxCornerAngle` | 41 |
| registerFunction | `getHasParallelSnapping` | 42 |
| registerFunction | `getIsBuildLocked` | 43 |
| registerFunction | `setBuildLocked` | 44 |
| registerOverwrittenFunction | `getIsOnFarmland` | 50 |
| registerOverwrittenFunction | `collectPickObjects` | 51 |
| registerOverwrittenFunction | `getDestructionMethod` | 52 |
| registerOverwrittenFunction | `performNodeDestruction` | 53 |
| registerOverwrittenFunction | `previewNodeDestructionNodes` | 54 |
| registerOverwrittenFunction | `setOwnerFarmId` | 55 |
| registerOverwrittenFunction | `getOwnerFarmId` | 56 |
| registerOverwrittenFunction | `canBeSold` | 57 |
| registerEventListener | `onLoad` | 63 |
| registerEventListener | `onDelete` | 64 |
| registerEventListener | `onReadStream` | 65 |
| registerEventListener | `onWriteStream` | 66 |
| registerEventListener | `onUpdate` | 67 |
| registerEventListener | `onFinalizePlacement` | 68 |
