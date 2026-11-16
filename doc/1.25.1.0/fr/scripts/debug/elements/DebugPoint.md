# debug/elements/DebugPoint.lua

*[English version](../../../../scripts/debug/elements/DebugPoint.md)*

Source: `dataS/scripts/debug/elements/DebugPoint.lua` — FS25 1.25.1.0

✍ DebugPoint est un élément de débogage qui dessine un point unique avec texte optionnel à une position monde, dérivé de DebugElement. `DebugPoint.renderAtPosition` est absent de ce dump (NON VÉRIFIÉ).

- **DebugPoint** hérite de `DebugElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugPoint.new(customMt: table?) → DebugPoint` | 18 | ✍ Crée un élément point, non solide, non aligné au sol et sans texte. |
| `DebugPoint:draw()` | 32 | ✍ Appelle `DebugPoint.renderAtPosition` avec la position, la couleur, l'option solide, le texte, sa taille et les distances de clip. |
