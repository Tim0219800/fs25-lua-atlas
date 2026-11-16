---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/maps/ValueMap.lua (generated stub, FS25 Lua Atlas)

--- Base class of the Precision Farming value maps (soil, nitrogen, pH, yield, cover, tramline and so on). Only a static coordinate helper survives in this dump; the class body is not included.
---@class ValueMap
ValueMap = {}

--- Snaps a world x/z position to the centre of the map pixel containing it, given the terrain size and the map resolution. Returns the adjusted world x and z coordinates.
---@param x any
---@param z any
---@param terrainSize any
---@param mapSize any
function ValueMap.roundToPixelCenter(x, z, terrainSize, mapSize) end
