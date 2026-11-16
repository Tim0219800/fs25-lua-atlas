# collections/MapDataGrid.lua

*[Version française](../../fr/scripts/collections/MapDataGrid.md)*

Source: `dataS/scripts/collections/MapDataGrid.lua` — FS25 1.25.1.0

✍ DataGrid subclass that divides a square map, centered on world origin, into an equal number of blocks per row and column, so values can be read and written by world X/Z position. Positions outside the map are clamped to the edge blocks when looking up row and column.

- **MapDataGrid** inherits from `DataGrid` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `MapDataGrid.new(mapSize: integer, blocksPerRowColumn: integer, customMt: table?) → table` | 21 | ✍ Creates a square grid of blocksPerRowColumn by blocksPerRowColumn blocks covering a map of mapSize, and stores blockSize = mapSize / blocksPerRowColumn. |
| `MapDataGrid.createFromBlockSize(mapSize: integer, blockSize: integer, customMt: table?) → MapDataGrid` | 37 | ✍ Creates a grid from a map size and a desired block size in metres, using ceil(mapSize / blockSize) blocks per side, so the real block size may be slightly smaller. |
| `MapDataGrid:getValueAtWorldPos(worldX: number, worldZ: number) → table` | 49 | ✍ Returns the value stored in the block containing a world X/Z, followed by the row and column used. |
| `MapDataGrid:setValueAtWorldPos(worldX: number, worldZ: number, value: table)` | 59 | ✍ Stores a value in the block containing a world X/Z. Positions outside the map write to the nearest edge block. |
| `MapDataGrid:getRowColumnFromWorldPos(worldX: number, worldZ: number) → integer, integer` | 70 | ✍ Converts a world X/Z to a one-based row (from Z) and column (from X), clamped to the grid, with the map centered on the origin. |
| `MapDataGrid:isWorldPositionInRange(worldX: number, worldZ: number) → boolean` | 90 | ✍ Returns true if the world X/Z lies inside the map square; the lower edge is exclusive and the upper edge inclusive. |
