# placeables/specializations/PlaceableIndoorAreas.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableIndoorAreas.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableIndoorAreas.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui marque des zones en parallélogramme comme intérieures dans le masque d'intérieur de la mission à la finalisation du placement, et les remet en extérieur à la suppression. Le masque sert à distinguer intérieur et extérieur (consommateurs exacts NON VÉRIFIÉS). Aucun prérequis.

- **PlaceableIndoorAreas** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableIndoorAreas.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Aucun prérequis : renvoie toujours true. |
| `PlaceableIndoorAreas.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre la méthode loadIndoorArea. |
| `PlaceableIndoorAreas.registerEventListeners(placeableType: any)` | 30 | ✍ Abonne la spécialisation aux événements de chargement, suppression et finalisation du placement. |
| `PlaceableIndoorAreas.registerXMLPaths(schema: any, basePath: any)` | 38 | ✍ Déclare les entrées indoorAreas.indoorArea avec startNode, widthNode et heightNode. |
| `PlaceableIndoorAreas:onLoad(savegame: table)` | 49 | ✍ Charge les zones intérieures via loadIndoorArea et logue un avertissement XML si aucun bloc indoorAreas n'existe. |
| `PlaceableIndoorAreas:onDelete()` | 68 | ✍ Si des zones avaient été marquées, les remet en OUTDOOR dans le masque d'intérieur, sauf pendant un rechargement du placeable. |
| `PlaceableIndoorAreas:loadIndoorArea(xmlFile: any, key: any, area: any)` | 80 | ✍ Lit les trois noeuds d'une zone dans la table ; renvoie false avec un avertissement si l'un manque. |
| `PlaceableIndoorAreas:onFinalizePlacement()` | 108 | ✍ Met chaque zone en INDOOR dans le masque d'intérieur de la mission et active la remise en extérieur à la suppression. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadIndoorArea` | 25 |
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onDelete` | 32 |
| registerEventListener | `onFinalizePlacement` | 33 |
