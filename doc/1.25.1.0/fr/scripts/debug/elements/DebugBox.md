# debug/elements/DebugBox.lua

*[English version](../../../../scripts/debug/elements/DebugBox.md)*

Source: `dataS/scripts/debug/elements/DebugBox.lua` — FS25 1.25.1.0

✍ DebugBox est un élément de débogage pour une boîte filaire ou à faces remplies, dérivé de DebugElement. Dans ce dump, seuls deux setters sont présents ; le code de position, d'orientation et de dessin, dont `calculateCornerPositions`, est absent (NON VÉRIFIÉ).

- **DebugBox** hérite de `DebugElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugBox:setSize(sizeX: number, sizeY: number, sizeZ: number) → DebugBox` | 479 | ✍ Met à jour la taille de la boîte (un argument nil conserve la valeur actuelle) et recalcule les positions des coins via `DebugBox.calculateCornerPositions`, absent de ce dump. Renvoie self. |
| `DebugBox:setDrawFaces(drawFaces: boolean) → DebugBox` | 498 | ✍ Définit si les faces de la boîte sont dessinées en plus de ses arêtes. Renvoie self. |
