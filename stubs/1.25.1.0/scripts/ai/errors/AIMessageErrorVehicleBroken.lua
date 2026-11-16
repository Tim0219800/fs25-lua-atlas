---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorVehicleBroken.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where the vehicle is broken. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorVehicleBroken : AIMessage
AIMessageErrorVehicleBroken = {}

--- Constructor of the AI error message meaning: the vehicle is broken. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorVehicleBroken.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorVehicleBroken` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorVehicleBroken:getI18NText() end
