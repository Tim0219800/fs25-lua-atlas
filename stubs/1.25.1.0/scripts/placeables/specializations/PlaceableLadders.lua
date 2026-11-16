---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableLadders.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for placeables with climbable ladders. In this SDK dump only the collectPickObjects override is present; the ladder trigger loading code is not included, so spec.ladderTriggers is filled elsewhere (UNVERIFIED).
---@class PlaceableLadders
PlaceableLadders = {}

--- Overrides collectPickObjects on the placeable type.
---@param placeableType any
function PlaceableLadders.registerOverwrittenFunctions(placeableType) end

--- Calls the parent for the node unless the node is one of the ladder trigger nodes, which are therefore not registered as pickable objects.
---@param superFunc any
---@param node any
function PlaceableLadders:collectPickObjects(superFunc, node) end
