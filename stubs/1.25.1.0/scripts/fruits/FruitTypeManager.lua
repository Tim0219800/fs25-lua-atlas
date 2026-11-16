---@meta
-- FS25 1.25.1.0 : fruits/FruitTypeManager.lua (generated stub, FS25 Lua Atlas)

--- Manager (parent AbstractManager) that owns every fruit type, fruit type category and fruit-to-fill-type converter. It loads fruit types from the base maps_fruitTypes.xml and from the map XML, merges mod overrides, and exposes lookups by index, name and fill type, plus category and converter helpers. It also creates the global tables FruitType, FruitTypeCategory and FruitTypeConverter (name to index). Several methods it calls (addFruitType, loadMapFruitTypes, loadMapCategoriesAndConverters, loadCategoriesFromXML, loadConvertersFromXML, initializeFruitTypeConverters) are not defined in this dump (UNVERIFIED).
---@class FruitTypeManager : AbstractManager
FruitTypeManager = {}

--- Constructor. Creates the manager through AbstractManager.new with this class's metatable.
---@param customMt table?
---@return any
function FruitTypeManager.new(customMt) end

--- Resets all lookup tables (fruit types by index, name, fill type, density type, filename, converters, windrow data, categories) and sets the globals FruitType (with UNKNOWN = 0), FruitTypeCategory and FruitTypeConverter to the name-to-index tables.
function FruitTypeManager:initDataStructures() end

--- Loads the base game fruit types, categories and converters from data/maps/maps_fruitTypes.xml, flagged as base types.
function FruitTypeManager:loadDefaultTypes() end

--- Map load entry. Loads the map's fruit types first (stored as mod fruit types), then the default types, then the map's categories and converters, and finally initialises the converters. Returns true.
---@param xmlFileHandle integer
---@param missionInfo table
---@param baseDirectory string?
---@return boolean
function FruitTypeManager:loadMapData(xmlFileHandle, missionInfo, baseDirectory) end

--- Reads fruit type entries from an XML handle, each pointing to a foliage XML loaded into a FruitTypeDesc and added to the manager. A pending mod fruit type with the same name replaces the default. Remaining mod types are added, then categories and converters are read. Stops at the network limit.
---@param xmlFileHandle integer
---@param missionInfo table
---@param baseDirectory string?
---@param isBaseType boolean?
---@return boolean
function FruitTypeManager:loadFruitTypes(xmlFileHandle, missionInfo, baseDirectory, isBaseType) end

--- Returns the fruit type object for an index, or nil.
---@param index integer
---@return table
function FruitTypeManager:getFruitTypeByIndex(index) end

--- Returns the upper-case name of a fruit type by index, "UNKNOWN" for index 0, or nil if the index is not known.
---@param index integer
---@return string?
function FruitTypeManager:getFruitTypeNameByIndex(index) end

--- Returns the fruit type for a name (case-insensitive), or nil if the name is nil or unknown.
---@param name string
---@return table
function FruitTypeManager:getFruitTypeByName(name) end

--- Returns the list of all fruit types. This is the internal table; do not modify it.
---@return table
function FruitTypeManager:getFruitTypes() end

--- Returns the fruit type index linked to a fill type index, or nil if that fill type is not a fruit.
---@param index integer
---@return integer?
function FruitTypeManager:getFruitTypeIndexByFillTypeIndex(index) end

--- Returns the fruit type object matching a fill type index, or nil.
---@param index integer
---@return table?
function FruitTypeManager:getFruitTypeByFillTypeIndex(index) end

--- Returns the fill type index of a fruit type, or nil if there is none.
---@param index integer
---@return integer?
function FruitTypeManager:getFillTypeIndexByFruitTypeIndex(index) end

--- Returns the fill type object of a fruit type index, or nil.
---@param index integer
---@return table?
function FruitTypeManager:getFillTypeByFruitTypeIndex(index) end

--- Returns the fill type name of a fruit type index, or nil. Note: the local variable is named fillTypeIndex but holds the fill type object.
---@param index integer
---@return string?
function FruitTypeManager:getFillTypeNameByFruitTypeIndex(index) end

--- Returns the cut height in metres of a fruit type. With isForageCutter it prefers the forage cut height. Defaults to 0.15 when the fruit type is unknown.
---@param index integer
---@param isForageCutter boolean?
---@return number
function FruitTypeManager:getCutHeightByFruitTypeIndex(index, isForageCutter) end

--- Registers a fruit type category by name (validated, upper-cased) and returns its index. Returns nil with a warning for an invalid name, or for an existing name when isBaseType is true; otherwise an existing category index is reused.
---@param name string
---@param isBaseType boolean
---@return integer?
function FruitTypeManager:addFruitTypeCategory(name, isBaseType) end

--- Appends a fruit type index to a category. Returns true if both arguments are non-nil, else false. It does not check that the category exists or avoid duplicates.
---@param fruitTypeIndex integer
---@param categoryIndex integer
---@return table
function FruitTypeManager:addFruitTypeToCategory(fruitTypeIndex, categoryIndex) end

--- Takes space-separated category names and returns the list of fruit types in them, without duplicates. Unknown categories optionally log the given warning format.
---@param names string
---@param warning string
---@return array
function FruitTypeManager:getFruitTypesByCategoryNames(names, warning) end

--- Same as getFruitTypesByCategoryNames but returns fruit type indices instead of objects.
---@param names string
---@param warning string
---@return table
function FruitTypeManager:getFruitTypeIndicesByCategoryNames(names, warning) end

--- Takes space-separated fruit type names and returns the matching fruit types, without duplicates. Unknown names optionally log the given warning format.
---@param names string
---@param warning string?
---@return array
function FruitTypeManager:getFruitTypesByNames(names, warning) end

--- Same as getFruitTypesByNames but returns fruit type indices.
---@param names string
---@param warning string?
---@return array
function FruitTypeManager:getFruitTypeIndicesByNames(names, warning) end

--- Takes space-separated fruit type names and returns their fill type objects, without duplicates. Names with no fruit type or fill type optionally log the warning format.
---@param names string
---@param warning string?
---@return table
function FruitTypeManager:getFillTypesByFruitTypeNames(names, warning) end

--- Same as getFillTypesByFruitTypeNames but returns fill type indices.
---@param names string
---@param warning string?
---@return table
function FruitTypeManager:getFillTypeIndicesByFruitTypeNames(names, warning) end

--- Takes space-separated category names and returns the fill types of all fruit types in them, without duplicates. Unknown categories optionally log the warning format.
---@param fruitTypeCategoryNames string
---@param warning string?
---@return table
function FruitTypeManager:getFillTypesByFruitTypeCategoryNames(fruitTypeCategoryNames, warning) end

--- Same as getFillTypesByFruitTypeCategoryNames but returns fill type indices. The name is singular although it accepts several category names.
---@param fruitTypeCategoryNames string
---@param warning string?
---@return table
function FruitTypeManager:getFillTypeIndicesByFruitTypeCategoryName(fruitTypeCategoryNames, warning) end

--- Returns true if the fill type index is registered as a windrow fill type; false for nil or unknown.
---@param index integer
---@return boolean
function FruitTypeManager:isFillTypeWindrow(index) end

--- Returns the windrow fill type index of a fruit type, or nil if it has no windrow.
---@param index integer
---@return integer?
function FruitTypeManager:getWindrowFillTypeIndexByFruitTypeIndex(index) end

--- Returns the liters per square metre for a fill type: the windrow value if its fruit type has a windrow, else the harvest value. Returns defaultValue if the fill type has no fruit type.
---@param fillTypeIndex integer
---@param defaultValue number
---@return number
function FruitTypeManager:getFillTypeLiterPerSqm(fillTypeIndex, defaultValue) end

--- Registers a converter by name (validated, upper-cased) and returns its index. Returns nil with a warning for an invalid name or, if isBaseType is true, an existing name; otherwise reuses the existing index.
---@param name string
---@param isBaseType boolean
---@return integer
function FruitTypeManager:addFruitTypeConverter(name, isBaseType) end

--- Queues a fruit type to fill type conversion with a factor for a converter. It is stored as names and resolved later by initializeFruitTypeConverters (not in this dump).
---@param converter integer
---@param fruitTypeName integer
---@param fillTypeName integer
---@param conversionFactor number
function FruitTypeManager:addFruitTypeConversion(converter, fruitTypeName, fillTypeName, conversionFactor) end

--- Returns the converter data table for a converter name (case-insensitive), or nil.
---@param converterName string
---@return table
function FruitTypeManager:getConverterDataByName(converterName) end

--- Records an extra foliage type (name, XML path, optional required map mod name) to load later. Only stores the request here; the loading code is not in this file.
---@param name string
---@param filename string
---@param requiredMapModName string?
function FruitTypeManager:addModFoliageType(name, filename, requiredMapModName) end
