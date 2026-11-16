---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageSuccessSiloEmpty.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the non-error ending where the silo is empty so the job ended. It extends `AIMessage` and reports `AIMessageType.OK`.
---@class AIMessageSuccessSiloEmpty : AIMessage
AIMessageSuccessSiloEmpty = {}

--- Constructor of the success message meaning: the silo is empty so the job ended. Inherits from `AIMessage`, no extra state.
---@param customMt any
function AIMessageSuccessSiloEmpty.new(customMt) end

--- Returns the localized text for the key `ai_messageSuccessSiloEmpty` via `g_i18n`.
function AIMessageSuccessSiloEmpty:getI18NText() end

--- Returns `AIMessageType.OK`, marking the message as a non-error outcome.
function AIMessageSuccessSiloEmpty:getType() end
