# debug/elements/DebugElement.lua

*[English version](../../../../scripts/debug/elements/DebugElement.md)*

Source: `dataS/scripts/debug/elements/DebugElement.lua` — FS25 1.25.1.0

✍ DebugElement est la classe de base de tous les éléments Debug* : elle stocke position, couleur, texte optionnel, visibilité, distance de clip et le masquage quand une interface est ouverte. Les setters renvoient self pour le chaînage, et `addToManager` enregistre l'élément auprès de `g_debugManager`, qui appelle `getShouldBeDrawn` et `draw` à chaque image.

- **DebugElement** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DebugElement.new(customMt: table?) → table` | 18 | ✍ Crée un élément à l'origine, de couleur blanche, sans texte, visible, sans distance de clip et masqué quand une interface est ouverte. Les sous-classes passent leur propre métatable. |
| `DebugElement:getShouldBeDrawn() → boolean` | 55 | ✍ Indique au gestionnaire s'il faut appeler `draw` : faux si l'élément est invisible, si une interface autre que ConstructionScreen est affichée et que le masquage est actif, ou si la caméra active est plus loin que la distance de clip. À noter : le cas invisible renvoie nil et non false. |
| `DebugElement:draw()` | 76 | ✍ Implémentation de base vide ; les sous-classes la redéfinissent pour le rendu. |
| `DebugElement:addToManager(groupId: string?, lifetime: number?, maxCount: integer?) → DebugElement` | 86 | ✍ Enregistre l'élément auprès de `g_debugManager`, éventuellement dans un groupe nommé, avec une durée de vie en ms et un nombre maximal par groupe (le plus ancien est retiré en premier). Renvoie self. |
| `DebugElement:setColorRGBA(r: number, g: number, b: number, a: number?) → DebugElement` | 99 | ✍ Remplace la couleur par un nouvel objet Color construit à partir de r, g, b et d'un alpha optionnel, chacun de 0 à 1. Renvoie self. |
| `DebugElement:setIsVisible(isVisible: boolean) → DebugElement` | 178 | ✍ Affiche ou masque l'élément. Renvoie self. |
| `DebugElement:setVisbileWhenGUIOpen(isVisible: boolean) → DebugElement` | 191 | ✍ Choisit si l'élément reste visible lorsqu'une interface est ouverte (stocké inversé dans `hideWhenGuiIsOpen`). Le nom de la méthode contient une faute, Visbile. Renvoie self. |
| `DebugElement:setClipDistance(clipDistance: number?) → DebugElement` | 204 | ✍ Définit la distance maximale à la caméra à laquelle l'élément est dessiné ; nil désactive le clipping. Renvoie self. |
