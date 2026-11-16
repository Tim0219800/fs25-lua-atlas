---@meta
-- FS25 1.25.1.0 : objects/football/FootballFieldActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable used to reset the football. This file only defines the distance function; the rest of the class (constructor, run) is not in the dump and is UNVERIFIED.
---@class FootballFieldResetActivatable
FootballFieldResetActivatable = {}

--- Returns the distance from the given point to the field's reset trigger node, or `math.huge` if the field has no such node.
---@param x any
---@param y any
---@param z any
function FootballFieldResetActivatable:getDistance(x, y, z) end
