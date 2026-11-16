---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorOutOfMoney.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where the farm cannot pay for the job. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorOutOfMoney : AIMessage
AIMessageErrorOutOfMoney = {}

--- Constructor of the AI error message meaning: the farm cannot pay for the job. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorOutOfMoney.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorOutOfMoney` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorOutOfMoney:getI18NText() end
