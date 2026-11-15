---@meta
-- FS25 1.25.1.0 : placement/PlacementGrid2D.lua (generated stub, FS25 Lua Atlas)

---@class PlacementGrid2D
PlacementGrid2D = {}

---@param node any
---@param width any
---@param length any
---@param spacing any
---@param mode any
function PlacementGrid2D.new(node, width, length, spacing, mode) end

function PlacementGrid2D:delete() end

function PlacementGrid2D:reset() end

---@param x any
---@param z any
---@param width any
---@param length any
function PlacementGrid2D:blockAreaLocal(x, z, width, length) end

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

---@param minX any
---@param maxX any
---@param minZ any
---@param maxZ any
function PlacementGrid2D:updateBlockedArea(minX, maxX, minZ, maxZ) end

function PlacementGrid2D:drawDebug() end
