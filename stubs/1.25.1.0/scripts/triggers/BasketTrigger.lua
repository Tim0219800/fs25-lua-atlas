---@meta
-- FS25 1.25.1.0 : triggers/BasketTrigger.lua (generated stub, FS25 Lua Atlas)

---@class BasketTrigger
BasketTrigger = {}

---@param id integer
function BasketTrigger:onCreate(id) end

---@param customMt table?
---@return table
function BasketTrigger.new(customMt) end

---@param nodeId integer
---@return boolean
function BasketTrigger:load(nodeId) end

function BasketTrigger:delete() end

---@param triggerId integer
---@param otherActorId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId any
function BasketTrigger:triggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end
