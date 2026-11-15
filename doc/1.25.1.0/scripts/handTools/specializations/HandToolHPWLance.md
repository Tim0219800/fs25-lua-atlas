# handTools/specializations/HandToolHPWLance.lua

Source: `dataS/scripts/handTools/specializations/HandToolHPWLance.lua` — FS25 1.25.1.0

- **HandToolHPWLance** (l.10)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `HandToolHPWLance.registerXMLPaths(xmlSchema: any)` | 14 |  |
| `HandToolHPWLance.registerFunctions(handToolType: any)` | 26 |  |
| `HandToolHPWLance.registerOverwrittenFunctions(vehicleType: any)` | 34 |  |
| `HandToolHPWLance.registerEventListeners(handToolType: any)` | 40 |  |
| `HandToolHPWLance.prerequisitesPresent(specializations: any)` | 53 |  |
| `HandToolHPWLance:onLoad(xmlFile: any, baseDirectory: any)` | 59 |  |
| `HandToolHPWLance:onDelete()` | 85 |  |
| `HandToolHPWLance:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 93 |  |
| `HandToolHPWLance:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 107 |  |
| `HandToolHPWLance:onUpdate(dt: any)` | 130 |  |
| `HandToolHPWLance:onLanceCallback(nodeId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 184 |  |
| `HandToolHPWLance:setIsActivated(isActivated: any)` | 216 |  |
| `HandToolHPWLance:onRegisterActionEvents()` | 248 |  |
| `HandToolHPWLance:onWashAction(_: any, inputValue: any)` | 263 |  |
| `HandToolHPWLance:getCanBeDropped(superFunc: any)` | 269 |  |
| `HandToolHPWLance:onHeldEnd()` | 275 |  |
| `HandToolHPWLance:onDebugDraw(x: any, y: any, textSize: any)` | 282 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onWashAction` | 27 |
| registerFunction | `setIsActivated` | 28 |
| registerFunction | `onLanceCallback` | 29 |
| registerOverwrittenFunction | `getCanBeDropped` | 35 |
| registerEventListener | `onLoad` | 41 |
| registerEventListener | `onDelete` | 42 |
| registerEventListener | `onWriteUpdateStream` | 43 |
| registerEventListener | `onReadUpdateStream` | 44 |
| registerEventListener | `onUpdate` | 45 |
| registerEventListener | `onRegisterActionEvents` | 46 |
| registerEventListener | `onHeldEnd` | 47 |
| registerEventListener | `onDebugDraw` | 48 |
