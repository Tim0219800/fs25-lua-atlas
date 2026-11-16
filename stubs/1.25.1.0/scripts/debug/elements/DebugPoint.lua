---@meta
-- FS25 1.25.1.0 : debug/elements/DebugPoint.lua (generated stub, FS25 Lua Atlas)

--- DebugPoint is a debug element drawing a single point with optional text at a world position, derived from DebugElement. `DebugPoint.renderAtPosition` is absent from this dump (UNVERIFIED).
---@class DebugPoint : DebugElement
DebugPoint = {}

--- Creates a point element, not solid, not ground-aligned and without text.
---@param customMt table?
---@return DebugPoint
function DebugPoint.new(customMt) end

--- Calls `DebugPoint.renderAtPosition` with position, colour, solid flag, text, text size and clip distances.
function DebugPoint:draw() end
