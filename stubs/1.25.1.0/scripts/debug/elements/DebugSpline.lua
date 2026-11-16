---@meta
-- FS25 1.25.1.0 : debug/elements/DebugSpline.lua (generated stub, FS25 Lua Atlas)

--- DebugSpline is a debug element for visualising a spline node, with optional edit-point display and a text label near the closest camera position. `createWithNode` (used by DebugManager's spline debug command) and `DebugSpline.renderForNode` are absent from this dump (UNVERIFIED).
---@class DebugSpline : DebugElement
DebugSpline = {}

--- Calls `DebugSpline.renderForNode` with the spline node, colour, text (or a default text), clip distances, the edit-point flag and cached closest-to-camera data.
function DebugSpline:draw() end
