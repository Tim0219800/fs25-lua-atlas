---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BaleWrapperDropEvent.lua (generated stub, FS25 Lua Atlas)

---@class BaleWrapperDropEvent : Event
BaleWrapperDropEvent = {}

---@return table
function BaleWrapperDropEvent.emptyNew() end

---@param object table
---@param dropAnimationIndex integer
---@return BaleWrapperDropEvent
function BaleWrapperDropEvent.new(object, dropAnimationIndex) end

---@param streamId integer
---@param connection Connection
function BaleWrapperDropEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function BaleWrapperDropEvent:writeStream(streamId, connection) end

---@param connection Connection
function BaleWrapperDropEvent:run(connection) end
