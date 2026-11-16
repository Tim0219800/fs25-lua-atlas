# gui/elements/ButtonElement.lua

*[English version](../../../../scripts/gui/elements/ButtonElement.md)*

Source: `dataS/scripts/gui/elements/ButtonElement.lua` — FS25 1.25.1.0

✍ Bouton GUI cliquable, dérivé de TextElement avec le PlaySampleMixin pour les sons de clic. Il dessine un fond (couche "image") et une icône (couche "icon") ou, si `inputAction` est défini, un glyphe de touche clavier ou manette ; il gère aussi l'affichage de bouton tactile sur mobile, le dimensionnement selon le contenu, les états focus/survol/pressé et les callbacks (onClick, onFocus, onLeave, onHighlight, onHighlightRemove, onSizeChanged). Les événements souris, tactile et clavier sont traités ici ; `sendAction`, `loadInputGlyph`, `setPressed` et similaires sont définis dans d'autres fichiers (NON VÉRIFIÉ). Interface côté client.

- **ButtonElement** hérite de `TextElement` (l.32)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ButtonElement.new(target: any, custom_mt: any)` | 39 | ✍ Constructeur : construit l'élément de texte, ajoute le mixin de sons et définit les valeurs par défaut (overlays et icônes vides, texte centré, action envoyée au relâchement, son de clic par défaut, pas d'ajustement au contenu, indicateurs clavier/tactile désactivés). |
| `ButtonElement:delete()` | 86 | ✍ Supprime les overlays d'icône tactile, de fond et d'icône, puis exécute la suppression du parent. |
| `ButtonElement:loadFromXML(xmlFile: any, key: any)` | 96 | ✍ Lit les callbacks, les tailles d'icône, les indicateurs de comportement (forceFocus, fitToContent, options tactiles, sendActionOnRelease, drawChildrenLast...), textSeparator, `inputAction` (nom d'InputAction valide) ou l'overlay d'icône, l'icône tactile sur mobile et `clickSound`, puis crée l'overlay et met à jour la taille. |
| `ButtonElement:loadProfile(profile: any, applyProfile: any)` | 156 | ✍ Mêmes réglages que le chargeur XML mais depuis un profil GUI (sans callbacks) ; ne met à jour la taille que lorsque le profil est appliqué. |
| `ButtonElement:copyAttributes(src: any)` | 215 | ✍ Copie les overlays, les réglages d'icône, les indicateurs de comportement, l'action d'entrée, le son de clic, l'état pressé et les callbacks depuis un bouton source, et clone le mixin de son. |
| `ButtonElement:loadInputGlyphColors(profile: profile, xmlFile: xmlFile, key: key)` | 263 | ✍ Charge les couleurs du glyphe (icône et "iconBg") depuis le XML ou depuis un profil, selon l'argument fourni. |
| `ButtonElement:setInputMode(isKeyboardMode: any, isTouchMode: any, isGamepadMode: any)` | 306 | ✍ Enregistre quel mode de glyphe (clavier, tactile ou manette) est actif, charge le glyphe d'entrée la première fois et recalcule la taille si un mode a changé. |
| `ButtonElement:setAlpha(alpha: any)` | 337 | ✍ Définit l'alpha de l'élément et le répercute sur les overlays de fond et d'icône. |
| `ButtonElement:setDisabled(disabled: any)` | 349 | ✍ Applique l'indicateur désactivé ; en cas de désactivation, retire le focus, efface l'état d'entrée et déclenche le callback onLeave. |
| `ButtonElement:setInputAction(inputActionName: any)` | 362 | ✍ Change par son nom l'action d'entrée affichée en glyphe (ignoré si le nom n'est pas une InputAction valide) et force le rechargement du glyphe. |
| `ButtonElement:onOpen()` | 371 | ✍ Si une action d'entrée est définie, recharge le glyphe à l'ouverture, de façon différée pour qu'une manette absente ne casse pas le chargement. |
| `ButtonElement:onClose()` | 383 | ✍ Exécute le gestionnaire du parent puis réinitialise l'état du bouton. |
| `ButtonElement:reset()` | 390 | ✍ Efface les états pressé, focalisé et survolé ainsi que l'indicateur d'appui. |
| `ButtonElement:setImageFilename(filename: any, iconFilename: any)` | 401 | ✍ Recrée l'overlay de fond et/ou d'icône à partir des noms de fichier donnés (chacun seulement s'il n'est pas nil). |
| `ButtonElement:setImageUVs(backgroundUVs: any, iconUVs: any)` | 412 | ✍ Remplace la table UV de l'overlay de fond et/ou d'icône lorsqu'elle est fournie. |
| `ButtonElement:setImageSlice(backgroundSliceId: any, iconSliceId: any)` | 424 | ✍ Résout un identifiant de tranche pour le fond et un pour l'icône via `g_overlayManager` et applique leurs UV et fichiers image. |
| `ButtonElement:getIsActive()` | 439 | ✍ Le bouton n'est actif que si la condition du parent est remplie et qu'un callback onClick existe. |
| `ButtonElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 446 | ✍ Gère la souris lorsque le bouton est actif : suit le survol (surbrillance) même si l'événement est consommé, donne le focus au clic gauche enfoncé, envoie l'action à l'appui ou au relâchement selon `sendActionOnRelease`, met à jour l'état pressé et retourne si l'événement a été utilisé. |
| `ButtonElement:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any, eventUsed: any)` | 511 | ✍ Équivalent tactile du gestionnaire souris : surbrillance, focus au toucher, envoi de l'action au toucher ou au relâchement, état pressé, et retourne si l'événement a été consommé. |
| `ButtonElement:keyEvent(unicode: any, sym: any, modifier: any, isDown: any, eventUsed: any)` | 575 | ✍ Transmet les événements clavier au parent seulement si le bouton est actif ; sinon retourne false. |
| `ButtonElement:getIconOffset(textWidth: any, textHeight: any)` | 584 | ✍ Calcule la position de l'icône par rapport au texte, d'après la taille de l'icône, l'alignement du texte, sa taille et `iconTextOffset`. Retourne un décalage x et y en unités d'écran. |
| `ButtonElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 607 | ✍ Dessine d'abord les enfants (sauf si drawChildrenLast), synchronise le mode d'entrée depuis `g_inputBinding`, affiche le fond, puis le glyphe de touche clavier, le bouton tactile et l'icône tactile/manette, ou l'icône normale, plus un contour de debug si activé. Les enfants sont dessinés en dernier si drawChildrenLast vaut true. |
| `ButtonElement:getIconModifiedTextOffset(textOffsetX: number, textOffsetY: number) → number, number` | 689 | ✍ Décale le décalage de texte donné pour laisser la place à l'icône, selon l'alignement gauche ou centré. Retourne les décalages x et y modifiés. |
| `ButtonElement:getTextOffset()` | 704 | ✍ Retourne le décalage de texte du parent plus une marge fixe de zone tactile en mode tactile, ajusté pour l'icône. |
| `ButtonElement:getText2Offset()` | 716 | ✍ Retourne le décalage du second texte (ombre) ajusté pour l'icône. |
| `ButtonElement:getIconSize()` | 723 | ✍ Retourne la taille de l'icône : celle du glyphe de touche en mode clavier, sinon la taille d'icône configurée. |
| `ButtonElement:setIconSize(x: any, y: any)` | 733 | ✍ Définit la largeur et/ou la hauteur de l'icône (nil conserve la valeur actuelle) et met à jour la taille de l'élément. |
| `ButtonElement:canReceiveFocus()` | 743 | ✍ Vrai lorsque le bouton est activé, visible et gère le focus. |
| `ButtonElement:onFocusLeave()` | 749 | ✍ Exécute le gestionnaire du parent et déclenche le callback onLeave. |
| `ButtonElement:onFocusEnter()` | 757 | ✍ Exécute le gestionnaire du parent et déclenche le callback onFocus. |
| `ButtonElement:onHighlight()` | 765 | ✍ Exécute le gestionnaire du parent et déclenche le callback onHighlight. |
| `ButtonElement:onHighlightRemove()` | 773 | ✍ Exécute le gestionnaire du parent et déclenche le callback onHighlightRemove. |
| `ButtonElement:onFocusActivate()` | 781 | ✍ Lorsque actif, envoie l'action du bouton (activation par le système de focus, par exemple la validation à la manette). |
| `ButtonElement:getIsPressed()` | 804 | ✍ Retourne si le bouton est actuellement pressé. |
| `ButtonElement:getOverlayState()` | 810 | ✍ Retourne l'état d'overlay par ordre de priorité : désactivé, pressé (sauf s'il est ignoré), sélectionné, focalisé, survol, sinon normal. |
| `ButtonElement:updateSize(forceTextSize: any)` | 828 | ✍ Si l'ajustement au contenu ou la largeur/hauteur automatique du texte est actif, redimensionne le bouton selon icône plus texte (largeur supplémentaire, marge tactile sur mobile). Si la taille change, déclenche onSizeChanged pour le mode tactile et invalide la mise en page du parent si elle se valide automatiquement. |
| `ButtonElement:setText(text: any, forceTextSize: any, isInitializing: any, forceScrollingParameterUpdate: any)` | 876 | ✍ Préfixe le texte avec `textSeparator` s'il est défini, l'applique via le parent, puis met à jour la taille. |
| `ButtonElement:setTextSize(size: any)` | 888 | ✍ Définit la taille du texte via le parent et met à jour la taille du bouton. |
| `ButtonElement:setClickSound(soundName: any)` | 896 | ✍ Définit le nom de l'échantillon sonore joué au clic. |
