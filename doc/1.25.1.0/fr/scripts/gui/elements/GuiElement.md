# gui/elements/GuiElement.lua

*[English version](../../../../scripts/gui/elements/GuiElement.md)*

Source: `dataS/scripts/gui/elements/GuiElement.lua` — FS25 1.25.1.0

✍ GuiElement est la classe racine de tout élément d'interface. Elle gère l'arbre parent/enfants, la position, la taille et les ancres (unités d'écran normalisées), la visibilité, le fondu d'alpha, les états actif/sélectionné/focalisé/surligné, des bordures optionnelles, les infobulles et les callbacks liés à une vue cible. Les propriétés viennent d'attributs XML et de valeurs de guiProfiles ; le XML prime sur le profil. Elle propage souris, tactile, clavier et entrées aux enfants et travaille avec FocusManager et GuiOverlay. Le mixin GuiMixin, FocusManager et g_gui sont dans d'autres fichiers.

- **GuiElement** (l.99)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `GuiElement.new(target: target, custom_mt: any)` | 144 | ✍ Constructeur. Prépare la liste d'enfants, la cible, un profil vide, les tables de position/taille/ancres, les valeurs par défaut visible et actif, alpha 1, temps de fondu 0, état d'overlay normal et handleFocus à true. Inclut GuiMixin. |
| `GuiElement:loadFromXML(xmlFile: xmlFile, key: key)` | 222 | ✍ Charge le profil nommé par #profile, puis lit id, callbacks (onCreate, onOpen, onClose, onDraw), nom, pivot, position, taille, ancres, indicateurs, cadre, temps de fondu (secondes, stockés en ms), infobulle (clés $l10n_ gérées) et réglages de focus, puis résout les tailles. |
| `GuiElement:loadProfile(profile: profile, applyProfile: boolean)` | 315 | ✍ Lit depuis un objet profil les mêmes propriétés de mise en page, d'état, de cadre, de focus et de fondu. Si applyProfile est vrai, re-résout aussi les tailles, corrige les lignes fines et met à jour les positions absolues. Un temps de fondu invalide journalise un avertissement dev. |
| `GuiElement:applyProfile(profileName: profileName, blockSizeUpdate: boolean?, ignoreSameProfile: boolean?)` | 393 | ✍ Applique un profil par son nom à l'exécution via g_gui:getProfile. La mise à jour de taille est sautée si blockSizeUpdate est vrai, et l'appel est ignoré si le même profil est déjà actif et ignoreSameProfile est vrai. |
| `GuiElement:resolveSizeString()` | 405 | ✍ Convertit les chaînes size, width et height en tailles normalisées. Une valeur en pourcentage est relative à la taille du parent moins absoluteSizeOffset ; sinon elle passe par GuiUtils.getNormalizedValue. Puis recalcule les deltas d'ancrage. |
| `GuiElement:delete()` | 453 | ✍ Supprime récursivement tous les enfants, détache cet élément de son parent et le retire de FocusManager. |
| `GuiElement:clone(parent: table, includeId: boolean?, suppressOnCreate: boolean?, blockFocusHandlingReload: any) → table` | 473 | ✍ Crée une copie via self.new() et copyAttributes, clone les enfants récursivement (ids conservés si demandé), recharge la gestion du focus et déclenche onCreate sauf suppression. Le parent est optionnel. À noter : new() est appelé sans cible. |
| `GuiElement:copyAttributes(src: table)` | 503 | ✍ Copie noms, indicateurs d'état, taille, marge, callbacks, cible, profil, fondu, données de focus, cadre, position, ancres et hotspot depuis un élément source. À noter : il copie ignoreLayout alors que le XML et les profils utilisent layoutIgnore. |
| `GuiElement:onGuiSetupFinished()` | 568 | ✍ Propage la fin de la mise en place du GUI aux enfants, puis résout toolTipElementId parmi les descendants de la cible et avertit si l'élément est introuvable. |
| `GuiElement:toggleFrameSide(sideIndex: integer, isVisible: any)` | 587 | ✍ Affiche ou masque l'un des quatre côtés de la bordure par son index. Sans effet si l'élément n'a pas de cadre. |
| `GuiElement:updateFramePosition()` | 595 | ✍ Recalcule les rectangles des quatre bordures à partir de la position absolue, de la taille et de l'épaisseur, puis découpe les chevauchements aux coins. |
| `GuiElement:cutFrameBordersHorizontal(verticalPart: any, horizontalPart: any, isLeft: any)` | 649 | ✍ Aide pour les coins : raccourcit une bordure horizontale de la largeur d'une bordure verticale quand celle-ci est plus épaisse, en décalant x à gauche. |
| `GuiElement:cutFrameBordersVertical(horizontalPart: any, verticalPart: any, isBottom: any)` | 661 | ✍ Aide pour les coins : raccourcit une bordure verticale de la hauteur d'une bordure horizontale quand celle-ci est au moins aussi longue, en décalant y pour le bas. |
| `GuiElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 706 | ✍ Transmet un événement souris aux enfants visibles du dernier au premier (le plus haut d'abord) et renvoie true si l'un d'eux l'a utilisé. |
| `GuiElement:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any, eventUsed: any)` | 725 | ✍ Comme mouseEvent pour le tactile : transmet aux enfants visibles et renvoie si l'événement a été utilisé. |
| `GuiElement:inputEvent(action: action, value: value, eventUsed: eventUsed) → True` | 752 | ✍ Fait remonter une action d'entrée au parent si elle n'est pas déjà utilisée ; renvoie si elle a été traitée. |
| `GuiElement:keyEvent(unicode: any, sym: any, modifier: any, isDown: any, eventUsed: any) → True` | 777 | ✍ Transmet un événement clavier aux enfants visibles, du dernier au premier, et renvoie true si l'un d'eux l'a utilisé. |
| `GuiElement:update(dt: any)` | 796 | ✍ Mise à jour par frame : fait avancer le fondu avec dt selon fadeInTime ou fadeOutTime, puis met à jour chaque enfant actif. |
| `GuiElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 815 | ✍ Démarre une nouvelle couche 2D si demandé, calcule la zone de découpe, déclenche onDraw, dessine des contours de debug si actif, dessine les enfants visibles, puis les bordures et le texte de debug du focus. |
| `GuiElement:onOpen()` | 884 | ✍ Déclenche le callback onOpen et notifie tous les enfants. |
| `GuiElement:onClose()` | 895 | ✍ Déclenche le callback onClose et notifie tous les enfants. |
| `GuiElement:shouldFocusChange(direction: any)` | 905 | ✍ Renvoie true seulement si chaque enfant accepte que le focus change dans la direction donnée. |
| `GuiElement:canReceiveFocus()` | 918 | ✍ Renvoie false par défaut ; les sous-classes focalisables la surchargent. |
| `GuiElement:onFocusLeave()` | 925 | ✍ Retire le focus de cet élément et de ses enfants et efface le texte d'infobulle si un élément d'infobulle est utilisé. |
| `GuiElement:onFocusEnter()` | 941 | ✍ Donne le focus à cet élément et à ses enfants et affiche le texte d'infobulle dans l'élément dédié s'il est configuré. |
| `GuiElement:onFocusActivate()` | 957 | ✍ Propage l'activation du focus aux enfants qui gèrent le focus. |
| `GuiElement:onHighlight()` | 969 | ✍ Marque cet élément et ses enfants comme surlignés, affiche l'infobulle et déplace le focus ici si focusOnHighlight est actif. |
| `GuiElement:onHighlightRemove()` | 989 | ✍ Retire le surlignage de cet élément et de ses enfants et efface le texte d'infobulle. |
| `GuiElement:getHandleFocus()` | 1004 | ✍ Renvoie si l'élément participe à la gestion du focus. |
| `GuiElement:setHandleFocus(handleFocus: any)` | 1010 | ✍ Définit si l'élément participe à la gestion du focus. |
| `GuiElement:addElement(element: any)` | 1016 | ✍ Ajoute un enfant à la fin, en le retirant d'abord de son ancien parent, et renseigne son champ parent. |
| `GuiElement:removeElement(element: any)` | 1027 | ✍ Retire un enfant de la liste et efface son parent. L'enfant n'est pas supprimé. |
| `GuiElement:unlinkElement()` | 1040 | ✍ Détache cet élément de son parent sans le supprimer. |
| `GuiElement:updateAbsolutePosition()` | 1049 | ✍ Calcule la position et la taille absolues à partir des bordures du parent, des ancres et des deltas d'ancrage, puis met à jour tous les enfants et les rectangles du cadre. |
| `GuiElement:reset()` | 1080 | ✍ Réinitialise récursivement tous les enfants ; la classe de base n'a pas d'état propre à réinitialiser. |
| `GuiElement:isChildOf(element: any)` | 1089 | ✍ Remonte la chaîne des parents et renvoie true si l'élément donné est un ancêtre. Renvoie false pour lui-même. |
| `GuiElement:getFocusTarget(incomingDirection: incomingDirection, moveDirection: moveDirection) → GuiElement` | 1115 | ✍ Renvoie l'élément qui doit réellement recevoir le focus ; la classe de base se renvoie elle-même. |
| `GuiElement:setPosition(x: any, y: any)` | 1121 | ✍ Définit la position relative (nil conserve l'axe), puis rafraîchit les deltas d'ancrage et les positions absolues. |
| `GuiElement:move(dx: any, dy: any)` | 1131 | ✍ Décale la position relative de dx, dy et met à jour les positions absolues. Les deltas d'ancrage ne sont pas recalculés ici. |
| `GuiElement:setAbsolutePosition(x: any, y: any)` | 1140 | ✍ Déplace l'élément à une position absolue d'écran et décale tous les enfants du même écart, puis met à jour le cadre. Les champs de position relative ne changent pas. |
| `GuiElement:setSize(x: boolean, y: any, updateChildAnchorDeltas: boolean)` | 1162 | ✍ Définit la taille (nil conserve l'axe), en imposant au moins un pixel sur les axes non nuls si la protection des lignes fines est active, puis met à jour les deltas d'ancrage et les positions absolues. |
| `GuiElement:setVisible(visible: any)` | 1185 | ✍ Définit l'indicateur visible propre à cet élément. |
| `GuiElement:getIsVisible()` | 1192 | ✍ Vrai si cet élément et tous ses ancêtres sont visibles. |
| `GuiElement:getIsVisibleNonRec()` | 1206 | ✍ Vrai si cet élément est visible et son alpha supérieur à zéro ; les parents ne sont pas vérifiés. |
| `GuiElement:setDisabled(disabled: disabled, blockDelegate: any)` | 1214 | ✍ Définit l'indicateur désactivé et, si updateChildrenState est actif et la délégation non bloquée, l'applique à tous les enfants. |
| `GuiElement:getIsDisabled()` | 1226 | ✍ Renvoie l'indicateur désactivé. |
| `GuiElement:setSelected(selected: selected, blockDelegate: any)` | 1233 | ✍ Définit l'indicateur sélectionné, en le propageant aux enfants si updateChildrenState est actif et la délégation non bloquée. |
| `GuiElement:getIsSelected()` | 1245 | ✍ Renvoie l'indicateur sélectionné. |
| `GuiElement:setFocused(focused: focused, blockDelegate: any)` | 1252 | ✍ Définit l'indicateur focalisé, en le propageant aux enfants si updateChildrenState est actif et la délégation non bloquée. |
| `GuiElement:getIsFocused()` | 1264 | ✍ Renvoie l'indicateur focalisé. |
| `GuiElement:getIsHighlighted()` | 1283 | ✍ Renvoie l'indicateur surligné. |
| `GuiElement:getOverlayState()` | 1289 | ✍ Renvoie l'état d'overlay par priorité : désactivé, sélectionné, focalisé, surligné, sinon normal. |
| `GuiElement:fadeIn(factor: any)` | 1305 | ✍ Lance un fondu d'apparition au facteur de vitesse donné (1 par défaut) si fadeInTime est supérieur à zéro, sinon met l'alpha à 1 immédiatement. |
| `GuiElement:fadeOut(factor: any)` | 1317 | ✍ Lance un fondu de disparition au facteur de vitesse donné si fadeOutTime est supérieur à zéro, sinon met l'alpha à 0 immédiatement. |
| `GuiElement:setAlpha(alpha: alpha)` | 1329 | ✍ Définit l'alpha (borné de 0 à 1) sur cet élément et tous ses enfants quand il change, et arrête tout fondu à 0 ou 1. |
| `GuiElement:getIsActive()` | 1345 | ✍ Vrai si l'élément n'est pas désactivé et est visible, ancêtres compris. |
| `GuiElement:getIsActiveNonRec()` | 1351 | ✍ Vrai si l'élément n'est pas désactivé et est visible avec un alpha positif, sans vérifier les ancêtres. |
| `GuiElement:getClipArea(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 1357 | ✍ Si le clipping est actif, intersecte le rectangle de découpe reçu avec les limites de l'élément et renvoie les quatre valeurs ; sinon renvoie l'entrée inchangée. |
| `GuiElement:setSoundSuppressed(doSuppress: any)` | 1371 | ✍ Définit l'indicateur de suppression des sons sur cet élément et tous ses enfants. |
| `GuiElement:getSoundSuppressed()` | 1382 | ✍ Renvoie si les sons sont supprimés pour cet élément. |
| `GuiElement:findDescendantsRec(accumulator: accumulator, rootElement: rootElement?, predicateFunction: predicateFunction?)` | 1393 | ✍ Aide récursive : ajoute à un accumulateur chaque descendant d'une racine qui passe un prédicat optionnel, en profondeur d'abord (enfants avant l'élément testé). |
| `GuiElement:getDescendants(predicateFunction: any) → List` | 1412 | ✍ Renvoie la liste de tous les descendants, filtrée par une fonction prédicat optionnelle. |
| `GuiElement:getFirstDescendant(predicateFunction: any) → First` | 1444 | ✍ Renvoie le premier descendant qui satisfait le prédicat, ou nil. Il construit d'abord toute la liste, donc ce n'est pas bon marché. |
| `GuiElement:getDescendantById(id: id) → Element` | 1458 | ✍ Renvoie le premier descendant dont l'id égale l'id donné, ou nil. |
| `GuiElement:getDescendantByName(name: name) → Element` | 1475 | ✍ Renvoie le premier descendant dont le nom égale le nom donné, ou nil. |
| `GuiElement:fixThinLines()` | 1512 | ✍ Avec la protection des lignes fines, relève à au moins un pixel les composantes de taille non nulles et rafraîchit les positions absolues. |
| `GuiElement:getParentBorders() → number, number, number, number` | 1533 | ✍ Renvoie les bordures absolues du parent (minX, minY, maxX, maxY), ou tout l'écran 0,0,1,1 sans parent. |
| `GuiElement:getBorders() → number, number, number, number` | 1547 | ✍ Renvoie les bordures absolues de cet élément : minX, minY, maxX, maxY. |
| `GuiElement:getParentOriginalBorders() → number, number, number, number` | 1563 | ✍ Renvoie les bordures relatives (d'origine) du parent, ou 0,0,1,1 sans parent. |
| `GuiElement:getOriginalBorders() → number, number, number, number` | 1577 | ✍ Renvoie les bordures calculées à partir de la position et de la taille relatives, pas des absolues. |
| `GuiElement:getCenter() → number, number` | 1590 | ✍ Renvoie le centre absolu x, y de l'élément. |
| `GuiElement:getAspectScale() → number, number` | 1600 | ✍ Renvoie les valeurs globales d'échelle d'aspect g_aspectScaleX et g_aspectScaleY. |
| `GuiElement:addCallback(xmlFile: xmlFile, key: key, funcName: funcName)` | 1611 | ✍ Lit un nom de callback dans un attribut XML et stocke la fonction correspondante sous funcName, prise sur la cible s'il y en a une, sinon via ClassUtil.getFunction. |
| `GuiElement:raiseCallback(name: any, ...: any)` | 1635 | ✍ Appelle le callback stocké par nom de champ, avec la cible en premier argument si elle existe, et renvoie son résultat (nil s'il est absent). |
| `GuiElement.extractIndexAndNameFromID(elementId: elementId) → Index` | 1652 | ✍ Découpe un id du type nom[3] en index numérique et nom de base. Renvoie nil et l'id complet si l'id n'a pas d'index entre crochets valide. |
| `GuiElement:setId(xmlFile: any, key: any)` | 1670 | ✍ Lit l'attribut #id et le mémorise si le nom de base ne contient que lettres, chiffres et underscores ; sinon affiche une erreur et l'ignore. |
| `GuiElement:include(guiMixinType: guiMixinType)` | 1692 | ✍ Instancie un type de mixin et l'attache à cet élément. |
| `findFirstFocusableSearch()` | 1714 | ✍ Fonction globale au corps vide dans ce fichier. Elle ressemble à un reste de code sans effet ; toute logique de recherche est NON VÉRIFIÉE. |
| `GuiElement:toString()` | 1776 | ✍ Renvoie une chaîne de debug avec l'id, l'id de focus, le nom du profil et la position absolue. |
