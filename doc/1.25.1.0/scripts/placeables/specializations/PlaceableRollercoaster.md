# placeables/specializations/PlaceableRollercoaster.lua

Source: `dataS/scripts/placeables/specializations/PlaceableRollercoaster.lua` — FS25 1.25.1.0

- **PlaceableRollercoaster** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PlaceableRollercoaster.prerequisitesPresent(specializations: table) → boolean` | 37 |  |
| `PlaceableRollercoaster.registerFunctions(placeableType: any)` | 43 |  |
| `PlaceableRollercoaster.registerOverwrittenFunctions(placeableType: any)` | 68 |  |
| `PlaceableRollercoaster.registerEventListeners(placeableType: any)` | 75 |  |
| `PlaceableRollercoaster.registerXMLPaths(schema: any, basePath: any)` | 86 |  |
| `PlaceableRollercoaster.registerSavegameXMLPaths(schema: any, basePath: any)` | 124 |  |
| `PlaceableRollercoaster:onLoad(savegame: table)` | 134 |  |
| `PlaceableRollercoaster:onSharedAnimationFileLoaded(node: any, failedReason: any, args: any)` | 277 |  |
| `PlaceableRollercoaster:onFinalizePlacement(savegame: any)` | 318 |  |
| `PlaceableRollercoaster:onDelete()` | 340 |  |
| `PlaceableRollercoaster:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 388 |  |
| `PlaceableRollercoaster:loadFromXMLFile(xmlFile: any, key: any)` | 402 |  |
| `PlaceableRollercoaster:onReadStream(streamId: any, connection: any)` | 417 |  |
| `PlaceableRollercoaster:onWriteStream(streamId: any, connection: any)` | 431 |  |

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
