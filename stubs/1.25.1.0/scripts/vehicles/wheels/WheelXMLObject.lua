---@meta
-- FS25 1.25.1.0 : vehicles/wheels/WheelXMLObject.lua (generated stub, FS25 Lua Atlas)

--- Helper object used while loading a wheel from a vehicle XML. It resolves each attribute either from the vehicle's own wheel entry or from an external wheel XML file (selected by filename and configId), so wheel definitions can be shared and overridden. Helpers such as getXMLFileAndKey and getXMLFileAndPropertyKey are called but their bodies are not in the SDK dump (UNVERIFIED).
---@class WheelXMLObject
WheelXMLObject = {}

--- Creates the object for a given vehicle XML file, base key, configuration index and wheel key. Stores the mod base directory and immediately calls setXMLLoadKey with an empty suffix.
---@param xmlFile any
---@param baseKey any
---@param configIndex any
---@param wheelKey any
---@param indexToParentIndex any
function WheelXMLObject.new(xmlFile, baseKey, configIndex, wheelKey, indexToParentIndex) end

--- Reads an attribute through the vehicle/external XML lookup and returns nil if the stored text is a single dash. If no source holds the key, it reads the default key on the vehicle XML so the XML value type supplies its default.
---@param attributeKey any
function WheelXMLObject:getValue(attributeKey, ...) end

--- Same as getValue but passes a flag to the key lookup, apparently to restrict it to the vehicle's own entry (exact lookup rules UNVERIFIED). A dash value yields nil; missing keys fall back to the default key.
---@param attributeKey any
function WheelXMLObject:getLocalValue(attributeKey, ...) end

--- Reads an attribute while also giving an alternative attribute key to the lookup, for values that may be stored under a second name. A dash gives nil; otherwise it falls back to the default key like getValue.
---@param attributeKey any
---@param altAttributeKey any
function WheelXMLObject:getValueAlternative(attributeKey, altAttributeKey, ...) end

--- Logs an XML warning on the vehicle file, appending the full wheel key path of the attribute to the message.
---@param attributeKey any
---@param text any
function WheelXMLObject:xmlWarning(attributeKey, text, ...) end

--- Checks the vehicle XML for an old attribute under this wheel's key and reports it as deprecated in favour of the new one, through XMLUtil.checkDeprecatedXMLElements.
---@param oldAttributeKey any
---@param newAttribute any
function WheelXMLObject:checkDeprecatedXMLElements(oldAttributeKey, newAttribute) end

--- Appends a sub-key to the wheel key, then reads #filename and #configId locally to select an external wheel file. If no filename is set, any previously loaded external XML is deleted and the external state is cleared.
---@param key any
---@param alternativeFilename any
function WheelXMLObject:setXMLLoadKey(key, alternativeFilename) end

--- Resolves the external wheel filename against the mod base directory and stores it with its configId. If either changed, the loaded external XML is deleted and the cached wheel name is reset so it will be reloaded.
---@param externalFilename any
---@param configId any
function WheelXMLObject:setExternalFilename(externalFilename, configId) end

--- Loads the external wheel XML with the Wheels.xmlSchema, stores its metadata name and finds the configuration whose id matches. Returns true on success; on failure it clears the external fields and returns false.
function WheelXMLObject:loadExternalXMLFile() end

--- Returns the wheel mass: the vehicle's own physics mass if present, else a value cached per external file and config, else the physics mass plus the masses of all additional visual parts. Returns 0.1 with no external file. Note: WheelXMLObject.wheelMassCache is indexed but not created in this file (UNVERIFIED elsewhere), and the later check for a missing external filename is unreachable.
function WheelXMLObject:cacheWheelMass() end
