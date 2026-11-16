# gui/hud/HUDTextDisplay.lua

*[English version](../../../../scripts/gui/hud/HUDTextDisplay.md)*

Source: `dataS/scripts/gui/hud/HUDTextDisplay.lua` — FS25 1.25.1.0

✍ Élément de texte HUD sur une ligne (étend HUDDisplayElement) avec ombre optionnelle et animation tween. La taille de l'élément est recalculée d'après la largeur et la hauteur du texte à chaque appel de setText, puis il est placé à la position initiale. Le rendu utilise les fonctions RenderText, l'alpha de l'overlay étant multiplié à l'alpha du texte. Côté client uniquement.

- **HUDTextDisplay** hérite de `HUDDisplayElement` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HUDTextDisplay.new(posX: number, posY: number, textSize: number, textAlignment: integer?, textColor: table?, textBold: boolean?) → table` | 28 | ✍ Crée un affichage de texte vide avec une taille en pixels de référence, un alignement (gauche par défaut), une couleur (blanc par défaut) et un drapeau gras. Le texte doit être défini ensuite via setText, qui fixe dimensions et position. |
| `HUDTextDisplay:setText(text: string, textSize: number, textAlignment: integer, textColor: table, textBold: boolean)` | 55 | ✍ Met à jour le texte et les champs de style fournis (les autres gardent leur valeur), recalcule la taille écran, redimensionne l'élément selon le texte et le replace à la position initiale. À noter : textBold utilise 'or', donc passer false ne désactive pas le gras. |
| `HUDTextDisplay:setScale(uiScale: number)` | 75 | ✍ Applique l'échelle d'interface via la classe parente et recalcule la taille du texte à l'écran. |
| `HUDTextDisplay:setVisible(isVisible: boolean, animate: boolean)` | 85 | ✍ Définit la visibilité sans le repositionnement du parent ; avec animate à true, réinitialise l'animation en cas de masquage ou si elle tourne encore, et la démarre à l'affichage. |
| `HUDTextDisplay:setAlpha(alpha: number)` | 104 | ✍ Définit l'alpha de l'overlay, multiplié par l'alpha de la couleur du texte au moment du dessin. |
| `HUDTextDisplay:setTextColorChannels(r: number, g: number, b: number, a: number)` | 115 | ✍ Écrit en place les quatre canaux de couleur du texte, prévu pour des changements à chaque frame comme une animation. |
| `HUDTextDisplay:setTextShadow(isShadowEnabled: boolean, shadowColor: table)` | 126 | ✍ Active l'ombre portée et/ou définit sa couleur. À noter : 'isShadowEnabled or self.hasShadow' fait que passer false ne désactive jamais une ombre déjà activée. |
| `HUDTextDisplay:setAnimation(animationTween: table)` | 135 | ✍ Mémorise la position d'origine de l'élément et affecte une séquence tween (ou NO_SEQUENCE vide). Elle est jouée par setVisible avec animate à true. |
| `HUDTextDisplay:update(dt: number)` | 143 | ✍ Fait avancer l'animation via l'update parent, mais seulement tant que l'élément est visible. |
| `HUDTextDisplay:draw()` | 151 | ✍ Dessine le texte avec l'alignement, le gras et l'alignement sur la ligne de base mémorisés, précédé d'une copie d'ombre décalée selon un facteur de taille si activée. Ignoré si vide ou masqué. Réinitialise ensuite l'état du texte. |
