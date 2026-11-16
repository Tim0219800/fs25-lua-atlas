# placeables/specializations/PlaceableRollercoaster.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableRollercoaster.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableRollercoaster.lua` — FS25 1.25.1.0

✍ Placeable specialization for a rideable rollercoaster, requiring PlaceableConstructible. It loads an animation clip played on the coaster, carts with seats (camera and character per seat), exit points, a player trigger, spline-linked sounds and a map hotspot with optional teleport. Per-player ride counts are saved by unique user id and seat occupancy is streamed to joining clients. Ride logic functions (enter, exit, start, animation time) are registered but have no body in the dump, so they are UNVERIFIED.

- **PlaceableRollercoaster** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableRollercoaster.prerequisitesPresent(specializations: table) → boolean` | 37 | ✍ Requires the PlaceableConstructible specialization. |
| `PlaceableRollercoaster.registerFunctions(placeableType: any)` | 43 | ✍ Registers the ride API (getCanEnter, startRide, endRide, enterRide, exitRide, riders-changed listeners, player trigger, getNumRides, etc.). Only onSharedAnimationFileLoaded has a body in this dump; the rest is UNVERIFIED. |
| `PlaceableRollercoaster.registerOverwrittenFunctions(placeableType: any)` | 68 | ✍ Overrides getHotspot and finalizeConstruction; their bodies are not in this dump. |
| `PlaceableRollercoaster.registerEventListeners(placeableType: any)` | 75 | ✍ Subscribes to onLoad, onFinalizePlacement, onDelete, onUpdate, onReadStream and onWriteStream. |
| `PlaceableRollercoaster.registerXMLPaths(schema: any, basePath: any)` | 86 | ✍ Declares the XML under placeable.rollercoaster: animation clip, moving audio sources, five driving sounds, player trigger, exit points, hotspot link and teleport nodes, and carts with seats including camera and character definitions. |
| `PlaceableRollercoaster.registerSavegameXMLPaths(schema: any, basePath: any)` | 124 | ✍ Declares savegame keys: state index, spline time, and per-player unique user id with ride count. |
| `PlaceableRollercoaster:onLoad(savegame: table)` | 134 | ✍ Loads the animation setup (async shared i3d for the clip), player trigger, activatable, carts and seats with camera/character, exit points (warns if fewer than seats), hotspot nodes, and on the client the moving audio sources and driving samples. Subscribes to USER_REMOVED. |
| `PlaceableRollercoaster:onSharedAnimationFileLoaded(node: any, failedReason: any, args: any)` | 277 | ✍ Callback after the animation i3d loads: clones its anim character set onto the clip root node, binds the named clip to track 0 (no loop, speed scale), stores its duration, deletes the loaded node, resets ride counters, initializes the constructible state machine states and finishes the loading task. |
| `PlaceableRollercoaster:onFinalizePlacement(savegame: any)` | 318 | ✍ Configures the map hotspot (placeable, no owner farm, world and teleport positions) and adds it to the mission. The first finalized rollercoaster becomes PlaceableRollercoaster.INSTANCE. |
| `PlaceableRollercoaster:onDelete()` | 340 | ✍ Unsubscribes messages, removes and deletes the hotspot, releases the animation i3d, deletes seat characters and cameras, removes moving sounds and samples, removes the player trigger and clears INSTANCE if it was this placeable. |
| `PlaceableRollercoaster:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 388 | ✍ Saves each player's unique user id and ride count. |
| `PlaceableRollercoaster:loadFromXMLFile(xmlFile: any, key: any)` | 402 | ✍ Restores the per-player ride counters from the savegame, ignoring incomplete entries. |
| `PlaceableRollercoaster:onReadStream(streamId: any, connection: any)` | 417 | ✍ Client initial sync: for each occupied seat, reads the player object and calls enterRide for that seat. |
| `PlaceableRollercoaster:onWriteStream(streamId: any, connection: any)` | 431 | ✍ Server initial sync: writes for each seat whether it is occupied and, if so, the player's node object. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onSharedAnimationFileLoaded` | 44 |
| registerFunction | `getCanEnter` | 45 |
| registerFunction | `getFreeSeatIndex` | 46 |
| registerFunction | `getCanStart` | 47 |
| registerFunction | `startRide` | 48 |
| registerFunction | `endRide` | 49 |
| registerFunction | `getAnimation` | 50 |
| registerFunction | `setAnimationTime` | 51 |
| registerFunction | `updateFxModifierValues` | 52 |
| registerFunction | `tryEnterRide` | 53 |
| registerFunction | `enterRide` | 54 |
| registerFunction | `exitRide` | 55 |
| registerFunction | `onUserRemoved` | 56 |
| registerFunction | `registerRidersChangedListener` | 57 |
| registerFunction | `unregisterRidersChangedListener` | 58 |
| registerFunction | `getParentComponent` | 59 |
| registerFunction | `passengerCharacterLoaded` | 60 |
| registerFunction | `playerTriggerCallback` | 61 |
| registerFunction | `setPlayerTriggerState` | 62 |
| registerFunction | `getNumRides` | 63 |
| registerOverwrittenFunction | `getHotspot` | 69 |
| registerOverwrittenFunction | `finalizeConstruction` | 70 |
| registerEventListener | `onLoad` | 76 |
| registerEventListener | `onFinalizePlacement` | 77 |
| registerEventListener | `onDelete` | 78 |
| registerEventListener | `onUpdate` | 79 |
| registerEventListener | `onReadStream` | 80 |
| registerEventListener | `onWriteStream` | 81 |

## Messages

- subscribes `MessageType.USER_REMOVED` (l.271)
