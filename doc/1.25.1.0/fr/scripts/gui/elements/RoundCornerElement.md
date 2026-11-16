# gui/elements/RoundCornerElement.lua

*[English version](../../../../scripts/gui/elements/RoundCornerElement.md)*

Source: `dataS/scripts/gui/elements/RoundCornerElement.lua` — FS25 1.25.1.0

✍ Élément d'interface qui dessine un rectangle plein à coins arrondis dans une couleur dépendant de l'état (normal, désactivé, pressé, sélectionné, focalisé, survolé). Il étend GuiElement et sert aux fonds et curseurs arrondis, par exemple créés par les profils par défaut de MultiTextOptionElement. La taille des coins est en unités où 1 vaut 20 px d'après la source.

- **RoundCornerElement** hérite de `GuiElement` (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `RoundCornerElement.new(target: any, custom_mt: any)` | 18 | ✍ Constructeur. Crée l'élément avec le blanc opaque comme couleur de base et une taille de coin de 1. |
| `RoundCornerElement:loadFromXML(xmlFile: any, key: any)` | 30 | ✍ Charge l'élément de base, puis lit les attributs de couleur (color, colorDisabled, colorHighlighted, colorSelected, colorFocused, colorPressed) et cornerSize depuis le XML. |
| `RoundCornerElement:loadProfile(profile: any, applyProfile: any)` | 68 | ✍ Charge le profil de base, puis les six couleurs sous forme de tableaux de couleurs (dégradés possibles) et cornerSize (converti en nombre) depuis le profil. |
| `RoundCornerElement:copyAttributes(src: any)` | 106 | ✍ Copie la couleur de base et les couleurs d'état définies sur la source (en nouvelles tables), ainsi que la taille des coins. |
| `RoundCornerElement:getColor()` | 132 | ✍ Retourne la couleur de l'état courant, testé dans l'ordre désactivé, pressé, sélectionné, focalisé, survolé ; retombe sur la couleur de base si la couleur d'état n'est pas définie. |
| `RoundCornerElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 151 | ✍ Dessine un rectangle plein arrondi à la position et taille absolues avec la couleur d'état et les limites de clipping, puis exécute le draw du parent (enfants). |
