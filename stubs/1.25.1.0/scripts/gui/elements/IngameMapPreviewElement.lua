---@meta
-- FS25 1.25.1.0 : gui/elements/IngameMapPreviewElement.lua (generated stub, FS25 Lua Atlas)

--- IngameMapPreviewElement is a small GuiElement subclass that only restores the shared in-game map when it closes. It expects a field ingameMap (set elsewhere, UNVERIFIED) and undoes the custom layout, hotspot clipping and clip area applied for a map preview.
---@class IngameMapPreviewElement : GuiElement
IngameMapPreviewElement = {}

--- Calls the parent onClose, then resets the map: custom layout to nil, clipHotspots to false and the map clip area cleared.
function IngameMapPreviewElement:onClose() end
