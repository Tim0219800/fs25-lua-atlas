---@meta
-- FS25 1.25.1.0 : collections/DataGrid.lua (generated stub, FS25 Lua Atlas)

--- Simple fixed-size two-dimensional grid stored as a table of rows, with one-based, bounds-checked access by row and column. Out-of-range access logs an error and a callstack instead of raising.
---@class DataGrid
DataGrid = {}

--- Creates a grid with the given number of rows and columns, with one empty table per row. Cells start as nil.
---@param numRows integer
---@param numColumns integer
---@param customMt table?
---@return table
function DataGrid.new(numRows, numColumns, customMt) end

--- Releases the grid by dropping the reference to its row tables. The stored values are not deleted individually.
function DataGrid:delete() end

--- Returns the value at a row and column (one-based). Out-of-range indices log an error with a callstack and return nil.
---@param rowIndex integer
---@param colIndex integer
---@return table
function DataGrid:getValue(rowIndex, colIndex) end

--- Stores a value at a row and column (one-based). Returns true on success, or false after logging an error and callstack if an index is out of range.
---@param rowIndex integer
---@param colIndex integer
---@param value table
function DataGrid:setValue(rowIndex, colIndex, value) end
