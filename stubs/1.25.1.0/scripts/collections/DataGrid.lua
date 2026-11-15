---@meta
-- FS25 1.25.1.0 : collections/DataGrid.lua (generated stub, FS25 Lua Atlas)

---@class DataGrid
DataGrid = {}

---@param numRows integer
---@param numColumns integer
---@param customMt table?
---@return table
function DataGrid.new(numRows, numColumns, customMt) end

function DataGrid:delete() end

---@param rowIndex integer
---@param colIndex integer
---@return table
function DataGrid:getValue(rowIndex, colIndex) end

---@param rowIndex integer
---@param colIndex integer
---@param value table
function DataGrid:setValue(rowIndex, colIndex, value) end
