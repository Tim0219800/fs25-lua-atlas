# gui/elements/ListItemElement.lua

*[English version](../../../../scripts/gui/elements/ListItemElement.md)*

Source: `dataS/scripts/gui/elements/ListItemElement.lua` — FS25 1.25.1.0

✍ ListItemElement est un BitmapElement utilisé comme ligne ou cellule par SmoothListElement, avec une couche d'image de fond. Il gère des règles de sélection, le focus optionnel des enfants et l'alternance des couleurs de lignes, et déclenche les callbacks onFocus, onLeave et onClick depuis la souris et le tactile. Clés XML ou profil : allowSelected, autoSelectChildren, alternateChildren, hideSelection, alternateBackgroundColor.

- **ListItemElement** hérite de `BitmapElement` (l.21)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ListItemElement.new(target: any, custom_mt: any)` | 27 | ✍ Constructeur. Autorise la sélection, désactive handleFocus et l'auto-sélection des enfants, sans fond alterné, avec une table d'attributs vide. |
| `ListItemElement:loadFromXML(xmlFile: any, key: any)` | 46 | ✍ Lit allowSelected, autoSelectChildren, alternateChildren et hideSelection, et enregistre les callbacks onFocus, onLeave et onClick depuis le nœud XML. |
| `ListItemElement:loadProfile(profile: any, applyProfile: any)` | 61 | ✍ Lit les quatre options booléennes depuis le profil. Au premier chargement seulement, mémorise la couleur d'overlay normale comme backgroundColor et lit alternateBackgroundColor. |
| `ListItemElement:copyAttributes(src: any)` | 79 | ✍ Copie les options de sélection, les couleurs de fond, l'indicateur d'en-tête de section et les trois callbacks d'un élément source. |
| `ListItemElement:onClose()` | 99 | ✍ Appelle le onClose du parent, puis réinitialise l'élément. |
| `ListItemElement:setSelected(selected: any)` | 115 | ✍ Applique la sélection seulement si l'élément l'autorise et ne masque pas la sélection. |
| `ListItemElement:mouseEvent(posX: any, posY: any, isDown: any, isUp: any, button: any, eventUsed: any)` | 121 | ✍ Gère la souris quand l'élément est visible : surligne et déclenche onFocus au premier survol, déclenche onClick au clic gauche, déclenche onLeave et retire le surlignage à la sortie. Renvoie si l'événement a été utilisé. |
| `ListItemElement:touchEvent(posX: any, posY: any, isDown: any, isUp: any, touchId: any, eventUsed: any)` | 171 | ✍ Équivalent tactile de mouseEvent : surlignage et onFocus à l'entrée, onClick à l'appui, onLeave et retrait du surlignage à la sortie. Renvoie si l'événement a été utilisé. |
| `ListItemElement:getFocusTarget(incomingDirection: incomingDirection, moveDirection: moveDirection) → GuiElement` | 230 | ✍ Délègue à la cible de focus du parent seulement si autoSelectChildren est vrai ; sinon l'élément lui-même est la cible de focus. |
