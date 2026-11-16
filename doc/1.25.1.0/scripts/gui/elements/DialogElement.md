# gui/elements/DialogElement.lua

*[Version française](../../../fr/scripts/gui/elements/DialogElement.md)*

Source: `dataS/scripts/gui/elements/DialogElement.lua` — FS25 1.25.1.0

✍ DialogElement is the base class of modal dialogs. It extends ScreenElement and is configured by a matching dialog Lua class plus XML file. It adds a close-permission flag and a dialog type that switches which icon element is visible. The constants it uses (DialogElement.TYPE_*, DIALOG_CIRCLE_PROFILE*, TYPE_ICON_ID_MAPPING) are not defined in this file of the dump: UNVERIFIED.

- **DialogElement** inherits from `ScreenElement` (l.50)

## Functions

| Function | Line | Description |
|---|---|---|
| `DialogElement.new(target: any, custom_mt: any)` | 54 | ✍ Constructor. Builds a ScreenElement-based dialog and sets isCloseAllowed to true. |
| `DialogElement:close()` | 64 | ✍ Closes this dialog by asking g_gui to close the dialog registered under this element's name. |
| `DialogElement:onClickBack(forceBack: any, usedMenuButton: any)` | 70 | ✍ Back-button handler. Closes the dialog and returns false (event consumed) if closing is allowed or forced and the menu button was not used; otherwise returns true (event unused). |
| `DialogElement:setDialogType(dialogType: any)` | 81 | ✍ Stores the dialog type (default DialogElement.TYPE_WARNING) and shows only the icon element matching it. Hides the circle for the loading type and applies a warning or a normal circle profile. Note: TYPE_ICON_ID_MAPPING is read as a bare global, not as a DialogElement field. |
| `DialogElement:setIsCloseAllowed(isAllowed: any)` | 107 | ✍ Sets whether the player may close the dialog with the back action. |
