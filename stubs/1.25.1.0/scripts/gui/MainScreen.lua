---@meta
-- FS25 1.25.1.0 : gui/MainScreen.lua (generated stub, FS25 Lua Atlas)

--- Main menu screen shown at game start (extends `ScreenElement`). Only the input handling override is described here.
---@class MainScreen : ScreenElement
MainScreen = {}

--- Calls the parent input handler, then on Android turns MENU_BACK into a yes/no quit dialog (`onYesNoEnd`) and always marks the event as used. Returns the event-used flag.
---@param action any
---@param value any
---@param eventUsed any
function MainScreen:inputEvent(action, value, eventUsed) end
