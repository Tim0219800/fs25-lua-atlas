# gui/hud/HUDPopupMessageMobile.lua

*[English version](../../../../scripts/gui/hud/HUDPopupMessageMobile.md)*

Source: `dataS/scripts/gui/hud/HUDPopupMessageMobile.lua` — FS25 1.25.1.0

✍ Boîte de message popup de l'interface mobile (étend HUDDisplayElement), affichée en bas au centre de l'écran. Les messages sont mis en file et montrés un par un avec titre, texte et un nombre maximal de lignes de commandes, puis fermés après un délai, au toucher ou via les actions de confirmation. Pendant l'affichage, elle bloque le basculement de la minicarte, ajoute une zone de flou de profondeur de champ et utilise un contexte tactile nommé guidedTour. Côté client uniquement.

- **HUDPopupMessageMobile** hérite de `HUDDisplayElement` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HUDPopupMessageMobile.new(hudAtlasPath: string, ingameMap: ingameMap) → table` | 39 | ✍ Crée le popup avec son overlay de fond, une file de messages vide, des lignes d'entrée et des glyphes, et un texte de continuation issu de la clé l10n introduction_continueTextTouch. Nécessite la carte en jeu pour la forcer en petit pendant un message. |
| `HUDPopupMessageMobile:showMessage(title: table?, text: function?, duration: table?, controls: table?, callback: function?, target: table?)` | 83 | ✍ Met en file un message avec titre, texte, commandes optionnelles et callback/cible optionnels. Une durée de 0 est déduite de la longueur du texte, une durée négative vaut la durée maximale ; les plus anciens messages en attente sont supprimés si la file est trop longue et les commandes en trop tronquées. |
| `HUDPopupMessageMobile:getVisible()` | 121 | ✍ Retourne true seulement si l'élément de base est visible et qu'un message courant existe. |
| `HUDPopupMessageMobile:getHidingTranslation() → number, number` | 130 | ✍ Retourne le décalage (x, y) utilisé par l'animation de masquage : vers le bas de la hauteur de la boîte plus le décalage de zone sûre et une petite marge. |
| `HUDPopupMessageMobile:assignCurrentMessage(message: any)` | 137 | ✍ Définit le message donné comme courant et remet son minuteur à zéro. Si un gestionnaire tactile existe, entre dans le contexte guidedTour et enregistre une zone tactile plein écran qui confirme le message au relâchement. Masque le glyphe de continuation en mode tactile, puis dimensionne la boîte et rafraîchit les glyphes. |
| `HUDPopupMessageMobile:setCurrentMessageHeight()` | 155 | ✍ Calcule la hauteur de la boîte à partir des hauteurs du titre, du texte et des lignes de commandes, des marges et du bouton de continuation, puis l'applique avec une hauteur minimale. |
| `HUDPopupMessageMobile:getTitleHeight()` | 168 | ✍ Mesure le titre, mis en majuscules et renvoyé à la ligne, du message courant en unités écran (0 s'il n'y en a pas), puis restaure l'état du texte. |
| `HUDPopupMessageMobile:getTextHeight()` | 188 | ✍ Mesure le corps du texte du message courant avec l'échelle de hauteur de ligne du popup, en retournant 0 s'il n'y a pas de message. |
| `HUDPopupMessageMobile:getInputRowsHeight()` | 206 | ✍ Retourne la hauteur réservée aux lignes de commandes : une ligne par commande plus une ligne supplémentaire, 0 sans message courant. |
| `HUDPopupMessageMobile:animateHide()` | 218 | ✍ Lance l'animation de masquage du parent, retire la zone de profondeur de champ et enregistre finishMessage comme callback de fin d'animation. |
| `HUDPopupMessageMobile:startMessage()` | 229 | ✍ Désactive le basculement de la carte et force la minicarte en petit, puis prend le premier message en file et le rend courant. |
| `HUDPopupMessageMobile:finishMessage()` | 240 | ✍ Réactive le basculement de la carte, appelle le callback du message courant (avec sa cible, ou avec le popup lui-même sans cible) et efface le message courant. |
| `HUDPopupMessageMobile:update(dt: any)` | 260 | ✍ Ignoré tant qu'un menu est visible. Sinon, met à jour l'animation, cumule le temps d'affichage sauf en pause ou pendant le sommeil, gère l'expiration ou le message suivant, et rafraîchit les glyphes quand le mode d'aide à la saisie change. |
| `HUDPopupMessageMobile:updateCurrentMessage()` | 285 | ✍ Masque le message courant avec animation quand son temps d'affichage dépasse sa durée ; sans message courant, démarre le suivant en file, l'anime à l'entrée et ajoute une zone de flou à la fin de l'animation. |
| `HUDPopupMessageMobile:updateButtonGlyphs()` | 305 | ✍ Règle le glyphe de continuation sur l'action SKIP_MESSAGE_BOX et, pour chaque ligne visible du message courant, affecte les noms d'action de la commande au glyphe de la ligne. |
| `HUDPopupMessageMobile:setInputActive(isActive: any)` | 333 | ✍ Active ou désactive le contexte de saisie dédié. Activation : enregistre les événements MENU_ACCEPT et SKIP_MESSAGE_BOX (texte masqué) appelant onConfirmMessage. Désactivation : retire les événements de cette cible et restaure le contexte. |
| `HUDPopupMessageMobile:onConfirmMessage(actionName: any, inputValue: any)` | 355 | ✍ Callback de saisie ou tactile qui ferme le message en le masquant avec animation, mais seulement si aucune animation n'est en cours ; il restaure aussi le contexte tactile personnalisé. |
| `HUDPopupMessageMobile:draw()` | 376 | ✍ Dessine le fond puis le titre (en majuscules, centré), le texte du corps renvoyé à la ligne, un texte par commande et, en mode tactile, le libellé de continuation. Rien n'est dessiné si un menu est visible ou sans message courant. |
| `HUDPopupMessageMobile.getBackgroundPosition(uiScale: number)` | 441 | ✍ Retourne la position de base de la boîte : centrée horizontalement, bas à hauteur de la zone sûre, plus le décalage configuré multiplié par uiScale. |
| `HUDPopupMessageMobile:setScale(uiScale: any)` | 448 | ✍ Applique l'échelle d'interface, recalcule les valeurs mises à l'échelle en cache et recentre la boîte horizontalement à sa position de fond. |
| `HUDPopupMessageMobile:setDimension(width: any, height: any)` | 460 | ✍ Surcharge simple qui appelle setDimension du parent sans comportement supplémentaire. |
| `HUDPopupMessageMobile:storeScaledValues()` | 466 | ✍ Met en cache toutes les tailles, décalages et tailles de texte mis à l'échelle (taille minimale, marges, tailles de lignes et de bouton, textes de titre/corps/continuation), convertis depuis les constantes en pixels. |
| `HUDPopupMessageMobile.createBackground(hudAtlasPath: any)` | 490 | ✍ Crée l'overlay de fond depuis l'atlas HUD à la position de base avec la taille minimale, les UV et la couleur de fond. |
| `HUDPopupMessageMobile:createComponents(hudAtlasPath: any)` | 502 | ✍ Crée la pile de lignes de commandes (stockées dans l'ordre inverse) et l'InputGlyphElement de continuation, puis les ajoute comme enfants. |
| `HUDPopupMessageMobile:createInputRow(hudAtlasPath: any, posX: any, posY: any)` | 531 | ✍ Construit une ligne de commande : un panneau de fond coloré, un InputGlyphElement et une ligne de séparation. Retourne le panneau, le glyphe et la position Y de la ligne suivante. |
