---@meta
-- FS25 1.25.1.0 : vehicles/LicensePlate.lua (generated stub, FS25 Lua Atlas)

--- One license plate object: an i3d node with several variations, each made of value nodes (characters or static parts) and optional materials. Instances are loaded from the map license plate XML by LicensePlateManager (global `g_licensePlateManager`), then cloned for each vehicle. It displays text with CharacterLine objects using the font material, can be coloured, validated and randomised, and also registers the XML paths of the plate definition. The CharacterLine, VehicleMaterial and font classes are outside this file (UNVERIFIED).
---@class LicensePlate
LicensePlate = {}

--- Constructor. Starts at variation 1, position ANY, empty characters, and keeps a reference to `g_licensePlateManager`.
---@param customMt table?
---@return LicensePlate
function LicensePlate.new(customMt) end

--- Loads the plate from the map XML: type (ELONGATED by default), size, font settings, variations with their value nodes and materials, and an optional frame node. Fetches the font from the manager. Returns false on an unknown type or missing font.
---@param node integer
---@param filename string
---@param customEnvironment any
---@param xmlFile XMLFile
---@param key string
---@return boolean
function LicensePlate:loadFromXML(node, filename, customEnvironment, xmlFile, key) end

--- Deletes the plate i3d node.
function LicensePlate:delete() end

--- Creates an independent copy with a cloned node, copied settings and variations (value nodes rebound to the clone), then applies the current variation. The frame is shown and added to the size only if `includeFrame` is true.
---@param includeFrame boolean
---@return LicensePlate
function LicensePlate:clone(includeFrame) end

--- Applies variation, placement position and text: switches variation if needed, optionally validates the characters, then positions each value node and sets its text or visibility according to position and whether it is static. Note: indexing is byte-based, not UTF-8 safe.
---@param variationIndex integer
---@param position integer
---@param characters string
---@param validate boolean
function LicensePlate:updateData(variationIndex, position, characters, validate) end

--- Switches to another variation: deletes the children of the old non-static value nodes, creates a centered CharacterLine for each new non-static value, and applies the variation materials matching the position. Does nothing for an unknown index.
---@param variationIndex integer
---@param position any
function LicensePlate:setVariation(variationIndex, position) end

--- Returns two values: the maximum character width (font size times the font max width ratio) and the font size.
---@return number
---@return number
function LicensePlate:getFontSize() end

--- Looks up the manager color at this index and applies it with `setColor`. Does nothing if the index is invalid.
---@param colorIndex integer
function LicensePlate:setColorIndex(colorIndex) end

--- Returns the color table (r, g, b) from the manager list at this index, or nil if the index does not exist.
---@param colorIndex integer
---@return table
function LicensePlate:getColor(colorIndex) end

--- Colors the plate material named by the manager and sets the character shader parameter to the same RGB on all non-static value nodes of every variation.
---@param r number
---@param g number
---@param b number
function LicensePlate:setColor(r, g, b) end

--- Returns a table of characters for a variation: fixed characters are kept, others are drawn at random from the font set matching the node type (letters, digits, special). The first random digit is never zero.
---@param variationIndex integer
---@return table
function LicensePlate:getRandomCharacters(variationIndex) end

--- Filters the given text (string or table) with `filterText`, and replaces each changed character with the first character of the allowed set of the matching value node. Returns the corrected characters in the same form. Byte-based, not UTF-8 safe.
---@param characters table
---@return table
function LicensePlate:validateLicensePlateCharacters(characters) end

--- Steps the character at a value index by `direction` through the allowed sets (letters, digits, special) of that node, moving to the neighbouring set at the ends and clamping at the extremes. Edits and returns the given table.
---@param variationIndex integer
---@param currentCharacters table
---@param valueIndex integer
---@param direction integer
---@return table
function LicensePlate:changeCharacter(variationIndex, currentCharacters, valueIndex, direction) end

--- Builds the displayed text from the stored characters, skipping static nodes and underscores and inserting a space before nodes marked as a new section. Returns nil when the plate has no characters.
---@return string
function LicensePlate:getFormattedString() end

--- Registers the XML schema paths of a plate definition (filename, node, type, size, font, variations, values, materials, frame). Note: the registered default height is 0.2 while `loadFromXML` uses 0.3.
---@param schema XMLSchema
---@param baseName string
function LicensePlate.registerXMLPaths(schema, baseName) end
