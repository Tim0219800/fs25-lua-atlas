---@meta
-- FS25 1.25.1.0 : gui/hud/FillLevelsDisplay.lua (generated stub, FS25 Lua Atlas)

--- HUD display for vehicle fill levels, derived from HUDDisplay. This file only defines the constructor: background slices (gui.filltypes_left/middle/right), a max-weight icon, a three-part progress bar and empty vehicle/icon/fill-level tables. Layout and drawing are not in this file (UNVERIFIED).
---@class FillLevelsDisplay : HUDDisplay
FillLevelsDisplay = {}

--- Constructor. Creates the tinted background overlays, the max-weight icon overlay and the ThreePartOverlay progress bar; no vehicle is attached and the icon/data tables are empty.
function FillLevelsDisplay.new() end
