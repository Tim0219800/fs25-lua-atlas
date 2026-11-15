# vehicles/specializations/GroundReference.lua

Source: `dataS/scripts/vehicles/specializations/GroundReference.lua` — FS25 1.25.1.0

- **GroundReference** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `GroundReference.prerequisitesPresent(specializations: any)` | 16 |  |
| `GroundReference.initSpecialization()` | 22 |  |
| `GroundReference.registerEvents(vehicleType: any)` | 43 |  |
| `GroundReference.registerFunctions(vehicleType: any)` | 48 |  |
| `GroundReference.registerOverwrittenFunctions(vehicleType: any)` | 59 |  |
| `GroundReference.registerEventListeners(vehicleType: any)` | 67 |  |
| `GroundReference:onLoad(savegame: any)` | 76 |  |
| `GroundReference:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 124 |  |
| `GroundReference:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 135 |  |
| `GroundReference:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 146 |  |
| `GroundReference:loadGroundReferenceNode(xmlFile: any, baseName: any, entry: any)` | 155 |  |
| `GroundReference:updateGroundReferenceNode(groundReferenceNode: any)` | 179 |  |
| `GroundReference:getGroundReferenceNodeFromIndex(refNodeIndex: any)` | 213 |  |
| `GroundReference:getIsGroundReferenceNodeActive(groundReferenceNode: any)` | 220 |  |
| `GroundReference:getIsGroundReferenceNodeThreshold(groundReferenceNode: any)` | 226 |  |
| `GroundReference:getGroundReferenceNodeForwardSpeed(groundReferenceNodeIndex: any)` | 232 |  |
| `GroundReference:getPowerMultiplier(superFunc: any)` | 246 |  |
| `GroundReference:loadSpeedRotatingPartFromXML(superFunc: any, speedRotatingPart: any, xmlFile: any, key: any)` | 274 |  |
| `GroundReference:getIsSpeedRotatingPartActive(superFunc: any, speedRotatingPart: any)` | 292 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadGroundReferenceNode` | 49 |
| registerFunction | `updateGroundReferenceNode` | 50 |
| registerFunction | `getGroundReferenceNodeFromIndex` | 51 |
| registerFunction | `getIsGroundReferenceNodeActive` | 52 |
| registerFunction | `getIsGroundReferenceNodeThreshold` | 53 |
| registerFunction | `getGroundReferenceNodeForwardSpeed` | 54 |
| registerOverwrittenFunction | `getPowerMultiplier` | 60 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 61 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 62 |
| registerEventListener | `onLoad` | 68 |
| registerEventListener | `onReadUpdateStream` | 69 |
| registerEventListener | `onWriteUpdateStream` | 70 |
| registerEventListener | `onUpdateTick` | 71 |
