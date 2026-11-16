# gui/hud/HUDFrameElement.lua

*[English version](../../../../scripts/gui/hud/HUDFrameElement.md)*

Source: `dataS/scripts/gui/hud/HUDFrameElement.lua` — FS25 1.25.1.0

✍ Cadre de fond HUD composé d'un overlay de base transparent et de quatre enfants HUDElement : ligne haute, lignes gauche et droite, barre basse. L'épaisseur des lignes est arrondie au pixel écran supérieur. La barre basse devient une simple ligne de cadre avec showBar=false. Étend HUDElement ; côté client uniquement.

- **HUDFrameElement** hérite de `HUDElement` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HUDFrameElement.new(posX: number, posY: number, width: number, height: number, parent: table?, showBar: any, frameThickness: any, barThickness: any)` | 23 | ✍ Crée le cadre à la position et la taille données, éventuellement rattaché à un parent, avec visibilité de barre et épaisseurs facultatives (défauts dans HUDFrameElement.THICKNESS), puis construit les lignes. |
| `HUDFrameElement:createComponents(baseX: any, baseY: any, width: any, height: any)` | 44 | ✍ Construit les overlays haut, gauche, droit et bas comme enfants, en arrondissant l'épaisseur à au moins un pixel écran. Sans barre, le bas utilise l'épaisseur et la couleur du cadre. |
| `HUDFrameElement:setDimension(width: any, height: any)` | 100 | ✍ Surcharge HUDElement:setDimension pour redimensionner le cadre en gardant les lignes en place : haut et bas suivent la nouvelle largeur, les côtés la nouvelle hauteur moins deux épaisseurs, et les lignes haute et droite sont repositionnées. |
| `HUDFrameElement:setBottomBarHeight(height: any)` | 120 | ✍ Définit uniquement la hauteur de la barre basse. |
| `HUDFrameElement:setBottomBarColor(r: any, g: any, b: any, a: any)` | 126 | ✍ Définit la couleur de la barre basse. À noter : son commentaire de documentation répète à tort la description de la hauteur de barre. |
| `HUDFrameElement:setLeftLineVisible(visible: any)` | 132 | ✍ Affiche ou masque la ligne gauche du cadre. |
| `HUDFrameElement:setRightLineVisible(visible: any)` | 138 | ✍ Affiche ou masque la ligne droite du cadre. |
| `HUDFrameElement:setFrameColor(r: any, g: any, b: any, a: any)` | 144 | ✍ Applique une même couleur aux lignes haute, gauche et droite et à la barre basse (ce qui écrase une couleur de barre distincte). |
