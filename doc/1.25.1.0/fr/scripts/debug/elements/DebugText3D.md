# debug/elements/DebugText3D.lua

*[English version](../../../../scripts/debug/elements/DebugText3D.md)*

Source: `dataS/scripts/debug/elements/DebugText3D.lua` — FS25 1.25.1.0

✍ DebugText3D est un élément de débogage qui dessine du texte comme un objet 3D dans le monde avec une rotation donnée (via le moteur `renderText3D`), centré par défaut. Contrairement à DebugText, il n'a pas d'ombre et n'est pas projeté à l'écran.

- **DebugText3D** hérite de `DebugElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugText3D.new(customMt: table?) → DebugText3D` | 18 | ✍ Crée un élément de texte 3D avec alignement centré, alignement vertical médian et taille 0,1. |
| `DebugText3D:draw()` | 30 | ✍ Affiche le texte à la position et rotation mémorisées avec la couleur, la taille et les alignements de l'élément. |
| `DebugText3D.renderAtPosition(x: number, y: number, z: number, rx: number, ry: number, rz: number, text: string, color: table?, size: number?, alignment: integer?, verticalAlignment: integer?)` | 47 | ✍ Dessine du texte en 3D à une position monde avec rotation d'Euler (blanc, centré par défaut), puis réinitialise alignement et couleur. À noter : le commentaire de la source mentionne un alignement terrain avec Y nil, mais le code ne l'implémente pas. |
| `DebugText3D.renderAtNode(node: integer, text: string, color: table?, size: number?, alignment: integer?, verticalAlignment: integer?)` | 69 | ✍ Dessine du texte 3D à la position monde d'un noeud en utilisant sa rotation monde. |
