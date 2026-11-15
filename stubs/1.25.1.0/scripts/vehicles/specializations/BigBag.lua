---@meta
-- FS25 1.25.1.0 : vehicles/specializations/BigBag.lua (generated stub, FS25 Lua Atlas)

---@class BigBag
BigBag = {}

---@param specializations table
---@return boolean
function BigBag.prerequisitesPresent(specializations) end

function BigBag.initSpecialization() end

---@param vehicleType any
function BigBag.registerFunctions(vehicleType) end

---@param vehicleType any
function BigBag.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function BigBag.registerEventListeners(vehicleType) end

---@param savegame table
function BigBag:onLoad(savegame) end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function BigBag:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function BigBag:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

---@param superFunc any
function BigBag:getInfoBoxTitle(superFunc) end
