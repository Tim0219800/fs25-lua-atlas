---@meta
-- FS25 1.25.1.0 : collections/MapDataGrid.lua (generated stub, FS25 Lua Atlas)

--- DataGrid subclass that divides a square map, centered on world origin, into an equal number of blocks per row and column, so values can be read and written by world X/Z position. Positions outside the map are clamped to the edge blocks when looking up row and column.
---@class MapDataGrid : DataGrid
MapDataGrid = {}

--- Creates a square grid of blocksPerRowColumn by blocksPerRowColumn blocks covering a map of mapSize, and stores blockSize = mapSize / blocksPerRowColumn.
---@param mapSize integer
---@param blocksPerRowColumn integer
---@param customMt table?
---@return table
function MapDataGrid.new(mapSize, blocksPerRowColumn, customMt) end

--- Creates a grid from a map size and a desired block size in metres, using ceil(mapSize / blockSize) blocks per side, so the real block size may be slightly smaller.
---@param mapSize integer
---@param blockSize integer
---@param customMt table?
---@return MapDataGrid
function MapDataGrid.createFromBlockSize(mapSize, blockSize, customMt) end

--- Returns the value stored in the block containing a world X/Z, followed by the row and column used.
---@param worldX number
---@param worldZ number
---@return table
function MapDataGrid:getValueAtWorldPos(worldX, worldZ) end

--- Stores a value in the block containing a world X/Z. Positions outside the map write to the nearest edge block.
---@param worldX number
---@param worldZ number
---@param value table
function MapDataGrid:setValueAtWorldPos(worldX, worldZ, value) end

--- Converts a world X/Z to a one-based row (from Z) and column (from X), clamped to the grid, with the map centered on the origin.
---@param worldX number
---@param worldZ number
---@return integer
---@return integer
function MapDataGrid:getRowColumnFromWorldPos(worldX, worldZ) end

--- Returns true if the world X/Z lies inside the map square; the lower edge is exclusive and the upper edge inclusive.
---@param worldX number
---@param worldZ number
---@return boolean
function MapDataGrid:isWorldPositionInRange(worldX, worldZ) end
