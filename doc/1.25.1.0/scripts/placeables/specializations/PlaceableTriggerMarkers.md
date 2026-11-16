# placeables/specializations/PlaceableTriggerMarkers.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableTriggerMarkers.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableTriggerMarkers.lua` — FS25 1.25.1.0

✍ Placeable specialization that attaches visual trigger markers (loaded i3d files, optionally snapped to terrain) to nodes of a building and shows them only to players allowed to access it. It listens to farm and player-created messages to refresh visibility. Markers are declared under `placeable.triggerMarkers.triggerMarker(?)`.

- **PlaceableTriggerMarkers** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableTriggerMarkers.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite specialization. |
| `PlaceableTriggerMarkers.registerEventListeners(placeableType: any)` | 24 | ✍ Subscribes to onLoad, onDelete, onFinalizePlacement and onOwnerChanged. |
| `PlaceableTriggerMarkers.registerFunctions(placeableType: any)` | 33 | ✍ Registers `onPlayerFarmChanged`, `onMarkerFileLoaded`, `getTriggerMarkerPosition` and `setShowMarkers`. Note: only `onMarkerFileLoaded` is defined in this file; the other three are referenced but not defined here (UNVERIFIED, may live elsewhere). |
| `PlaceableTriggerMarkers.registerXMLPaths(schema: any, basePath: any)` | 42 | ✍ Declares marker XML keys: `#node`, `#filename`, `#adjustToGround`, `#groundOffset` (default 0.03), `#showAllPlayers` and `#showOnlyIfOwned` (both default false). |
| `PlaceableTriggerMarkers:onLoad(savegame: table)` | 56 | ✍ Iterates the marker entries, skipping those with no node, and stores each marker's settings (ground offset defaults to 3 cm). If a filename is set it starts an asynchronous shared i3d load tied to a loading task. |
| `PlaceableTriggerMarkers:onMarkerFileLoaded(i3dNode: any, failedReason: any, args: any)` | 132 | ✍ Async load callback: links the loaded i3d under the marker node (when loading succeeded), makes it the marker's node, then completes the loading task. |
| `PlaceableTriggerMarkers:onDelete()` | 148 | ✍ Releases the shared i3d load requests, removes each marker from the mission via `removeTriggerMarker`, and unsubscribes from the player-farm-changed and player-created messages. |
| `PlaceableTriggerMarkers:onFinalizePlacement()` | 169 | ✍ Snaps markers with `adjustToGround` to the terrain height plus offset, shows or hides markers according to player access, and subscribes to the farm-changed and player-created messages. |

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
