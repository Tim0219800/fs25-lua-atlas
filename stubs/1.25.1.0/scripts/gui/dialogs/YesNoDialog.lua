---@meta
-- FS25 1.25.1.0 : gui/dialogs/YesNoDialog.lua (generated stub, FS25 Lua Atlas)

--- Binary yes/no confirmation dialog, derived from MessageDialog and meant as a base for dialogs that confirm or cancel an action. This file only adds Android back-key handling; the rest is inherited. Client-side GUI only.
---@class YesNoDialog : MessageDialog
YesNoDialog = {}

--- Extends the parent input handling; on Android, once the input lock delay has expired, the back action triggers `onNo` and the event is always consumed so no other focused element reacts.
---@param action any
---@param value any
---@param eventUsed any
function YesNoDialog:inputEvent(action, value, eventUsed) end
