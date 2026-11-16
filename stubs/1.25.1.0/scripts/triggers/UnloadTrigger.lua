---@meta
-- FS25 1.25.1.0 : triggers/UnloadTrigger.lua (generated stub, FS25 Lua Atlas)

--- Base class (subclass of Object) for unload triggers, such as sell points and storages: it mimics a fill unit so vehicles can discharge into it, forwarding the fill to a target object that provides getIsFillTypeAllowed, getIsToolTypeAllowed, addFillLevelFromTool and getFreeCapacity. It reads accepted fill types, tool types, price scale, AI node and optional fill type conversions with a ratio. PalletUnloadTrigger and WoodUnloadTrigger derive from it. Parts of the file are empty in the dump, so some methods are not visible (UNVERIFIED).
---@class UnloadTrigger : Object
UnloadTrigger = {}

--- Registers the XML attributes of an unload trigger: exactFillRootNode, priceScale, acceptedToolTypes, the shared fill type config paths, aiNode, and repeated fillTypeConversion entries (incomingFillType, outgoingFillType, ratio default 1).
---@param schema any
---@param basePath any
function UnloadTrigger.registerXMLPaths(schema, basePath) end

--- Creates the unload trigger as a network Object with empty fill type, tool type and conversion tables.
---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function UnloadTrigger.new(isServer, isClient, customMt) end

--- Reads the exact fill root node (must have the FILLABLE collision group, else returns false) and registers it as a node object. Reads aiNode, priceScale, fill type conversions (ratio clamped 0.01 to 10000), sets the target if given, loads fill and tool types and enables the trigger. Returns true.
---@param components table
---@param xmlFile table
---@param xmlNode string
---@param target table
---@param extraAttributes table
---@param i3dMappings table
---@return boolean
function UnloadTrigger:load(components, xmlFile, xmlNode, target, extraAttributes, i3dMappings) end

--- Removes the exact fill root node from the mission's node objects if there is one, then calls the parent delete.
function UnloadTrigger:delete() end

--- Parses the acceptedToolTypes attribute into a set of tool type indices. If the attribute is absent, acceptedToolTypes is set to nil, meaning every tool type passes this filter.
---@param xmlFile XMLFile
---@param xmlNode string
function UnloadTrigger:loadAcceptedToolType(xmlFile, xmlNode) end

--- Loads the combined fill types from the XML config through g_fillTypeManager into a set. If none are configured the set becomes nil, which means no restriction by this trigger.
---@param xmlFile XMLFile
---@param xmlNode string
function UnloadTrigger:loadFillTypes(xmlFile, xmlNode) end

--- Sets the object that receives the unloaded goods. Asserts it implements getIsFillTypeAllowed, getIsToolTypeAllowed, addFillLevelFromTool and getFreeCapacity; it errors otherwise.
---@param object table
function UnloadTrigger:setTarget(object) end

--- Fill unit emulation: always returns 1, whatever the node.
---@param node integer
function UnloadTrigger:getFillUnitIndexFromNode(node) end

--- Fill unit emulation: returns the exact fill root node, ignoring the fill unit index.
---@param fillUnitIndex integer
function UnloadTrigger:getFillUnitExactFillRootNode(fillUnitIndex) end

--- Passes a delivery to the target via addFillLevelFromTool and returns the amount accepted, in incoming units. If a conversion exists for the fill type, the amount is multiplied by the ratio and sent as the outgoing type, and the result is divided back.
---@param farmId integer
---@param fillUnitIndex integer
---@param fillLevelDelta number
---@param fillTypeIndex integer
---@param toolType table
---@param fillPositionData table
---@param extraAttributes any
---@return number
function UnloadTrigger:addFillUnitFillLevel(farmId, fillUnitIndex, fillLevelDelta, fillTypeIndex, toolType, fillPositionData, extraAttributes) end

--- Fill unit emulation: returns whether the fill type is allowed, delegating to getIsFillTypeAllowed; the index is ignored.
---@param fillUnitIndex integer
---@param fillType integer
---@return boolean
function UnloadTrigger:getFillUnitAllowsFillType(fillUnitIndex, fillType) end

--- Returns whether the fill type is allowed, which currently just delegates to getIsFillTypeSupported.
---@param fillType integer
---@return boolean
function UnloadTrigger:getIsFillTypeAllowed(fillType) end

--- Returns false if a type list exists and does not contain the type. Otherwise, if a target exists, converts the type through the conversion table and asks the target getIsFillTypeAllowed. True when no check rejects it.
---@param fillType integer
---@return boolean
function UnloadTrigger:getIsFillTypeSupported(fillType) end

--- Returns the target's free capacity for the fill type and farm, divided by the ratio when a conversion applies, so it is expressed in incoming units. Returns 0 if the target has no getFreeCapacity.
---@param fillUnitIndex integer
---@param fillTypeIndex integer
---@param farmId any
---@return number
function UnloadTrigger:getFillUnitFreeCapacity(fillUnitIndex, fillTypeIndex, farmId) end

--- Returns false if an accepted tool type list exists and lacks the tool type; otherwise returns the target's own getIsToolTypeAllowed answer.
---@param toolType integer
---@return boolean
function UnloadTrigger:getIsToolTypeAllowed(toolType) end

--- Returns the custom warning text shown when discharging is refused (nil by default, set by subclasses or other code).
function UnloadTrigger:getCustomDischargeNotAllowedWarning() end

--- Signature only (no body in the SDK dump): by its name and parameters it likely returns the set of fill type names an unload trigger supports, read from the XML at the given path, for use in specification displays. UNVERIFIED.
---@param xmlFile XMLFile
---@param xmlPath string
---@param customEnvironment string?
---@param baseDir string?
---@return table?
function UnloadTrigger.loadSpecValueFillTypes(xmlFile, xmlPath, customEnvironment, baseDir) end
