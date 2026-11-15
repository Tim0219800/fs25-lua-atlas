---@meta
-- FS25 1.25.1.0 : ai/events/AITaskStopEvent.lua (stub généré, atlas Lua FS25)

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
