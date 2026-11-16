---@meta
-- FS25 1.25.1.0 : utils/SplitShapeUtil.lua (generated stub, FS25 Lua Atlas)

--- Static helpers around engine split shapes (trees and logs): splitting, locating a tree's center and radius, building a tension belt around a tree and finding the split shape in a node hierarchy. The dump only has signatures, so behaviour is inferred and UNVERIFIED.
---@class SplitShapeUtil
SplitShapeUtil = {}

--- Signature only (no body in the SDK dump): Callback shape receiving the split shape plus flags for below and above and Y/Z extents. Its role as a split result handler is inferred and UNVERIFIED.
---@param unused any
---@param shape integer
---@param isBelow boolean
---@param isAbove boolean
---@param minY number
---@param maxY number
---@param minZ number
---@param maxZ number
function SplitShapeUtil.onSplitShapeCallback(unused, shape, isBelow, isAbove, minY, maxY, minZ, maxZ) end

--- Signature only (no body in the SDK dump): Presumably cuts a split shape with a plane given by a position, a normal and a Y direction, with cut sizes, then calls a named callback, optionally on a target table. The signature lists the callback parameter twice, so the real parameter order is UNVERIFIED.
---@param shape integer
---@param x number
---@param y number
---@param z number
---@param nx number
---@param ny number
---@param nz number
---@param yx number
---@param yy number
---@param yz number
---@param cutSizeY number
---@param callback string
---@param cutSizeZ number
---@param callback string
---@param target table?
function SplitShapeUtil.splitShape(shape, x, y, z, nx, ny, nz, yx, yy, yz, cutSizeY, callback, cutSizeZ, callback, target) end

--- Signature only (no body in the SDK dump): Returns the tree center position, up normal and radius near a world position within a maximum radius and a minimum length. UNVERIFIED beyond the annotations.
---@param shapeId integer
---@param x number
---@param y number
---@param z number
---@param maxRadius number
---@param minLength number
---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
---@return number
function SplitShapeUtil.getTreeOffsetPosition(shapeId, x, y, z, maxRadius, minLength) end

--- Signature only (no body in the SDK dump): Creates a tension belt shape around a tree from a tree center, a target position, the trunk up direction, a hook offset, an option to ignore the Y direction and a spacing; fills the given belt data table and returns the belt shape id. UNVERIFIED.
---@param beltData table
---@param shapeId integer
---@param tx number
---@param ty number
---@param tz number
---@param sx number
---@param sy number
---@param sz number
---@param upX number
---@param upY number
---@param upZ number
---@param hookOffset number
---@param ignoreYDirection boolean
---@param spacing number
---@return integer
function SplitShapeUtil.createTreeBelt(beltData, shapeId, tx, ty, tz, sx, sy, sz, upX, upY, upZ, hookOffset, ignoreYDirection, spacing) end

--- Signature only (no body in the SDK dump): Returns the first split shape mesh found in the hierarchy of a node, or nil.
---@param node integer
---@return integer
function SplitShapeUtil.getSplitShapeId(node) end
