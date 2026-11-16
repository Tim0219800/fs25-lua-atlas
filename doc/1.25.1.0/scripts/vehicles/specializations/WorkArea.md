# vehicles/specializations/WorkArea.lua

*[Version française](../../../fr/scripts/vehicles/specializations/WorkArea.md)*

Source: `dataS/scripts/vehicles/specializations/WorkArea.lua` — FS25 1.25.1.0

✍ Core specialization that gives implements work areas (start, width and height nodes forming a parallelogram) and runs their processing function every update tick. It requires GroundReference and supports a `workArea` configuration. Each tick it raises `onStartWorkAreaProcessing` and `onEndWorkAreaProcessing`, checks activity (ground contact, direction, lowered state) and farmland access, calls optional pre/process/post functions named in the XML, and adds worked hectares and time to farm stats. Registers the default and auxiliary area types. `getMissionByWorkArea` is registered as a vehicle function but its body is not in the dump (UNVERIFIED).

- **WorkArea** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `WorkArea.initSpecialization()` | 18 | ✍ Registers the work area types `default` and `auxiliary`, adds the `workArea` configuration type, and declares the work area XML paths (base and per configuration) plus `#workAreaIndex` for speed rotating parts. |
| `WorkArea.registerWorkAreaXMLPaths(schema: any, basePath: any)` | 37 | ✍ Registers the XML attributes of one work area under a base path: type, ground contact, backwards disabling, owned farmland requirement, function names, the three area nodes, ground reference node index and lowered-only flag. |
| `WorkArea.prerequisitesPresent(specializations: any)` | 56 | ✍ Returns true only if the vehicle type has the GroundReference specialization. |
| `WorkArea.registerEvents(vehicleType: any)` | 62 | ✍ Registers the vehicle events `onStartWorkAreaProcessing` and `onEndWorkAreaProcessing`. |
| `WorkArea.registerFunctions(vehicleType: any)` | 69 | ✍ Registers the work area API on the vehicle type: loading, lookup, activity, width, processing state, typed areas, farmland access, last worked area, mission lookup and AI width. |
| `WorkArea.registerOverwrittenFunctions(vehicleType: any)` | 89 | ✍ Overrides `loadSpeedRotatingPartFromXML`, `getIsSpeedRotatingPartActive`, `checkMovingPartDirtyUpdateNode` and `getImplementAllowAutomaticSteering`. |
| `WorkArea.registerEventListeners(vehicleType: any)` | 98 | ✍ Subscribes to onLoad and onUpdateTick. |
| `WorkArea:onLoad(savegame: table)` | 106 | ✍ Selects the XML section of the chosen `workArea` configuration (falling back to `vehicle.workAreas`), loads every valid work area, computes widths and indexes areas by type. Initializes farmland warning state and texts. |
| `WorkArea:getIsAccessibleAtWorldPosition(farmId: boolean, x: integer, z: boolean, workAreaType: any)` | 161 | ✍ Returns three values: whether the farm may work at x, z, the farmland owner id, and whether the land is buyable. Mission vehicles defer to `g_missionManager`; unowned or non-buyable land is refused. |
| `WorkArea:updateLastWorkedArea(area: any)` | 185 | ✍ Keeps the largest worked area value reported during the current tick, later converted to hectares for stats. |
| `WorkArea:getLastTouchedFarmlandFarmId()` | 192 | ✍ Returns the farm id of the last farmland where an owned work area was accessible, or 0 if none. |
| `WorkArea:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 207 | ✍ Per tick: raises the start event, then for each non-auxiliary area checks activity and farmland access (testing start, width, height and the fourth corner), runs pre, main and post functions, and stores worked hectares and processing time. Shows a blinking warning if no area is on accessible buyable land, raises the end event, then adds hectares and minutes to farm stats. |
| `WorkArea:loadWorkAreaFromXML(workArea: table, xmlFile: XMLFile, key: string) → boolean` | 345 | ✍ Fills a work area table from XML and returns true on success. Validates the three nodes (distinct positions), type, ground reference (when ground contact is required), mandatory `functionName` that must exist on the vehicle, and optional pre/post functions. Note: the `workArea.type == nil` test can never trigger because of the `or WorkAreaType.DEFAULT` fallback just above it. |
| `WorkArea:getWorkAreaByIndex(workAreaIndex: any)` | 452 | ✍ Returns the work area table at the given 1-based index, or nil. |
| `WorkArea:getIsWorkAreaActive(workArea: table) → boolean` | 461 | ✍ True if the area passes its conditions: ground reference node active (if required), not moving backwards (if `disableBackwards`), and implement lowered (if `onlyActiveWhenLowered`). |
| `WorkArea:updateWorkAreaWidth(workAreaIndex: integer)` | 488 | ✍ Recomputes the area's `workWidth` (meters) as the lateral spread of the start, width and height nodes measured from the first component. Does nothing if the index is invalid. |
| `WorkArea:getWorkAreaWidth(workAreaIndex: integer)` | 507 | ✍ Returns the last computed width of the work area at the given index (no nil check on the index). |
| `WorkArea:getIsWorkAreaProcessing(workArea: table)` | 515 | ✍ True if the area produced a result within the last 200 ms of mission time. |
| `WorkArea:getTypedNetworkAreas(areaType: integer, needsFieldProperty: boolean) → table, boolean, number` | 526 | ✍ For the active areas of a type, returns a list of {x, z, x1, z1, x2, z2} corner coordinates to send over the network, a flag telling whether any area was refused for access, and the summed area size. When `needsFieldProperty` is set, checks the local farm's land access. |
| `WorkArea:getTypedWorkAreas(areaType: integer) → table` | 560 | ✍ Returns the table of work areas of a given type, or an empty table. |
| `WorkArea:getIsTypedWorkAreaActive(areaType: integer) → boolean, table` | 575 | ✍ Returns whether at least one area of the type is active, plus the list of areas of that type. |
| `WorkArea:getAIWorkAreaWidth()` | 616 | ✍ Returns the largest `workWidth` among areas whose type is flagged as an AI area by the work area type manager (0 if none). |
| `WorkArea:getIsFarmlandNotOwnedWarningShown()` | 629 | ✍ Returns whether the not-owned-farmland warning was raised during the last tick. |
| `WorkArea:loadSpeedRotatingPartFromXML(superFunc: table, speedRotatingPart: table, xmlFile: XMLFile, key: string) → boolean` | 639 | ✍ Extends the parent loader: after it succeeds, also reads `#workAreaIndex` into the speed rotating part. Returns false if the parent fails. |
| `WorkArea:getIsSpeedRotatingPartActive(superFunc: table, speedRotatingPart: table) → boolean` | 653 | ✍ If the part is tied to a work area, it is active only while that area is processing; an invalid index logs a warning and returns true. Otherwise defers to the parent. Note: the warning prints the index after it was set to nil. |
| `WorkArea:checkMovingPartDirtyUpdateNode(superFunc: any, node: any, movingPart: any)` | 673 | ✍ Calls the parent check, then logs an XML error if a work area node or ground reference node is under a moving part with a limited update distance. |
| `WorkArea:getImplementAllowAutomaticSteering(superFunc: any)` | 693 | ✍ Returns true if any work area has a type flagged for steering assist; otherwise defers to the parent. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onStartWorkAreaProcessing` | 63 |
| registerEvent | `onEndWorkAreaProcessing` | 64 |
| registerFunction | `loadWorkAreaFromXML` | 70 |
| registerFunction | `getWorkAreaByIndex` | 71 |
| registerFunction | `getIsWorkAreaActive` | 72 |
| registerFunction | `updateWorkAreaWidth` | 73 |
| registerFunction | `getWorkAreaWidth` | 74 |
| registerFunction | `getIsWorkAreaProcessing` | 75 |
| registerFunction | `getTypedNetworkAreas` | 76 |
| registerFunction | `getTypedWorkAreas` | 77 |
| registerFunction | `getIsTypedWorkAreaActive` | 78 |
| registerFunction | `getIsFarmlandNotOwnedWarningShown` | 79 |
| registerFunction | `getLastTouchedFarmlandFarmId` | 80 |
| registerFunction | `getIsAccessibleAtWorldPosition` | 81 |
| registerFunction | `updateLastWorkedArea` | 82 |
| registerFunction | `getMissionByWorkArea` | 83 |
| registerFunction | `getAIWorkAreaWidth` | 84 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 90 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 91 |
| registerOverwrittenFunction | `checkMovingPartDirtyUpdateNode` | 92 |
| registerOverwrittenFunction | `getImplementAllowAutomaticSteering` | 93 |
| registerEventListener | `onLoad` | 99 |
| registerEventListener | `onUpdateTick` | 100 |
