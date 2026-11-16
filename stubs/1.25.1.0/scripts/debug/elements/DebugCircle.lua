---@meta
-- FS25 1.25.1.0 : debug/elements/DebugCircle.lua (generated stub, FS25 Lua Atlas)

--- DebugCircle is a debug element for a horizontal circle, derived from DebugElement. Only `draw` is present; the static renderer `DebugCircle.renderAtPosition` is absent from this dump (UNVERIFIED).
---@class DebugCircle : DebugElement
DebugCircle = {}

--- Forwards position, radius, colour, segment count, solid, filled, sector and text settings to `DebugCircle.renderAtPosition`; Y is passed as nil (ground alignment) when `alignToGround` is set.
function DebugCircle:draw() end
