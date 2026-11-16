---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorUnloadingStationFull.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where the unloading station is full. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorUnloadingStationFull : AIMessage
AIMessageErrorUnloadingStationFull = {}

--- Constructor of the AI error message meaning: the unloading station is full. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorUnloadingStationFull.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorUnloadingStationFull` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorUnloadingStationFull:getI18NText() end
