# collections/MapDataGrid.lua

Source : `dataS/scripts/collections/MapDataGrid.lua` — FS25 1.25.1.0

- **MapDataGrid** hérite de `DataGrid` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MapDataGrid.new(mapSize: integer, blocksPerRowColumn: integer, customMt: table?) → table` | 21 |  |
| `MapDataGrid.createFromBlockSize(mapSize: integer, blockSize: integer, customMt: table?) → MapDataGrid` | 37 |  |
| `MapDataGrid:getValueAtWorldPos(worldX: number, worldZ: number) → table` | 49 |  |
| `MapDataGrid:setValueAtWorldPos(worldX: number, worldZ: number, value: table)` | 59 |  |
| `MapDataGrid:getRowColumnFromWorldPos(worldX: number, worldZ: number) → integer, integer` | 70 |  |
| `MapDataGrid:isWorldPositionInRange(worldX: number, worldZ: number) → boolean` | 90 |  |
