---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageSuccessFinishedJob.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the non-error ending where the job finished successfully. It extends `AIMessage` and reports `AIMessageType.OK`.
---@class AIMessageSuccessFinishedJob : AIMessage
AIMessageSuccessFinishedJob = {}

--- Constructor of the success message meaning: the job finished successfully. Inherits from `AIMessage`, no extra state.
---@param customMt any
function AIMessageSuccessFinishedJob.new(customMt) end

--- Returns the localized text for the key `ai_messageSuccessFinishedJob` via `g_i18n`.
function AIMessageSuccessFinishedJob:getI18NText() end

--- Returns `AIMessageType.OK`, marking the message as a non-error outcome.
function AIMessageSuccessFinishedJob:getType() end
