---@meta
-- FS25 1.25.1.0 : gui/elements/DialogElement.lua (generated stub, FS25 Lua Atlas)

--- DialogElement is the base class of modal dialogs. It extends ScreenElement and is configured by a matching dialog Lua class plus XML file. It adds a close-permission flag and a dialog type that switches which icon element is visible. The constants it uses (DialogElement.TYPE_*, DIALOG_CIRCLE_PROFILE*, TYPE_ICON_ID_MAPPING) are not defined in this file of the dump: UNVERIFIED.
---@class DialogElement : ScreenElement
DialogElement = {}

--- Constructor. Builds a ScreenElement-based dialog and sets isCloseAllowed to true.
---@param target any
---@param custom_mt any
function DialogElement.new(target, custom_mt) end

--- Closes this dialog by asking g_gui to close the dialog registered under this element's name.
function DialogElement:close() end

--- Back-button handler. Closes the dialog and returns false (event consumed) if closing is allowed or forced and the menu button was not used; otherwise returns true (event unused).
---@param forceBack any
---@param usedMenuButton any
function DialogElement:onClickBack(forceBack, usedMenuButton) end

--- Stores the dialog type (default DialogElement.TYPE_WARNING) and shows only the icon element matching it. Hides the circle for the loading type and applies a warning or a normal circle profile. Note: TYPE_ICON_ID_MAPPING is read as a bare global, not as a DialogElement field.
---@param dialogType any
function DialogElement:setDialogType(dialogType) end

--- Sets whether the player may close the dialog with the back action.
---@param isAllowed any
function DialogElement:setIsCloseAllowed(isAllowed) end
