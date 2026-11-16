---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorUnloadingStationDeleted.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where the unloading station was deleted. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorUnloadingStationDeleted : AIMessage
AIMessageErrorUnloadingStationDeleted = {}

--- Constructor of the AI error message meaning: the unloading station was deleted. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorUnloadingStationDeleted.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorUnloadingStationDeleted` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorUnloadingStationDeleted:getI18NText() end
