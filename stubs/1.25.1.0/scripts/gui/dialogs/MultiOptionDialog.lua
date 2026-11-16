---@meta
-- FS25 1.25.1.0 : gui/dialogs/MultiOptionDialog.lua (generated stub, FS25 Lua Atlas)

--- Dialog offering up to four choices mapped to the menu activate, accept, back and cancel actions, derived from MessageDialog. Only the Android back-key handling is defined in this file; the rest is inherited. Client-side GUI only.
---@class MultiOptionDialog : MessageDialog
MultiOptionDialog = {}

--- Extends the parent input handling; on Android, once the input lock delay has expired, the back action triggers `onNo` and the event is always consumed so no other focused element reacts.
---@param action any
---@param value any
---@param eventUsed any
function MultiOptionDialog:inputEvent(action, value, eventUsed) end
