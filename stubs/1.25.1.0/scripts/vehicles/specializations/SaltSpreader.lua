---@meta
-- FS25 1.25.1.0 : vehicles/specializations/SaltSpreader.lua (generated stub, FS25 Lua Atlas)

--- Specialization for road salt spreaders. It requires WorkArea and TurnOnVehicle, registers the "saltSpreader" work area type and consumes salt from a fill unit while turned on (usage in liters per second, optionally scaled by a work area width). On the server the work area calls the SnowSystem (`g_currentMission.snowSystem:saltArea`); effects are played on the client through the EffectManager.
---@class SaltSpreader
SaltSpreader = {}

--- Registers the "saltSpreader" work area type and declares the XML schema: fill unit index, unload info index, usage work area, usage in liters per second, and the effects.
function SaltSpreader.initSpecialization() end

--- Returns true only if the vehicle type has WorkArea and TurnOnVehicle.
---@param specializations table
---@return boolean
function SaltSpreader.prerequisitesPresent(specializations) end

--- Registers `processSaltSpreaderArea` on the vehicle type.
---@param vehicleType any
function SaltSpreader.registerFunctions(vehicleType) end

--- Overrides `doCheckSpeedLimit`, `getDirtMultiplier`, `getWearMultiplier`, `getAreControlledActionsAllowed`, `getCanBeTurnedOn`, `getTurnedOnNotAllowedWarning` and `getVariableWorkWidthUsage`.
---@param vehicleType any
function SaltSpreader.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onUpdateTick, onTurnedOn and onTurnedOff.
---@param vehicleType any
function SaltSpreader.registerEventListeners(vehicleType) end

--- Reads the fill unit, unload info, usage work area and usage (converted from l/s to l/ms), loads the effects on the client and caches the SnowSystem and the "fill the tool first" text. Removes onUpdateTick on non-servers.
---@param savegame table
function SaltSpreader:onLoad(savegame) end

--- Deletes the effects through the EffectManager.
function SaltSpreader:onDelete() end

--- Server tick: while turned on and the tank is not empty, removes salt from the fill unit proportionally to dt and the usage width; when the fill level reaches 0 it turns the spreader off.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function SaltSpreader:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client side: if the fill unit contains a known fill type, sets that type on the effects and starts them.
function SaltSpreader:onTurnedOn() end

--- Client side: stops the effects.
function SaltSpreader:onTurnedOff() end

--- Returns true if the parent does or if the spreader is turned on, so the speed limit applies while spreading.
---@param superFunc any
---@return boolean
function SaltSpreader:doCheckSpeedLimit(superFunc) end

--- Adds the work dirt multiplier to the parent value while turned on.
---@param superFunc any
function SaltSpreader:getDirtMultiplier(superFunc) end

--- Adds the work wear multiplier to the parent value while turned on.
---@param superFunc any
function SaltSpreader:getWearMultiplier(superFunc) end

--- Returns false plus the "fill the tool first" warning when the tank is empty; otherwise defers to the parent.
---@param superFunc any
---@return boolean
---@return string
function SaltSpreader:getAreControlledActionsAllowed(superFunc) end

--- Returns false when the fill unit is empty; otherwise defers to the parent.
---@param superFunc any
function SaltSpreader:getCanBeTurnedOn(superFunc) end

--- Returns the "fill the tool first" warning when the tank is empty; otherwise defers to the parent.
---@param superFunc any
function SaltSpreader:getTurnedOnNotAllowedWarning(superFunc) end

--- If the parent gives no usage, returns the salt usage in liters per minute (usage times work width times 1000 times 60) while turned on, else 0; otherwise returns the parent value.
---@param superFunc any
---@return number
function SaltSpreader:getVariableWorkWidthUsage(superFunc) end

--- Static function returning the default speed limit, 20 (km/h presumably; unit not stated in this file).
---@return number
function SaltSpreader.getDefaultSpeedLimit() end

--- Work area callback: on the server, calls `snowSystem:saltArea` with the area corners and returns its two results; on clients returns 0, 0. The SnowSystem class is not in the dump, so its return values are UNVERIFIED.
---@param workArea any
function SaltSpreader:processSaltSpreaderArea(workArea) end
