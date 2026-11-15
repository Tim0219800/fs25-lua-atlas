# placeables/specializations/PlaceableCartridgePlayer.lua

Source : `dataS/scripts/placeables/specializations/PlaceableCartridgePlayer.lua` — FS25 1.25.1.0

- **PlaceableCartridgePlayer** (l.11)
- **PlaceableCartridgePlayerActivatable** (l.173)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlaceableCartridgePlayer.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `PlaceableCartridgePlayer.registerFunctions(placeableType: any)` | 23 |  |
| `PlaceableCartridgePlayer.registerEventListeners(placeableType: any)` | 30 |  |
| `PlaceableCartridgePlayer.registerXMLPaths(schema: any, basePath: any)` | 37 |  |
| `PlaceableCartridgePlayer:onLoad(savegame: any)` | 52 |  |
| `PlaceableCartridgePlayer:onDelete()` | 85 |  |
| `PlaceableCartridgePlayer:cartridgePlayerTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 100 |  |
| `PlaceableCartridgePlayer:activatePlayer()` | 115 |  |
| `PlaceableCartridgePlayerActivatable.new(placeable: any)` | 177 |  |
| `PlaceableCartridgePlayerActivatable:run()` | 188 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `cartridgePlayerTriggerCallback` | 24 |
| registerFunction | `activatePlayer` | 25 |
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onDelete` | 32 |
