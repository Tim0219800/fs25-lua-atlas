---@meta
-- FS25 1.25.1.0 : collections/MapDataGrid.lua (generated stub, FS25 Lua Atlas)

---@class MapDataGrid : DataGrid
MapDataGrid = {}

---@param mapSize integer
---@param blocksPerRowColumn integer
---@param customMt table?
---@return table
function MapDataGrid.new(mapSize, blocksPerRowColumn, customMt) end

---@param mapSize integer
---@param blockSize integer
---@param customMt table?
---@return MapDataGrid
function MapDataGrid.createFromBlockSize(mapSize, blockSize, customMt) end

---@param worldX number
---@param worldZ number
---@return table
function MapDataGrid:getValueAtWorldPos(worldX, worldZ) end

---@param worldX number
---@param worldZ number
---@param value table
function MapDataGrid:setValueAtWorldPos(worldX, worldZ, value) end

---@param worldX number
---@param worldZ number
---@return integer
---@return integer
function MapDataGrid:getRowColumnFromWorldPos(worldX, worldZ) end

---@param worldX number
---@param worldZ number
---@return boolean
function MapDataGrid:isWorldPositionInRange(worldX, worldZ) end
