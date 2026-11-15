---@meta
-- FS25 1.25.1.0 : vehicles/LicensePlate.lua (stub généré, atlas Lua FS25)

---@class LicensePlate
LicensePlate = {}

---@param customMt table?
---@return LicensePlate
function LicensePlate.new(customMt) end

---@param node integer
---@param filename string
---@param customEnvironment any
---@param xmlFile XMLFile
---@param key string
---@return boolean
function LicensePlate:loadFromXML(node, filename, customEnvironment, xmlFile, key) end

function LicensePlate:delete() end

---@param includeFrame boolean
---@return LicensePlate
function LicensePlate:clone(includeFrame) end

---@param variationIndex integer
---@param position integer
---@param characters string
---@param validate boolean
function LicensePlate:updateData(variationIndex, position, characters, validate) end

---@param variationIndex integer
---@param position any
function LicensePlate:setVariation(variationIndex, position) end

---@return number
---@return number
function LicensePlate:getFontSize() end

---@param colorIndex integer
function LicensePlate:setColorIndex(colorIndex) end

---@param colorIndex integer
---@return table
function LicensePlate:getColor(colorIndex) end

---@param r number
---@param g number
---@param b number
function LicensePlate:setColor(r, g, b) end

---@param variationIndex integer
---@return table
function LicensePlate:getRandomCharacters(variationIndex) end

---@param characters table
---@return table
function LicensePlate:validateLicensePlateCharacters(characters) end

---@param variationIndex integer
---@param currentCharacters table
---@param valueIndex integer
---@param direction integer
---@return table
function LicensePlate:changeCharacter(variationIndex, currentCharacters, valueIndex, direction) end

---@return string
function LicensePlate:getFormattedString() end

---@param schema XMLSchema
---@param baseName string
function LicensePlate.registerXMLPaths(schema, baseName) end
