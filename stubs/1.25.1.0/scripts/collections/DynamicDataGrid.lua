---@meta
-- FS25 1.25.1.0 : collections/DynamicDataGrid.lua (generated stub, FS25 Lua Atlas)

--- Square grid of cells centered on a movable world position, with cells of tileSize world units snapped to a world-aligned lattice. Cells are created once, optionally by a constructor receiving their world X and Z. In this dump the file stops after getGridIndicesByWorldPosition and calls getWorldIndicesByWorldPosition and getGridSnappedPositionByLocalIndices, which are not defined in it (UNVERIFIED where they come from). The lastPosition field is only set at construction here.
---@class DynamicDataGrid
DynamicDataGrid = {}

--- Builds the grid: rowColumnCount = ceil(size / tileSize), with local indices running around a central cell. Optional start X/Z set the initial position and cellConstructor(worldX, worldZ) creates each cell, else empty tables. Debug asserts check arguments only in debug builds.
---@param size any
---@param tileSize any
---@param startX any
---@param startZ any
---@param cellConstructor any
---@param customMt any
function DynamicDataGrid.new(size, tileSize, startX, startZ, cellConstructor, customMt) end

--- Calls delete on every cell that has such a method, then drops the grid table.
function DynamicDataGrid:delete() end

--- Returns the cell covering a world X/Z position, or nil if it lies outside the grid. With clamp true the local indices are clamped to the grid edges so a cell is always returned.
---@param worldX number
---@param worldZ number
---@param clamp boolean
---@return table
function DynamicDataGrid:getCellFromWorldPosition(worldX, worldZ, clamp) end

--- Returns the world X/Z of the center of the cell at a local offset (0,0 = center cell) relative to the grid's last position. Relies on helpers not defined in this file (UNVERIFIED).
---@param localIndexX number
---@param localIndexZ number
---@return number
---@return number
function DynamicDataGrid:getWorldPositionByLocalIndices(localIndexX, localIndexZ) end

--- Converts a world X/Z to local cell indices relative to the grid's last position, where 0,0 is the center cell. Relies on getWorldIndicesByWorldPosition, not defined here (UNVERIFIED).
---@param worldX number
---@param worldZ number
---@return number
---@return number
function DynamicDataGrid:getLocalIndicesByWorldPosition(worldX, worldZ) end

--- Snaps an X/Z position to the center of its tileSize cell: floor to the tile multiple, then add half a tile.
---@param x number
---@param z number
---@return number
---@return number
function DynamicDataGrid:getGridSnappedPosition(x, z) end

--- Returns the one-based indices into the underlying 2D array for a world position, i.e. the local index shifted by the center index. The result can fall outside 1..rowColumnCount for positions beyond the grid.
---@param worldX number
---@param worldZ number
---@return number
---@return number
function DynamicDataGrid:getGridIndicesByWorldPosition(worldX, worldZ) end
