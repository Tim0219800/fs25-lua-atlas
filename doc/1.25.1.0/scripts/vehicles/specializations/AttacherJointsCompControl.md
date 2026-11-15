# vehicles/specializations/AttacherJointsCompControl.lua

Source: `dataS/scripts/vehicles/specializations/AttacherJointsCompControl.lua` — FS25 1.25.1.0


## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AttacherJointsCompControl.prerequisitesPresent(specializations: table) → boolean` | 19 |  |
| `AttacherJointsCompControl.initSpecialization()` | 25 |  |
| `AttacherJointsCompControl.registerFunctions(vehicleType: any)` | 43 |  |
| `AttacherJointsCompControl.registerOverwrittenFunctions(vehicleType: any)` | 51 |  |
| `AttacherJointsCompControl.registerEventListeners(vehicleType: any)` | 58 |  |
| `AttacherJointsCompControl:onPreLoad(savegame: table)` | 66 |  |
| `AttacherJointsCompControl:onStateChange(state: any, data: any)` | 78 |  |
| `AttacherJointsCompControl:setDependentComponentJointBaseFactors(componentJointIndex: any, transSpringFactor: any, transDampingFactor: any, overwrite: any)` | 86 |  |
| `AttacherJointsCompControl:addDependentComponentJointData(componentJointIndex: any)` | 103 |  |
| `AttacherJointsCompControl:updateDependentComponentJointValues(forceUpdate: any, skipInterpolation: any)` | 155 |  |
| `AttacherJointsCompControl:addToPhysics(superFunc: any) → boolean` | 204 |  |
| `AttacherJointsCompControl:loadAttacherJointFromXML(superFunc: table, attacherJoint: table, xmlFile: string, baseName: string, index: integer)` | 222 |  |
| `AttacherJointsCompControl:updateDebugValues(values: any)` | 250 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `setDependentComponentJointBaseFactors` | 44 |
| registerFunction | `addDependentComponentJointData` | 45 |
| registerFunction | `updateDependentComponentJointValues` | 46 |
| registerOverwrittenFunction | `addToPhysics` | 52 |
| registerOverwrittenFunction | `loadAttacherJointFromXML` | 53 |
| registerEventListener | `onPreLoad` | 59 |
| registerEventListener | `onStateChange` | 60 |
