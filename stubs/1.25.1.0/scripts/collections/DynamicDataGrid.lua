---@meta
-- FS25 1.25.1.0 : collections/DynamicDataGrid.lua (stub généré, atlas Lua FS25)

---@class DynamicDataGrid
DynamicDataGrid = {}

---@param size any
---@param tileSize any
---@param startX any
---@param startZ any
---@param cellConstructor any
---@param customMt any
function DynamicDataGrid.new(size, tileSize, startX, startZ, cellConstructor, customMt) end

function DynamicDataGrid:delete() end

---@param worldX number
---@param worldZ number
---@param clamp boolean
---@return table
function DynamicDataGrid:getCellFromWorldPosition(worldX, worldZ, clamp) end

---@param localIndexX number
---@param localIndexZ number
---@return number
---@return number
function DynamicDataGrid:getWorldPositionByLocalIndices(localIndexX, localIndexZ) end

---@param worldX number
---@param worldZ number
---@return number
---@return number
function DynamicDataGrid:getLocalIndicesByWorldPosition(worldX, worldZ) end

---@param x number
---@param z number
---@return number
---@return number
function DynamicDataGrid:getGridSnappedPosition(x, z) end

---@param worldX number
---@param worldZ number
---@return number
---@return number
function DynamicDataGrid:getGridIndicesByWorldPosition(worldX, worldZ) end
