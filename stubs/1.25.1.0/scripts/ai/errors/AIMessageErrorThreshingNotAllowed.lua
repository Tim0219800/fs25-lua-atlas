---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorThreshingNotAllowed.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where threshing is not allowed at this time. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorThreshingNotAllowed : AIMessage
AIMessageErrorThreshingNotAllowed = {}

--- Constructor of the AI error message meaning: threshing is not allowed at this time. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorThreshingNotAllowed.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorThreshingNotAllowed` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorThreshingNotAllowed:getI18NText() end
