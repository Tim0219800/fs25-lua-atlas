---@meta
-- FS25 1.25.1.0 : materials/CharacterLine.lua (generated stub, FS25 Lua Atlas)

--- Text line made of cloned character shapes that use a FontMaterial, for in-world text such as signs and displays. It creates a transform group linked to a node, one shape per available character slot, and lays out the text from right to left with alignment, size, scale, thickness, color and spacing options. Character data and shader work are delegated to FontMaterial.
---@class CharacterLine
CharacterLine = {}

--- Constructor: creates a root group linked to the node, clones one shape per character slot (shadow casting off), sets defaults (right and bottom alignment, thickness 1, normal map on) and sets an empty text.
---@param linkNode any
---@param fontMaterial any
---@param numCharacters any
---@param customMt any
function CharacterLine.new(linkNode, fontMaterial, numCharacters, customMt) end

--- Sets text size and X/Y scale; nil arguments keep the current values. The layout is applied at the next `setText`.
---@param textSize any
---@param scaleX any
---@param scaleY any
function CharacterLine:setSizeAndScale(textSize, scaleX, scaleY) end

--- Sets the horizontal alignment (nil keeps current); applied at the next `setText`.
---@param textAlignment any
function CharacterLine:setTextAlignment(textAlignment) end

--- Sets the vertical alignment (nil keeps current); applied at the next `setText`.
---@param textVerticalAlignment any
function CharacterLine:setTextVerticalAlignment(textVerticalAlignment) end

--- Stores the thickness, converts it to a shader value `(t-1)/8+1` and writes the `alphaErosion` shader parameter on every character shape.
---@param fontThickness any
function CharacterLine:setFontThickness(fontThickness) end

--- Updates text color, hidden color, emissive scale and hidden alpha (nil keeps current) and applies the text color to every character through the font material.
---@param textColor any
---@param hiddenColor any
---@param textEmissiveScale any
---@param hiddenAlpha any
function CharacterLine:setColor(textColor, hiddenColor, textEmissiveScale, hiddenAlpha) end

--- Sets the decal layer on all character shapes (0 if nil).
---@param decalLayer any
function CharacterLine:setDecalLayer(decalLayer) end

--- Enables or disables shadow map casting for all character shapes.
---@param castShadowmap any
function CharacterLine:setCastShadowmap(castShadowmap) end

--- Sets whether the font material uses a normal map and reassigns the font material to every character shape.
---@param useNormalMap any
function CharacterLine:setUseNormalMap(useNormalMap) end

--- Stores a spacing multiplier used in the next layout (nil means 1).
---@param characterSpacing any
function CharacterLine:setCharacterSpacing(characterSpacing) end

--- Fills each slot with the characters of the text taken from the end (unused slots get a space), and when `updateAlignment` is not false scales and positions each shape leftward and offsets the root for the chosen alignment. Note: `realSpacingX` falls back to `spacingY`, which looks like a typo.
---@param text any
---@param updateAlignment any
function CharacterLine:setText(text, updateAlignment) end
