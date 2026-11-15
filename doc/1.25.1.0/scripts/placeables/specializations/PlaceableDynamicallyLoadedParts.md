# placeables/specializations/PlaceableDynamicallyLoadedParts.lua

Source : `dataS/scripts/placeables/specializations/PlaceableDynamicallyLoadedParts.lua` — FS25 1.25.1.0

- **PlaceableDynamicallyLoadedParts** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableDynamicallyLoadedParts.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableDynamicallyLoadedParts.registerFunctions(placeableType: any)` | 24 |  |
| `PlaceableDynamicallyLoadedParts.registerEventListeners(placeableType: any)` | 30 |  |
| `PlaceableDynamicallyLoadedParts.registerXMLPaths(schema: any, basePath: any)` | 38 |  |
| `PlaceableDynamicallyLoadedParts:onLoad(savegame: table)` | 60 |  |
| `PlaceableDynamicallyLoadedParts:onDynamicallyPartI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 88 |  |
| `PlaceableDynamicallyLoadedParts:onDelete()` | 237 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `onDynamicallyPartI3DLoaded` | 25 |
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onDelete` | 32 |
| registerEventListener | `onFinalizePlacement` | 33 |
