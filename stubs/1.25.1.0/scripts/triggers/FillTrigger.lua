---@meta
-- FS25 1.25.1.0 : triggers/FillTrigger.lua (stub généré, atlas Lua FS25)

---@class FillTrigger
FillTrigger = {}

---@param id integer
function FillTrigger:onCreate(id) end

---@param id integer
---@param sourceObject table
---@param fillUnitIndex integer
---@param fillLitersPerSecond table?
---@param defaultFillType any
---@param customMt table?
---@return table
function FillTrigger.new(id, sourceObject, fillUnitIndex, fillLitersPerSecond, defaultFillType, customMt) end

function FillTrigger:delete() end

---@param vehicle table
function FillTrigger:onVehicleDeleted(vehicle) end

---@param vehicle table
---@param delta number
---@param dt any
---@return number
function FillTrigger:fillVehicle(vehicle, delta, dt) end

---@param vehicle table
---@return boolean
function FillTrigger:getIsActivatable(vehicle) end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function FillTrigger:fillTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end
