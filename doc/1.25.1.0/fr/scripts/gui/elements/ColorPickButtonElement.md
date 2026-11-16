# gui/elements/ColorPickButtonElement.lua

*[English version](../../../../scripts/gui/elements/ColorPickButtonElement.md)*

Source: `dataS/scripts/gui/elements/ColorPickButtonElement.lua` — FS25 1.25.1.0

✍ Bouton utilisé dans le sélecteur de couleur, dérivé de ButtonElement. Il se remplit d'une couleur, dessine un cadre de sélection rectangulaire lorsqu'il est sélectionné ou focalisé, et superpose une icône de matériau brillant, métallique ou mat. Fonctionne avec les constantes ColorPickerDialog.MATERIAL_* (définies ailleurs). Interface côté client.

- **ColorPickButtonElement** hérite de `ButtonElement` (l.13)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ColorPickButtonElement.new(target: any, custom_mt: any)` | 22 | ✍ Constructeur : épaisseur de cadre par défaut et cadre blanc, matériau brillant, et crée trois overlays mis à l'échelle (`gui.glossyBig`, `gui.metallicBig`, `gui.matteBig`) via `g_overlayManager`. |
| `ColorPickButtonElement:loadFromXML(xmlFile: any, key: any)` | 44 | ✍ Lit `selectionFrameThickness` et `selectionFrameColor` depuis le nœud XML après les attributs du bouton parent. |
| `ColorPickButtonElement:loadProfile(profile: any, applyProfile: any)` | 54 | ✍ Lit l'épaisseur et la couleur du cadre de sélection depuis un profil GUI après les attributs du parent. |
| `ColorPickButtonElement:copyAttributes(src: any)` | 63 | ✍ Copie l'épaisseur et la couleur du cadre ainsi que le matériau d'un élément source. Les overlays d'icônes ne sont pas copiés (chaque élément crée les siens). |
| `ColorPickButtonElement:onGuiSetupFinished()` | 74 | ✍ Force la couleur d'overlay de chaque état au blanc (normal, sélectionné, focalisé, désactivé à alpha 1, survol à alpha 0,5) afin que la couleur réelle soit appliquée séparément. |
| `ColorPickButtonElement:delete()` | 109 | ✍ Supprime les trois overlays d'icônes de matériau puis exécute la suppression du parent. |
| `ColorPickButtonElement:draw(clipX1: any, clipY1: any, clipX2: any, clipY2: any)` | 119 | ✍ Dessine l'overlay aligné sur les pixels, rentré de 7 pixels avec quatre côtés de cadre en rectangles pleins quand il est sélectionné ou focalisé, un contour de debug optionnel, puis l'icône correspondant à `self.material`. Le positionnement de l'icône n'est pas défini ici (NON VÉRIFIÉ). |
