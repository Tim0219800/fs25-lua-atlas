# debug/elements/DebugText.lua

*[English version](../../../../scripts/debug/elements/DebugText.md)*

Source: `dataS/scripts/debug/elements/DebugText.lua` — FS25 1.25.1.0

✍ DebugText est un élément de débogage qui dessine du texte 2D à l'écran à la position projetée d'un point monde ou d'un noeud, avec une ombre noire, centré par défaut. Les aides statiques s'utilisent sans créer d'élément.

- **DebugText** hérite de `DebugElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugText.new(customMt: table?) → DebugText` | 18 | ✍ Crée un élément texte avec alignement centré, alignement vertical médian, taille 0,1, sans décalage écran ni noeud. |
| `DebugText:draw()` | 33 | ✍ Si un noeud est défini et existe, met à jour la position depuis lui, puis affiche le texte à cette position monde projetée. |
| `DebugText.renderAtPosition(x: number, y: number, z: number, text: string, color: table?, size: number?, screenSpaceYOffset: number?, alignment: integer?, verticalAlignment: integer?)` | 52 | ✍ Projette une position monde à l'écran et y dessine du texte ; un Y nil le place 0,01 m au-dessus du terrain, et rien n'est dessiné si le point est au-delà du plan lointain (z > 1) ou s'il n'y a pas de terrain. |
| `DebugText.renderAtScreenPosition(x: number, y: number, text: string, color: table?, size: number?, yOffset: number?, alignment: integer?, verticalAlignment: integer?)` | 80 | ✍ Dessine du texte aux coordonnées écran normalisées (taille 0,02 par défaut) avec une ombre noire, après des tests de limites, puis réinitialise alignement et couleur du texte. Renvoie le Y pour une ligne suivante, ou rien si le texte est hors écran. |
| `DebugText.renderAtNode(node: integer, text: string, color: table?, size: number?, alignment: integer?, verticalAlignment: integer?)` | 124 | ✍ Dessine du texte à la projection écran de la position monde d'un noeud, sans décalage Y supplémentaire. |
