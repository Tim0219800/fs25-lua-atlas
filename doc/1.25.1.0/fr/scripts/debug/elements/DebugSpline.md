# debug/elements/DebugSpline.lua

*[English version](../../../../scripts/debug/elements/DebugSpline.md)*

Source: `dataS/scripts/debug/elements/DebugSpline.lua` — FS25 1.25.1.0

✍ DebugSpline est un élément de débogage pour visualiser un noeud spline, avec affichage optionnel des points d'édition et une étiquette de texte près de la position la plus proche de la caméra. `createWithNode` (utilisé par la commande de débogage des splines du DebugManager) et `DebugSpline.renderForNode` sont absents de ce dump (NON VÉRIFIÉ).

- **DebugSpline** hérite de `DebugElement` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugSpline:draw()` | 118 | ✍ Appelle `DebugSpline.renderForNode` avec le noeud spline, la couleur, le texte (ou un texte par défaut), les distances de clip, l'indicateur de points d'édition et les données mises en cache du point le plus proche de la caméra. |
