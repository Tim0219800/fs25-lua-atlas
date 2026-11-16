# collections/DataGrid.lua

*[English version](../../../scripts/collections/DataGrid.md)*

Source: `dataS/scripts/collections/DataGrid.lua` — FS25 1.25.1.0

✍ Grille bidimensionnelle simple de taille fixe, stockée sous forme de table de lignes, avec accès base un contrôlé par ligne et colonne. Un accès hors limites logue une erreur et une pile d'appels au lieu de lever une exception.

- **DataGrid** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DataGrid.new(numRows: integer, numColumns: integer, customMt: table?) → table` | 20 | ✍ Crée une grille avec le nombre de lignes et de colonnes donné, avec une table vide par ligne. Les cellules commencent à nil. |
| `DataGrid:delete()` | 35 | ✍ Libère la grille en abandonnant la référence à ses tables de lignes. Les valeurs stockées ne sont pas supprimées individuellement. |
| `DataGrid:getValue(rowIndex: integer, colIndex: integer) → table` | 44 | ✍ Retourne la valeur à une ligne et colonne (base un). Des indices hors limites logent une erreur avec pile d'appels et retournent nil. |
| `DataGrid:setValue(rowIndex: integer, colIndex: integer, value: table)` | 64 | ✍ Stocke une valeur à une ligne et colonne (base un). Retourne true en cas de succès, ou false après avoir logué une erreur et une pile d'appels si un indice est hors limites. |
