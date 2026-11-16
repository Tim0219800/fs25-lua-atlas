# gui/hud/InfoDisplayBox.lua

*[English version](../../../../scripts/gui/hud/InfoDisplayBox.md)*

Source: `dataS/scripts/gui/hud/InfoDisplayBox.lua` — FS25 1.25.1.0

✍ Base abstraite d'une boîte à l'intérieur d'un InfoDisplay. Elle garde l'InfoDisplay propriétaire et l'échelle d'interface, et définit des crochets vides (delete, storeScaledValues) ainsi que canDraw et draw par défaut que des sous-classes comme InfoDisplayKeyValueBox surchargent. Côté client uniquement.

- **InfoDisplayBox** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `InfoDisplayBox.new(infoDisplay: any, uiScale: any, customMt: any)` | 16 | ✍ Crée une boîte référençant son info display et l'échelle d'interface ; une métatable optionnelle permet aux sous-classes de l'étendre. |
| `InfoDisplayBox:delete()` | 27 | ✍ Crochet vide permettant aux sous-classes de libérer leurs ressources. |
| `InfoDisplayBox:setScale(uiScale: any)` | 32 | ✍ Mémorise la nouvelle échelle d'interface et recalcule les valeurs mises à l'échelle en appelant storeScaledValues. |
| `InfoDisplayBox:storeScaledValues()` | 39 | ✍ Crochet vide, surchargé par les sous-classes pour mettre en cache les tailles mises à l'échelle. |
| `InfoDisplayBox:canDraw()` | 44 | ✍ Retourne true par défaut ; les sous-classes indiquent si la boîte a quelque chose à afficher. |
| `InfoDisplayBox:draw(posX: any, posY: any)` | 50 | ✍ Dessin par défaut qui ne rend rien et retourne la position inchangée ; les sous-classes retournent la prochaine position libre. |
