# debug/elements/DebugFunction.lua

*[English version](../../../../scripts/debug/elements/DebugFunction.md)*

Source: `dataS/scripts/debug/elements/DebugFunction.lua` — FS25 1.25.1.0

✍ DebugFunction est un élément de débogage léger qui exécute à chaque image une fonction de dessin fournie par l'utilisateur, ce qui permet d'enregistrer un rendu de débogage personnalisé auprès du DebugManager. Il n'hérite pas de DebugElement.

- **DebugFunction** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugFunction:getShouldBeDrawn() → boolean` | 58 | ✍ Renvoie toujours true, le gestionnaire appelle donc toujours `draw`. |
| `DebugFunction:draw()` | 64 | ✍ Appelle le `drawFunc` mémorisé avec l'élément en argument s'il existe ; sinon ne fait rien. |
