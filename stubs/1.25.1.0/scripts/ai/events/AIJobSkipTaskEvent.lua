---@meta
-- FS25 1.25.1.0 : ai/events/AIJobSkipTaskEvent.lua (generated stub, FS25 Lua Atlas)

---@class AIJobSkipTaskEvent : Event
AIJobSkipTaskEvent = {}

function AIJobSkipTaskEvent.emptyNew() end

---@param job any
function AIJobSkipTaskEvent.new(job) end

---@param streamId any
---@param connection any
function AIJobSkipTaskEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AIJobSkipTaskEvent:writeStream(streamId, connection) end

---@param connection any
function AIJobSkipTaskEvent:run(connection) end
