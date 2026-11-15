---@meta
-- FS25 1.25.1.0 : utils/SplitShapeUtil.lua (generated stub, FS25 Lua Atlas)

---@class SplitShapeUtil
SplitShapeUtil = {}

---@param unused any
---@param shape integer
---@param isBelow boolean
---@param isAbove boolean
---@param minY number
---@param maxY number
---@param minZ number
---@param maxZ number
function SplitShapeUtil.onSplitShapeCallback(unused, shape, isBelow, isAbove, minY, maxY, minZ, maxZ) end

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

---@param node integer
---@return integer
function SplitShapeUtil.getSplitShapeId(node) end
