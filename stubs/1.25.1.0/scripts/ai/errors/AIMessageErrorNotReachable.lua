---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorNotReachable.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where the target cannot be reached. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorNotReachable : AIMessage
AIMessageErrorNotReachable = {}

--- Constructor of the AI error message meaning: the target cannot be reached. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorNotReachable.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorNotReachable` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorNotReachable:getI18NText() end
