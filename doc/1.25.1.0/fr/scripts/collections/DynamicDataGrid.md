# collections/DynamicDataGrid.lua

*[English version](../../../scripts/collections/DynamicDataGrid.md)*

Source: `dataS/scripts/collections/DynamicDataGrid.lua` — FS25 1.25.1.0

✍ Grille carrée de cellules centrée sur une position monde déplaçable, avec des cellules de tileSize unités monde alignées sur un réseau ancré dans le monde. Les cellules sont créées une fois, éventuellement par un constructeur recevant leurs X et Z monde. Dans ce dump le fichier s'arrête après getGridIndicesByWorldPosition et appelle getWorldIndicesByWorldPosition et getGridSnappedPositionByLocalIndices, qui n'y sont pas définies (origine NON VÉRIFIÉE). Le champ lastPosition n'est défini ici qu'à la construction.

- **DynamicDataGrid** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DynamicDataGrid.new(size: any, tileSize: any, startX: any, startZ: any, cellConstructor: any, customMt: any)` | 15 | ✍ Construit la grille : rowColumnCount = ceil(size / tileSize), avec des indices locaux répartis autour d'une cellule centrale. Les X/Z de départ optionnels fixent la position initiale et cellConstructor(worldX, worldZ) crée chaque cellule, sinon des tables vides. Les assertions de débogage ne vérifient les arguments qu'en build debug. |
| `DynamicDataGrid:delete()` | 97 | ✍ Appelle delete sur chaque cellule qui possède cette méthode, puis abandonne la table de la grille. |
| `DynamicDataGrid:getCellFromWorldPosition(worldX: number, worldZ: number, clamp: boolean) → table` | 189 | ✍ Retourne la cellule couvrant une position monde X/Z, ou nil si elle est hors de la grille. Avec clamp à true, les indices locaux sont bornés aux bords de la grille de sorte qu'une cellule est toujours retournée. |
| `DynamicDataGrid:getWorldPositionByLocalIndices(localIndexX: number, localIndexZ: number) → number, number` | 219 | ✍ Retourne les X/Z monde du centre de la cellule à un décalage local (0,0 = cellule centrale) par rapport à la dernière position de la grille. Dépend d'assistants non définis dans ce fichier (NON VÉRIFIÉ). |
| `DynamicDataGrid:getLocalIndicesByWorldPosition(worldX: number, worldZ: number) → number, number` | 233 | ✍ Convertit un X/Z monde en indices de cellule locaux relatifs à la dernière position de la grille, où 0,0 est la cellule centrale. Dépend de getWorldIndicesByWorldPosition, non définie ici (NON VÉRIFIÉ). |
| `DynamicDataGrid:getGridSnappedPosition(x: number, z: number) → number, number` | 255 | ✍ Aligne une position X/Z sur le centre de sa cellule de tileSize : arrondi inférieur au multiple de la taille, puis ajout d'une demi-cellule. |
| `DynamicDataGrid:getGridIndicesByWorldPosition(worldX: number, worldZ: number) → number, number` | 273 | ✍ Retourne les indices base un dans le tableau 2D sous-jacent pour une position monde, c'est-à-dire l'indice local décalé de l'indice central. Le résultat peut sortir de 1..rowColumnCount pour des positions au-delà de la grille. |
