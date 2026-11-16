# collections/DynamicDataGrid.lua

*[Version française](../../fr/scripts/collections/DynamicDataGrid.md)*

Source: `dataS/scripts/collections/DynamicDataGrid.lua` — FS25 1.25.1.0

✍ Square grid of cells centered on a movable world position, with cells of tileSize world units snapped to a world-aligned lattice. Cells are created once, optionally by a constructor receiving their world X and Z. In this dump the file stops after getGridIndicesByWorldPosition and calls getWorldIndicesByWorldPosition and getGridSnappedPositionByLocalIndices, which are not defined in it (UNVERIFIED where they come from). The lastPosition field is only set at construction here.

- **DynamicDataGrid** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `DynamicDataGrid.new(size: any, tileSize: any, startX: any, startZ: any, cellConstructor: any, customMt: any)` | 15 | ✍ Builds the grid: rowColumnCount = ceil(size / tileSize), with local indices running around a central cell. Optional start X/Z set the initial position and cellConstructor(worldX, worldZ) creates each cell, else empty tables. Debug asserts check arguments only in debug builds. |
| `DynamicDataGrid:delete()` | 97 | ✍ Calls delete on every cell that has such a method, then drops the grid table. |
| `DynamicDataGrid:getCellFromWorldPosition(worldX: number, worldZ: number, clamp: boolean) → table` | 189 | ✍ Returns the cell covering a world X/Z position, or nil if it lies outside the grid. With clamp true the local indices are clamped to the grid edges so a cell is always returned. |
| `DynamicDataGrid:getWorldPositionByLocalIndices(localIndexX: number, localIndexZ: number) → number, number` | 219 | ✍ Returns the world X/Z of the center of the cell at a local offset (0,0 = center cell) relative to the grid's last position. Relies on helpers not defined in this file (UNVERIFIED). |
| `DynamicDataGrid:getLocalIndicesByWorldPosition(worldX: number, worldZ: number) → number, number` | 233 | ✍ Converts a world X/Z to local cell indices relative to the grid's last position, where 0,0 is the center cell. Relies on getWorldIndicesByWorldPosition, not defined here (UNVERIFIED). |
| `DynamicDataGrid:getGridSnappedPosition(x: number, z: number) → number, number` | 255 | ✍ Snaps an X/Z position to the center of its tileSize cell: floor to the tile multiple, then add half a tile. |
| `DynamicDataGrid:getGridIndicesByWorldPosition(worldX: number, worldZ: number) → number, number` | 273 | ✍ Returns the one-based indices into the underlying 2D array for a world position, i.e. the local index shifted by the center index. The result can fall outside 1..rowColumnCount for positions beyond the grid. |
