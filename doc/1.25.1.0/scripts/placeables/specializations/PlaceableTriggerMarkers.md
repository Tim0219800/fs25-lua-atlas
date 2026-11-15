# placeables/specializations/PlaceableTriggerMarkers.lua

Source: `dataS/scripts/placeables/specializations/PlaceableTriggerMarkers.lua` — FS25 1.25.1.0

- **PlaceableTriggerMarkers** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableTriggerMarkers.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `PlaceableTriggerMarkers.registerEventListeners(placeableType: any)` | 24 |  |
| `PlaceableTriggerMarkers.registerFunctions(placeableType: any)` | 33 |  |
| `PlaceableTriggerMarkers.registerXMLPaths(schema: any, basePath: any)` | 42 |  |
| `PlaceableTriggerMarkers:onLoad(savegame: table)` | 56 |  |
| `PlaceableTriggerMarkers:onMarkerFileLoaded(i3dNode: any, failedReason: any, args: any)` | 132 |  |
| `PlaceableTriggerMarkers:onDelete()` | 148 |  |
| `PlaceableTriggerMarkers:onFinalizePlacement()` | 169 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 25 |
| registerEventListener | `onDelete` | 26 |
| registerEventListener | `onFinalizePlacement` | 27 |
| registerEventListener | `onOwnerChanged` | 28 |
| registerFunction | `onPlayerFarmChanged` | 34 |
| registerFunction | `onMarkerFileLoaded` | 35 |
| registerFunction | `getTriggerMarkerPosition` | 36 |
| registerFunction | `setShowMarkers` | 37 |

## Messages

- subscribes `MessageType.PLAYER_FARM_CHANGED` (l.185)
- subscribes `MessageType.PLAYER_CREATED` (l.186)
