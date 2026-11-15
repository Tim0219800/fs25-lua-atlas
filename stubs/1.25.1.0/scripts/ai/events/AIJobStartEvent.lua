---@meta
-- FS25 1.25.1.0 : ai/events/AIJobStartEvent.lua (generated stub, FS25 Lua Atlas)

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
