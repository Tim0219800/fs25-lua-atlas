# vehicles/specializations/AdditionalToolConnections.lua

Source: `dataS/scripts/vehicles/specializations/AdditionalToolConnections.lua` — FS25 1.25.1.0


## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AdditionalToolConnections.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `AdditionalToolConnections.initSpecialization()` | 24 |  |
| `AdditionalToolConnections.registerFunctions(vehicleType: any)` | 42 |  |
| `AdditionalToolConnections.registerOverwrittenFunctions(vehicleType: any)` | 47 |  |
| `AdditionalToolConnections.registerEventListeners(vehicleType: any)` | 53 |  |
| `AdditionalToolConnections:onPostLoad(savegame: any)` | 61 |  |
| `AdditionalToolConnections:loadAttacherJointFromXML(superFunc: table, attacherJoint: table, xmlFile: string, baseName: string, index: integer, ...: any)` | 95 |  |
| `AdditionalToolConnections:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer, loadFromSavegame: boolean)` | 120 |  |
| `AdditionalToolConnections:onPreDetach(attacherVehicle: table, implement: table)` | 141 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `loadAttacherJointFromXML` | 48 |
| registerEventListener | `onPostLoad` | 54 |
| registerEventListener | `onPostAttach` | 55 |
| registerEventListener | `onPreDetach` | 56 |
