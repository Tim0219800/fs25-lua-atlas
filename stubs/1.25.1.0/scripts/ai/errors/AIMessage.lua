---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessage.lua (generated stub, FS25 Lua Atlas)

--- Base class of all messages shown when an AI helper job ends, with error or success. Subclasses supply the localized text through `getI18NText` and may override the type and the network serialization; `AIMessageManager` registers them and `AIJobStopEvent` transmits them.
---@class AIMessage
AIMessage = {}

--- Creates a message instance with the given optional metatable so that subclasses can reuse it.
---@param customMt any
function AIMessage.new(customMt) end

--- Formats the text from `self:getI18NText()` with the helper name of the given job, using "Unknown" if the job or name is nil. Returns an empty string when there is no text. `getI18NText` is not defined in this class.
---@param job any
function AIMessage:getMessage(job) end

--- Returns `AIMessageType.ERROR` by default; success subclasses override it.
function AIMessage:getType() end

--- Empty hook for reading message data from a network stream; subclasses with state override it.
---@param streamId any
---@param connection any
function AIMessage:readStream(streamId, connection) end

--- Empty hook for writing message data to a network stream; subclasses with state override it.
---@param streamId any
---@param connection any
function AIMessage:writeStream(streamId, connection) end
