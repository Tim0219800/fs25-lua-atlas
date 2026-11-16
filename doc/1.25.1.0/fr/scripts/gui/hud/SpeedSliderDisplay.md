# gui/hud/SpeedSliderDisplay.lua

*[English version](../../../../scripts/gui/hud/SpeedSliderDisplay.md)*

Source: `dataS/scripts/gui/hud/SpeedSliderDisplay.lua` — FS25 1.25.1.0

✍ Élément HUD tactile/mobile (sous-classe de HUDDisplayElement) avec un curseur vertical accélérateur/frein pour les véhicules, un curseur d'allures pour les montures (chevaux), un bouton de saut et un affichage de vitesse. Il apparaît ou se cache selon le mode d'entrée (la manette le masque), l'activité IA et l'état joueur/véhicule, et pilote le véhicule via setTargetSpeedAndDirection. Actif seulement si Platform.hasTouchSliders est vrai. Côté client uniquement.

- **SpeedSliderDisplay** hérite de `HUDDisplayElement` (l.30)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SpeedSliderDisplay.new(hud: string, hudAtlasPath: string, controlHudAtlasPath: any)` | 47 | ✍ Crée l'affichage sur un overlay de positionnement vide, initialise l'état (ni véhicule ni joueur, position de repos 0,25), construit les composants et s'abonne aux messages d'ouverture de GUI, de dialogue, de visite guidée et de changement d'insets. |
| `SpeedSliderDisplay:delete()` | 79 | ✍ Se désabonne de tous les messages du message center puis supprime l'élément via la classe parente. |
| `SpeedSliderDisplay:createComponents()` | 88 | ✍ Construit les éléments enfants : fond du curseur, barres positive (accélération) et négative (frein), poignée du curseur avec son callback, boutons de saut joueur et cheval et fond pour manette. Mémorise aussi les positions visible/cachée utilisées pour l'animation. |
| `SpeedSliderDisplay:setSliderState(state: any)` | 181 | ✍ Affiche ou cache le curseur (avec animation) lorsque l'état demandé diffère de l'état courant. |
| `SpeedSliderDisplay:hideSlider()` | 193 | ✍ Lance une interpolation vers la position cachée, passe l'état du curseur à faux, désactive le toucher sur le curseur et rafraîchit la visibilité des éléments. |
| `SpeedSliderDisplay:showSlider()` | 210 | ✍ Lance une interpolation vers la position visible, réinitialise le curseur, active le toucher et rafraîchit la visibilité à la fin de l'animation. |
| `SpeedSliderDisplay:updateElementsVisibility()` | 228 | ✍ Affiche le fond manette seulement quand le curseur est inactif et qu'aucun joueur ni monture n'est contrôlé, et le fond du curseur seulement quand il est actif. |
| `SpeedSliderDisplay:onSliderVisibilityChangeFinished(visibility: any)` | 236 | ✍ Callback de fin d'animation : rafraîchit la visibilité des éléments quand le curseur est devenu visible. |
| `SpeedSliderDisplay:setVehicle(vehicle: table)` | 245 | ✍ Définit le véhicule contrôlé, détecte s'il est monture, efface tout joueur, réinitialise le curseur et ajoute les positions d'accroche des allures pour les montures. Change l'image et la taille du fond entre variantes véhicule et cheval. |
| `SpeedSliderDisplay:setPlayer(player: any)` | 279 | ✍ Définit le joueur à pied ; un joueur non nil efface le véhicule courant. Met ensuite à jour l'état de visibilité du curseur et des éléments. |
| `SpeedSliderDisplay:createBar(position: any, size: any, color: any)` | 319 | ✍ Crée une barre HUDElement de couleur unie à la position, la taille et la couleur données (en pixels), relativement à la position de l'affichage. |
| `SpeedSliderDisplay:onSliderPositionChanged(position: any)` | 331 | ✍ Callback du curseur : borne la position entre 0 et 1, redimensionne la barre d'accélération et repositionne/redimensionne la barre de frein, colore la barre pour le régulateur s'il est actif, et pour une monture règle l'allure correspondante quand la poignée atteint une position d'accroche. |
| `SpeedSliderDisplay:getAccelerateAndBrakeValue()` | 362 | ✍ Convertit la position du curseur en deux valeurs entre 0 et 1 : accélération au-dessus de la position de repos et frein en dessous. |
| `SpeedSliderDisplay:onJumpEventCallback()` | 368 | ✍ Gestionnaire du bouton de saut : ignoré pendant le sommeil ; fait sauter la monture si c'est permis, ou déclenche l'entrée de saut du joueur à pied. |
| `SpeedSliderDisplay:update(dt: any)` | 392 | ✍ Mise à jour par frame : met à jour le curseur et, pour un véhicule avec entrée d'accélération, envoie vitesse cible et direction (avant, arrière ou neutre) selon le curseur. Pour une monture, déplace la poignée pour suivre les changements d'allure faits ailleurs. |
| `SpeedSliderDisplay:getIsSliderActive()` | 426 | ✍ Renvoie vrai seulement si le curseur doit être utilisable : pas en mode d'aide manette, curseurs tactiles supportés, aucune IA ne conduit le véhicule et aucun joueur à pied. |
| `SpeedSliderDisplay:onInputHelpModeChange(inputHelpMode: any)` | 448 | ✍ Mémorise le nouveau mode d'aide à la saisie ; en mode manette, remet la poignée en position de repos. Rafraîchit ensuite l'état de visibilité. |
| `SpeedSliderDisplay:onAIVehicleStateChanged(state: any, vehicle: any)` | 461 | ✍ Callback d'état IA : rafraîchit l'état de visibilité si l'événement concerne le véhicule actuellement contrôlé. |
| `SpeedSliderDisplay:updateVisibilityState()` | 469 | ✍ Recalcule si le curseur doit être affiché et l'applique via setSliderState en cas de changement. |
| `SpeedSliderDisplay:draw()` | 478 | ✍ Dessine les enfants puis, pour un véhicule non monture, affiche la vitesse (arrondie, dans l'unité choisie) en nombre court, ou avec l'unité quand l'IA, la manette ou l'absence de curseur tactile s'applique. |
| `SpeedSliderDisplay:onDialogOpened(guiName: any, overlappingDialog: any)` | 522 | ✍ Gestionnaire de message : réinitialise la poignée du curseur à l'ouverture d'un dialogue qui ne chevauche pas un autre dialogue. |
| `SpeedSliderDisplay:onGuiOpen()` | 531 | ✍ Gestionnaire de message : réinitialise la poignée du curseur lorsqu'un écran de GUI va s'ouvrir. |
| `SpeedSliderDisplay:setScale(uiScale: any)` | 545 | ✍ Applique une nouvelle échelle d'interface : redimensionne l'élément, recalcule les positions visible/cachée (bornées par l'inset droit de la zone de sécurité), la plage du curseur et la position d'origine, et garde l'affichage caché si le curseur est inactif. |
| `SpeedSliderDisplay.getBackgroundPosition(scale: scale, width: number) → number, number` | 580 | ✍ Renvoie la position écran de l'affichage pour une échelle et une largeur données, ancrée au bord droit et limitée par l'inset droit de la zone de sécurité. |
| `SpeedSliderDisplay.createBackground()` | 599 | ✍ Crée l'overlay vide (sans texture) servant uniquement de cadre de positionnement à l'affichage. |

## Messages

- s'abonne à `MessageType.GUI_BEFORE_OPEN` (l.69)
- s'abonne à `MessageType.GUI_DIALOG_OPENED` (l.70)
- s'abonne à `MessageType.GUIDED_TOUR_DIALOG` (l.71)
- s'abonne à `MessageType.INSETS_CHANGED` (l.72)
