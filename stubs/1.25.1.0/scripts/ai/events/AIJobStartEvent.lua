---@meta
-- FS25 1.25.1.0 : ai/events/AIJobStartEvent.lua (stub généré, atlas Lua FS25)

---@class AIJobStartEvent : Event
AIJobStartEvent = {}

function AIJobStartEvent.emptyNew() end

---@param job any
---@param startFarmId any
function AIJobStartEvent.new(job, startFarmId) end

---@param streamId any
---@param connection any
function AIJobStartEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AIJobStartEvent:writeStream(streamId, connection) end

---@param connection any
function AIJobStartEvent:run(connection) end
