---@meta
-- FS25 1.25.1.0 : debug/elements/DebugPath.lua (generated stub, FS25 Lua Atlas)

--- DebugPath is a debug element that draws a polyline through a list of points, optionally at a forced height or aligned to the ground. It does its own clipping, and the rendering function `DebugPath.renderPath` is absent from this dump (UNVERIFIED).
---@class DebugPath : DebugElement
DebugPath = {}

--- Creates a path element with an empty point list, no ground alignment, solid drawing and no minimum point spacing.
---@param customMt table?
---@return DebugPath
function DebugPath.new(customMt) end

--- Always returns true because the path applies its clip distance itself during rendering, bypassing the base class checks (visibility flag and GUI hiding).
---@return boolean
function DebugPath:getShouldBeDrawn() end

--- Calls `DebugPath.renderPath` with the points, colour, ground alignment, forced Y, solid flag, clip distance and text.
function DebugPath:draw() end

--- Replaces the point list with an empty table. Returns self.
---@return DebugPath
function DebugPath:clear() end

--- Sets a fixed world Y used to draw the path; pass nil to remove it. Returns self.
---@param forcedY number
---@return DebugPath
function DebugPath:setForcedY(forcedY) end
