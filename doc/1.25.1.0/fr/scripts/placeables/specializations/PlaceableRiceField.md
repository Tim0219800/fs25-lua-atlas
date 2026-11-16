# placeables/specializations/PlaceableRiceField.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableRiceField.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableRiceField.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable pour les rizières dessinées par le joueur. Chaque champ est un polygone avec une zone de terrain aplanie, une digue surélevée autour, un plan d'eau (maillages visuel, miroir et collision), une pompe avec sons et un déclencheur joueur. Le serveur anime le niveau d'eau selon le temps de jeu et le synchronise ; le terrain est déformé via g_terrainDeformationQueue. Utilise aussi PlaceableRiceFieldActivatable et la simulation d'eau peu profonde si présente. Beaucoup de fonctions sont enregistrées mais sans corps dans le dump (création, sommets, accesseurs d'eau, événements) : NON VÉRIFIÉ.

- **PlaceableRiceField** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableRiceField.registerXMLPaths(schema: XMLSchema, basePath: string)` | 58 | ✍ Déclare le schéma XML sous placeable.riceField : types de sol et dimensions de la zone et de la digue, feuillage de digue, niveau d'eau max et durée de remplissage, valeurs de brouillard sous-marin, i3d de pompe avec nœuds de remplissage/vidange et sons, nœud de déclencheur joueur et types de fruits acceptés. |
| `PlaceableRiceField.registerSavegameXMLPaths(schema: any, basePath: any)` | 96 | ✍ Déclare le XML de sauvegarde de chaque champ : hauteur monde, hauteur et cible d'eau, données de fruit initial pour les champs prépositionnés, sommets du contour et niveaux d'eau par période. |
| `PlaceableRiceField.prerequisitesPresent(specializations: table) → boolean` | 113 | ✍ Retourne toujours true ; aucune spécialisation prérequise. |
| `PlaceableRiceField.registerFunctions(placeableType: any)` | 119 | ✍ Enregistre l'API de rizière sur le type de placeable (création/suppression/accès aux champs, sommets, accesseurs de hauteur et de niveau d'eau, callbacks de déformation du terrain, événements d'état). La plupart de ces fonctions ne sont pas définies dans le dump. |
| `PlaceableRiceField.registerOverwrittenFunctions(placeableType: any)` | 167 | ✍ Surcharge addToPhysics, collectPickObjects, getIsOnFarmland, getFarmlandId, getDestructionMethod, performNodeDestruction et previewNodeDestructionNodes. |
| `PlaceableRiceField.registerEventListeners(placeableType: any)` | 179 | ✍ Abonne à onLoad, onDelete, aux événements de flux lecture/écriture (initial et mise à jour), onDirtyMaskCleared, onUpdateTick et onPeriodChanged. |
| `PlaceableRiceField.initSpecialization()` | 194 | ✍ Seulement si g_isDevelopmentVersion est actif, enregistre quatre commandes console (gsRiceFieldWaterSetLevel, gsRiceFieldWaterSetShaderParameters, gsRiceFieldSetRice, gsRiceFieldCreateFromField). |
| `PlaceableRiceField:onLoad(savegame: table)` | 215 | ✍ Lit depuis le XML les types de sol, réglages de digue et d'eau, valeurs de brouillard, nœud de déclencheur et types de fruits, lance le chargement asynchrone de l'i3d de pompe, charge les sons côté client, crée l'activatable et s'abonne à FINISHED_GROWTH_PERIOD. À noter : le repli de l'état de croissance du feuillage lit la clé foliageGrowthStateName au lieu de foliageGrowthState. |
| `PlaceableRiceField:onPumpI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 302 | ✍ Callback asynchrone de l'i3d de pompe partagé : conserve le nœud comme modèle cloné par champ, mémorise les chemins des nœuds d'eau et d'éclaboussures de remplissage/vidange, puis termine la tâche de chargement. Retourne false en cas d'échec de l'i3d. |
| `PlaceableRiceField:onDelete()` | 329 | ✍ Retire l'activatable, se désabonne des messages, supprime tous les champs, le modèle de pompe, les sons et la requête i3d partagée. |
| `PlaceableRiceField:onReadStream(streamId: any, connection: any)` | 366 | ✍ Synchronisation initiale côté client : lit chaque champ (hauteur, sommets du polygone, hauteur d'eau, cible optionnelle), le crée, construit ses maillages et règle les effets de pompe en remplissage ou vidange. |
| `PlaceableRiceField:onWriteStream(streamId: any, connection: any)` | 398 | ✍ Synchronisation initiale côté serveur : écrit le nombre de champs, puis pour chacun sa hauteur, les sommets du polygone, la hauteur d'eau et la cible éventuelle. |
| `PlaceableRiceField:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 445 | ✍ Serveur uniquement : si le drapeau de changement d'eau est levé, écrit la hauteur d'eau (compressée jusqu'au niveau max) et un indicateur d'atteinte de la cible, uniquement pour les champs marqués modifiés. |
| `PlaceableRiceField:onUpdateTick(dt: any)` | 473 | ✍ Ajoute des vagues aléatoires à la simulation d'eau peu profonde près des éclaboussures de remplissage. Sur le serveur, rapproche la hauteur d'eau de chaque champ de sa cible selon l'échelle de temps effective et la durée de remplissage, arrête les effets et signale une synchronisation à l'arrivée. |
| `PlaceableRiceField:loadFromXMLFile(xmlFile: any, key: any)` | 552 | ✍ Charge chaque champ sauvegardé : hauteur, hauteur d'eau, polygone, niveaux d'eau par période et cible éventuelle. Dans une nouvelle partie, le serveur applique aussi la déformation initiale du terrain et le fruit initial. À noter : la variable callback passée à performTerrainDeformation n'est jamais définie, elle vaut nil. |
| `PlaceableRiceField:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 604 | ✍ Sauvegarde chaque champ : hauteur monde, hauteur d'eau, cible éventuelle, niveaux d'eau par période au mètre carré et sommets du polygone sous forme de chaînes x z. |
| `PlaceableRiceField:getDestructionMethod(superFunc: any)` | 629 | ✍ Retourne Placeable.DESTRUCTION.PER_NODE : le joueur supprime un champ à la fois plutôt que tout le placeable. |
| `PlaceableRiceField:previewNodeDestructionNodes(superFunc: function, node: integer) → array?` | 642 | ✍ Pour le champ du nœud visé, dessine le contour de son maillage d'eau et des formes visibles de sa pompe. Retourne nil (aucun nœud supplémentaire à surligner pour le pinceau). |
| `PlaceableRiceField:performNodeDestruction(superFunc: any, node: any)` | 659 | ✍ Supprime le champ correspondant au nœud ; retourne si un champ a été retiré et si tout le placeable doit être détruit (plus aucun champ valide). |
| `PlaceableRiceField:collectPickObjects(superFunc: any, node: any, target: any)` | 667 | ✍ Surcharge vide : désactive la collecte par défaut des objets pickables pour ce placeable. |
| `PlaceableRiceField:buildMesh(field: any)` | 1302 | ✍ Construit les nœuds d'un champ depuis son polygone : plan d'eau visuel avec le matériau riceFieldWaterSimulation, plan miroir, plans de collision d'eau et de placement, pompe clonée et déclencheur joueur sur la première arête. Enregistre le champ, règle la hauteur d'eau et ajoute le plan à la simulation d'eau peu profonde. Retourne false si un maillage échoue. À noter : les paramètres shader du plan miroir sont appliqués au nœud du plan principal. |
| `PlaceableRiceField:performTerrainDeformation(field: any, callback: any)` | 1467 | ✍ Met en file trois travaux de terrain pour un champ : aplanir le polygone avec le type de sol intérieur, relever les digues le long de chaque arête, et peindre le type de sol des digues s'il existe. Chaque travail appelle onTerrainDeformationTaskFinished ; le callback est stocké dans field.brushCallback. |
| `PlaceableRiceField:getHasValidFields()` | 1667 | ✍ Retourne true si au moins un polygone de champ a trois sommets ou plus. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onPumpI3DLoaded` | 120 |
| registerFunction | `drawDebug` | 121 |
| registerFunction | `getCanCreateNewField` | 122 |
| registerFunction | `createNewField` | 123 |
| registerFunction | `removeFieldByNode` | 124 |
| registerFunction | `removeFieldByIndex` | 125 |
| registerFunction | `deleteField` | 126 |
| registerFunction | `getFields` | 127 |
| registerFunction | `getFieldByIndex` | 128 |
| registerFunction | `getFieldByNode` | 129 |
| registerFunction | `getCanAddVertex` | 130 |
| registerFunction | `getCanFinish` | 131 |
| registerFunction | `onPolyhedronOverlap` | 132 |
| registerFunction | `onFinishedGrowthPeriod` | 133 |
| registerFunction | `getHasValidFields` | 134 |
| registerFunction | `addVertex` | 135 |
| registerFunction | `removeLastVertex` | 136 |
| registerFunction | `tryToFinishField` | 137 |
| registerFunction | `finalizeNewField` | 138 |
| registerFunction | `onRiceFieldAnswerEvent` | 139 |
| registerFunction | `buildMesh` | 140 |
| registerFunction | `performTerrainDeformation` | 141 |
| registerFunction | `onTerrainDeformationFinished` | 142 |
| registerFunction | `onTerrainDeformationFailed` | 143 |
| registerFunction | `onTerrainDeformationTaskFinished` | 144 |
| registerFunction | `getFirstAndLastVertex` | 145 |
| registerFunction | `getNumVertices` | 146 |
| registerFunction | `setWaterHeight` | 147 |
| registerFunction | `setEffectVisibility` | 148 |
| registerFunction | `getWaterHeight` | 149 |
| registerFunction | `setWaterHeightTarget` | 150 |
| registerFunction | `getWaterHeightTarget` | 151 |
| registerFunction | `getWaterFillLevel` | 152 |
| registerFunction | `getWaterFillLevelPerSqm` | 153 |
| registerFunction | `getFieldFillingState` | 154 |
| registerFunction | `getMaxWaterHeight` | 155 |
| registerFunction | `getArea` | 156 |
| registerFunction | `getSupportedFruitTypes` | 157 |
| registerFunction | `playerTriggerCallback` | 158 |
| registerFunction | `renderEdges` | 159 |
| registerFunction | `getRiceFieldState` | 160 |
| registerFunction | `onRiceFieldStatusResult` | 161 |
| registerFunction | `getConfirmDestruction` | 162 |
| registerOverwrittenFunction | `addToPhysics` | 168 |
| registerOverwrittenFunction | `collectPickObjects` | 169 |
| registerOverwrittenFunction | `getIsOnFarmland` | 170 |
| registerOverwrittenFunction | `getFarmlandId` | 171 |
| registerOverwrittenFunction | `getDestructionMethod` | 172 |
| registerOverwrittenFunction | `performNodeDestruction` | 173 |
| registerOverwrittenFunction | `previewNodeDestructionNodes` | 174 |
| registerEventListener | `onLoad` | 180 |
| registerEventListener | `onDelete` | 181 |
| registerEventListener | `onReadStream` | 182 |
| registerEventListener | `onWriteStream` | 183 |
| registerEventListener | `onReadUpdateStream` | 184 |
| registerEventListener | `onWriteUpdateStream` | 185 |
| registerEventListener | `onDirtyMaskCleared` | 186 |
| registerEventListener | `onUpdateTick` | 187 |
| registerEventListener | `onPeriodChanged` | 189 |

## Messages

- s'abonne à `MessageType.FINISHED_GROWTH_PERIOD` (l.295)
