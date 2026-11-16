# debug/elements/DebugPlane.lua

*[English version](../../../../scripts/debug/elements/DebugPlane.md)*

Source: `dataS/scripts/debug/elements/DebugPlane.lua` — FS25 1.25.1.0

✍ DebugPlane est un élément de débogage qui dessine un quadrilatère à partir de quatre positions de coins, avec alignement terrain, remplissage, double face ou option solide. Le rendu `DebugPlane.renderWithPositions` et `createWithPositions` sont absents de ce dump (NON VÉRIFIÉ).

- **DebugPlane** hérite de `DebugElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugPlane:draw()` | 90 | ✍ Appelle `DebugPlane.renderWithPositions` avec les positions de coins mémorisées et les options d'affichage (les arguments de coordonnées explicites sont passés à nil). |
| `DebugPlane:createWithNodes(startNode: integer, widthNode: integer, heightNode: integer) → DebugPlane` | 179 | ✍ Construit le plan à partir des positions monde d'un noeud de départ et de noeuds de largeur et de hauteur, en déléguant à `createWithPositions` (absent de ce dump). Renvoie self. |
| `DebugPlane:createWithNode(node: integer, sizeX: number, sizeZ: number) → DebugPlane` | 372 | ✍ Construit un rectangle horizontal de taille X et Z données, centré sur un noeud, et mémorise ses quatre coins en espace monde (calculés une fois, non mis à jour si le noeud bouge). Renvoie self. |
