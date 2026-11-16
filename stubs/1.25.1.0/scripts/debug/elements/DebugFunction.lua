---@meta
-- FS25 1.25.1.0 : debug/elements/DebugFunction.lua (generated stub, FS25 Lua Atlas)

--- DebugFunction is a lightweight debug element that runs a user-supplied draw function each frame, so custom debug rendering can be registered with the DebugManager. It does not inherit from DebugElement.
---@class DebugFunction
DebugFunction = {}

--- Always returns true, so the manager always calls `draw`.
---@return boolean
function DebugFunction:getShouldBeDrawn() end

--- Calls the stored `drawFunc` with the element as argument if one is set; otherwise does nothing.
function DebugFunction:draw() end
