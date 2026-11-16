# gui/elements/TextInputElement.lua

*[English version](../../../../scripts/gui/elements/TextInputElement.md)*

Source: `dataS/scripts/gui/elements/TextInputElement.lua` — FS25 1.25.1.0

✍ Zone de saisie de texte monoligne pour les menus, dérivée de ButtonElement. Elle capture le clavier (ou l'IME à l'écran) lorsqu'elle est activée, gère un curseur clignotant, le défilement horizontal avec points de suspension avant/arrière, le masquage de mot de passe et un filtre de grossièretés optionnel. Elle change le contexte des entrées pendant la capture pour que les actions du jeu ne se déclenchent pas. Charge des attributs comme maxCharacters, maxInputTextWidth, isPassword et plusieurs callbacks (onEnterPressed, onEscPressed, onTextChanged, onIsUnicodeAllowed) depuis le XML ou un profil GUI.

- **TextInputElement** hérite de `ButtonElement` (l.26)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `TextInputElement.new(target: any, custom_mt: any)` | 44 | ✍ Constructeur. Crée l'élément à partir de ButtonElement et initialise le curseur, le clignotement, l'état du texte, l'indicateur de prise en charge de l'IME (via imeIsSupported), le focus forcé et le son de focus de zone de texte. |
| `TextInputElement:delete()` | 95 | ✍ Interrompt toute session IME en cours, supprime l'overlay du curseur puis appelle le delete du parent. |
| `TextInputElement:translate(str: any)` | 103 | ✍ Convertit un texte via g_i18n:convertText pour résoudre les jetons l10n des chaînes IME ; une entrée nil/false est renvoyée telle quelle. |
| `TextInputElement:loadFromXML(xmlFile: any, key: any)` | 112 | ✍ Lit l'élément depuis le XML : les cinq callbacks, le type de clavier/titre/description/texte d'indication de l'IME, maxCharacters, maxInputTextWidth, décalage/taille/overlay du curseur, enterWhenClickOutside, applyProfanityFilter et isPassword. Garantit un curseur d'au moins un pixel de large. |
| `TextInputElement:loadProfile(profile: any, applyProfile: any)` | 148 | ✍ Applique les valeurs d'un profil GUI (maxCharacters, maxInputTextWidth, décalage/taille/taille d'image du curseur, isPassword, applyProfanityFilter) et charge l'overlay du curseur depuis le profil. |
| `TextInputElement:copyAttributes(src: any)` | 171 | ✍ Copie les réglages IME, les limites, l'overlay et la géométrie du curseur, l'indicateur de mot de passe, les callbacks et les options de comportement depuis un autre TextInputElement lors d'un clonage. |
| `TextInputElement:finalize()` | 201 | ✍ Recalcule la place nécessaire au curseur et journalise une erreur si l'alignement centre/droite est utilisé sans maxInputTextWidth, ou un avertissement si cette largeur est trop petite pour les points et le curseur. |
| `TextInputElement:getIsActive()` | 218 | ✍ Utilise le test d'activité de base de GuiElement, en contournant volontairement celui de ButtonElement qui serait incompatible avec une zone de texte. |
| `TextInputElement:setCaptureInput(isCapturing: any)` | 225 | ✍ Démarre ou arrête la capture des entrées. Le démarrage bascule g_inputBinding sur le contexte de saisie (en annulant un contexte précédent si besoin) et, hors console, enregistre MENU_BACK/MENU_ACCEPT ; l'arrêt restaure le contexte et, sauf mot de passe ou filtre désactivé, applique filterText au contenu. |
| `TextInputElement:setAlpha(alpha: any)` | 277 | ✍ Définit l'alpha de l'élément via le parent et le recopie sur l'overlay du curseur. |
| `TextInputElement:getDoRenderText()` | 286 | ✍ Renvoie toujours false pour que le parent ne dessine pas le texte lui-même ; draw() affiche les parties visibles du texte à la main. |
| `TextInputElement:reset()` | 292 | ✍ Réinitialise l'état du parent et arrête toute répétition automatique de touche en cours. |
| `TextInputElement:setText(text: any)` | 302 | ✍ Définit le texte, tronqué à maxCharacters (compatible UTF-8), place le curseur à la fin et rafraîchit les portions visibles. Ne déclenche pas onTextChanged. |
| `TextInputElement:setForcePressed(force: any)` | 317 | ✍ Entre ou sort du mode édition : active/désactive la capture des entrées, donne le focus à l'élément, restaure ou retire l'état de focus précédent à la sortie, arrête la répétition de touche et rafraîchit le texte visible. |
| `TextInputElement:getIsUnicodeAllowed(unicode: any)` | 349 | ✍ Indique si un caractère saisi est accepté : refuse les sauts de ligne et les caractères que la police ne peut pas afficher, puis s'en remet au callback onIsUnicodeAllowed (true par défaut). |
| `TextInputElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 362 | ✍ Gère la souris : surbrillance au survol, entrée en édition au clic gauche (ouverture de l'IME au relâchement si prise en charge) et sortie lors d'un clic à l'extérieur, avec éventuel onEnterPressed. Renvoie si l'événement a été consommé. |
| `TextInputElement:moveCursorLeft(isLeftCtrlPressed: any)` | 417 | ✍ Déplace le curseur d'un caractère vers la gauche, ou au début du mot précédent si le modificateur ctrl est actif. |
| `TextInputElement:moveCursorRight(isLeftCtrlPressed: any)` | 437 | ✍ Déplace le curseur d'un caractère vers la droite, ou saute au début du mot suivant si le modificateur ctrl est actif. |
| `TextInputElement:setCursorPosition(position: any)` | 453 | ✍ Définit la position du curseur (base 1), bornée entre 1 et la longueur du texte plus un. |
| `TextInputElement:deleteText(deleteRightCharacterFromCursor: any)` | 459 | ✍ Supprime le caractère avant le curseur, ou celui après si l'argument est true, puis déclenche onTextChanged. Sans effet aux extrémités du texte. |
| `TextInputElement:stopSpecialKeyRepeating()` | 492 | ✍ Efface l'état de répétition automatique (touche, délai et délai restant) des touches de navigation/suppression maintenues. |
| `TextInputElement:openIme()` | 507 | ✍ Ouvre la saisie système à l'écran (imeOpen) avec le texte courant, le titre, la description, l'indication, le type de clavier et la longueur max (512 par défaut). Renvoie true et s'abonne aux changements de pause si l'ouverture a réussi. |
| `TextInputElement:abortIme()` | 521 | ✍ Annule une session IME active via imeAbort, vide le texte précédent mémorisé et se désabonne des messages de pause. |
| `TextInputElement:keyEvent(unicode: any, sym: any, modifier: any, isDown: any, eventUsed: any)` | 533 | ✍ Traite le clavier en mode édition : entrée/échap au relâchement, flèches, début/fin, suppr, retour arrière (ctrl supprime un mot), collage ctrl+V et caractères normaux insérés au curseur, avec répétition automatique. Déclenche onEnterPressed, onEscPressed et onTextChanged. |
| `TextInputElement:inputEvent(action: any, value: any, eventUsed: any)` | 658 | ✍ Gère les actions manette/menu pendant l'édition (sans IME actif) : MENU_ACCEPT valide et MENU_BACK/MENU_CANCEL annule, chacun quittant l'édition et déclenchant le callback correspondant. |
| `TextInputElement:update(dt: any)` | 687 | ✍ Mise à jour par frame : fait avancer le clignotement du curseur, gère la répétition accélérée des touches, interroge l'IME (fin ou texte en direct) et décrémente le minuteur de blocage des entrées. dt en millisecondes. |
| `TextInputElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 742 | ✍ Dessine le fond du parent avec un texte vide, puis affiche les points avant, le texte avant le curseur, le curseur clignotant, le texte après et les points arrière, selon l'alignement et la zone de découpe éventuelle. |
| `TextInputElement:shouldFocusChange(direction: any)` | 802 | ✍ Autorise la navigation de focus hors de l'élément seulement s'il n'est pas en mode édition. |
| `TextInputElement:onFocusLeave()` | 808 | ✍ À la perte du focus, interrompt l'IME, quitte le mode édition et appelle le gestionnaire du parent. |
| `TextInputElement:onFocusActivate()` | 816 | ✍ Activation par le focus (ex. validation manette) : déclenche onEnter, puis termine l'édition et déclenche onEnterPressed, ou ouvre l'IME et entre en édition. Ignorée tant que le minuteur de blocage tourne. |
| `TextInputElement:onClose()` | 835 | ✍ À la fermeture de l'écran parent, interrompt l'IME et quitte le mode édition afin que le mode de saisie ne reste pas actif. |
| `TextInputElement:drawTextPart(text: any, textXPos: any, displacementX: any, textYPos: any)` | 844 | ✍ Affiche un segment de texte (avec ombre optionnelle) au décalage x donné et renvoie sa largeur, ce qui permet d'enchaîner points, segments et curseur. |
| `TextInputElement:drawCursor(textXPos: any, displacementX: any, textYPos: any)` | 871 | ✍ Dessine l'overlay du curseur, aligné sur les pixels, pendant la moitié visible du cycle de clignotement et renvoie la largeur réservée au curseur. |
| `TextInputElement:updateVisibleTextElements()` | 883 | ✍ Recalcule quelles parties du texte (avant/après curseur, points avant/arrière) tiennent dans maxInputTextWidth. Les mots de passe sont affichés en astérisques ; hors édition, le texte part du début et est coupé par des points arrière. |
| `TextInputElement.limitTextToAvailableWidth(text: any, textSize: any, availableWidth: any, trimFront: any)` | 1025 | ✍ Fonction statique qui rogne le texte par l'arrière (ou par l'avant si trimFront) jusqu'à ce qu'il tienne dans la largeur. Renvoie le texte rogné et les indices du premier/dernier caractère. |
| `TextInputElement:getAvailableTextWidth()` | 1055 | ✍ Renvoie maxInputTextWidth moins la place prise par les points et le curseur visibles, ou nil si aucune largeur maximale n'est définie. |
| `TextInputElement:getNeededTextWidth()` | 1079 | ✍ Additionne les largeurs de toutes les parties actuellement visibles (points, segments de texte, curseur) ; sert à aligner le texte centré ou à droite. |
| `TextInputElement:getText()` | 1106 | ✍ Renvoie le texte brut courant de la saisie (non masqué pour les mots de passe). |

## Messages

- s'abonne à `MessageType.PAUSE` (l.511)
