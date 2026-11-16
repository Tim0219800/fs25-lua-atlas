---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorFieldNotReady.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where the field is not ready for the work. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorFieldNotReady : AIMessage
AIMessageErrorFieldNotReady = {}

--- Constructor of the AI error message meaning: the field is not ready for the work. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorFieldNotReady.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorFieldNotReady` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorFieldNotReady:getI18NText() end
