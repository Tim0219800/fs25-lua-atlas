---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BaleWrapperStateEvent.lua (stub généré, atlas Lua FS25)

---@class BaleWrapperStateEvent : Event
BaleWrapperStateEvent = {}

---@return table
function BaleWrapperStateEvent.emptyNew() end

---@param object table
---@param stateId integer
---@param nearestBaleServerId integer?
---@return BaleWrapperStateEvent
function BaleWrapperStateEvent.new(object, stateId, nearestBaleServerId) end

---@param streamId integer
---@param connection Connection
function BaleWrapperStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function BaleWrapperStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function BaleWrapperStateEvent:run(connection) end
