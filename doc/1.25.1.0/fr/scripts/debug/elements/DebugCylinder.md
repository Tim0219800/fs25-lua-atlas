# debug/elements/DebugCylinder.lua

*[English version](../../../../scripts/debug/elements/DebugCylinder.md)*

Source: `dataS/scripts/debug/elements/DebugCylinder.lua` — FS25 1.25.1.0

✍ DebugCylinder est un élément de débogage pour un cylindre, dérivé de DebugElement. Seul `draw` est présent ; `DebugCylinder.renderAtPosition` est absent de ce dump (NON VÉRIFIÉ).

- **DebugCylinder** hérite de `DebugElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugCylinder:draw()` | 37 | ✍ Transmet position, rayon, hauteur, axe, couleur, nombre de segments, option solide, alignement au sol et texte à `DebugCylinder.renderAtPosition`. |
