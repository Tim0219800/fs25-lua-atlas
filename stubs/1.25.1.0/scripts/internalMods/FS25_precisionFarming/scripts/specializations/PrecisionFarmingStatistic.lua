---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/PrecisionFarmingStatistic.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization of Precision Farming that caches, for each vehicle, the farmland under it, whether the player's farm may access it, the active contract and a smoothed on-field flag. It exposes the data and lets other specializations push values into the farmland statistics. Most setup code (load, spec fields) is not in this dump (UNVERIFIED).
---@class PrecisionFarmingStatistic
PrecisionFarmingStatistic = {}

--- Always returns true: no prerequisite specialization.
---@param specializations table
---@return boolean
function PrecisionFarmingStatistic.prerequisitesPresent(specializations) end

--- Every tick accumulates moved distance; when it exceeds the update distance (or no farmland is known) it refreshes farmland id, access right, contract at position and the on-field flags. The smoothed flag only flips back after moving more than 20 m from the last position.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function PrecisionFarmingStatistic:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Returns five values: the farmland statistics object, isOnField, farmlandId, isOnFieldSmoothed and the contract at the vehicle position.
function PrecisionFarmingStatistic:getPFStatisticInfo() end

--- Adds a value to the named farmland statistic, only if statistics exist, the vehicle is on a farmland the farm can access and no contract is active there.
---@param name any
---@param value any
function PrecisionFarmingStatistic:updatePFStatistic(name, value) end

--- Returns the yield map object stored in the specialization table (UNVERIFIED where it is assigned).
function PrecisionFarmingStatistic:getPFYieldMap() end
