# vehicles/specializations/TestAreas.lua

*[Version française](../../../fr/scripts/vehicles/specializations/TestAreas.md)*

Source: `dataS/scripts/vehicles/specializations/TestAreas.lua` — FS25 1.25.1.0

✍ Helper specialization (requires WorkArea) that adds 'test areas' to work areas: small ground rectangles checked for crops or fill material so other specializations know where the tool actually has contact. Areas come from XML or are auto-generated across the work area width. The server samples the density maps and syncs contact flags to clients as a compact first/last-contact stream. It exposes the contact width and a charge ratio per work area.

- **TestAreas** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `TestAreas.initSpecialization()` | 15 | ✍ Registers the XML schema for testAreas under work areas and work area configurations: auto-generate, root/start/width nodes, offsets, length, count (10), width scale (0.9), scale, and explicit testArea nodes. |
| `TestAreas.prerequisitesPresent(specializations: any)` | 54 | ✍ Returns true only if the vehicle type also has the WorkArea specialization. |
| `TestAreas.registerFunctions(vehicleType: any)` | 60 | ✍ Registers the stream read/write, generation, dimension calculation, registration, requirements, activity, processing and width/charge query functions. |
| `TestAreas.registerOverwrittenFunctions(vehicleType: any)` | 75 | ✍ Overrides loadWorkAreaFromXML. |
| `TestAreas.registerEventListeners(vehicleType: any)` | 81 | ✍ Subscribes to onPreLoad, onPostLoad, the four stream events (read/write, plain and update) and onUpdateTick. |
| `TestAreas:onPreLoad(savegame: any)` | 93 | ✍ Creates the test area lists and reserves a dirty flag used to sync contact changes. |
| `TestAreas:onPostLoad(savegame: any)` | 105 | ✍ Builds the lookup of test areas by work area index from the by-work-area table. |
| `TestAreas:onReadStream(streamId: any, connection: any)` | 115 | ✍ Initial sync on join: reads the contact flags. |
| `TestAreas:onWriteStream(streamId: any, connection: any)` | 121 | ✍ Initial sync on join: writes the contact flags. |
| `TestAreas:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 127 | ✍ Client side: reads the contact flags when the server flagged a change in this update. |
| `TestAreas:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 137 | ✍ Server side: writes a bool for the dirty flag and, if set, the contact flags. |
| `TestAreas:readTestAreasStream(streamId: any, connection: any)` | 147 | ✍ Reads the compact contact state: first-contact scan from the left, then last-contact scan from the right, and marks every area between them as in contact. |
| `TestAreas:writeTestAreasStream(streamId: any, connection: any)` | 186 | ✍ Writes the compact contact state: bools up to the first contact from the left, then from the right up to the last contact. |
| `TestAreas:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 212 | ✍ For each active work area, tests areas from the left to find the first contact, then from the right for the last, fills the area in between as in contact, and stores the resulting min/max width. Inactive areas reset to unlimited width. |
| `TestAreas:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 272 | ✍ Override: after the parent loads the work area, reads its testAreas settings (warns where the platform disallows them), then auto-generates areas or reads explicit testArea entries. Returns false if the parent fails. |
| `TestAreas:generateTestAreasForWorkArea(workArea: any)` | 339 | ✍ Creates transform nodes and splits the work area width into numAreas equal test areas (with side offsets, length and z offset), registering each one. |
| `TestAreas:calculateTestAreaDimensions(workArea: any, testArea: any)` | 384 | ✍ Computes the test area's min/max X relative to the work area root node and widens the work area's overall X range. |
| `TestAreas:registerTestAreaForWorkArea(workArea: any, testArea: any)` | 398 | ✍ Resets the contact flags of a test area and adds it to the per-work-area list and the global list. |
| `TestAreas:setTestAreaRequirements(fruitTypeIndex: any, fillTypeIndex: any, allowsForageGrowthState: any)` | 413 | ✍ Sets what the areas look for: a fruit type (with optional forage growth states) or a fill type; FruitType.UNKNOWN and FillType.UNKNOWN count as none. |
| `TestAreas:getIsTestAreaActive(testArea: any)` | 431 | ✍ Hook returning true by default; other specializations may override it to disable an individual area. |
| `TestAreas:processTestArea(testArea: any)` | 437 | ✍ Server: samples the density map (fruit area or height fill level) under the area and sets its contact flag, raising the dirty flag on change. Clients only draw debug. Returns the area's current contact state. |
| `TestAreas:getTestAreaWidthByWorkAreaIndex(workAreaIndex: any)` | 479 | ✍ Returns current contact min/max X, total min/max X and true when the work area has test areas; otherwise half-width bounds and false, or unlimited values if the index is unknown. |
| `TestAreas:getTestAreaChargeByWorkAreaIndex(workAreaIndex: any)` | 496 | ✍ Returns the fraction (0 to 1) of the work area's test areas currently in contact, or 1 when it has none. |

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
