---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorNoFieldFound.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where no field was found at the start position. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorNoFieldFound : AIMessage
AIMessageErrorNoFieldFound = {}

--- Constructor of the AI error message meaning: no field was found at the start position. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorNoFieldFound.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorNoFieldFound` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorNoFieldFound:getI18NText() end
