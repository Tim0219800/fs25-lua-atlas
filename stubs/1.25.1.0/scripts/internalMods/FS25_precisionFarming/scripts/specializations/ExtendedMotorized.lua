---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMotorized.lua (generated stub, FS25 Lua Atlas)

--- Precision Farming specialization added to motorized vehicles (requires Motorized and PrecisionFarmingStatistic). It adds the diesel consumed while on a field to the vehicle's Precision Farming statistics. The class doc comment says it tracks fuel usage on fields.
---@class ExtendedMotorized
ExtendedMotorized = {}

--- Returns true when the vehicle type has both Motorized and PrecisionFarmingStatistic.
---@param specializations table
---@return boolean
function ExtendedMotorized.prerequisitesPresent(specializations) end

--- Override: after the base update, if the vehicle is on a field, adds the diesel used by permanent consumers (lastFuelUsage in l/h scaled to the frame time dt) to the usedFuel statistic.
---@param superFunc any
---@param dt any
---@param accInput any
function ExtendedMotorized:updateConsumers(superFunc, dt, accInput) end
