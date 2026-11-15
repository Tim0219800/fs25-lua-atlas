# vehicles/specializations/VinePrepruner.lua

Source: `dataS/scripts/vehicles/specializations/VinePrepruner.lua` — FS25 1.25.1.0

- **VinePrepruner** (l.12)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `VinePrepruner.initSpecialization()` | 18 |  |
| `VinePrepruner.prerequisitesPresent(specializations: any)` | 44 |  |
| `VinePrepruner.registerFunctions(vehicleType: any)` | 50 |  |
| `VinePrepruner.registerOverwrittenFunctions(vehicleType: any)` | 57 |  |
| `VinePrepruner.registerEventListeners(vehicleType: any)` | 67 |  |
| `VinePrepruner:onLoad(savegame: any)` | 81 |  |
| `VinePrepruner:onDelete()` | 117 |  |
| `VinePrepruner:onReadStream(streamId: any, connection: any)` | 124 |  |
| `VinePrepruner:onWriteStream(streamId: any, connection: any)` | 130 |  |
| `VinePrepruner:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 136 |  |
| `VinePrepruner:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 146 |  |
| `VinePrepruner.readPrePrunerFromStream(self: any, streamId: any, forceState: any)` | 157 |  |
| `VinePrepruner.writePrePrunerToStream(self: any, streamId: any)` | 186 |  |
| `VinePrepruner:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 201 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadPreprunerNodeFromXML` | 51 |
| registerFunction | `getIsPreprunerNodeActive` | 52 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 58 |
| registerOverwrittenFunction | `getCanStartVineDetection` | 59 |
| registerOverwrittenFunction | `getIsValidVinePlaceable` | 60 |
| registerOverwrittenFunction | `handleVinePlaceable` | 61 |
| registerOverwrittenFunction | `getAIImplementUseVineSegment` | 62 |
| registerEventListener | `onLoad` | 68 |
| registerEventListener | `onDelete` | 69 |
| registerEventListener | `onReadStream` | 70 |
| registerEventListener | `onWriteStream` | 71 |
| registerEventListener | `onReadUpdateStream` | 72 |
| registerEventListener | `onWriteUpdateStream` | 73 |
| registerEventListener | `onUpdate` | 74 |
| registerEventListener | `onTurnedOff` | 75 |
| registerEventListener | `onAnimationPartChanged` | 76 |
