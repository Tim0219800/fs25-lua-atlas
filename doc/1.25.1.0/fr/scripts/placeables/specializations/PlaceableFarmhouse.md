# placeables/specializations/PlaceableFarmhouse.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableFarmhouse.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableFarmhouse.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui fait d'un bâtiment une maison de ferme : elle fournit le noeud d'apparition du joueur et un déclencheur de sommeil optionnel avec sa caméra, et permet de dormir via un FarmhouseActivatable. Le bâtiment s'inscrit auprès du système de placeables une fois finalisé, donc une maison constructible ne compte qu'après achèvement. Aucun prérequis.

- **PlaceableFarmhouse** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableFarmhouse.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Aucun prérequis : renvoie toujours true. |
| `PlaceableFarmhouse.registerFunctions(placeableType: table)` | 26 | ✍ Enregistre le callback du déclencheur de sommeil, les accesseurs de caméra et de point d'apparition, et getIsAllowedToSleep (corps absent du dump du SDK : NON VÉRIFIÉ). |
| `PlaceableFarmhouse.registerOverwrittenFunctions(placeableType: table)` | 37 | ✍ Surcharge finalizeConstruction sur le type de placeable ; le corps de la surcharge est absent du dump du SDK (NON VÉRIFIÉ). |
| `PlaceableFarmhouse.registerEventListeners(placeableType: table)` | 44 | ✍ Abonne la spécialisation aux événements de chargement, suppression et finalisation du placement. |
| `PlaceableFarmhouse.registerXMLPaths(schema: XMLSchema, basePath: string)` | 54 | ✍ Déclare farmhouse#spawnNode, farmhouse#isFinalized ainsi que le noeud de déclencheur de sommeil, le noeud de caméra et l'indicateur isFreeForAll. |
| `PlaceableFarmhouse.registerSavegameXMLPaths(schema: XMLSchema, basePath: string)` | 68 | ✍ Déclare l'unique attribut de sauvegarde isFreeForAll. |
| `PlaceableFarmhouse:onLoad(savegame: table)` | 77 | ✍ Crée l'activatable, lit le noeud d'apparition (erreur loguée et repli sur le noeud racine s'il manque) et le déclencheur de sommeil, qui reçoit un callback et un avertissement si le bit de collision joueur est absent. Ajoute la caméra de sommeil si le noeud est bien une caméra, et lit isFreeForAll (faux par défaut) et isFinalized (vrai par défaut). |
| `PlaceableFarmhouse:loadFromXMLFile(xmlFile: XMLFile, key: string)` | 116 | ✍ Remplace isFreeForAll par la valeur sauvegardée lorsqu'elle existe. |
| `PlaceableFarmhouse:saveToXMLFile(xmlFile: XMLFile, key: string, usedModNames: table)` | 129 | ✍ Écrit l'indicateur isFreeForAll courant dans la sauvegarde. |
| `PlaceableFarmhouse:onFinalizePlacement()` | 135 | ✍ Si la maison est déjà finalisée, l'enregistre comme maison de ferme auprès du système de placeables. |
| `PlaceableFarmhouse:onDelete()` | 158 | ✍ Retire l'activatable, désinscrit la maison du système de placeables, supprime le déclencheur de sommeil et retire la caméra de sommeil du gestionnaire de caméras. |
| `PlaceableFarmhouse:getSpawnPoint() → integer?` | 177 | ✍ Renvoie le noeud d'apparition du joueur, ou nil tant que la maison n'est pas finalisée. |
| `PlaceableFarmhouse:getSpawnWorldPosition()` | 189 | ✍ Renvoie les coordonnées monde x, y, z du noeud d'apparition, ou nil si la maison n'est pas finalisée. |
| `PlaceableFarmhouse:getSleepCamera() → integer?` | 202 | ✍ Renvoie le noeud de la caméra de sommeil, ou nil si aucune n'est définie. |
| `PlaceableFarmhouse:farmhouseSleepingTriggerCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 233 | ✍ Callback du déclencheur : uniquement pour le noeud racine du joueur local, il ajoute l'activatable de sommeil à l'entrée et le retire à la sortie. Un TODO commenté sur le chien du joueur est du code mort. Sans effet sur un serveur dédié (pas de joueur local). |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `farmhouseSleepingTriggerCallback` | 27 |
| registerFunction | `getSleepCamera` | 28 |
| registerFunction | `getSpawnWorldPosition` | 29 |
| registerFunction | `getSpawnPoint` | 30 |
| registerFunction | `getIsAllowedToSleep` | 31 |
| registerOverwrittenFunction | `finalizeConstruction` | 38 |
| registerEventListener | `onLoad` | 45 |
| registerEventListener | `onDelete` | 46 |
| registerEventListener | `onFinalizePlacement` | 47 |
