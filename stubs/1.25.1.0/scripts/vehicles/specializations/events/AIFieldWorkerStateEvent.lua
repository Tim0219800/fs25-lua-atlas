---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/AIFieldWorkerStateEvent.lua (generated stub, FS25 Lua Atlas)

---@class AIFieldWorkerStateEvent : Event
AIFieldWorkerStateEvent = {}

---@return table
function AIFieldWorkerStateEvent.emptyNew() end

---@param vehicle table
---@param isActive boolean
function AIFieldWorkerStateEvent.new(vehicle, isActive) end

---@param streamId integer
---@param connection Connection
function AIFieldWorkerStateEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function AIFieldWorkerStateEvent:writeStream(streamId, connection) end

---@param connection Connection
function AIFieldWorkerStateEvent:run(connection) end
