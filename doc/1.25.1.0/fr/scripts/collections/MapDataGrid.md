# collections/MapDataGrid.lua

*[English version](../../../scripts/collections/MapDataGrid.md)*

Source: `dataS/scripts/collections/MapDataGrid.lua` — FS25 1.25.1.0

✍ Sous-classe de DataGrid qui divise une carte carrée, centrée sur l'origine du monde, en un nombre égal de blocs par ligne et par colonne, afin de lire et écrire des valeurs par position monde X/Z. Les positions hors de la carte sont ramenées aux blocs de bord lors du calcul de la ligne et de la colonne.

- **MapDataGrid** hérite de `DataGrid` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `MapDataGrid.new(mapSize: integer, blocksPerRowColumn: integer, customMt: table?) → table` | 21 | ✍ Crée une grille carrée de blocksPerRowColumn par blocksPerRowColumn blocs couvrant une carte de taille mapSize, et mémorise blockSize = mapSize / blocksPerRowColumn. |
| `MapDataGrid.createFromBlockSize(mapSize: integer, blockSize: integer, customMt: table?) → MapDataGrid` | 37 | ✍ Crée une grille à partir d'une taille de carte et d'une taille de bloc souhaitée en mètres, avec ceil(mapSize / blockSize) blocs par côté ; la taille réelle d'un bloc peut donc être légèrement plus petite. |
| `MapDataGrid:getValueAtWorldPos(worldX: number, worldZ: number) → table` | 49 | ✍ Retourne la valeur stockée dans le bloc contenant un X/Z monde, suivie de la ligne et de la colonne utilisées. |
| `MapDataGrid:setValueAtWorldPos(worldX: number, worldZ: number, value: table)` | 59 | ✍ Stocke une valeur dans le bloc contenant un X/Z monde. Les positions hors de la carte écrivent dans le bloc de bord le plus proche. |
| `MapDataGrid:getRowColumnFromWorldPos(worldX: number, worldZ: number) → integer, integer` | 70 | ✍ Convertit un X/Z monde en ligne (depuis Z) et colonne (depuis X) base un, bornées à la grille, avec la carte centrée sur l'origine. |
| `MapDataGrid:isWorldPositionInRange(worldX: number, worldZ: number) → boolean` | 90 | ✍ Retourne true si le X/Z monde se trouve dans le carré de la carte ; le bord inférieur est exclu et le bord supérieur inclus. |
