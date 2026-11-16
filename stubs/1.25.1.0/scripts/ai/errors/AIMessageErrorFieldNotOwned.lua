---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorFieldNotOwned.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where the field is not owned by the farm. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorFieldNotOwned : AIMessage
AIMessageErrorFieldNotOwned = {}

--- Constructor of the AI error message meaning: the field is not owned by the farm. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorFieldNotOwned.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorFieldNotOwned` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorFieldNotOwned:getI18NText() end
