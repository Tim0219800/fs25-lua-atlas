# debug/elements/DebugInfoTable.lua

*[English version](../../../../scripts/debug/elements/DebugInfoTable.md)*

Source: `dataS/scripts/debug/elements/DebugInfoTable.lua` — FS25 1.25.1.0

✍ DebugInfoTable affiche un tableau d'informations titré (noms/valeurs) sous forme de texte 3D dans le monde, face à la caméra par défaut. Dérivé de DebugElement, mais seule cette fonction statique est présente ici.

- **DebugInfoTable** hérite de `DebugElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugInfoTable.renderAtPosition(x: number, y: number, z: number, information: array, rx: number?, ry: number?, rz: number?, size: number?, color: table?)` | 46 | ✍ Affiche des groupes de lignes ({title, content={{name, value, color?, sizeFactor?}}}) en texte 3D empilé vers le haut depuis une position monde, dernier groupe en premier, avec noms alignés à droite, nombres à 4 décimales et titres gras centrés. Sans rotation, il fait face à la caméra via `DebugUtil.getYRotatationToCamera` (absent de ce dump). |
