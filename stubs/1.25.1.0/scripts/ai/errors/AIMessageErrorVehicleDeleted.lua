---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorVehicleDeleted.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where the vehicle was deleted. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorVehicleDeleted : AIMessage
AIMessageErrorVehicleDeleted = {}

--- Constructor of the AI error message meaning: the vehicle was deleted. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorVehicleDeleted.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorVehicleDeleted` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorVehicleDeleted:getI18NText() end
