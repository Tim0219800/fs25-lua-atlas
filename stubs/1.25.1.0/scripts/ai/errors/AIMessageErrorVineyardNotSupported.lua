---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorVineyardNotSupported.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where the vineyard is not supported by this job. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorVineyardNotSupported : AIMessage
AIMessageErrorVineyardNotSupported = {}

--- Constructor of the AI error message meaning: the vineyard is not supported by this job. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorVineyardNotSupported.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorVineyardNotSupported` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorVineyardNotSupported:getI18NText() end
