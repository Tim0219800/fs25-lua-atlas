---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorCouldNotPrepare.lua (generated stub, FS25 Lua Atlas)

---@class AIMessageErrorCouldNotPrepare : AIMessage
AIMessageErrorCouldNotPrepare = {}

---@param vehicle any
---@param customMt any
function AIMessageErrorCouldNotPrepare.new(vehicle, customMt) end

---@param job any
function AIMessageErrorCouldNotPrepare:getMessage(job) end

---@param streamId any
---@param connection any
function AIMessageErrorCouldNotPrepare:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AIMessageErrorCouldNotPrepare:writeStream(streamId, connection) end
