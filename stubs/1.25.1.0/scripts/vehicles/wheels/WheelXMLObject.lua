---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelXMLObject.lua (generated stub, FS25 Lua Atlas)

---@class WheelXMLObject
WheelXMLObject = {}

---@param xmlFile any
---@param baseKey any
---@param configIndex any
---@param wheelKey any
---@param indexToParentIndex any
function WheelXMLObject.new(xmlFile, baseKey, configIndex, wheelKey, indexToParentIndex) end

---@param attributeKey any
function WheelXMLObject:getValue(attributeKey, ...) end

---@param attributeKey any
function WheelXMLObject:getLocalValue(attributeKey, ...) end

---@param attributeKey any
---@param altAttributeKey any
function WheelXMLObject:getValueAlternative(attributeKey, altAttributeKey, ...) end

---@param attributeKey any
---@param text any
function WheelXMLObject:xmlWarning(attributeKey, text, ...) end

---@param oldAttributeKey any
---@param newAttribute any
function WheelXMLObject:checkDeprecatedXMLElements(oldAttributeKey, newAttribute) end

---@param key any
---@param alternativeFilename any
function WheelXMLObject:setXMLLoadKey(key, alternativeFilename) end

---@param externalFilename any
---@param configId any
function WheelXMLObject:setExternalFilename(externalFilename, configId) end

function WheelXMLObject:loadExternalXMLFile() end

function WheelXMLObject:cacheWheelMass() end
