# debug/elements/DebugPath.lua

*[English version](../../../../scripts/debug/elements/DebugPath.md)*

Source: `dataS/scripts/debug/elements/DebugPath.lua` — FS25 1.25.1.0

✍ DebugPath est un élément de débogage qui dessine une polyligne passant par une liste de points, éventuellement à une hauteur imposée ou alignée au sol. Il gère son propre clipping, et la fonction de rendu `DebugPath.renderPath` est absente de ce dump (NON VÉRIFIÉ).

- **DebugPath** hérite de `DebugElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugPath.new(customMt: table?) → DebugPath` | 18 | ✍ Crée un élément de chemin avec une liste de points vide, sans alignement au sol, dessin solide et sans espacement minimal entre points. |
| `DebugPath:getShouldBeDrawn() → boolean` | 54 | ✍ Renvoie toujours true car le chemin applique lui-même sa distance de clip pendant le rendu, ce qui contourne les contrôles de la classe de base (indicateur de visibilité et masquage de l'interface). |
| `DebugPath:draw()` | 61 | ✍ Appelle `DebugPath.renderPath` avec les points, la couleur, l'alignement au sol, le Y imposé, l'option solide, la distance de clip et le texte. |
| `DebugPath:clear() → DebugPath` | 161 | ✍ Remplace la liste de points par une table vide. Renvoie self. |
| `DebugPath:setForcedY(forcedY: number) → DebugPath` | 171 | ✍ Définit un Y monde fixe pour dessiner le chemin ; passer nil le retire. Renvoie self. |
