---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/ExtendedCombine.lua (generated stub, FS25 Lua Atlas)

---@class ExtendedCombine
ExtendedCombine = {}

---@param specializations table
---@return boolean
function ExtendedCombine.prerequisitesPresent(specializations) end

function ExtendedCombine:onDelete() end

---@param streamId any
---@param timestamp any
---@param connection any
function ExtendedCombine:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function ExtendedCombine:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ExtendedCombine:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ExtendedCombine:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function ExtendedCombine:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param forcedState any
function ExtendedCombine.updateMinimapActiveState(self, forcedState) end

---@param lastYieldWeight any
---@param lastYieldPercentage any
---@param lastYieldPotential any
function ExtendedCombine:setLastYieldValues(lastYieldWeight, lastYieldPercentage, lastYieldPotential) end
