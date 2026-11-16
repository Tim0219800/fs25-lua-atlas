---@meta
-- FS25 1.25.1.0 : placeables/specializations/activatables/WardrobeActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable object for a wardrobe placeable that opens the character customization screen. It is available if the wardrobe is free for all or belongs to the local farm, and is blocked during a guided tour.
---@class WardrobeActivatable
WardrobeActivatable = {}

--- Creates the activatable for a wardrobe placeable and sets the prompt text `action_openWardrobe`.
---@param placeable any
function WardrobeActivatable.new(placeable) end

--- Returns true if the wardrobe is free for all or the local farm owns the placeable.
function WardrobeActivatable:getIsActivatable() end

--- Shows an info dialog during a guided tour; otherwise switches the GUI to the WardrobeScreen.
function WardrobeActivatable:run() end
