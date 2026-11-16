---@meta
-- FS25 1.25.1.0 : vehicles/specializations/StandaloneMotor.lua (generated stub, FS25 Lua Atlas)

--- Always returns true: no other specialization is required.
---@param specializations table
---@return boolean
function StandaloneMotor.prerequisitesPresent(specializations) end

--- Declares the `vehicle.standaloneMotor` schema (turn-off delay, idle load and RPM fractions, start duration, fold limits), sound/effect/animation paths, the dashboard value paths and the `#isMotorRunning` dashboard group attribute.
function StandaloneMotor.initSpecialization() end

--- Registers `updateStandaloneMotorTemperature`, `getNeedsStandaloneMotorRunning`, `getAllowsStandaloneMotorRunning`, `getStandaloneMotorTargetRpm` and `getStandaloneMotorLoad`.
---@param vehicleType any
function StandaloneMotor.registerFunctions(vehicleType) end

--- Overrides `getIsOperating`, `loadDashboardGroupFromXML` and `getIsDashboardGroupActive`.
---@param vehicleType any
function StandaloneMotor.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onRegisterDashboardValueTypes, onDelete and onUpdateTick.
---@param vehicleType any
function StandaloneMotor.registerEventListeners(vehicleType) end

--- Reads the XML settings, initialises RPM, load and the temperature state (start 20, max 120, heating 1.5 degrees per second at full load; fan on at 95 and off at 85, cooling 3 degrees per second) and loads the motor samples, effects and animation nodes.
---@param savegame any
function StandaloneMotor:onLoad(savegame) end

--- Registers the dashboard value types "operatingTime", "motorTemperature" (with min/max range), "motorTemperatureWarning" (true while the temperature is within the dashboard warning thresholds) and "ignitionState" (range 0 to 2).
function StandaloneMotor:onRegisterDashboardValueTypes() end

--- Deletes the motor samples, effects and animation nodes.
function StandaloneMotor:onDelete() end

--- Starts the motor (sound, effects, animations, start timer) when it is needed and allowed, and stops it after the turn-off delay (instantly if not allowed). While active, smooths the RPM toward the target, computes the load from `getStandaloneMotorLoad`, feeds sound and effect parameters, updates the temperature and keeps the vehicle active with `raiseActive`.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function StandaloneMotor:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Returns whether the motor should run: the result of `getRequiresPower`.
function StandaloneMotor:getNeedsStandaloneMotorRunning() end

--- Returns false if the vehicle is foldable and its fold animation time is outside the configured fold limits; otherwise true.
function StandaloneMotor:getAllowsStandaloneMotorRunning() end

--- Returns 0 by default: the target RPM fraction (0 to 1), meant to be overridden by other specializations.
function StandaloneMotor:getStandaloneMotorTargetRpm() end

--- Returns 0, 0 by default: sum of load factors and their count, meant to be overridden by other specializations.
function StandaloneMotor:getStandaloneMotorLoad() end

--- Heats the motor proportionally to dt, load and RPM (capped at the max), switches the fan on above its enable temperature and off below its disable temperature, and cools the motor while the fan runs (not below the minimum).
---@param dt any
function StandaloneMotor:updateStandaloneMotorTemperature(dt) end

--- Returns true if the parent does or if the standalone motor is active.
---@param superFunc any
---@return boolean
function StandaloneMotor:getIsOperating(superFunc) end

--- Calls the parent and additionally reads `isMotorRunning` onto the dashboard group.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param group any
function StandaloneMotor:loadDashboardGroupFromXML(superFunc, xmlFile, key, group) end

--- Returns false for a group flagged `isMotorRunning` while the motor is not active; otherwise defers to the parent.
---@param superFunc any
---@param group any
function StandaloneMotor:getIsDashboardGroupActive(superFunc, group) end

--- Server-side debug helper: adds RPM (percent and real sample RPM when available), load, turn-off timer and temperature to the given values table.
---@param values any
function StandaloneMotor:updateDebugValues(values) end

--- Returns the ignition state for the dashboard: 0 when the motor is off, 1 while it is still starting (until `motorStartTime` is reached), 2 once started.
---@param self any
---@return boolean
function StandaloneMotor.getMotorIgnitionState(self) end
