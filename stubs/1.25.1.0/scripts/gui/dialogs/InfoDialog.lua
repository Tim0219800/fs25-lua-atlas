---@meta
-- FS25 1.25.1.0 : gui/dialogs/InfoDialog.lua (generated stub, FS25 Lua Atlas)

--- Simple information dialog with a text and a confirm button, derived from MessageDialog. A singleton instance (`InfoDialog.INSTANCE`) is reused through the static `show` helper. Client-side GUI only.
---@class InfoDialog : MessageDialog
InfoDialog = {}

--- Configures the shared instance (callback, dialog type defaulting to TYPE_INFO, button text and action, message, open sound) and opens it with `g_gui:showDialog`. Does nothing if the instance does not exist.
---@param text string
---@param callback function?
---@param target table?
---@param dialogType integer?
---@param okText string?
---@param buttonAction string?
---@param callbackArgs any
---@param disableOpenSound boolean?
function InfoDialog.show(text, callback, target, dialogType, okText, buttonAction, callbackArgs, disableOpenSound) end

--- Extends the parent input handling; on Android, once the input lock delay has expired, the back action triggers `onClickOk` and the event is always consumed so no other focused element reacts.
---@param action any
---@param value any
---@param eventUsed any
function InfoDialog:inputEvent(action, value, eventUsed) end
