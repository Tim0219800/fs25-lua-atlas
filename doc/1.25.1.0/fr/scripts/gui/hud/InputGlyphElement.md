# gui/hud/InputGlyphElement.lua

*[English version](../../../../scripts/gui/hud/InputGlyphElement.md)*

Source: `dataS/scripts/gui/hud/InputGlyphElement.lua` — FS25 1.25.1.0

✍ Élément HUD (étend HUDElement) qui affiche les touches clavier ou glyphes de manette liés à une ou deux actions de saisie, éventuellement suivis d'un texte d'action. Il demande les overlays de symboles à g_inputDisplayManager, dispose les combinaisons avec des séparateurs plus ou ou, et se rafraîchit sur le message INPUT_DEVICES_CHANGED. Côté client uniquement. onInputDevicesChanged, getPositionOffset et getDrawSeparator sont utilisés mais non définis dans ce fichier (NON VÉRIFIÉ pour leur emplacement).

- **InputGlyphElement** hérite de `HUDElement` (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `InputGlyphElement.new(inputDisplayManager: table, baseWidth: number, baseHeight: number, customMt: any)` | 28 | ✍ Crée le glyphe avec une taille de base, une liste d'actions vide, les overlays plus/ou du gestionnaire d'affichage de saisie et un ButtonOverlay clavier, puis s'abonne à INPUT_DEVICES_CHANGED. Appeler delete pour se désabonner. |
| `InputGlyphElement:delete()` | 78 | ✍ Supprime l'overlay clavier, se désabonne de tous les événements du message center et exécute le delete du parent. |
| `InputGlyphElement:setScale(widthScale: number, heightScale: number)` | 93 | ✍ Applique l'échelle en largeur/hauteur via le parent, puis recalcule les décalages de glyphe et de texte ainsi que les tailles d'icône, plus et ou à partir de la taille de base. |
| `InputGlyphElement:setUpperCase(enableUpperCase: any)` | 107 | ✍ Active ou désactive la mise en majuscules du texte d'action (ce qui annule les minuscules) et rafraîchit le texte affiché. |
| `InputGlyphElement:setLowerCase(enableLowerCase: any)` | 116 | ✍ Active ou désactive la mise en minuscules du texte d'action (ce qui annule les majuscules) et rafraîchit le texte affiché. |
| `InputGlyphElement:setBold(isBold: any)` | 124 | ✍ Définit si le texte d'action est rendu en gras. |
| `InputGlyphElement:setKeyboardGlyphColor(color: table, bgColor: any)` | 131 | ✍ Mémorise la couleur principale (aussi utilisée pour le texte d'action) et l'applique, avec une couleur de fond optionnelle, à l'overlay des touches clavier. |
| `InputGlyphElement:setButtonGlyphColor(color: table)` | 148 | ✍ Mémorise la couleur utilisée pour les glyphes de manette et l'applique aux overlays de boutons déjà résolus des actions courantes. |
| `InputGlyphElement:setAction(actionName: string, actionText: string?, actionTextSize: number?, noModifiers: boolean?)` | 171 | ✍ Raccourci pour une action unique : remplace la liste d'actions par celle-ci et appelle setActions avec les mêmes options de texte. |
| `InputGlyphElement:setActions(actionNames: table, actionText: string?, actionTextSize: number?, noModifiers: boolean?, customBinding: any)` | 186 | ✍ Résout les overlays de symboles et noms de touches des actions données (au plus une paire combinée) via le gestionnaire d'affichage de saisie, puis fixe la largeur de l'élément d'après les glyphes en conservant la hauteur. Mémorise le texte d'action et sa taille optionnels. |
| `InputGlyphElement:updateDisplayText()` | 270 | ✍ Dérive le texte affiché à partir du texte d'action, en majuscules ou minuscules selon les drapeaux, lorsqu'un texte d'action existe. |
| `InputGlyphElement:getGlyphWidth()` | 283 | ✍ Calcule la largeur totale des glyphes actuellement résolus (icônes de manette avec séparateurs, ou touches clavier), sans le texte d'action. |
| `InputGlyphElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 332 | ✍ Dessine les glyphes (boutons de manette ou touches clavier) alignés à droite dans l'élément sauf alignement à gauche, puis le texte d'action s'il existe. Ne fait rien sans actions ou si l'overlay est masqué. |
| `InputGlyphElement:drawControllerButtons(buttonOverlays: table, posX: number, posY: number, clipX1: any, clipY1: any, clipX2: any, clipY2: any) → number` | 381 | ✍ Rend chaque overlay de bouton de manette dans l'ordre, en insérant des icônes de séparation plus ou ou entre eux, et retourne la position X après le dernier. |
| `InputGlyphElement:drawActionText(posX: number, posY: number, clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 419 | ✍ Rend le texte d'action après les glyphes avec la taille, le gras et la couleur mémorisés, avec une zone de clipping de texte optionnelle réinitialisée ensuite. |

## Messages

- s'abonne à `MessageType.INPUT_DEVICES_CHANGED` (l.71)
