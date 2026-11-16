# gui/elements/InputGlyphElementUI.lua

*[English version](../../../../scripts/gui/elements/InputGlyphElementUI.md)*

Source: `dataS/scripts/gui/elements/InputGlyphElementUI.lua` — FS25 1.25.1.0

✍ InputGlyphElementUI est un GuiElement qui enveloppe un élément de glyphe pour afficher la touche ou le bouton lié à une ou deux actions d'entrée. Clés XML ou profil : glyphColor, buttonGlyphColor, glyphBackgroundColor, isLeftAligned, inputAction, inputAction2 (les noms doivent exister dans InputAction). buildGlyph et la classe du glyphe sont définis ailleurs : NON VÉRIFIÉ.

- **InputGlyphElementUI** hérite de `GuiElement` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `InputGlyphElementUI.new(target: any, custom_mt: any)` | 19 | ✍ Constructeur. Définit les couleurs de glyphe par défaut (blanc, fond sombre), l'alignement à gauche désactivé et une liste vide de noms d'actions. |
| `InputGlyphElementUI:delete()` | 34 | ✍ Supprime l'élément de glyphe interne s'il existe, puis appelle le delete du parent. |
| `InputGlyphElementUI:loadFromXML(xmlFile: any, key: any)` | 45 | ✍ Lit couleurs et alignement, construit le glyphe et, si inputAction (et éventuellement inputAction2) est une InputAction connue, mémorise et applique les actions. Sinon réapplique les actions déjà fixées par un profil. |
| `InputGlyphElementUI:loadProfile(profile: any, applyProfile: any)` | 77 | ✍ Lit couleurs, alignement et valeurs inputAction/inputAction2 depuis le profil et construit le glyphe. Les actions sont seulement mémorisées, pas encore appliquées. À noter : la valeur par défaut passée à getValue est self.inputActionName, champ jamais défini dans ce fichier. |
| `InputGlyphElementUI:copyAttributes(src: any)` | 104 | ✍ Copie couleurs, alignement et noms d'actions d'une source ; si la source avait un glyphe, en construit un et applique les actions. |
| `InputGlyphElementUI:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 155 | ✍ Dessine l'élément via le parent, puis dessine le glyphe interne dans le rectangle de découpe donné. |
| `InputGlyphElementUI:setActions(actions: any, actionText: any, actionTextSize: any, noModifiers: any, customBinding: any)` | 165 | ✍ Transmet les actions, le texte optionnel, la taille du texte, l'indicateur de modificateurs et le binding personnalisé au glyphe, puis redimensionne cet élément à la largeur du glyphe et invalide la mise en page du parent. |
