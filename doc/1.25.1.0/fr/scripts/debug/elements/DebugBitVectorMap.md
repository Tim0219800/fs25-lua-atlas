# debug/elements/DebugBitVectorMap.lua

*[English version](../../../../scripts/debug/elements/DebugBitVectorMap.md)*

Source: `dataS/scripts/debug/elements/DebugBitVectorMap.lua` — FS25 1.25.1.0

✍ DebugBitVectorMap dessine sur le terrain une grille de petites cellules colorées autour d'un centre, chaque couleur venant d'une valeur renvoyée par une fonction de contrôle (palette par défaut : 0 rouge, 1 vert, 2 bleu, indéfini gris foncé ; rayon 15, taille de cellule 0,5, légende optionnelle). Ce n'est pas une sous-classe de DebugElement ; elle a son propre `draw`. La routine de grille `drawAroundCenter` n'est pas dans ce dump (NON VÉRIFIÉ).

- **DebugBitVectorMap** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugBitVectorMap.new(customMt: table?) → DebugBitVectorMap` | 18 | ✍ Crée l'objet de grille avec rayon, taille de cellule, opacité, table valeur-couleur, couleur de valeur indéfinie, décalage Y, facteur de marge et légende activée par défaut. |
| `DebugBitVectorMap:draw()` | 71 | ✍ Dessine la grille centrée sur le noeud racine du véhicule IA (ignoré s'il est supprimé ou en cours de suppression) avec `aiAreaCheck`, sinon centrée sur la caméra active avec la fonction personnalisée. Ne fait rien si aucun des deux n'est défini. |
| `DebugBitVectorMap:createWithAIVehicle(vehicle: table) → DebugBitVectorMap` | 87 | ✍ Lie la grille à un véhicule IA pour que les valeurs des cellules viennent du contrôle de zone de travail IA du véhicule. Renvoie self pour le chaînage. |
| `DebugBitVectorMap:createWithCustomFunc(customFunc: function) → DebugBitVectorMap` | 97 | ✍ Définit une fonction personnalisée fournissant la valeur de chaque zone ; la grille est alors dessinée autour de la caméra active. Renvoie self. |
| `DebugBitVectorMap:setAdditionalDrawInfoFunc(drawInfoFunc: function) → DebugBitVectorMap` | 107 | ✍ Mémorise une fonction pour un dessin ou des informations supplémentaires ; comment et quand elle est appelée dépend d'un code absent de ce dump (NON VÉRIFIÉ). Renvoie self. |
| `DebugBitVectorMap:aiAreaCheck(startWorldX: any, startWorldZ: any, widthWorldX: any, widthWorldZ: any, heightWorldX: any, heightWorldZ: any)` | 179 | ✍ Renvoie le résultat de `AIVehicleUtil.getAIAreaOfVehicle` pour le véhicule IA mémorisé sur le parallélogramme donné en coordonnées monde XZ (coins start, width, height). |
