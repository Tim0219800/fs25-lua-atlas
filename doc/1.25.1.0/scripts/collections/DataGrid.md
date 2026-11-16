# collections/DataGrid.lua

*[Version française](../../fr/scripts/collections/DataGrid.md)*

Source: `dataS/scripts/collections/DataGrid.lua` — FS25 1.25.1.0

✍ Simple fixed-size two-dimensional grid stored as a table of rows, with one-based, bounds-checked access by row and column. Out-of-range access logs an error and a callstack instead of raising.

- **DataGrid** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `DataGrid.new(numRows: integer, numColumns: integer, customMt: table?) → table` | 20 | ✍ Creates a grid with the given number of rows and columns, with one empty table per row. Cells start as nil. |
| `DataGrid:delete()` | 35 | ✍ Releases the grid by dropping the reference to its row tables. The stored values are not deleted individually. |
| `DataGrid:getValue(rowIndex: integer, colIndex: integer) → table` | 44 | ✍ Returns the value at a row and column (one-based). Out-of-range indices log an error with a callstack and return nil. |
| `DataGrid:setValue(rowIndex: integer, colIndex: integer, value: table)` | 64 | ✍ Stores a value at a row and column (one-based). Returns true on success, or false after logging an error and callstack if an index is out of range. |
