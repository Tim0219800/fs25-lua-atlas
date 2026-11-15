# vehicles/specializations/TestAreas.lua

Source: `dataS/scripts/vehicles/specializations/TestAreas.lua` — FS25 1.25.1.0

- **TestAreas** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `TestAreas.initSpecialization()` | 15 |  |
| `TestAreas.prerequisitesPresent(specializations: any)` | 54 |  |
| `TestAreas.registerFunctions(vehicleType: any)` | 60 |  |
| `TestAreas.registerOverwrittenFunctions(vehicleType: any)` | 75 |  |
| `TestAreas.registerEventListeners(vehicleType: any)` | 81 |  |
| `TestAreas:onPreLoad(savegame: any)` | 93 |  |
| `TestAreas:onPostLoad(savegame: any)` | 105 |  |
| `TestAreas:onReadStream(streamId: any, connection: any)` | 115 |  |
| `TestAreas:onWriteStream(streamId: any, connection: any)` | 121 |  |
| `TestAreas:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 127 |  |
| `TestAreas:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 137 |  |
| `TestAreas:readTestAreasStream(streamId: any, connection: any)` | 147 |  |
| `TestAreas:writeTestAreasStream(streamId: any, connection: any)` | 186 |  |
| `TestAreas:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 212 |  |
| `TestAreas:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 272 |  |
| `TestAreas:generateTestAreasForWorkArea(workArea: any)` | 339 |  |
| `TestAreas:calculateTestAreaDimensions(workArea: any, testArea: any)` | 384 |  |
| `TestAreas:registerTestAreaForWorkArea(workArea: any, testArea: any)` | 398 |  |
| `TestAreas:setTestAreaRequirements(fruitTypeIndex: any, fillTypeIndex: any, allowsForageGrowthState: any)` | 413 |  |
| `TestAreas:getIsTestAreaActive(testArea: any)` | 431 |  |
| `TestAreas:processTestArea(testArea: any)` | 437 |  |
| `TestAreas:getTestAreaWidthByWorkAreaIndex(workAreaIndex: any)` | 479 |  |
| `TestAreas:getTestAreaChargeByWorkAreaIndex(workAreaIndex: any)` | 496 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `readTestAreasStream` | 61 |
| registerFunction | `writeTestAreasStream` | 62 |
| registerFunction | `generateTestAreasForWorkArea` | 63 |
| registerFunction | `calculateTestAreaDimensions` | 64 |
| registerFunction | `registerTestAreaForWorkArea` | 65 |
| registerFunction | `setTestAreaRequirements` | 66 |
| registerFunction | `getIsTestAreaActive` | 67 |
| registerFunction | `processTestArea` | 68 |
| registerFunction | `getTestAreaWidthByWorkAreaIndex` | 69 |
| registerFunction | `getTestAreaChargeByWorkAreaIndex` | 70 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 76 |
| registerEventListener | `onPreLoad` | 82 |
| registerEventListener | `onPostLoad` | 83 |
| registerEventListener | `onReadStream` | 84 |
| registerEventListener | `onWriteStream` | 85 |
| registerEventListener | `onReadUpdateStream` | 86 |
| registerEventListener | `onWriteUpdateStream` | 87 |
| registerEventListener | `onUpdateTick` | 88 |
