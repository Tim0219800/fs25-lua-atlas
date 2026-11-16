---@meta
-- FS25 1.25.1.0 : debug/elements/DebugGizmo.lua (generated stub, FS25 Lua Atlas)

--- DebugGizmo is a debug element that draws an axis gizmo (position, direction, up) with optional text, derived from DebugElement. The static renderer `DebugGizmo.renderAtPosition` is absent from this dump (UNVERIFIED).
---@class DebugGizmo : DebugElement
DebugGizmo = {}

--- Override that hides the gizmo when a GUI is visible (if hiding is on) or when it is beyond the clip distance of the camera, tested with `DebugUtil.isPositionInCameraRange`. Unlike the base class it ignores the visibility flag.
---@return boolean
function DebugGizmo:getShouldBeDrawn() end

--- Forwards position, direction, up, text, solid, scale, text size, text colour and text offsets to `DebugGizmo.renderAtPosition`.
function DebugGizmo:draw() end
