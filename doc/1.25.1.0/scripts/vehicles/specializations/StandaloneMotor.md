# vehicles/specializations/StandaloneMotor.lua

*[Version française](../../../fr/scripts/vehicles/specializations/StandaloneMotor.md)*

Source: `dataS/scripts/vehicles/specializations/StandaloneMotor.lua` — FS25 1.25.1.0

✍ Specialization for an implement with its own engine that is not a drivable motorized vehicle (for example a self-powered machine or trailer engine). It plays motor sounds, effects and animation nodes while the machine needs power and is allowed to run, simulates RPM, load and a simple motor temperature with a cooling fan, and exposes dashboard values (operating time, temperature, warning, ignition state). It has no prerequisites and is not synchronised over the network by this file.


## Functions

| Function | Line | Description |
|---|---|---|
| `StandaloneMotor.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Always returns true: no other specialization is required. |
| `StandaloneMotor.initSpecialization()` | 25 | ✍ Declares the `vehicle.standaloneMotor` schema (turn-off delay, idle load and RPM fractions, start duration, fold limits), sound/effect/animation paths, the dashboard value paths and the `#isMotorRunning` dashboard group attribute. |
| `StandaloneMotor.registerFunctions(vehicleType: any)` | 50 | ✍ Registers `updateStandaloneMotorTemperature`, `getNeedsStandaloneMotorRunning`, `getAllowsStandaloneMotorRunning`, `getStandaloneMotorTargetRpm` and `getStandaloneMotorLoad`. |
| `StandaloneMotor.registerOverwrittenFunctions(vehicleType: any)` | 60 | ✍ Overrides `getIsOperating`, `loadDashboardGroupFromXML` and `getIsDashboardGroupActive`. |
| `StandaloneMotor.registerEventListeners(vehicleType: any)` | 68 | ✍ Subscribes to onLoad, onRegisterDashboardValueTypes, onDelete and onUpdateTick. |
| `StandaloneMotor:onLoad(savegame: any)` | 77 | ✍ Reads the XML settings, initialises RPM, load and the temperature state (start 20, max 120, heating 1.5 degrees per second at full load; fan on at 95 and off at 85, cooling 3 degrees per second) and loads the motor samples, effects and animation nodes. |
| `StandaloneMotor:onRegisterDashboardValueTypes()` | 115 | ✍ Registers the dashboard value types "operatingTime", "motorTemperature" (with min/max range), "motorTemperatureWarning" (true while the temperature is within the dashboard warning thresholds) and "ignitionState" (range 0 to 2). |
| `StandaloneMotor:onDelete()` | 143 | ✍ Deletes the motor samples, effects and animation nodes. |
| `StandaloneMotor:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 153 | ✍ Starts the motor (sound, effects, animations, start timer) when it is needed and allowed, and stops it after the turn-off delay (instantly if not allowed). While active, smooths the RPM toward the target, computes the load from `getStandaloneMotorLoad`, feeds sound and effect parameters, updates the temperature and keeps the vehicle active with `raiseActive`. |
| `StandaloneMotor:getNeedsStandaloneMotorRunning()` | 214 | ✍ Returns whether the motor should run: the result of `getRequiresPower`. |
| `StandaloneMotor:getAllowsStandaloneMotorRunning()` | 220 | ✍ Returns false if the vehicle is foldable and its fold animation time is outside the configured fold limits; otherwise true. |
| `StandaloneMotor:getStandaloneMotorTargetRpm()` | 234 | ✍ Returns 0 by default: the target RPM fraction (0 to 1), meant to be overridden by other specializations. |
| `StandaloneMotor:getStandaloneMotorLoad()` | 240 | ✍ Returns 0, 0 by default: sum of load factors and their count, meant to be overridden by other specializations. |
| `StandaloneMotor:updateStandaloneMotorTemperature(dt: any)` | 246 | ✍ Heats the motor proportionally to dt, load and RPM (capped at the max), switches the fan on above its enable temperature and off below its disable temperature, and cools the motor while the fan runs (not below the minimum). |
| `StandaloneMotor:getIsOperating(superFunc: any) → boolean` | 272 | ✍ Returns true if the parent does or if the standalone motor is active. |
| `StandaloneMotor:loadDashboardGroupFromXML(superFunc: any, xmlFile: any, key: any, group: any)` | 278 | ✍ Calls the parent and additionally reads `isMotorRunning` onto the dashboard group. |
| `StandaloneMotor:getIsDashboardGroupActive(superFunc: any, group: any)` | 290 | ✍ Returns false for a group flagged `isMotorRunning` while the motor is not active; otherwise defers to the parent. |
| `StandaloneMotor:updateDebugValues(values: any)` | 302 | ✍ Server-side debug helper: adds RPM (percent and real sample RPM when available), load, turn-off timer and temperature to the given values table. |
| `StandaloneMotor.getMotorIgnitionState(self: any) → boolean` | 323 | ✍ Returns the ignition state for the dashboard: 0 when the motor is off, 1 while it is still starting (until `motorStartTime` is reached), 2 once started. |

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
