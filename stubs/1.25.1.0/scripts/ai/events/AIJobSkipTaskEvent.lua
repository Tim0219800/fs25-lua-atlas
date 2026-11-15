---@meta
-- FS25 1.25.1.0 : ai/events/AIJobSkipTaskEvent.lua (stub généré, atlas Lua FS25)

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
