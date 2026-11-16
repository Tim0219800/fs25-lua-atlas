# debug/elements/DebugPolygon.lua

*[English version](../../../../scripts/debug/elements/DebugPolygon.md)*

Source: `dataS/scripts/debug/elements/DebugPolygon.lua` — FS25 1.25.1.0

✍ DebugPolygon est un élément de débogage qui dessine un polygone à partir d'une liste plate de coordonnées de sommets, avec contour optionnel. Il enveloppe la fonction moteur `drawDebugPolygon` (comportement NON VÉRIFIÉ, côté moteur).

- **DebugPolygon** hérite de `DebugElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugPolygon:draw()` | 29 | ✍ Appelle `DebugPolygon.renderWithPositions` avec les positions mémorisées, la couleur, l'option solide et l'option de contour. |
| `DebugPolygon.renderWithPositions(positions: array, color: table?, solid: boolean?, drawContour: any)` | 38 | ✍ Dessine un polygone à partir de sommets donnés sous la forme x1,y1,z1,x2,y2,z2,... (blanc par défaut) avec `drawDebugPolygon` ; si `drawContour` est actif, il dessine aussi les arêtes, y compris l'arête de fermeture vers le premier sommet. |
