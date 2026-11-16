# gui/elements/TerrainLayerElement.lua

*[English version](../../../../scripts/gui/elements/TerrainLayerElement.md)*

Source: `dataS/scripts/gui/elements/TerrainLayerElement.lua` — FS25 1.25.1.0

✍ Élément GUI (dérivé de GuiElement) qui dessine la texture d'une couche de terrain sous forme d'overlay, par exemple dans un sélecteur de couches. L'overlay est créé à la demande et dessiné avec découpe des UV quand un rectangle de clipping parent est fourni. Il utilise les fonctions moteur getTerrainLayerSubLayer, setOverlayLayer, setOverlayUVs et renderOverlay, dont le comportement est NON VÉRIFIÉ ici. createOverlay et destroyOverlay ne sont pas définis dans ce fichier.

- **TerrainLayerElement** hérite de `GuiElement` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TerrainLayerElement.new(target: any, custom_mt: any)` | 20 | ✍ Constructeur. Démarre sans overlay de couche de terrain. |
| `TerrainLayerElement:delete()` | 30 | ✍ Détruit l'overlay via destroyOverlay (non défini ici, NON VÉRIFIÉ) puis supprime l'élément via la classe parente. À noter : il passe self.terrainRootNode, que setTerrainLayer ne stocke jamais. |
| `TerrainLayerElement:copyAttributes(src: any)` | 38 | ✍ Copie les attributs parents puis applique le nœud racine de terrain et la couche de la source via setTerrainLayer. |
| `TerrainLayerElement:setTerrainLayer(terrainRootNode: any, layer: any)` | 46 | ✍ Définit la couche de terrain à afficher : crée l'overlay au premier usage, le lie à la sous-couche 0 de la couche et mémorise l'indice de couche. Ne fait rien si layer est nil. À noter : le nœud racine n'est pas mémorisé. |
| `TerrainLayerElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 80 | ✍ Dessine l'overlay de la couche dans le rectangle de l'élément. Si un rectangle de clipping est donné, il réduit le rectangle et ajuste les UV en conséquence, sans dessiner si la zone visible est vide, puis dessine les enfants via la classe parente. |
| `TerrainLayerElement:canReceiveFocus()` | 133 | ✍ Retourne true seulement si l'élément est visible, a au moins un enfant et que chaque enfant peut lui-même recevoir le focus. |
| `TerrainLayerElement:getFocusTarget()` | 148 | ✍ Retourne le premier élément enfant s'il existe, sinon l'élément lui-même. |
