# debug/elements/DebugDensityMap.lua

*[English version](../../../../scripts/debug/elements/DebugDensityMap.md)*

Source: `dataS/scripts/debug/elements/DebugDensityMap.lua` — FS25 1.25.1.0

✍ DebugDensityMap est un élément de débogage qui visualise les valeurs d'une density map sous forme de cellules colorées et numérotées sur le terrain autour de la caméra ou d'un centre choisi, avec une légende de couleurs à l'écran. Il dépend de champs définis ailleurs (`modifier`, `filter`, `numChannels`, `pixelValueToColor`, résolution, rayon) et de `drawDebugAreaRectangleFilled`, aucun n'étant défini dans ce dump.

- **DebugDensityMap** hérite de `DebugElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugDensityMap:draw()` | 65 | ✍ Échantillonne la density map cellule par cellule sur une grille alignée sur la résolution, trouve la première valeur (0 à 2^numChannels-1) présente dans chaque cellule, la remplit avec la couleur de cette valeur et y affiche la valeur. Elle dessine ensuite une légende de couleurs à gauche de l'écran. Coûteux : une requête du modifier par valeur et par cellule. |
