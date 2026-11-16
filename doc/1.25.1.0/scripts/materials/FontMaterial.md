# materials/FontMaterial.lua

*[Version française](../../fr/scripts/materials/FontMaterial.md)*

Source: `dataS/scripts/materials/FontMaterial.lua` — FS25 1.25.1.0

✍ Font definition used for in-world text: it asynchronously loads a shared i3d holding a material node (optionally a variant without normal map) and a character mesh, reads per-character UV index, spacing, offsets and type from XML, and offers helpers to assign the material, pick a glyph and set color on a shape. CharacterLine builds on it. XML lives under `fonts.font(?)` and the character type constants come from MaterialManager (not in this file).

- **FontMaterial** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `FontMaterial.new(customMt: any)` | 16 | ✍ Constructor: creates an empty font material object. |
| `FontMaterial:loadFromXML(xmlFile: any, key: any, customEnvironment: any, baseDirectory: any, callback: any)` | 24 | ✍ Reads name, i3d filename, material node, no-normal node and character shape paths; if name, file and node exist it prefixes the name with the mod environment and starts an async shared i3d load, otherwise calls the callback with false. |
| `FontMaterial:onI3DFileLoaded(i3dNode: any, failedReason: any, arguments: any, loadingId: any)` | 59 | ✍ Load callback: resolves the material and character shape nodes, unlinks them from the loaded scene, reads spacing and every `character` entry into lookup tables (exact, lower and upper case, plus lists by type), deletes the loaded i3d root and calls the callback with true if the material node was found. |
| `FontMaterial:getCharacterIndexByCharacter(char: any)` | 135 | ✍ Returns the 1-based index of a character in the list (case-insensitive), or 0 if it is not found. |
| `FontMaterial:getCharacterByCharacterIndex(index: any)` | 147 | ✍ Returns the character value at the given list index, or nil. |
| `FontMaterial:assignFontMaterialToNode(node: any, hasNormal: any)` | 158 | ✍ Applies the font material to a node (the no-normal variant if `hasNormal` is false and one exists) and sets the default `spacing` shader parameter. |
| `FontMaterial:setFontCharacter(node: any, targetCharacter: any, color: any, hiddenColor: any)` | 172 | ✍ Makes a shape display the given character: optionally recolors it (a space becomes a hidden-colored `0`), finds glyph data (exact case then lowercase), sets visibility, `index` and `spacing` shader parameters, or hides the shape if unknown. Returns the character data or nil. |
| `FontMaterial:setFontCharacterColor(node: any, r: any, g: any, b: any, a: any, emissive: any)` | 207 | ✍ Sets the `colorScale` shader parameter of a shape, and `lightControl` when an emissive value is given. |
| `FontMaterial:getFontMaxWidthRatio(alphabetical: any, numerical: any, special: any)` | 219 | ✍ Returns the largest width to height glyph ratio among the characters of the enabled types (each type is included unless its argument is false). |
| `FontMaterial:getClonedShape(linkNode: any, hasNormal: any)` | 238 | ✍ Clones the character shape, links it under the given node and assigns the font material. Returns the new shape. |
| `FontMaterial.registerXMLPaths(schema: any)` | 248 | ✍ Registers the `fonts.font(?)` XML paths: name, filename, node paths, spacing and per-character fields. Note: the schema default for `charToChar` is 0.1 but the loader uses 0.05 when absent. |
