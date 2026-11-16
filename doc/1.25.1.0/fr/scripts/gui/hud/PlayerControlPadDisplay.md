# gui/hud/PlayerControlPadDisplay.lua

*[English version](../../../../scripts/gui/hud/PlayerControlPadDisplay.md)*

Source: `dataS/scripts/gui/hud/PlayerControlPadDisplay.lua` — FS25 1.25.1.0

✍ Pavé joystick tactile pour le déplacement à pied dans l'interface mobile (étend HUDDisplayElement). Il combine un fond, un bouton de joystick et deux HUDSliderElement (axes X et Y) ; la position normalisée du stick est envoyée à chaque update au joueur via onInputMoveSide et onInputMoveForward. La visibilité suit le mode d'aide à la saisie et la possibilité de se déplacer. Côté client uniquement.

- **PlayerControlPadDisplay** hérite de `HUDDisplayElement` (l.26)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerControlPadDisplay.new(hud: string, hudAtlasPath: string)` | 31 | ✍ Crée le pavé avec sa référence au HUD et le chemin de l'atlas, une position de stick centrée et le mode d'aide clavier comme état initial, puis construit ses composants. |
| `PlayerControlPadDisplay:setPlayer(player: any)` | 53 | ✍ Affecte le joueur qui reçoit la saisie de déplacement et rafraîchit la visibilité. |
| `PlayerControlPadDisplay:createComponents()` | 61 | ✍ Construit les éléments de fond et de bouton et deux HUDSliderElement (un par axe) avec callbacks vers onSliderPositionChangedX/Y, puis centre les deux curseurs. |
| `PlayerControlPadDisplay:setVisible(isVisible: boolean, animate: boolean)` | 128 | ✍ Le masquage fonctionne toujours ; l'affichage est ignoré tant que le mode d'aide est manette. Sinon délègue au setVisible du parent. |
| `PlayerControlPadDisplay:onSliderPositionChangedX(position: any)` | 136 | ✍ Callback du curseur de l'axe X : convertit la position 0..1 en -1..1, limite le stick au cercle unité et déplace le bouton horizontalement. Retourne la position corrigée si limitée (nil sinon). |
| `PlayerControlPadDisplay:onSliderPositionChangedY(position: any)` | 148 | ✍ Callback du curseur de l'axe Y : convertit la position 0..1 en -1..1 et limite le stick au cercle unité, en retournant le Y corrigé s'il y a eu limitation. |
| `PlayerControlPadDisplay:updateJoystickPosition()` | 158 | ✍ Si le vecteur du stick dépasse la longueur 1, le normalise et déplace les deux curseurs à la position limitée, en retournant les nouvelles translations X et Y ; sinon retourne nil. |
| `PlayerControlPadDisplay:onInputHelpModeChange(inputHelpMode: any)` | 178 | ✍ Mémorise le nouveau mode d'aide à la saisie et rafraîchit la visibilité. |
| `PlayerControlPadDisplay:updateVisibilityState()` | 186 | ✍ Affiche ou masque le pavé avec animation quand l'état voulu diffère de l'actuel, et active ou désactive la gestion tactile des curseurs. Utilise getIsPlayerMoveActive et animationState, définis ailleurs (NON VÉRIFIÉ). |
| `PlayerControlPadDisplay:update(dt: any)` | 202 | ✍ Met à jour l'animation, synchronise le bouton avec les curseurs et, si un joueur est défini, met à jour les curseurs et envoie les valeurs du stick à onInputMoveSide et onInputMoveForward (Y inversé). À noter : canControl vaut true en dur, donc les UV désactivés ne sont jamais utilisés. |
| `PlayerControlPadDisplay:onAnimateVisibilityFinished(isVisible: any)` | 233 | ✍ Exécute le gestionnaire du parent et, quand le pavé est devenu visible, réinitialise les deux curseurs. |
| `PlayerControlPadDisplay:setScale(uiScale: any)` | 264 | ✍ Applique l'échelle d'interface, repositionne le pavé à sa position de fond mise à l'échelle, conserve la visibilité actuelle, rafraîchit l'état de visibilité et recalcule les translations des curseurs. |
| `PlayerControlPadDisplay.getBackgroundPosition(scale: scale, width: number) → number, number` | 286 | ✍ Retourne le décalage de fond configuré multiplié par l'échelle ; l'argument de largeur n'est pas utilisé. |
| `PlayerControlPadDisplay.createBackground()` | 297 | ✍ Crée un overlay sans image à la position de base avec la taille de fond configurée, utilisé uniquement comme cadre de positionnement. |
