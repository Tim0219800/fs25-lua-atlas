# vehicles/specializations/FruitPreparer.lua

Source: `dataS/scripts/vehicles/specializations/FruitPreparer.lua` — FS25 1.25.1.0

- **FruitPreparer** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `FruitPreparer.initSpecialization()` | 17 |  |
| `FruitPreparer.prerequisitesPresent(specializations: table) → boolean` | 42 |  |
| `FruitPreparer.registerFunctions(vehicleType: any)` | 48 |  |
| `FruitPreparer.registerOverwrittenFunctions(vehicleType: any)` | 54 |  |
| `FruitPreparer.registerEventListeners(vehicleType: any)` | 67 |  |
| `FruitPreparer:onLoad(savegame: table)` | 81 |  |
| `FruitPreparer:onDelete()` | 142 |  |
| `FruitPreparer:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 153 |  |
| `FruitPreparer:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 165 |  |
| `FruitPreparer:onTurnedOn()` | 175 |  |
| `FruitPreparer:onTurnedOff()` | 186 |  |
| `FruitPreparer:loadWorkAreaFromXML(superFunc: table, workArea: table, xmlFile: XMLFile, key: string) → boolean` | 200 |  |
| `FruitPreparer:getDoGroundManipulation(superFunc: any) → boolean` | 217 |  |
| `FruitPreparer:doCheckSpeedLimit(superFunc: any) → boolean` | 225 |  |
| `FruitPreparer:getAllowCutterAIFruitRequirements(superFunc: any)` | 243 |  |
| `FruitPreparer:getDirtMultiplier(superFunc: any)` | 249 |  |
| `FruitPreparer:getWearMultiplier(superFunc: any)` | 261 |  |
| `FruitPreparer:loadRandomlyMovingPartFromXML(superFunc: any, part: any, xmlFile: any, key: any)` | 273 |  |
| `FruitPreparer:getIsRandomlyMovingPartActive(superFunc: any, part: any)` | 283 |  |
| `FruitPreparer.getDefaultSpeedLimit() → number` | 296 |  |
| `FruitPreparer:onEndWorkAreaProcessing(dt: any)` | 302 |  |
| `FruitPreparer:onAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 315 |  |
| `FruitPreparer:processFruitPreparerArea(workArea: any)` | 322 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `processFruitPreparerArea` | 49 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 55 |
| registerOverwrittenFunction | `getDoGroundManipulation` | 56 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 57 |
| registerOverwrittenFunction | `getAllowCutterAIFruitRequirements` | 58 |
| registerOverwrittenFunction | `getDirtMultiplier` | 59 |
| registerOverwrittenFunction | `getWearMultiplier` | 60 |
| registerOverwrittenFunction | `loadRandomlyMovingPartFromXML` | 61 |
| registerOverwrittenFunction | `getIsRandomlyMovingPartActive` | 62 |
| registerEventListener | `onLoad` | 68 |
| registerEventListener | `onDelete` | 69 |
| registerEventListener | `onReadUpdateStream` | 70 |
| registerEventListener | `onWriteUpdateStream` | 71 |
| registerEventListener | `onTurnedOn` | 72 |
| registerEventListener | `onTurnedOff` | 73 |
| registerEventListener | `onEndWorkAreaProcessing` | 74 |
| registerEventListener | `onAIFieldCourseSettingsInitialized` | 75 |
