---@meta
-- FS25 1.25.1.0 : ai/events/AIJobStopEvent.lua (generated stub, FS25 Lua Atlas)

---@class AIJobStopEvent : Event
AIJobStopEvent = {}

function AIJobStopEvent.emptyNew() end

---@param job any
---@param aiMessage any
function AIJobStopEvent.new(job, aiMessage) end

---@param streamId any
---@param connection any
function AIJobStopEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AIJobStopEvent:writeStream(streamId, connection) end

---@param connection any
function AIJobStopEvent:run(connection) end
