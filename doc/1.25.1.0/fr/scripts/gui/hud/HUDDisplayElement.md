# gui/hud/HUDDisplayElement.lua

*[English version](../../../../scripts/gui/hud/HUDDisplayElement.md)*

Source: `dataS/scripts/gui/hud/HUDDisplayElement.lua` — FS25 1.25.1.0

✍ Classe de base des grands blocs d'affichage du HUD, dérivée de HUDElement. Elle ajoute une position d'origine mémorisée et des animations de glissement optionnelles (séquence de tweens) pour afficher ou masquer l'élément par translation, par défaut d'un demi-écran vers le bas. Les sous-classes peuvent surcharger getHidingTranslation.

- **HUDDisplayElement** hérite de `HUDElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HUDDisplayElement.new(overlay: table, parentHudElement: table?, customMt: table?) → table` | 23 | ✍ Constructeur prenant l'overlay, un élément HUD parent optionnel et une métatable optionnelle ; initialise la position d'origine à 0,0 et aucun état d'animation. |
| `HUDDisplayElement:setVisible(isVisible: boolean, animate: boolean)` | 36 | ✍ Définit la visibilité. Avec animate à true et sans animation en cours, joue le glissement d'affichage/masquage ; sinon arrête toute animation et applique le changement immédiatement, en plaçant l'élément à sa position d'origine ou à son décalage masqué. |
| `HUDDisplayElement:setScale(uiScale: any)` | 61 | ✍ Définit une échelle uniforme en passant la même valeur aux deux axes du parent. |
| `HUDDisplayElement:storeOriginalPosition()` | 67 | ✍ Mémorise la position actuelle comme position d'origine (visible) utilisée par les animations. |
| `HUDDisplayElement:getHidingTranslation() → number, number` | 76 | ✍ Renvoie la translation en espace écran appliquée au masquage : 0 en horizontal et -0,5 en vertical par défaut. À surcharger dans les sous-classes. |
| `HUDDisplayElement:animationSetPositionX(x: any)` | 82 | ✍ Fonction d'affectation pour tween qui ne change que la position X. |
| `HUDDisplayElement:animationSetPositionY(y: any)` | 88 | ✍ Fonction d'affectation pour tween qui ne change que la position Y. |
| `HUDDisplayElement:animateHide()` | 94 | ✍ Lance une séquence de tweens déplaçant l'élément de la translation de masquage pendant HUDDisplayElement.MOVE_ANIMATION_DURATION ; à la fin, l'élément est réellement masqué. |
| `HUDDisplayElement:animateShow()` | 107 | ✍ Rend l'élément visible et lance une séquence de tweens le ramenant à sa position d'origine pendant MOVE_ANIMATION_DURATION. |
| `HUDDisplayElement:onAnimateVisibilityFinished(isVisible: any)` | 121 | ✍ Callback de fin d'animation : après un masquage, applique l'état masqué ; rien à faire après un affichage. |
