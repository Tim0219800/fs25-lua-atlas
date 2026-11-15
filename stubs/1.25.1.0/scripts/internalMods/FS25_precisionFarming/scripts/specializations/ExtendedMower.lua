---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMower.lua (stub généré, atlas Lua FS25)

---@class ExtendedMower
ExtendedMower = {}

---@param specializations table
---@return boolean
function ExtendedMower.prerequisitesPresent(specializations) end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ExtendedMower:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function ExtendedMower:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

---@param self any
---@param forcedState any
function ExtendedMower.updateMinimapActiveState(self, forcedState) end

---@param superFunc any
---@param workArea any
---@param dt any
function ExtendedMower:processMowerArea(superFunc, workArea, dt) end
