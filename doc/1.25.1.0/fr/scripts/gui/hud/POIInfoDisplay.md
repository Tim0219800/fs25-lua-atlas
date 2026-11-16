# gui/hud/POIInfoDisplay.lua

*[English version](../../../../scripts/gui/hud/POIInfoDisplay.md)*

Source: `dataS/scripts/gui/hud/POIInfoDisplay.lua` — FS25 1.25.1.0

✍ Petite étiquette HUD dans le coin supérieur gauche (étend HUDDisplayElement) qui affiche une ligne de texte, utilisée pour des infos de points d'intérêt. Elle dessine un fond arrondi dimensionné à la largeur du texte plus des marges. text, les décalages et applyValues sont définis ailleurs (NON VÉRIFIÉ). Côté client uniquement.

- **POIInfoDisplay** hérite de `HUDDisplayElement` (l.22)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `POIInfoDisplay:draw()` | 47 | ✍ Dessine un rectangle plein arrondi ajusté à la largeur du texte plus les marges gauche/droite, puis le texte, puis le draw du parent. Ne fait rien si le texte est vide. |
| `POIInfoDisplay:setScale(uiScale: number)` | 76 | ✍ Applique l'échelle via le parent, repositionne à la position de fond mise à l'échelle et appelle applyValues avec l'échelle. |
| `POIInfoDisplay.getBackgroundPosition(uiScale: any)` | 107 | ✍ Retourne la position de base : décalage X configuré multiplié par l'échelle, et Y mesuré depuis le haut de l'écran moins la hauteur mise à l'échelle. |
| `POIInfoDisplay.createBackground()` | 118 | ✍ Crée un overlay sans image avec la position de base et la taille configurée, servant de cadre de positionnement. |
