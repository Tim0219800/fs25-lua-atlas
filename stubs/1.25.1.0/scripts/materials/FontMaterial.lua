---@meta
-- FS25 1.25.1.0 : materials/FontMaterial.lua (stub généré, atlas Lua FS25)

---@class FontMaterial
FontMaterial = {}

---@param customMt any
function FontMaterial.new(customMt) end

---@param xmlFile any
---@param key any
---@param customEnvironment any
---@param baseDirectory any
---@param callback any
function FontMaterial:loadFromXML(xmlFile, key, customEnvironment, baseDirectory, callback) end

---@param i3dNode any
---@param failedReason any
---@param arguments any
---@param loadingId any
function FontMaterial:onI3DFileLoaded(i3dNode, failedReason, arguments, loadingId) end

---@param char any
function FontMaterial:getCharacterIndexByCharacter(char) end

---@param index any
function FontMaterial:getCharacterByCharacterIndex(index) end

---@param node any
---@param hasNormal any
function FontMaterial:assignFontMaterialToNode(node, hasNormal) end

---@param node any
---@param targetCharacter any
---@param color any
---@param hiddenColor any
function FontMaterial:setFontCharacter(node, targetCharacter, color, hiddenColor) end

---@param node any
---@param r any
---@param g any
---@param b any
---@param a any
---@param emissive any
function FontMaterial:setFontCharacterColor(node, r, g, b, a, emissive) end

---@param alphabetical any
---@param numerical any
---@param special any
function FontMaterial:getFontMaxWidthRatio(alphabetical, numerical, special) end

---@param linkNode any
---@param hasNormal any
function FontMaterial:getClonedShape(linkNode, hasNormal) end

---@param schema any
function FontMaterial.registerXMLPaths(schema) end
