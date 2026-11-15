# vehicles/specializations/StandaloneMotor.lua

Source: `dataS/scripts/vehicles/specializations/StandaloneMotor.lua` — FS25 1.25.1.0


## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `StandaloneMotor.prerequisitesPresent(specializations: table) → boolean` | 19 |  |
| `StandaloneMotor.initSpecialization()` | 25 |  |
| `StandaloneMotor.registerFunctions(vehicleType: any)` | 50 |  |
| `StandaloneMotor.registerOverwrittenFunctions(vehicleType: any)` | 60 |  |
| `StandaloneMotor.registerEventListeners(vehicleType: any)` | 68 |  |
| `StandaloneMotor:onLoad(savegame: any)` | 77 |  |
| `StandaloneMotor:onRegisterDashboardValueTypes()` | 115 |  |
| `StandaloneMotor:onDelete()` | 143 |  |
| `StandaloneMotor:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 153 |  |
| `StandaloneMotor:getNeedsStandaloneMotorRunning()` | 214 |  |
| `StandaloneMotor:getAllowsStandaloneMotorRunning()` | 220 |  |
| `StandaloneMotor:getStandaloneMotorTargetRpm()` | 234 |  |
| `StandaloneMotor:getStandaloneMotorLoad()` | 240 |  |
| `StandaloneMotor:updateStandaloneMotorTemperature(dt: any)` | 246 |  |
| `StandaloneMotor:getIsOperating(superFunc: any) → boolean` | 272 |  |
| `StandaloneMotor:loadDashboardGroupFromXML(superFunc: any, xmlFile: any, key: any, group: any)` | 278 |  |
| `StandaloneMotor:getIsDashboardGroupActive(superFunc: any, group: any)` | 290 |  |
| `StandaloneMotor:updateDebugValues(values: any)` | 302 |  |
| `StandaloneMotor.getMotorIgnitionState(self: any) → boolean` | 323 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `updateStandaloneMotorTemperature` | 51 |
| registerFunction | `getNeedsStandaloneMotorRunning` | 52 |
| registerFunction | `getAllowsStandaloneMotorRunning` | 53 |
| registerFunction | `getStandaloneMotorTargetRpm` | 54 |
| registerFunction | `getStandaloneMotorLoad` | 55 |
| registerOverwrittenFunction | `getIsOperating` | 61 |
| registerOverwrittenFunction | `loadDashboardGroupFromXML` | 62 |
| registerOverwrittenFunction | `getIsDashboardGroupActive` | 63 |
| registerEventListener | `onLoad` | 69 |
| registerEventListener | `onRegisterDashboardValueTypes` | 70 |
| registerEventListener | `onDelete` | 71 |
| registerEventListener | `onUpdateTick` | 72 |
