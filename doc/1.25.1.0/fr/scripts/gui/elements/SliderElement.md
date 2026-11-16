# gui/elements/SliderElement.lua

*[English version](../../../../scripts/gui/elements/SliderElement.md)*

Source: `dataS/scripts/gui/elements/SliderElement.lua` — FS25 1.25.1.0

✍ Élément d'interface de curseur déplaçable (barre de défilement) qui étend GuiElement avec PlaySampleMixin. Il garde une valeur numérique entre un min et un max, dessine un fond et une poignée (éventuellement en trois parties) et attend par défaut deux enfants ButtonElement comme boutons de pas. Il peut se lier à un élément de données comme un ScrollingLayoutElement ou un SmoothListElement pour refléter sa plage de défilement, et notifie les enfants et l'élément de données via onSliderValueChanged. Les directions horizontale et verticale sont gérées.

- **SliderElement** hérite de `GuiElement` (l.36)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `SliderElement.new(target: any, custom_mt: any)` | 46 | ✍ Constructeur. Crée l'élément avec le mixin de son et les valeurs par défaut : plage 0 à 100, pas de 1, direction verticale, boutons attendus, tables d'overlays vides, curseur visible et nécessaire, sans arrondi au pas, sans réinitialisation par défaut. |
| `SliderElement:delete()` | 96 | ✍ Supprime les overlays de fin, de début, de poignée et de fond, puis exécute le delete du parent. |
| `SliderElement:loadFromXML(xmlFile: any, key: any)` | 107 | ✍ Charge les quatre overlays (image, sliderImage, startImage, endImage) et les options XML : direction (x ou y), callbacks onClick et onChanged, hasButtons, min/max (inversés avec un avertissement si nécessaire), valeur courante, pas, bitmap en trois parties, hideParentWhenEmpty, arrondi au pas, marges, tailles, ids ou noms des éléments de données/texte et resetToDefault. |
| `SliderElement:loadProfile(profile: any, applyProfile: any)` | 164 | ✍ Équivalent profil du chargeur XML : charge les overlays, la direction, l'option boutons, la plage (inversée avec avertissement), la valeur courante/par défaut, le pas, l'option trois parties, l'arrondi, les tailles, la marge, le décalage et resetToDefault. |
| `SliderElement:copyAttributes(src: any)` | 210 | ✍ Copie les overlays, la direction, la plage, la valeur, le pas, les tailles, les options, les ids d'éléments et les callbacks depuis un curseur source (en clonant les tables de taille), et clone le mixin de son. La valeur par défaut devient la valeur courante copiée. |
| `SliderElement:setSliderVisible(visible: any)` | 249 | ✍ Affiche ou masque le dessin de la poignée ; le curseur continue de fonctionner. |
| `SliderElement:onGuiSetupFinished()` | 255 | ✍ Après la construction de base, résout l'élément de texte et l'élément de données depuis la cible par id (ou par nom parmi les descendants du parent), avec un avertissement s'ils sont introuvables, et applique sliderBoxMargin en réduisant et décalant l'élément le long de son axe. |
| `SliderElement:addElement(element: any)` | 297 | ✍ Ajoute l'enfant ; si les boutons sont activés, le premier enfant devient le bouton haut et le second le bouton bas, reliés à onScrollDown/onScrollUp avec l'ordre échangé selon la direction. Les autres enfants restent inchangés. |
| `SliderElement:setDataElement(element: any)` | 331 | ✍ Lie le curseur à un élément de données (disposition défilante ou liste) : détache le précédent, stocke une référence inverse sur le nouveau dans sliderElement et appelle onBindUpdate sans mettre à jour l'élément. |
| `SliderElement:setValue(newValue: any, doNotUpdateDataElement: any, immediateMode: any)` | 347 | ✍ Définit la valeur du curseur : déplace la poignée (bornée), arrondit éventuellement au pas, arrondit à 5 décimales et borne. Si la valeur a changé, met à jour le texte, déclenche onChanged, appelle onSliderValueChanged sur les enfants et (sauf indicateur contraire) sur l'élément de données, met à jour les boutons et retourne true. |
| `SliderElement:updateSliderButtons()` | 400 | ✍ Désactive le bouton haut à la valeur maximale et le bouton bas à la valeur minimale, et les deux si le curseur est désactivé. |
| `SliderElement:setMinValue(minValue: any)` | 412 | ✍ Définit le minimum, forcé à au moins 1 (un ToDo dans la source), remonte la valeur si elle est désormais en dessous, et repositionne la poignée. |
| `SliderElement:setMaxValue(maxValue: any, newCurrentValue: any)` | 425 | ✍ Définit le maximum, forcé à au moins 1, abaisse la valeur si la valeur donnée (ou courante) le dépasse, et repositionne la poignée. Aucune vérification que le max dépasse le min. |
| `SliderElement:getMinValue()` | 442 | ✍ Retourne la valeur minimale. |
| `SliderElement:getMaxValue()` | 448 | ✍ Retourne la valeur maximale (le commentaire source dit 'set' par erreur). |
| `SliderElement:getValue()` | 454 | ✍ Retourne la valeur courante du curseur. |
| `SliderElement:updateAbsolutePosition()` | 460 | ✍ Met à jour la position absolue via le parent, puis recalcule les limites de la poignée. |
| `SliderElement:setSize(x: any, y: any)` | 467 | ✍ Redimensionne via le parent, puis recalcule les limites de la poignée. |
| `SliderElement:setSliderSize(visibleItems: any, maxItems: any)` | 474 | ✍ Si le dimensionnement automatique est actif, dimensionne la poignée le long de l'axe selon le ratio visible/total de la piste, avec des tailles minimales (plus grandes pour les bitmaps en trois parties), alignées sur les pixels. Sans boutons, redimensionne aussi les enfants à la taille de la poignée. |
| `SliderElement:updateSliderLimits()` | 501 | ✍ Recalcule les positions absolues minimale et maximale de la poignée le long de l'axe à partir de la position, de la taille et de la taille de la poignée, puis repositionne la poignée. |
| `SliderElement:setAlpha(alpha: any)` | 511 | ✍ Définit l'alpha de l'élément via le parent et le copie sur les overlays de fond et de poignée. |
| `SliderElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 523 | ✍ Gestion de la souris : l'appui gauche démarre un glissement (sur la poignée ou la piste), le relâchement déclenche onClick, la molette change la valeur d'un pas, le clic droit remet la valeur par défaut si autorisé, et le glissement convertit la position du pointeur en valeur. Arrête le glissement quand le pointeur quitte les limites sur l'axe du curseur. |
| `SliderElement:updateSliderPosition()` | 608 | ✍ Calcule la position de la poignée à partir de la valeur du curseur (inversée sur l'axe vertical), met à jour les boutons de pas et, sans boutons, déplace les enfants à la position de la poignée. |
| `SliderElement:callOnChanged()` | 630 | ✍ Déclenche le callback onChanged avec la valeur courante. |
| `SliderElement:keyEvent(unicode: any, sym: any, modifier: any, isDown: any, eventUsed: any)` | 636 | ✍ Transmet les événements clavier au parent quand l'élément est actif et retourne s'il les a consommés ; sinon retourne false. |
| `SliderElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 648 | ✍ Dessine le fond, puis la poignée si elle est visible et nécessaire (en une image ou en parties début/milieu/fin pour les bitmaps en trois parties, selon la direction), puis exécute le draw du parent. |
| `SliderElement:canReceiveFocus()` | 707 | ✍ Retourne true quand l'élément gère le focus et qu'un curseur est nécessaire (contenu plus grand que la vue). |
| `SliderElement:onFocusActivate()` | 713 | ✍ Déclenche le callback onClick avec la valeur courante quand le curseur focalisé est activé. |
| `SliderElement:onScrollUp()` | 719 | ✍ Augmente la valeur d'un pas. Relié au bouton haut ou bas selon la direction. |
| `SliderElement:onScrollDown()` | 725 | ✍ Diminue la valeur d'un pas. Relié au bouton haut ou bas selon la direction. |
| `SliderElement:onBindUpdate(element: any)` | 731 | ✍ Synchronise le curseur avec un ScrollingLayoutElement ou un SmoothListElement lié : fixe min/max selon les tailles de contenu et de vue, dimensionne la poignée, détermine si un curseur est nécessaire et fixe la valeur d'après le décalage de vue. Masque éventuellement le parent quand rien ne défile. |
| `SliderElement:isOutOfBound(posX: any, posY: any)` | 776 | ✍ Retourne true quand la position du pointeur donnée est hors de l'élément le long de l'axe du curseur (x en horizontal, y en vertical). |
