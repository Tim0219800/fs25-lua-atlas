---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorWrongSeason.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where the work is not possible in the current season. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorWrongSeason : AIMessage
AIMessageErrorWrongSeason = {}

--- Constructor of the AI error message meaning: the work is not possible in the current season. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorWrongSeason.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorWrongSeason` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorWrongSeason:getI18NText() end
