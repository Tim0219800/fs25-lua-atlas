---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/PrecisionFarmingStatistic.lua (generated stub, FS25 Lua Atlas)

---@class PrecisionFarmingStatistic
PrecisionFarmingStatistic = {}

---@param specializations table
---@return boolean
function PrecisionFarmingStatistic.prerequisitesPresent(specializations) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function PrecisionFarmingStatistic:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function PrecisionFarmingStatistic:getPFStatisticInfo() end

---@param name any
---@param value any
function PrecisionFarmingStatistic:updatePFStatistic(name, value) end

function PrecisionFarmingStatistic:getPFYieldMap() end
