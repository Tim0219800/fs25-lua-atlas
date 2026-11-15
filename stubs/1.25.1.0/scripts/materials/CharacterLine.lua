---@meta
-- FS25 1.25.1.0 : materials/CharacterLine.lua (stub généré, atlas Lua FS25)

---@class CharacterLine
CharacterLine = {}

---@param linkNode any
---@param fontMaterial any
---@param numCharacters any
---@param customMt any
function CharacterLine.new(linkNode, fontMaterial, numCharacters, customMt) end

---@param textSize any
---@param scaleX any
---@param scaleY any
function CharacterLine:setSizeAndScale(textSize, scaleX, scaleY) end

---@param textAlignment any
function CharacterLine:setTextAlignment(textAlignment) end

---@param textVerticalAlignment any
function CharacterLine:setTextVerticalAlignment(textVerticalAlignment) end

---@param fontThickness any
function CharacterLine:setFontThickness(fontThickness) end

---@param textColor any
---@param hiddenColor any
---@param textEmissiveScale any
---@param hiddenAlpha any
function CharacterLine:setColor(textColor, hiddenColor, textEmissiveScale, hiddenAlpha) end

---@param decalLayer any
function CharacterLine:setDecalLayer(decalLayer) end

---@param castShadowmap any
function CharacterLine:setCastShadowmap(castShadowmap) end

---@param useNormalMap any
function CharacterLine:setUseNormalMap(useNormalMap) end

---@param characterSpacing any
function CharacterLine:setCharacterSpacing(characterSpacing) end

---@param text any
---@param updateAlignment any
function CharacterLine:setText(text, updateAlignment) end
