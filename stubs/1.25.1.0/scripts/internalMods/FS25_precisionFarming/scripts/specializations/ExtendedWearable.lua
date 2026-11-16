---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/ExtendedWearable.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization of the Precision Farming internal mod. It requires Wearable and PrecisionFarmingStatistic, and turns wear damage into repair costs recorded in the farmland statistics while the vehicle is on a field.
---@class ExtendedWearable
ExtendedWearable = {}

--- Returns true only if the vehicle type has both the Wearable and PrecisionFarmingStatistic specializations.
---@param specializations table
---@return boolean
function ExtendedWearable.prerequisitesPresent(specializations) end

--- Compares the current wear damage with the previous tick, computes the repair price difference via Wearable.calculateRepairPrice, and if positive and the vehicle is on a field adds it to the 'vehicleCosts' statistic. Stores the damage for the next tick. Relies on spec fields set up in code absent from this file (UNVERIFIED).
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ExtendedWearable:onPostUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end
