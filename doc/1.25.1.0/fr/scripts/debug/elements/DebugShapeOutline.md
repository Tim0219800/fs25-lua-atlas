# debug/elements/DebugShapeOutline.lua

*[English version](../../../../scripts/debug/elements/DebugShapeOutline.md)*

Source: `dataS/scripts/debug/elements/DebugShapeOutline.lua` — FS25 1.25.1.0

✍ DebugShapeOutline est un élément de débogage qui trace le contour de la forme d'un noeud, avec récursion optionnelle sur les enfants et exclusion des masqués. Le `DebugShapeOutline.render` statique est absent de ce dump (NON VÉRIFIÉ).

- **DebugShapeOutline** hérite de `DebugElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugShapeOutline:draw()` | 29 | ✍ Appelle `DebugShapeOutline.render` avec le noeud, l'indicateur récursif et l'indicateur d'exclusion des masqués. |
