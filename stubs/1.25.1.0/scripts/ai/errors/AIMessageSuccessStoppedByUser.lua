---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageSuccessStoppedByUser.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the non-error ending where the player stopped the job. It extends `AIMessage` and reports `AIMessageType.OK`.
---@class AIMessageSuccessStoppedByUser : AIMessage
AIMessageSuccessStoppedByUser = {}

--- Constructor of the success message meaning: the player stopped the job. Inherits from `AIMessage`, no extra state.
---@param customMt any
function AIMessageSuccessStoppedByUser.new(customMt) end

--- Returns the localized text for the key `ai_messageSuccessStoppedByUser` via `g_i18n`.
function AIMessageSuccessStoppedByUser:getI18NText() end

--- Returns `AIMessageType.OK`, marking the message as a non-error outcome.
function AIMessageSuccessStoppedByUser:getType() end
