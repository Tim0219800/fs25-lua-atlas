---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/TreePlanterTreeTypeEvent.lua (stub généré, atlas Lua FS25)

---@class TreePlanterTreeTypeEvent : Event
TreePlanterTreeTypeEvent = {}

---@return table
function TreePlanterTreeTypeEvent.emptyNew() end

---@param object table
---@param treeTypeIndex integer
---@param treeVariationIndex any
function TreePlanterTreeTypeEvent.new(object, treeTypeIndex, treeVariationIndex) end

---@param streamId integer
---@param connection Connection
function TreePlanterTreeTypeEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function TreePlanterTreeTypeEvent:writeStream(streamId, connection) end

---@param connection Connection
function TreePlanterTreeTypeEvent:run(connection) end

---@param object table
---@param treeTypeIndex integer
---@param treeVariationIndex boolean
---@param noEventSend boolean
function TreePlanterTreeTypeEvent.sendEvent(object, treeTypeIndex, treeVariationIndex, noEventSend) end
