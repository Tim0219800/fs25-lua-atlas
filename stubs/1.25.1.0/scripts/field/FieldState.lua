---@meta
-- FS25 1.25.1.0 : field/FieldState.lua (generated stub, FS25 Lua Atlas)

--- Plain data holder for the state of a field or sampled spot: fruit, growth, weeds, stones, ground type, spray, lime, roller, plow, stubble and water levels, farmland and owner. It has no logic of its own; other classes fill it.
---@class FieldState
FieldState = {}

--- Constructor. Sets all levels to 0, validity to false, fruit type unknown, ground type NONE, farmland id 0 and owner AccessHandler.NOBODY.
---@param customMt any
---@return table
function FieldState.new(customMt) end
