# vehicles/specializations/ArticulatedAxis.lua

Source: `dataS/scripts/vehicles/specializations/ArticulatedAxis.lua` — FS25 1.25.1.0

- **ArticulatedAxis** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `ArticulatedAxis.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `ArticulatedAxis.initSpecialization()` | 23 |  |
| `ArticulatedAxis.registerOverwrittenFunctions(vehicleType: any)` | 52 |  |
| `ArticulatedAxis.registerEventListeners(vehicleType: any)` | 60 |  |
| `ArticulatedAxis:onLoad(savegame: table)` | 71 |  |
| `ArticulatedAxis:onPostLoad()` | 233 |  |
| `ArticulatedAxis:onDelete()` | 246 |  |
| `ArticulatedAxis:onDeactivate()` | 255 |  |
| `ArticulatedAxis:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 268 |  |
| `ArticulatedAxis:getSteeringRotTimeByCurvature(superFunc: any, curvature: any)` | 328 |  |
| `ArticulatedAxis:getTurningRadiusByRotTime(superFunc: any, rotTime: any)` | 334 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `getSteeringRotTimeByCurvature` | 53 |
| registerOverwrittenFunction | `getTurningRadiusByRotTime` | 54 |
| registerOverwrittenFunction | `getAIReverserNode` | 55 |
| registerEventListener | `onLoad` | 61 |
| registerEventListener | `onPostLoad` | 62 |
| registerEventListener | `onDelete` | 63 |
| registerEventListener | `onDeactivate` | 64 |
| registerEventListener | `onUpdate` | 65 |
