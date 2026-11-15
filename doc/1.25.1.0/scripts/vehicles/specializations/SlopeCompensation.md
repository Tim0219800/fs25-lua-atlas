# vehicles/specializations/SlopeCompensation.lua

Source: `dataS/scripts/vehicles/specializations/SlopeCompensation.lua` — FS25 1.25.1.0

- **SlopeCompensation** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `SlopeCompensation.prerequisitesPresent(specializations: any)` | 19 |  |
| `SlopeCompensation.initSpecialization()` | 25 |  |
| `SlopeCompensation.registerXMLPaths(schema: any, basePath: any)` | 48 |  |
| `SlopeCompensation.registerFunctions(vehicleType: any)` | 88 |  |
| `SlopeCompensation.registerEventListeners(vehicleType: any)` | 99 |  |
| `SlopeCompensation:onLoad(savegame: any)` | 109 |  |
| `SlopeCompensation:onLoadFinished(savegame: any)` | 154 |  |
| `SlopeCompensation:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 180 |  |
| `SlopeCompensation:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 189 |  |
| `SlopeCompensation:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 218 |  |
| `SlopeCompensation:onRegisterAnimationValueTypes()` | 224 |  |
| `SlopeCompensation:loadSlopeCompensationWheels(xmlFile: any, key: any, indexName: any, nodeName: any, nodesName: any)` | 265 |  |
| `SlopeCompensation:loadSlopeCompensationNodeFromXML(compensationNode: any, xmlFile: any, key: any)` | 316 |  |
| `SlopeCompensation:getSlopeCompensationAngle(compensationNode: any)` | 438 |  |
| `SlopeCompensation:getSlopeCompensationAngleScale(compensationNode: any)` | 444 |  |
| `SlopeCompensation:setSlopeCompensationNodeAngle(compensationNode: any, angle: any)` | 484 |  |
| `SlopeCompensation:updateDebugValues(values: any)` | 542 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadSlopeCompensationWheels` | 89 |
| registerFunction | `loadSlopeCompensationNodeFromXML` | 90 |
| registerFunction | `getSlopeCompensationAngle` | 91 |
| registerFunction | `getSlopeCompensationAngleScale` | 92 |
| registerFunction | `updateSlopeCompensationAngle` | 93 |
| registerFunction | `setSlopeCompensationNodeAngle` | 94 |
| registerEventListener | `onLoad` | 100 |
| registerEventListener | `onLoadFinished` | 101 |
| registerEventListener | `onUpdate` | 102 |
| registerEventListener | `onUpdateTick` | 103 |
| registerEventListener | `onRegisterAnimationValueTypes` | 104 |
