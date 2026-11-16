# materials/FontMaterial.lua

*[English version](../../../scripts/materials/FontMaterial.md)*

Source: `dataS/scripts/materials/FontMaterial.lua` — FS25 1.25.1.0

✍ Définition de police pour le texte dans le monde : elle charge de façon asynchrone un i3d partagé contenant un noeud de matériau (et éventuellement une variante sans normal map) et un maillage de caractère, lit depuis le XML l'indice UV, l'espacement, les décalages et le type de chaque caractère, et fournit des aides pour affecter le matériau, choisir un glyphe et définir la couleur d'une forme. CharacterLine s'appuie dessus. Le XML est sous `fonts.font(?)` et les constantes de type de caractère viennent de MaterialManager (absent de ce fichier).

- **FontMaterial** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FontMaterial.new(customMt: any)` | 16 | ✍ Constructeur : crée un objet de matériau de police vide. |
| `FontMaterial:loadFromXML(xmlFile: any, key: any, customEnvironment: any, baseDirectory: any, callback: any)` | 24 | ✍ Lit le nom, le fichier i3d et les chemins du noeud de matériau, du noeud sans normal et de la forme de caractère ; si nom, fichier et noeud existent, préfixe le nom avec l'environnement du mod et lance un chargement asynchrone de l'i3d partagé, sinon appelle le callback avec false. |
| `FontMaterial:onI3DFileLoaded(i3dNode: any, failedReason: any, arguments: any, loadingId: any)` | 59 | ✍ Callback de chargement : résout les noeuds de matériau et de forme de caractère, les détache de la scène chargée, lit l'espacement et chaque entrée `character` dans des tables de recherche (exacte, minuscule et majuscule, plus listes par type), supprime la racine i3d chargée et appelle le callback avec true si le noeud de matériau a été trouvé. |
| `FontMaterial:getCharacterIndexByCharacter(char: any)` | 135 | ✍ Renvoie l'indice (à partir de 1) d'un caractère dans la liste (insensible à la casse), ou 0 s'il est introuvable. |
| `FontMaterial:getCharacterByCharacterIndex(index: any)` | 147 | ✍ Renvoie la valeur du caractère à l'indice donné de la liste, ou nil. |
| `FontMaterial:assignFontMaterialToNode(node: any, hasNormal: any)` | 158 | ✍ Applique le matériau de police à un noeud (la variante sans normal si `hasNormal` vaut false et qu'elle existe) et fixe le paramètre de shader `spacing` par défaut. |
| `FontMaterial:setFontCharacter(node: any, targetCharacter: any, color: any, hiddenColor: any)` | 172 | ✍ Fait afficher un caractère à une forme : la recolore éventuellement (un espace devient un `0` de couleur masquée), cherche les données du glyphe (casse exacte puis minuscule), fixe visibilité et paramètres de shader `index` et `spacing`, ou masque la forme si inconnu. Renvoie les données du caractère ou nil. |
| `FontMaterial:setFontCharacterColor(node: any, r: any, g: any, b: any, a: any, emissive: any)` | 207 | ✍ Fixe le paramètre de shader `colorScale` d'une forme, et `lightControl` si une valeur émissive est donnée. |
| `FontMaterial:getFontMaxWidthRatio(alphabetical: any, numerical: any, special: any)` | 219 | ✍ Renvoie le plus grand rapport largeur sur hauteur de glyphe parmi les caractères des types activés (chaque type est inclus sauf si son argument vaut false). |
| `FontMaterial:getClonedShape(linkNode: any, hasNormal: any)` | 238 | ✍ Clone la forme de caractère, la lie sous le noeud donné et lui affecte le matériau de police. Renvoie la nouvelle forme. |
| `FontMaterial.registerXMLPaths(schema: any)` | 248 | ✍ Enregistre les chemins XML `fonts.font(?)` : nom, fichier, chemins de noeuds, espacement et champs par caractère. À noter : la valeur par défaut du schéma pour `charToChar` est 0,1 mais le chargeur utilise 0,05 en son absence. |
