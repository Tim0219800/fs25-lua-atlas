# debug/elements/DebugCircle.lua

*[English version](../../../../scripts/debug/elements/DebugCircle.md)*

Source: `dataS/scripts/debug/elements/DebugCircle.lua` — FS25 1.25.1.0

✍ DebugCircle est un élément de débogage pour un cercle horizontal, dérivé de DebugElement. Seul `draw` est présent ; le rendu statique `DebugCircle.renderAtPosition` est absent de ce dump (NON VÉRIFIÉ).

- **DebugCircle** hérite de `DebugElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugCircle:draw()` | 32 | ✍ Transmet position, rayon, couleur, nombre de segments, options solide, rempli, secteurs et texte à `DebugCircle.renderAtPosition` ; Y est passé à nil (alignement au sol) si `alignToGround` est actif. |
