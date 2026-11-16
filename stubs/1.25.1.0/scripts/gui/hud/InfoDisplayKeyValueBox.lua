---@meta
-- FS25 1.25.1.0 : gui/hud/InfoDisplayKeyValueBox.lua (generated stub, FS25 Lua Atlas)

--- Info box (extends InfoDisplayBox) meant to show a title and key/value lines on a three-part background. Only the constructor is in this file: it creates the fieldInfo top/middle/bottom background overlays, colored from HUD.COLOR.BACKGROUND, and a warning icon colored from HUD.COLOR.ACTIVE. Line and title methods are not defined here (UNVERIFIED where they live).
---@class InfoDisplayKeyValueBox : InfoDisplayBox
InfoDisplayKeyValueBox = {}

--- Creates the box with an empty line list, the placeholder title 'Unknown Title', three background overlays and a warning icon overlay created through g_overlayManager.
---@param infoDisplay any
---@param uiScale any
---@param customMt any
function InfoDisplayKeyValueBox.new(infoDisplay, uiScale, customMt) end
