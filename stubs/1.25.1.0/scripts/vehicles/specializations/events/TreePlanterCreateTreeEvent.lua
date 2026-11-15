---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TreePlanterCreateTreeEvent.lua (generated stub, FS25 Lua Atlas)

---@class TreePlanterCreateTreeEvent : Event
TreePlanterCreateTreeEvent = {}

---@return table
function TreePlanterCreateTreeEvent.emptyNew() end

---@param object table
---@param treeTypeIndex integer
---@param treeVariationIndex any
function TreePlanterCreateTreeEvent.new(object, treeTypeIndex, treeVariationIndex) end

---@param streamId integer
---@param connection Connection
function TreePlanterCreateTreeEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function TreePlanterCreateTreeEvent:writeStream(streamId, connection) end

---@param connection Connection
function TreePlanterCreateTreeEvent:run(connection) end

---@param object table
---@param noEventSend boolean
function TreePlanterCreateTreeEvent.sendEvent(object, noEventSend) end
