---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorOutOfFuel.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where the vehicle ran out of fuel. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorOutOfFuel : AIMessage
AIMessageErrorOutOfFuel = {}

--- Constructor of the AI error message meaning: the vehicle ran out of fuel. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorOutOfFuel.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorOutOfFuel` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorOutOfFuel:getI18NText() end
