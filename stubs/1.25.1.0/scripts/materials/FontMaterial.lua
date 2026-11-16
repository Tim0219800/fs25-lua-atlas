---@meta
-- FS25 1.25.1.0 : materials/FontMaterial.lua (generated stub, FS25 Lua Atlas)

--- Font definition used for in-world text: it asynchronously loads a shared i3d holding a material node (optionally a variant without normal map) and a character mesh, reads per-character UV index, spacing, offsets and type from XML, and offers helpers to assign the material, pick a glyph and set color on a shape. CharacterLine builds on it. XML lives under `fonts.font(?)` and the character type constants come from MaterialManager (not in this file).
---@class FontMaterial
FontMaterial = {}

--- Constructor: creates an empty font material object.
---@param customMt any
function FontMaterial.new(customMt) end

--- Reads name, i3d filename, material node, no-normal node and character shape paths; if name, file and node exist it prefixes the name with the mod environment and starts an async shared i3d load, otherwise calls the callback with false.
---@param xmlFile any
---@param key any
---@param customEnvironment any
---@param baseDirectory any
---@param callback any
function FontMaterial:loadFromXML(xmlFile, key, customEnvironment, baseDirectory, callback) end

--- Load callback: resolves the material and character shape nodes, unlinks them from the loaded scene, reads spacing and every `character` entry into lookup tables (exact, lower and upper case, plus lists by type), deletes the loaded i3d root and calls the callback with true if the material node was found.
---@param i3dNode any
---@param failedReason any
---@param arguments any
---@param loadingId any
function FontMaterial:onI3DFileLoaded(i3dNode, failedReason, arguments, loadingId) end

--- Returns the 1-based index of a character in the list (case-insensitive), or 0 if it is not found.
---@param char any
function FontMaterial:getCharacterIndexByCharacter(char) end

--- Returns the character value at the given list index, or nil.
---@param index any
function FontMaterial:getCharacterByCharacterIndex(index) end

--- Applies the font material to a node (the no-normal variant if `hasNormal` is false and one exists) and sets the default `spacing` shader parameter.
---@param node any
---@param hasNormal any
function FontMaterial:assignFontMaterialToNode(node, hasNormal) end

--- Makes a shape display the given character: optionally recolors it (a space becomes a hidden-colored `0`), finds glyph data (exact case then lowercase), sets visibility, `index` and `spacing` shader parameters, or hides the shape if unknown. Returns the character data or nil.
---@param node any
---@param targetCharacter any
---@param color any
---@param hiddenColor any
function FontMaterial:setFontCharacter(node, targetCharacter, color, hiddenColor) end

--- Sets the `colorScale` shader parameter of a shape, and `lightControl` when an emissive value is given.
---@param node any
---@param r any
---@param g any
---@param b any
---@param a any
---@param emissive any
function FontMaterial:setFontCharacterColor(node, r, g, b, a, emissive) end

--- Returns the largest width to height glyph ratio among the characters of the enabled types (each type is included unless its argument is false).
---@param alphabetical any
---@param numerical any
---@param special any
function FontMaterial:getFontMaxWidthRatio(alphabetical, numerical, special) end

--- Clones the character shape, links it under the given node and assigns the font material. Returns the new shape.
---@param linkNode any
---@param hasNormal any
function FontMaterial:getClonedShape(linkNode, hasNormal) end

--- Registers the `fonts.font(?)` XML paths: name, filename, node paths, spacing and per-character fields. Note: the schema default for `charToChar` is 0.1 but the loader uses 0.05 when absent.
---@param schema any
function FontMaterial.registerXMLPaths(schema) end
