---@meta
-- FS25 1.25.1.0 : debug/elements/DebugPolygon.lua (generated stub, FS25 Lua Atlas)

--- DebugPolygon is a debug element drawing a polygon from a flat list of vertex coordinates, with optional contour lines. It wraps the engine function `drawDebugPolygon` (behaviour UNVERIFIED, engine side).
---@class DebugPolygon : DebugElement
DebugPolygon = {}

--- Calls `DebugPolygon.renderWithPositions` with the stored positions, colour, solid flag and contour option.
function DebugPolygon:draw() end

--- Draws a polygon from vertices given as x1,y1,z1,x2,y2,z2,... (default white) with `drawDebugPolygon`; if `drawContour` is set it also draws the edges including the closing edge back to the first vertex.
---@param positions array
---@param color table?
---@param solid boolean?
---@param drawContour any
function DebugPolygon.renderWithPositions(positions, color, solid, drawContour) end
