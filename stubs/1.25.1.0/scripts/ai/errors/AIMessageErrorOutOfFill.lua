---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorOutOfFill.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where the vehicle ran out of the material it works with. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorOutOfFill : AIMessage
AIMessageErrorOutOfFill = {}

--- Constructor of the AI error message meaning: the vehicle ran out of the material it works with. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorOutOfFill.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorOutOfFill` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorOutOfFill:getI18NText() end
