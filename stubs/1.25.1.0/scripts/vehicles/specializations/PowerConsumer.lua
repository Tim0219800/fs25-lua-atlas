---@meta
-- FS25 1.25.1.0 : vehicles/specializations/PowerConsumer.lua (generated stub, FS25 Lua Atlas)

--- Specialization for implements that draw engine power, either through the PTO or as a pulling resistance. It has no prerequisites. It reads vehicle.powerConsumer (optionally per powerConsumer configuration), adds a drag force while moving, reports PTO torque and rpm to the root motor, and can refuse turn-on when the tractor motor lacks torque. It also provides the 'neededPower' store spec and an optional speed limit offset depending on the source motor power.
---@class PowerConsumer
PowerConsumer = {}

--- Registers the 'powerConsumer' configuration type and the 'neededPower' store spec, then the XML paths (base and per configuration), the store data keys and the work mode attributes forceScale and ptoPowerScale.
function PowerConsumer.initSpecialization() end

--- Registers all powerConsumer XML attributes under a given base path: force nodes, maxForce (kN), forceDir, turn-on peak settings, PTO power and rpm, virtual power multiplier and speedLimitModifier entries.
---@param schema any
---@param basePath any
function PowerConsumer.registerPowerConsumerXMLPaths(schema, basePath) end

--- Always returns true: no prerequisite specializations.
---@param specializations table
---@return boolean
function PowerConsumer.prerequisitesPresent(specializations) end

--- Adds loadPowerSetup, getPtoRpm, getDoConsumePtoPower, getPowerMultiplier, getConsumedPtoTorque and getConsumingLoad to the vehicle type.
---@param vehicleType any
function PowerConsumer.registerFunctions(vehicleType) end

--- Overrides getCanBeTurnedOn, getCanBeTurnedOnAll, getTurnedOnNotAllowedWarning, getRawSpeedLimit and loadWorkModeFromXML.
---@param vehicleType any
function PowerConsumer.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onUpdate, onStateChange, onWorkModeChanged and onTurnedOn.
---@param vehicleType any
function PowerConsumer.registerEventListeners(vehicleType) end

--- Reads force, turn-on peak and speedLimitModifier settings from the configuration key (or vehicle.powerConsumer if absent) and calls loadPowerSetup. Horsepower limits are converted to kW. Note: it removes an 'onPostDetach' listener that was never registered here.
---@param savegame table
function PowerConsumer:onLoad(savegame) end

--- While active and moving in forceDir, applies a braking force at the force node, equal to a friction term capped by maxForce and scaled by getPowerMultiplier. Also counts down the turn-on peak timer.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function PowerConsumer:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads min and max needed PTO power (kW at ptoRpm), PTO rpm and the virtual power multiplier from the XML. Warns on a deprecated key and if max is below min.
---@param xmlFile table
---@param baseKey any
function PowerConsumer:loadPowerSetup(xmlFile, baseKey) end

--- Returns the configured PTO rpm while the vehicle consumes PTO power, otherwise 0.
---@return number
function PowerConsumer:getPtoRpm() end

--- True if useTurnOnState is set and the vehicle is turned on (it needs getIsTurnedOn).
---@return boolean
function PowerConsumer:getDoConsumePtoPower() end

--- Returns 1 by default; meant to be overridden to scale the drag force in onUpdate.
---@return number
function PowerConsumer:getPowerMultiplier() end

--- Returns the PTO torque (kNm) and a virtual multiplier. Power is interpolated between min and max by the average consuming load, divided by angular speed, with a temporary peak after turn-on unless ignoreTurnOnPeak. Returns 0, 1 when idle.
---@param expected any
---@param ignoreTurnOnPeak any
---@return number
function PowerConsumer:getConsumedPtoTorque(expected, ignoreTurnOnPeak) end

--- Default returns 0, 0 (load, count); specializations override it to report their load for getConsumedPtoTorque.
function PowerConsumer:getConsumingLoad() end

--- Returns false (plus a not-enough-power flag) when the expected torque of this and all implements, scaled to engine side, exceeds 90 percent of the root motor peak torque and the tool is off. Otherwise defers to the parent.
---@param superFunc any
---@return boolean
function PowerConsumer:getCanBeTurnedOn(superFunc) end

--- Same torque check for the whole implement chain: returns false with the turn-on warning text if all PTO torques exceed 90 percent of peak motor torque and this tool is off.
---@param superFunc any
---@return boolean
function PowerConsumer:getCanBeTurnedOnAll(superFunc) end

--- Returns the insufficient-power warning if getCanBeTurnedOn reports missing power; otherwise defers to the parent.
---@param superFunc any
---@return string
function PowerConsumer:getTurnedOnNotAllowedWarning(superFunc) end

--- Adds the offset of the last speedLimitModifier whose power range contains the source motor peak power (kW) to the parent speed limit.
---@param superFunc any
function PowerConsumer:getRawSpeedLimit(superFunc) end

--- After the parent loads a work mode, reads its forceScale and ptoPowerScale (default 1). Returns false if the parent failed.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param workMode any
function PowerConsumer:loadWorkModeFromXML(superFunc, xmlFile, key, workMode) end

--- On attach or detach, stores the root vehicle motor peak power in sourceMotorPeakPower (math.huge without a motor).
---@param state any
---@param data any
function PowerConsumer:onStateChange(state, data) end

--- Rescales maxForce and the min/max needed PTO power from their original values using the work mode forceScale. Note: ptoPowerScale is loaded but not used here.
---@param workMode any
---@param oldWorkMode any
function PowerConsumer:onWorkModeChanged(workMode, oldWorkMode) end

--- Starts the turn-on peak timer at 1.5 times the peak duration.
function PowerConsumer:onTurnedOn() end

--- Recursively sums consumed PTO torque (kNm) over a vehicle and its attached implements, optionally excluding one vehicle. Returns the total and a torque-weighted virtual multiplier.
---@param self table?
---@param excludeVehicle table?
---@param expected boolean?
---@param ignoreTurnOnPeak boolean?
---@return number
---@return number
function PowerConsumer.getTotalConsumedPtoTorque(self, excludeVehicle, expected, ignoreTurnOnPeak) end

--- Recursively returns the highest PTO rpm requested by a vehicle or any implement attached to it.
---@param self any
---@return number
function PowerConsumer.getMaxPtoRpm(self) end

--- Console command handler: overrides power and force values on the selected implement and on all vehicles with the same config file, for live tuning. Returns a status or usage string.
---@param neededMinPtoPower any
---@param neededMaxPtoPower any
---@param forceFactor any
---@param maxForce any
---@param forceDir any
---@param ptoRpm any
function PowerConsumer:consoleSetPowerConsumer(neededMinPtoPower, neededMaxPtoPower, forceFactor, maxForce, forceDir, ptoRpm) end

--- Store spec loader: reads neededPower, its maxPower and one value per powerConsumer configuration from the XML into a table (base, maxPower, config).
---@param xmlFile XMLFile
---@param customEnvironment string
---@param baseDir any
---@return number
function PowerConsumer.loadSpecValueNeededPower(xmlFile, customEnvironment, baseDir) end

--- Builds the shop text for needed power, a single kW/HP value or an HP range across configurations. Returns nil if no power is set or the minimum is 0.
---@param storeItem table
---@param realItem table
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
---@return string
---@return number
---@return number
function PowerConsumer.getSpecValueNeededPower(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
