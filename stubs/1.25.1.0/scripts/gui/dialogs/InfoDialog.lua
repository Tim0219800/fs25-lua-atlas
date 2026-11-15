---@meta
-- FS25 1.25.1.0 : gui/dialogs/InfoDialog.lua (stub généré, atlas Lua FS25)

---@class InfoDialog : MessageDialog
InfoDialog = {}

---@param text string
---@param callback function?
---@param target table?
---@param dialogType integer?
---@param okText string?
---@param buttonAction string?
---@param callbackArgs any
---@param disableOpenSound boolean?
function InfoDialog.show(text, callback, target, dialogType, okText, buttonAction, callbackArgs, disableOpenSound) end

---@param action any
---@param value any
---@param eventUsed any
function InfoDialog:inputEvent(action, value, eventUsed) end
