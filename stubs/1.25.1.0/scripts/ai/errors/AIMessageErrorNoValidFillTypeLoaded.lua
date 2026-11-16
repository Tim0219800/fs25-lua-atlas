---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorNoValidFillTypeLoaded.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where no valid fill type is loaded. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorNoValidFillTypeLoaded : AIMessage
AIMessageErrorNoValidFillTypeLoaded = {}

--- Constructor of the AI error message meaning: no valid fill type is loaded. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorNoValidFillTypeLoaded.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorNoValidFillTypeLoaded` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorNoValidFillTypeLoaded:getI18NText() end
