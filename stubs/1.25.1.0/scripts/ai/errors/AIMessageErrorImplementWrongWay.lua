---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorImplementWrongWay.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where the implement is attached the wrong way round. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorImplementWrongWay : AIMessage
AIMessageErrorImplementWrongWay = {}

--- Constructor of the AI error message meaning: the implement is attached the wrong way round. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorImplementWrongWay.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorImplementWrongWay` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorImplementWrongWay:getI18NText() end
