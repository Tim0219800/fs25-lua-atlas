# placeables/specializations/PlaceableTipOcclusionAreas.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableTipOcclusionAreas.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableTipOcclusionAreas.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui permet à un bâtiment de marquer des zones au sol où l'on ne peut pas déverser de vrac. Elle charge des rectangles depuis `placeable.tipOcclusionUpdateAreas` (nœuds de début et de fin) ou un ancien `tipOcclusionUpdateArea` unique. Côté serveur, elle marque la zone correspondante de la carte de collision des hauteurs comme à recalculer afin de rafraîchir les collisions de déversement.

- **PlaceableTipOcclusionAreas** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableTipOcclusionAreas.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Renvoie toujours true : aucune spécialisation requise. |
| `PlaceableTipOcclusionAreas.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre `loadTipOcclusionArea` et `updateTipOcclusionAreas` sur le type de placeable. |
| `PlaceableTipOcclusionAreas.registerEventListeners(placeableType: any)` | 31 | ✍ S'abonne à onLoad, onDelete et onFinalizePlacement. |
| `PlaceableTipOcclusionAreas.registerXMLPaths(schema: any, basePath: any)` | 39 | ✍ Déclare les clés XML de l'ancienne zone unique (`#sizeX`, `#sizeZ`, `#centerX`, `#centerZ`) et de la liste multi-zones avec `#startNode` et `#endNode`. |
| `PlaceableTipOcclusionAreas:onLoad(savegame: table)` | 53 | ✍ Construit la liste des zones depuis le XML (chaque zone listée via `loadTipOcclusionArea`, plus l'ancienne zone unique si les tailles X et Z sont données) et remet à zéro le drapeau de mise à jour à la suppression. |
| `PlaceableTipOcclusionAreas:onDelete()` | 90 | ✍ Serveur seulement, et pas pendant un rechargement : si le drapeau posé lors du placement est actif, rafraîchit les zones d'occlusion pour que le sol libéré redevienne utilisable. |
| `PlaceableTipOcclusionAreas:loadTipOcclusionArea(xmlFile: any, key: any, area: any)` | 104 | ✍ Lit les nœuds de début et de fin, avertit et renvoie false si l'un manque, puis remplit `area` avec le centre et la taille (XZ locaux au nœud racine) d'après les positions des deux nœuds. Renvoie true en cas de succès. |
| `PlaceableTipOcclusionAreas:onFinalizePlacement()` | 141 | ✍ Serveur seulement : rafraîchit les zones d'occlusion sauf si le placeable vient d'une sauvegarde valide dont les collisions de déversement et de placement sont encore valides ; arme ensuite le rafraîchissement à la suppression. |
| `PlaceableTipOcclusionAreas:updateTipOcclusionAreas()` | 155 | ✍ Serveur seulement : convertit chaque zone en boîte englobante monde et la marque à recalculer dans la carte de collision de `g_densityMapHeightManager`. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadTipOcclusionArea` | 25 |
| registerFunction | `updateTipOcclusionAreas` | 26 |
| registerEventListener | `onLoad` | 32 |
| registerEventListener | `onDelete` | 33 |
| registerEventListener | `onFinalizePlacement` | 34 |
