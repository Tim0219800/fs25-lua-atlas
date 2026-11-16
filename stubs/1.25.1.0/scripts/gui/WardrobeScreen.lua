---@meta
-- FS25 1.25.1.0 : gui/WardrobeScreen.lua (generated stub, FS25 Lua Atlas)

--- Wardrobe (character customisation) screen, built on `TabbedMenuWithDetails`. Only the cleanup of its non-GUI input action event is described here.
---@class WardrobeScreen : TabbedMenuWithDetails
WardrobeScreen = {}

--- Unregisters the left/right controller action event (`eventIdLeftRightController`) from `g_inputBinding` and clears the stored id.
function WardrobeScreen:removeActionEvents() end
