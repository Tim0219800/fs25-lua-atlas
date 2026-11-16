# debug/elements/DebugGizmo.lua

*[English version](../../../../scripts/debug/elements/DebugGizmo.md)*

Source: `dataS/scripts/debug/elements/DebugGizmo.lua` — FS25 1.25.1.0

✍ DebugGizmo est un élément de débogage qui dessine un repère d'axes (position, direction, haut) avec texte optionnel, dérivé de DebugElement. Le rendu statique `DebugGizmo.renderAtPosition` est absent de ce dump (NON VÉRIFIÉ).

- **DebugGizmo** hérite de `DebugElement` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugGizmo:getShouldBeDrawn() → boolean` | 52 | ✍ Redéfinition qui masque le repère lorsqu'une interface est visible (si le masquage est actif) ou au-delà de la distance de clip de la caméra, testée avec `DebugUtil.isPositionInCameraRange`. Contrairement à la classe de base, elle ignore l'indicateur de visibilité. |
| `DebugGizmo:draw()` | 66 | ✍ Transmet position, direction, haut, texte, option solide, échelle, taille et couleur du texte et décalages du texte à `DebugGizmo.renderAtPosition`. |
