---@meta
-- FS25 1.25.1.0 : ai/events/AITaskStopEvent.lua (generated stub, FS25 Lua Atlas)

---@class AITaskStopEvent : Event
AITaskStopEvent = {}

function AITaskStopEvent.emptyNew() end

---@param job any
---@param task any
---@param wasJobStopped any
function AITaskStopEvent.new(job, task, wasJobStopped) end

---@param streamId any
---@param connection any
function AITaskStopEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AITaskStopEvent:writeStream(streamId, connection) end

---@param connection any
function AITaskStopEvent:run(connection) end
