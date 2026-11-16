# placeables/specializations/PlaceableFoliageAreas.lua

*[English version](../../../../scripts/placeables/specializations/PlaceableFoliageAreas.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableFoliageAreas.lua` — FS25 1.25.1.0

✍ Spécialisation de placeable qui permet à un bâtiment de définir des zones en parallélogramme (noeuds début, largeur, hauteur) peintes avec un type de culture à un stade de croissance, ou avec une couche de feuillage décoratif, à la finalisation du placement. L'écriture sur la carte se fait uniquement sur le serveur. Aucun prérequis.

- **PlaceableFoliageAreas** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableFoliageAreas.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Aucun prérequis : renvoie toujours true. |
| `PlaceableFoliageAreas.registerFunctions(placeableType: any)` | 24 | ✍ Enregistre la méthode loadFoliageArea sur le type de placeable. |
| `PlaceableFoliageAreas.registerEventListeners(placeableType: any)` | 30 | ✍ Abonne la spécialisation aux événements de chargement et de post-finalisation du placement. |
| `PlaceableFoliageAreas.registerXMLPaths(schema: any, basePath: any)` | 37 | ✍ Déclare les entrées foliageAreas.foliageArea : noeuds début, largeur et hauteur, fruitType, growthStateName, decoFoliage et état numérique. |
| `PlaceableFoliageAreas:onLoad(savegame: table)` | 52 | ✍ Parcourt les entrées foliageArea et conserve dans spec.areas celles acceptées par loadFoliageArea. |
| `PlaceableFoliageAreas:loadFoliageArea(xmlFile: any, key: any, area: any)` | 66 | ✍ Lit une zone dans la table fournie. Si fruitType et decoFoliage sont tous deux définis, decoFoliage est ignoré. Résout le type de culture et le stade (par défaut l'état maximal de récolte moins un), vérifie que la couche déco existe sur la carte et exige les trois noeuds. Renvoie false en cas d'échec. |
| `PlaceableFoliageAreas:onPostFinalizePlacement()` | 134 | ✍ Serveur uniquement : pour les zones de culture, met en file un FieldUpdateTask avec le type de culture et le stade sur la zone ; pour les zones déco, appelle applyDecoFoliage du système de feuillage avec les positions monde des trois coins. |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadFoliageArea` | 25 |
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onPostFinalizePlacement` | 32 |
