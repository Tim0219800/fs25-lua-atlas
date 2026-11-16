---@meta
-- FS25 1.25.1.0 : placement/PlacementGrid2D.lua (generated stub, FS25 Lua Atlas)

--- Helper that models a rectangular area attached to a node (width along X, length along Z) and tracks which parts of it are occupied. Occupancy is stored as one entry per Z slice of size `spacing`, each holding the min and max X blocked. Two placement modes are mentioned in the file's comments, SIDES and FILL; the constants such as `MODE_SIDES` are not present in the dump, so their values are UNVERIFIED. The free-position query itself is not in this dump.
---@class PlacementGrid2D
PlacementGrid2D = {}

--- Creates a grid for the given node, width, length and slice spacing. The mode defaults to `PlacementGrid2D.MODE_SIDES`. Starts with no blocked areas and two invalid lower/upper position records.
---@param node any
---@param width any
---@param length any
---@param spacing any
---@param mode any
function PlacementGrid2D.new(node, width, length, spacing, mode) end

--- Empty destructor, nothing is released.
function PlacementGrid2D:delete() end

--- Discards all blocked areas so the whole grid is free again.
function PlacementGrid2D:reset() end

--- Blocks a rectangle given in the grid's local space (x, z as the corner, then width and length) by forwarding its bounds to `updateBlockedArea`. No clamping to the grid size is done here.
---@param x any
---@param z any
---@param width any
---@param length any
function PlacementGrid2D:blockAreaLocal(x, z, width, length) end

--- Blocks the footprint of an oriented box given by world position, direction, up vector and half extents. The eight corners are converted to the grid node's local space and their bounds are clamped to the grid before blocking.
---@param x any
---@param y any
---@param z any
---@param dirX any
---@param dirY any
---@param dirZ any
---@param upX any
---@param upY any
---@param upZ any
---@param extendX any
---@param extendY any
---@param extendZ any
function PlacementGrid2D:blockAreaByBoundingBox(x, y, z, dirX, dirY, dirZ, upX, upY, upZ, extendX, extendY, extendZ) end

--- Marks every Z slice touched by the given range, creating missing slices and widening each slice's blocked min/max X to include the new range. Slice indices start at 1 and use `spacing` as size.
---@param minX any
---@param maxX any
---@param minZ any
---@param maxZ any
function PlacementGrid2D:updateBlockedArea(minX, maxX, minZ, maxZ) end

--- Debug drawing: outlines the grid in white and, for each blocked slice, draws its edges in white plus a red center line. Must be called every frame to stay visible.
function PlacementGrid2D:drawDebug() end
