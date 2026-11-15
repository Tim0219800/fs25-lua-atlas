# handTools/specializations/HandToolSprayCan.lua

Source: `dataS/scripts/handTools/specializations/HandToolSprayCan.lua` — FS25 1.25.1.0

- **HandToolSprayCan** (l.10)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `HandToolSprayCan.registerXMLPaths(xmlSchema: any)` | 16 |  |
| `HandToolSprayCan.registerSavegameXMLPaths(savegameXMLSchema: any, baseKey: any)` | 31 |  |
| `HandToolSprayCan.registerFunctions(handToolType: any)` | 37 |  |
| `HandToolSprayCan.registerEventListeners(handToolType: any)` | 48 |  |
| `HandToolSprayCan.prerequisitesPresent(specializations: any)` | 65 |  |
| `HandToolSprayCan:onLoad(xmlFile: any)` | 71 |  |
| `HandToolSprayCan:onPostLoad(savegame: any)` | 146 |  |
| `HandToolSprayCan:onDelete()` | 158 |  |
| `HandToolSprayCan:onWriteStream(streamId: any, connection: any, dirtyMask: any)` | 184 |  |
| `HandToolSprayCan:onReadStream(streamId: any, connection: any, carryingPlayer: any)` | 193 |  |
| `HandToolSprayCan:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 202 |  |
| `HandToolSprayCan:onReadUpdateStream(streamId: any, timestamp: any, connection: any, carryingPlayer: any)` | 214 |  |
| `HandToolSprayCan:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 225 |  |
| `HandToolSprayCan:onUpdate(dt: any)` | 233 |  |
| `HandToolSprayCan:onDraw()` | 302 |  |
| `HandToolSprayCan:onHeldStart()` | 324 |  |
| `HandToolSprayCan:onRegisterActionEvents()` | 367 |  |
| `HandToolSprayCan:activateSpraying(_: any, inputValue: any)` | 382 |  |
| `HandToolSprayCan:tryToAddTreeMarker(treeMarkerTypeIndex: any, splitShapeId: any, x: any, y: any, z: any, hitX: any, hitY: any, hitZ: any)` | 389 |  |
| `HandToolSprayCan:processDelayedMarker()` | 419 |  |
| `HandToolSprayCan:setIsSpraying(isSpraying: any, force: any)` | 445 |  |
| `HandToolSprayCan:changeTreeMarkerType(_: any, inputValue: any)` | 470 |  |
| `HandToolSprayCan:getIsSprayingAllowed(shape: any)` | 490 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `tryToAddTreeMarker` | 38 |
| registerFunction | `processDelayedMarker` | 39 |
| registerFunction | `setIsSpraying` | 40 |
| registerFunction | `changeTreeMarkerType` | 41 |
| registerFunction | `getIsSprayingAllowed` | 42 |
| registerFunction | `activateSpraying` | 43 |
| registerEventListener | `onLoad` | 49 |
| registerEventListener | `onPostLoad` | 50 |
| registerEventListener | `onDelete` | 51 |
| registerEventListener | `onUpdate` | 52 |
| registerEventListener | `onDraw` | 53 |
| registerEventListener | `onWriteStream` | 54 |
| registerEventListener | `onReadStream` | 55 |
| registerEventListener | `onWriteUpdateStream` | 56 |
| registerEventListener | `onReadUpdateStream` | 57 |
| registerEventListener | `onRegisterActionEvents` | 58 |
| registerEventListener | `onHeldStart` | 59 |
| registerEventListener | `onHeldEnd` | 60 |
