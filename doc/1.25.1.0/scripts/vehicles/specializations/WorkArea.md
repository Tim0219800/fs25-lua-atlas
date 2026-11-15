# vehicles/specializations/WorkArea.lua

Source : `dataS/scripts/vehicles/specializations/WorkArea.lua` — FS25 1.25.1.0

- **WorkArea** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `WorkArea.initSpecialization()` | 18 |  |
| `WorkArea.registerWorkAreaXMLPaths(schema: any, basePath: any)` | 37 |  |
| `WorkArea.prerequisitesPresent(specializations: any)` | 56 |  |
| `WorkArea.registerEvents(vehicleType: any)` | 62 |  |
| `WorkArea.registerFunctions(vehicleType: any)` | 69 |  |
| `WorkArea.registerOverwrittenFunctions(vehicleType: any)` | 89 |  |
| `WorkArea.registerEventListeners(vehicleType: any)` | 98 |  |
| `WorkArea:onLoad(savegame: table)` | 106 |  |
| `WorkArea:getIsAccessibleAtWorldPosition(farmId: boolean, x: integer, z: boolean, workAreaType: any)` | 161 |  |
| `WorkArea:updateLastWorkedArea(area: any)` | 185 |  |
| `WorkArea:getLastTouchedFarmlandFarmId()` | 192 |  |
| `WorkArea:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 207 |  |
| `WorkArea:loadWorkAreaFromXML(workArea: table, xmlFile: XMLFile, key: string) → boolean` | 345 |  |
| `WorkArea:getWorkAreaByIndex(workAreaIndex: any)` | 452 |  |
| `WorkArea:getIsWorkAreaActive(workArea: table) → boolean` | 461 |  |
| `WorkArea:updateWorkAreaWidth(workAreaIndex: integer)` | 488 |  |
| `WorkArea:getWorkAreaWidth(workAreaIndex: integer)` | 507 |  |
| `WorkArea:getIsWorkAreaProcessing(workArea: table)` | 515 |  |
| `WorkArea:getTypedNetworkAreas(areaType: integer, needsFieldProperty: boolean) → table, boolean, number` | 526 |  |
| `WorkArea:getTypedWorkAreas(areaType: integer) → table` | 560 |  |
| `WorkArea:getIsTypedWorkAreaActive(areaType: integer) → boolean, table` | 575 |  |
| `WorkArea:getAIWorkAreaWidth()` | 616 |  |
| `WorkArea:getIsFarmlandNotOwnedWarningShown()` | 629 |  |
| `WorkArea:loadSpeedRotatingPartFromXML(superFunc: table, speedRotatingPart: table, xmlFile: XMLFile, key: string) → boolean` | 639 |  |
| `WorkArea:getIsSpeedRotatingPartActive(superFunc: table, speedRotatingPart: table) → boolean` | 653 |  |
| `WorkArea:checkMovingPartDirtyUpdateNode(superFunc: any, node: any, movingPart: any)` | 673 |  |
| `WorkArea:getImplementAllowAutomaticSteering(superFunc: any)` | 693 |  |

## Spécialisation

| Type | Nom | Ligne |
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
