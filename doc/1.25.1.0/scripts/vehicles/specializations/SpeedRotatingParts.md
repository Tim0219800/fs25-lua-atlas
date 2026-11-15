# vehicles/specializations/SpeedRotatingParts.lua

Source: `dataS/scripts/vehicles/specializations/SpeedRotatingParts.lua` — FS25 1.25.1.0

- **SpeedRotatingParts** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `SpeedRotatingParts.prerequisitesPresent(specializations: table) → boolean` | 20 |  |
| `SpeedRotatingParts.initSpecialization()` | 26 |  |
| `SpeedRotatingParts.registerFunctions(vehicleType: any)` | 79 |  |
| `SpeedRotatingParts.registerOverwrittenFunctions(vehicleType: any)` | 88 |  |
| `SpeedRotatingParts.registerEventListeners(vehicleType: any)` | 94 |  |
| `SpeedRotatingParts:onLoad(savegame: table)` | 107 |  |
| `SpeedRotatingParts:onReadStream(streamId: integer, connection: Connection)` | 150 |  |
| `SpeedRotatingParts:onWriteStream(streamId: integer, connection: Connection)` | 165 |  |
| `SpeedRotatingParts:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 181 |  |
| `SpeedRotatingParts:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 202 |  |
| `SpeedRotatingParts:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 222 |  |
| `SpeedRotatingParts:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 242 |  |
| `SpeedRotatingParts:loadSpeedRotatingPartFromXML(speedRotatingPart: table, xmlFile: XMLFile, key: string) → boolean` | 261 |  |
| `SpeedRotatingParts:getIsSpeedRotatingPartActive(speedRotatingPart: table) → boolean` | 456 |  |
| `SpeedRotatingParts:getSpeedRotatingPartDirection(speedRotatingPart: table) → integer` | 472 |  |
| `SpeedRotatingParts:updateSpeedRotatingPart(speedRotatingPart: any, dt: any, isPartActive: any)` | 478 |  |
| `SpeedRotatingParts:validateWashableNode(superFunc: any, node: any)` | 677 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadSpeedRotatingPartFromXML` | 80 |
| registerFunction | `getIsSpeedRotatingPartActive` | 81 |
| registerFunction | `getSpeedRotatingPartDirection` | 82 |
| registerFunction | `updateSpeedRotatingPart` | 83 |
| registerOverwrittenFunction | `validateWashableNode` | 89 |
| registerEventListener | `onLoad` | 95 |
| registerEventListener | `onReadStream` | 96 |
| registerEventListener | `onWriteStream` | 97 |
| registerEventListener | `onReadUpdateStream` | 98 |
| registerEventListener | `onWriteUpdateStream` | 99 |
| registerEventListener | `onUpdate` | 100 |
| registerEventListener | `onUpdateTick` | 101 |
