---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorNoPalletsLoaded.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where no pallets are loaded. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorNoPalletsLoaded : AIMessage
AIMessageErrorNoPalletsLoaded = {}

--- Constructor of the AI error message meaning: no pallets are loaded. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorNoPalletsLoaded.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorNoPalletsLoaded` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorNoPalletsLoaded:getI18NText() end

--- Returns `AIMessageType.ERROR`; this is the same value the base class returns, so the override is redundant.
function AIMessageErrorNoPalletsLoaded:getType() end
