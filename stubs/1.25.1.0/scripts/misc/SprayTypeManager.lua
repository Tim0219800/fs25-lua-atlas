---@meta
-- FS25 1.25.1.0 : misc/SprayTypeManager.lua (generated stub, FS25 Lua Atlas)

--- Manager (subclass of AbstractManager) for spray types: fertilizer, lime and herbicide products tied to a fill type of the same name, with a consumption rate in liters per second and a ground type. Defaults come from data/maps/maps_sprayTypes.xml, then the map XML (key map.sprayTypes.sprayType) can add or modify entries. initDataStructures also publishes the global table SprayType (name to index).
---@class SprayTypeManager : AbstractManager
SprayTypeManager = {}

--- Constructor: creates the manager on top of AbstractManager with the given or default metatable.
---@param customMt any
---@return table
function SprayTypeManager.new(customMt) end

--- Resets the spray type lists and lookup tables (by name, index, fill type index) and assigns the global SprayType to the name-to-index table, so mods can read SprayType.NAME.
function SprayTypeManager:initDataStructures() end

--- Loads the base game spray types from data/maps/maps_sprayTypes.xml and registers them as base types, then closes the XML file.
function SprayTypeManager:loadDefaultTypes() end

--- Calls the parent loader, loads the default spray types, then lets XMLUtil read the map's own sprayTypes section (and mod additions) through loadSprayTypes. Returns the result of that helper.
---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function SprayTypeManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

--- Iterates over map.sprayTypes.sprayType entries of an XML file, reading #name, #litersPerSecond, #type and #sprayGroundType (via FieldSprayType) and calling addSprayType for each. Always returns true.
---@param xmlFile any
---@param missionInfo any
---@param isBaseType any
---@return boolean
function SprayTypeManager:loadSprayTypes(xmlFile, missionInfo, isBaseType) end

--- Creates a spray type bound to the fill type of the same name, or updates an existing one. The type must be FERTILIZER, LIME or HERBICIDE, otherwise a warning is printed and nil is returned. A base type that already exists is rejected; a later definition only overrides litersPerSecond and sprayGroundType (ground type defaults to 1).
---@param name string
---@param litersPerSecond number
---@param typeName any
---@param sprayGroundType any
---@param isBaseType any
---@return table
function SprayTypeManager:addSprayType(name, litersPerSecond, typeName, sprayGroundType, isBaseType) end

--- Returns the spray type object at the given index, or nil if the index is nil or unknown.
---@param index integer
---@return table
function SprayTypeManager:getSprayTypeByIndex(index) end

--- Returns the spray type with the given name (case-insensitive, uppercased internally), or nil.
---@param name string
---@return table
function SprayTypeManager:getSprayTypeByName(name) end

--- Returns the name registered for a spray type index. Despite the method name, the index is a spray type index, not a fill type index.
---@param index integer
---@return string
function SprayTypeManager:getFillTypeNameByIndex(index) end

--- Returns the spray type index for a name (case-insensitive), or nil. Despite the name, it is a spray type index, not a fill type index.
---@param name string
---@return integer
function SprayTypeManager:getFillTypeIndexByName(name) end

--- Returns the spray type object for a name (case-insensitive), or nil. Same result as getSprayTypeByName despite its name.
---@param name string
---@return table
function SprayTypeManager:getFillTypeByName(name) end

--- Returns the spray type linked to a fill type index, or nil when that fill type is not a spray product.
---@param index any
function SprayTypeManager:getSprayTypeByFillTypeIndex(index) end

--- Returns the spray type index for a fill type index, or nil if the fill type has no spray type.
---@param index integer
---@return integer
function SprayTypeManager:getSprayTypeIndexByFillTypeIndex(index) end

--- Returns the ordered list of all registered spray types.
---@return table
function SprayTypeManager:getSprayTypes() end
