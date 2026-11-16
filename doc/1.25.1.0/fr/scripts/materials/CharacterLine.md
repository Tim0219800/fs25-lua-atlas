# materials/CharacterLine.lua

*[English version](../../../scripts/materials/CharacterLine.md)*

Source: `dataS/scripts/materials/CharacterLine.lua` — FS25 1.25.1.0

✍ Ligne de texte composée de formes de caractères clonées utilisant un FontMaterial, pour du texte dans le monde comme panneaux et afficheurs. Elle crée un groupe de transformation lié à un noeud, une forme par emplacement de caractère, et dispose le texte de droite à gauche avec options d'alignement, taille, échelle, épaisseur, couleur et espacement. Les données de caractères et le travail de shader sont délégués à FontMaterial.

- **CharacterLine** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `CharacterLine.new(linkNode: any, fontMaterial: any, numCharacters: any, customMt: any)` | 16 | ✍ Constructeur : crée un groupe racine lié au noeud, clone une forme par emplacement de caractère (ombres désactivées), fixe les valeurs par défaut (alignement droite et bas, épaisseur 1, normal map activée) et définit un texte vide. |
| `CharacterLine:setSizeAndScale(textSize: any, scaleX: any, scaleY: any)` | 53 | ✍ Définit la taille du texte et l'échelle X/Y ; les arguments nil conservent les valeurs actuelles. La mise en page s'applique au prochain `setText`. |
| `CharacterLine:setTextAlignment(textAlignment: any)` | 61 | ✍ Définit l'alignement horizontal (nil conserve l'actuel) ; appliqué au prochain `setText`. |
| `CharacterLine:setTextVerticalAlignment(textVerticalAlignment: any)` | 67 | ✍ Définit l'alignement vertical (nil conserve l'actuel) ; appliqué au prochain `setText`. |
| `CharacterLine:setFontThickness(fontThickness: any)` | 73 | ✍ Mémorise l'épaisseur, la convertit en valeur de shader `(t-1)/8+1` et écrit le paramètre de shader `alphaErosion` sur chaque forme de caractère. |
| `CharacterLine:setColor(textColor: any, hiddenColor: any, textEmissiveScale: any, hiddenAlpha: any)` | 84 | ✍ Met à jour la couleur du texte, la couleur masquée, l'échelle émissive et l'alpha masqué (nil conserve l'actuel) et applique la couleur du texte à chaque caractère via le matériau de police. |
| `CharacterLine:setDecalLayer(decalLayer: any)` | 102 | ✍ Définit la couche de décalque de toutes les formes de caractères (0 si nil). |
| `CharacterLine:setCastShadowmap(castShadowmap: any)` | 110 | ✍ Active ou désactive la projection d'ombres de toutes les formes de caractères. |
| `CharacterLine:setUseNormalMap(useNormalMap: any)` | 118 | ✍ Définit si le matériau de police utilise une normal map et réaffecte le matériau à chaque forme de caractère. |
| `CharacterLine:setCharacterSpacing(characterSpacing: any)` | 128 | ✍ Mémorise un multiplicateur d'espacement utilisé à la prochaine mise en page (nil vaut 1). |
| `CharacterLine:setText(text: any, updateAlignment: any)` | 134 | ✍ Remplit chaque emplacement avec les caractères du texte pris par la fin (les emplacements inutilisés reçoivent un espace) et, si `updateAlignment` n'est pas false, met à l'échelle et positionne chaque forme vers la gauche puis décale la racine selon l'alignement. À noter : `realSpacingX` retombe sur `spacingY`, ce qui ressemble à une faute de frappe. |
