# gui/elements/CheckedOptionElement.lua

*[English version](../../../../scripts/gui/elements/CheckedOptionElement.md)*

Source: `dataS/scripts/gui/elements/CheckedOptionElement.lua` — FS25 1.25.1.0

✍ Élément d'option à deux états désactivé/activé dérivé de MultiTextOptionElement ; les états sont les constantes CheckedOptionElement.STATE_UNCHECKED et STATE_CHECKED (définies ailleurs). Interface côté client.

- **CheckedOptionElement** hérite de `MultiTextOptionElement` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CheckedOptionElement.new(target: any, custom_mt: any)` | 22 | ✍ Constructeur ; construit l'élément via MultiTextOptionElement. |
| `CheckedOptionElement:addElement(element: any)` | 30 | ✍ Ajoute un enfant ; dès que le nombre d'éléments atteint 3, règle les textes d'option sur les libellés localisés désactivé/activé (`ui_off`, `ui_on`) et réapplique l'état coché. |
| `CheckedOptionElement:getIsChecked()` | 41 | ✍ Retourne true quand l'état courant vaut STATE_CHECKED. |
| `CheckedOptionElement:setIsChecked(isChecked: any)` | 47 | ✍ Règle l'état sur STATE_CHECKED ou STATE_UNCHECKED selon le booléen. |
