---@meta
-- FS25 1.25.1.0 : ai/events/AITaskStartEvent.lua (stub généré, atlas Lua FS25)

---@class AITaskStartEvent : Event
AITaskStartEvent = {}

function AITaskStartEvent.emptyNew() end

---@param job any
---@param task any
function AITaskStartEvent.new(job, task) end

---@param streamId any
---@param connection any
function AITaskStartEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AITaskStartEvent:writeStream(streamId, connection) end

---@param connection any
function AITaskStartEvent:run(connection) end
