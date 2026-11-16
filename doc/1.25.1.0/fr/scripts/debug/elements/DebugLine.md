# debug/elements/DebugLine.lua

*[English version](../../../../scripts/debug/elements/DebugLine.md)*

Source: `dataS/scripts/debug/elements/DebugLine.lua` — FS25 1.25.1.0

✍ DebugLine est un élément de débogage qui dessine une ligne entre deux positions monde ou entre deux noeuds suivis à chaque image, avec couleurs de départ/fin, texte et alignement terrain optionnels. Le rendu statique `DebugLine.renderBetweenPositions` est absent de ce dump (NON VÉRIFIÉ).

- **DebugLine** hérite de `DebugElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugLine.new(customMt: table?) → DebugLine` | 18 | ✍ Crée un élément ligne avec les réglages par défaut : non solide, sans couleurs de départ/fin, sans alignement au sol et sans noeuds. |
| `DebugLine:draw()` | 34 | ✍ Si les deux noeuds sont définis et existent encore, met à jour les extrémités depuis leurs positions monde, puis appelle `DebugLine.renderBetweenPositions` avec les réglages de la ligne. |
