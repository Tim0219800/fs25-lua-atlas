# materials/CharacterLine.lua

*[Version française](../../fr/scripts/materials/CharacterLine.md)*

Source: `dataS/scripts/materials/CharacterLine.lua` — FS25 1.25.1.0

✍ Text line made of cloned character shapes that use a FontMaterial, for in-world text such as signs and displays. It creates a transform group linked to a node, one shape per available character slot, and lays out the text from right to left with alignment, size, scale, thickness, color and spacing options. Character data and shader work are delegated to FontMaterial.

- **CharacterLine** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `CharacterLine.new(linkNode: any, fontMaterial: any, numCharacters: any, customMt: any)` | 16 | ✍ Constructor: creates a root group linked to the node, clones one shape per character slot (shadow casting off), sets defaults (right and bottom alignment, thickness 1, normal map on) and sets an empty text. |
| `CharacterLine:setSizeAndScale(textSize: any, scaleX: any, scaleY: any)` | 53 | ✍ Sets text size and X/Y scale; nil arguments keep the current values. The layout is applied at the next `setText`. |
| `CharacterLine:setTextAlignment(textAlignment: any)` | 61 | ✍ Sets the horizontal alignment (nil keeps current); applied at the next `setText`. |
| `CharacterLine:setTextVerticalAlignment(textVerticalAlignment: any)` | 67 | ✍ Sets the vertical alignment (nil keeps current); applied at the next `setText`. |
| `CharacterLine:setFontThickness(fontThickness: any)` | 73 | ✍ Stores the thickness, converts it to a shader value `(t-1)/8+1` and writes the `alphaErosion` shader parameter on every character shape. |
| `CharacterLine:setColor(textColor: any, hiddenColor: any, textEmissiveScale: any, hiddenAlpha: any)` | 84 | ✍ Updates text color, hidden color, emissive scale and hidden alpha (nil keeps current) and applies the text color to every character through the font material. |
| `CharacterLine:setDecalLayer(decalLayer: any)` | 102 | ✍ Sets the decal layer on all character shapes (0 if nil). |
| `CharacterLine:setCastShadowmap(castShadowmap: any)` | 110 | ✍ Enables or disables shadow map casting for all character shapes. |
| `CharacterLine:setUseNormalMap(useNormalMap: any)` | 118 | ✍ Sets whether the font material uses a normal map and reassigns the font material to every character shape. |
| `CharacterLine:setCharacterSpacing(characterSpacing: any)` | 128 | ✍ Stores a spacing multiplier used in the next layout (nil means 1). |
| `CharacterLine:setText(text: any, updateAlignment: any)` | 134 | ✍ Fills each slot with the characters of the text taken from the end (unused slots get a space), and when `updateAlignment` is not false scales and positions each shape leftward and offsets the root for the chosen alignment. Note: `realSpacingX` falls back to `spacingY`, which looks like a typo. |
