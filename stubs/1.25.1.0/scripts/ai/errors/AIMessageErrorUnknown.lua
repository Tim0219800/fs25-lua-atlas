---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorUnknown.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where an unspecified error occurred. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorUnknown : AIMessage
AIMessageErrorUnknown = {}

--- Constructor of the AI error message meaning: an unspecified error occurred. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorUnknown.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorUnknown` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorUnknown:getI18NText() end
