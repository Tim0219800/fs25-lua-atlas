---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/BaleLoaderStateEvent.lua (generated stub, FS25 Lua Atlas)

---@class BaleLoaderStateEvent : Event
BaleLoaderStateEvent = {}

---@return table
function BaleLoaderStateEvent.emptyNew() end

---@param object table
---@param stateId integer
---@param nearestBaleServerId integer?
---@return BaleLoaderStateEvent
function BaleLoaderStateEvent.new(object, stateId, nearestBaleServerId) end

---@param streamId integer
---@param connection Connection
function BaleLoaderStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function BaleLoaderStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function BaleLoaderStateEvent:run(connection) end
