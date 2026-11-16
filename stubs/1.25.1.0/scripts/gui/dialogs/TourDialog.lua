---@meta
-- FS25 1.25.1.0 : gui/dialogs/TourDialog.lua (generated stub, FS25 Lua Atlas)

--- Information dialog with a text and a confirm button, derived from MessageDialog, apparently used for tour messages (the name suggests it; no tour logic is in this file). Only the Android back-key handling is defined here.
---@class TourDialog : MessageDialog
TourDialog = {}

--- Extends the parent input handling; on Android, once the input lock delay has expired, the back action triggers `onClickOk` and the event is always consumed so no other focused element reacts.
---@param action any
---@param value any
---@param eventUsed any
function TourDialog:inputEvent(action, value, eventUsed) end
