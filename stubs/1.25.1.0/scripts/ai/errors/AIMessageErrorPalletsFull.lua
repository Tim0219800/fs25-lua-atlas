---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorPalletsFull.lua (generated stub, FS25 Lua Atlas)

--- AI message class for the case where the pallet storage is full. It extends `AIMessage`, is registered in `AIMessageManager` and is shown when a helper job stops with this error.
---@class AIMessageErrorPalletsFull : AIMessage
AIMessageErrorPalletsFull = {}

--- Constructor of the AI error message meaning: the pallet storage is full. Inherits from `AIMessage` and adds no state.
---@param customMt any
function AIMessageErrorPalletsFull.new(customMt) end

--- Returns the localized text for the key `ai_messageErrorPalletsFull` via `g_i18n`, used by `AIMessage:getMessage`.
function AIMessageErrorPalletsFull:getI18NText() end

--- Returns `AIMessageType.ERROR`; this is the same value the base class returns, so the override is redundant.
function AIMessageErrorPalletsFull:getType() end
