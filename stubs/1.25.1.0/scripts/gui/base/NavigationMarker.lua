---@meta
-- FS25 1.25.1.0 : gui/base/NavigationMarker.lua (generated stub, FS25 Lua Atlas)

--- HUD marker pointing to a world position: it projects the position to the screen, clamps it to the screen border, draws a pulsing marker overlay with an arrow when off-screen, and prints the distance. Only the render method is in this file; the constructor and fields such as `worldPosX` come from elsewhere (UNVERIFIED).
---@class NavigationMarker
NavigationMarker = {}

--- Client-side drawing: returns if hidden, without a local player or closer than `minDistance`. Projects the target via the active camera, clamps to borders, pulses alpha with `g_time`, draws marker, arrow if clamped, and the distance text.
function NavigationMarker:render() end
