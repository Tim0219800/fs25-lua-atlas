---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessage.lua (stub généré, atlas Lua FS25)

---@class AIMessage
AIMessage = {}

---@param customMt any
function AIMessage.new(customMt) end

---@param job any
function AIMessage:getMessage(job) end

function AIMessage:getType() end

---@param streamId any
---@param connection any
function AIMessage:readStream(streamId, connection) end

---@param streamId any
---@param connection any
function AIMessage:writeStream(streamId, connection) end
