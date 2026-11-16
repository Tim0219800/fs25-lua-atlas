---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorNoVineFound.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where no vine was found. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorNoVineFound : AIMessage
AIMessageErrorNoVineFound = {}

--- Constructor of the AI error message meaning: no vine was found. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorNoVineFound.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorNoVineFound` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorNoVineFound:getI18NText() end
