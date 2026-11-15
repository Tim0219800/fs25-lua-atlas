---@meta
-- FS25 1.25.1.0 : vehicles/specializations/StrawBlower.lua (generated stub, FS25 Lua Atlas)

---@class StrawBlower
StrawBlower = {}

---@param specializations table
---@return boolean
function StrawBlower.prerequisitesPresent(specializations) end

function StrawBlower.initSpecialization() end

---@param vehicleType any
function StrawBlower.registerFunctions(vehicleType) end

---@param vehicleType any
function StrawBlower.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function StrawBlower.registerEventListeners(vehicleType) end

---@param savegame table
function StrawBlower:onLoad(savegame) end

function StrawBlower:onDelete() end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function StrawBlower:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param superFunc any
---@param farmId any
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillTypeIndex any
---@param toolType any
---@param fillPositionData any
function StrawBlower:addFillUnitFillLevel(superFunc, farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData) end

---@param triggerId integer
---@param otherActorId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function StrawBlower:strawBlowerBaleTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

---@param object any
function StrawBlower:onDeleteStrawBlowerObject(object) end

---@param superFunc any
function StrawBlower:getDrawFirstFillText(superFunc) end

---@param superFunc any
function StrawBlower:getAllowDynamicMountFillLevelInfo(superFunc) end

---@param fillUnitIndex integer
---@param fillLevelDelta number
---@param fillTypeIndex integer
---@param toolType boolean
---@param fillPositionData table
---@param appliedDelta any
function StrawBlower:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, appliedDelta) end

---@param state any
function StrawBlower:onDischargeStateChanged(state) end
