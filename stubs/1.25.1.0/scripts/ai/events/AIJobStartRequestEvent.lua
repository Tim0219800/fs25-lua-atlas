---@meta
-- FS25 1.25.1.0 : ai/events/AIJobStartRequestEvent.lua (generated stub, FS25 Lua Atlas)

---@class AIJobStartRequestEvent : Event
AIJobStartRequestEvent = {}

function AIJobStartRequestEvent.emptyNew() end

---@param job any
---@param startFarmId any
function AIJobStartRequestEvent.new(job, startFarmId) end

---@param state any
---@param jobTypeIndex any
function AIJobStartRequestEvent.newServerToClient(state, jobTypeIndex) end

---@param streamId any
---@param connection any
function AIJobStartRequestEvent:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AIJobStartRequestEvent:writeStream(streamId, connection) end

---@param connection any
function AIJobStartRequestEvent:run(connection) end
