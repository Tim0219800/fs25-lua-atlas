---@meta
-- FS25 1.25.1.0 : debug/elements/DebugLine.lua (generated stub, FS25 Lua Atlas)

--- DebugLine is a debug element drawing a line between two world positions or between two nodes that are followed each frame, with optional start/end colours, text and terrain alignment. The static renderer `DebugLine.renderBetweenPositions` is absent from this dump (UNVERIFIED).
---@class DebugLine : DebugElement
DebugLine = {}

--- Creates a line element with default settings: not solid, no start/end colours, no ground alignment and no nodes.
---@param customMt table?
---@return DebugLine
function DebugLine.new(customMt) end

--- If both nodes are set and still exist, refreshes the endpoints from their world positions, then calls `DebugLine.renderBetweenPositions` with the line settings.
function DebugLine:draw() end
