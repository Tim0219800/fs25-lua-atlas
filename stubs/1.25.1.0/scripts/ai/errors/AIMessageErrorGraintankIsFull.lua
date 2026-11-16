---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorGraintankIsFull.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where the grain tank is full. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorGraintankIsFull : AIMessage
AIMessageErrorGraintankIsFull = {}

--- Constructor of the AI error message meaning: the grain tank is full. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorGraintankIsFull.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorTankIsFull` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorGraintankIsFull:getI18NText() end
