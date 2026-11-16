---@meta
-- FS25 1.25.1.0 : fillTypes/FillTypeManager.lua (generated stub, FS25 Lua Atlas)

--- Manager (parent AbstractManager) owning all fill types, fill type categories, converters and fill type sound samples. It loads fill types from the base maps_fillTypes.xml, the map XML and mod XMLs, hands out lookups by index and name, builds the terrain fill layer and distance texture arrays from height types, and creates the globals FillType and FillTypeCategory (name to index). The method getFillTypesByCategoryNamesList and FillTypeDesc finalize, delete and addTerrainFillLayer are used but not in this file (UNVERIFIED).
---@class FillTypeManager : AbstractManager
FillTypeManager = {}

--- Constructor. Creates the manager through AbstractManager.new with this class's metatable.
---@param customMt table?
---@return table
function FillTypeManager.new(customMt) end

--- Resets all tables (fill types by index and name, converters, categories, sound samples, mods to load) and sets the globals FillType and FillTypeCategory to the name-to-index and category tables.
function FillTypeManager:initDataStructures() end

--- Loads the base game fill types from data/maps/maps_fillTypes.xml as base types, without finalizing them.
function FillTypeManager:loadDefaultTypes() end

--- Map load entry. Loads the default types, then the map's fill types through XMLUtil, then finalizes every fill type. Returns true if the map data loaded, else false.
---@param xmlFile integer
---@param missionInfo table
---@param baseDirectory string
---@return boolean
function FillTypeManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

--- Loads the queued mod fill type XML files (modsToLoad), logs how many each added, then finalizes all fill types. Does nothing if no mod entries are queued. The code that queues them is not in this file.
function FillTypeManager:loadModFillTypes() end

--- Deletes all fill type sound samples and calls delete on every fill type, then runs the parent unload.
function FillTypeManager:unloadMapData() end

--- Reads fill types, categories, converters and fill type sounds from an XML file or handle. For base types it first adds the UNKNOWN type and skips names that already exist; otherwise existing types are updated. Optionally finalizes each type. Returns false for a nil or 0 handle, else true.
---@param xmlFile table|integer
---@param baseDirectory string
---@param isBaseType boolean
---@param customEnv string?
---@param finalizeType any
---@return boolean
function FillTypeManager:loadFillTypes(xmlFile, baseDirectory, isBaseType, customEnv, finalizeType) end

--- Registers a fill type description, assigns it the next index and fills the name, index and title lookups. Returns false and logs an error if the network limit on the number of fill types is reached.
---@param fillTypeDesc table
---@return boolean
function FillTypeManager:addFillType(fillTypeDesc) end

--- Takes the first material of a node, lets the engine set the terrain fill plane textures (diffuse, normal, height) on it and assigns the resulting material back to the node.
---@param nodeId integer
---@param terrainRootNodeId integer
---@param diffuse boolean
---@param normal boolean
---@param height boolean
function FillTypeManager:assignFillTypeTextureArraysFromTerrain(nodeId, terrainRootNodeId, diffuse, normal, height) end

--- Same as assignFillTypeTextureArraysFromTerrain but uses custom texture names for diffuse, normal and height (empty string to skip).
---@param nodeId integer
---@param terrainRootNodeId integer
---@param diffuse string
---@param normal string
---@param height string
function FillTypeManager:assignCustomFillTypeTextureArraysFromTerrain(nodeId, terrainRootNodeId, diffuse, normal, height) end

--- Rebuilds the terrain fill layers: clears them, adds each height type's fill type as a layer, applies its visual height mappings to the terrain detail height, then finalizes the layers. Returns true.
---@param heightTypes table
---@param terrainRootNodeId integer
---@return boolean
function FillTypeManager:constructTerrainFillLayers(heightTypes, terrainRootNodeId) end

--- Builds the distance texture array for the terrain detail height from the fill types of the given height types, and returns the result of finalizing the constructor.
---@param terrainDetailHeightId integer
---@param typeFirstChannel integer
---@param typeNumChannels integer
---@param heightTypes table
---@return boolean
function FillTypeManager:constructFillTypeDistanceTextureArray(terrainDetailHeightId, typeFirstChannel, typeNumChannels, heightTypes) end

--- Returns the texture array index of a fill type, or nil if it is unknown or not in the array.
---@param index integer
---@return integer
function FillTypeManager:getTextureArrayIndexByFillTypeIndex(index) end

--- Returns the prioritized effect class name of a fill type (default "ShaderPlaneEffect"), or nil if the index is unknown.
---@param index integer
---@return string
function FillTypeManager:getPrioritizedEffectTypeByFillTypeIndex(index) end

--- Returns the smoke color of a fill type. With fruitColor true it prefers the fruit smoke color and falls back to the fill color. Returns nil if the fill type is unknown.
---@param index integer
---@param fruitColor boolean
---@return table
function FillTypeManager:getSmokeColorByFillTypeIndex(index, fruitColor) end

--- Returns the fill type object for an index, or nil.
---@param index integer
---@return table
function FillTypeManager:getFillTypeByIndex(index) end

--- Returns the upper-case name of a fill type index, or nil.
---@param index integer
---@return string
function FillTypeManager:getFillTypeNameByIndex(index) end

--- Returns the localized title of a fill type index, as stored when the type was added, or nil.
---@param index integer
---@return string
function FillTypeManager:getFillTypeTitleByIndex(index) end

--- Takes a set whose keys are fill type indices and returns a list of their names (order not guaranteed, since it iterates with pairs).
---@param indices table
---@return table
function FillTypeManager:getFillTypeNamesByIndices(indices) end

--- Returns the fill type index for a name (case-insensitive), or nil if the name is nil or unknown.
---@param name string
---@return integer
function FillTypeManager:getFillTypeIndexByName(name) end

--- Returns the fill type object for a name (case-insensitive), or nil if the name is not a valid index name or unknown.
---@param name string
---@return table
function FillTypeManager:getFillTypeByName(name) end

--- Returns the list of all fill type objects. This is the internal table; do not modify it.
---@return table
function FillTypeManager:getFillTypes() end

--- Registers a fill type category by name (validated, upper-cased) and returns its index. Returns nil with a warning for an invalid name, or for an existing name when isBaseType is true; otherwise reuses the existing index.
---@param name string
---@param isBaseType boolean
---@return integer
function FillTypeManager:addFillTypeCategory(name, isBaseType) end

--- Adds a fill type to a category in both directions (category to fill types, fill type to categories). Returns true on success, false if an argument is nil or the category does not exist.
---@param fillTypeIndex integer
---@param categoryIndex integer
---@return table
function FillTypeManager:addFillTypeToCategory(fillTypeIndex, categoryIndex) end

--- Splits space-separated category names and delegates to getFillTypesByCategoryNamesList, which is not in this dump (UNVERIFIED). Returns the (optionally supplied) result table, empty if names is nil.
---@param names string
---@param warning string?
---@param fillTypes table?
---@return table
function FillTypeManager:getFillTypesByCategoryNames(names, warning, fillTypes) end

--- Returns true if the fill type index belongs to the category with the given name, false if either is unknown.
---@param fillTypeIndex string
---@param categoryName string
---@return boolean
function FillTypeManager:getIsFillTypeInCategory(fillTypeIndex, categoryName) end

--- Splits space-separated fill type names and returns a list of fill type indices (despite the name), skipping UNKNOWN and duplicates. Unknown names optionally log the warning format. Appends to a supplied table if given.
---@param names string
---@param warning string?
---@param fillTypes table?
---@return table
function FillTypeManager:getFillTypesByNames(names, warning, fillTypes) end

--- Reads either a category list or a name list from two XML keys and returns the matching fill types. Setting both logs a warning and returns an empty list; setting neither warns only if requiresFillTypes is true.
---@param xmlFile XMLFile
---@param categoryKey string
---@param namesKey string
---@param requiresFillTypes boolean?
---@return table
function FillTypeManager:getFillTypesFromXML(xmlFile, categoryKey, namesKey, requiresFillTypes) end

--- Registers a converter by name (validated, upper-cased) and returns its index. Returns nil with a warning for an invalid name or, when isBaseType is true, an existing name; otherwise reuses the existing index.
---@param name string
---@param isBaseType boolean
---@return any
function FillTypeManager:addFillTypeConverter(name, isBaseType) end

--- Stores a conversion from a source fill type to a target fill type with a factor in the given converter. Ignored if the converter or an index is nil or unknown.
---@param converter integer
---@param sourceFillTypeIndex integer
---@param targetFillTypeIndex integer
---@param conversionFactor number
function FillTypeManager:addFillTypeConversion(converter, sourceFillTypeIndex, targetFillTypeIndex, conversionFactor) end

--- Returns the converter data table for a converter name (case-insensitive), or nil.
---@param converterName string
---@return table
function FillTypeManager:getConverterDataByName(converterName) end

--- Returns the sound sample assigned to a fill type index (explicitly or through a default sample), or nil.
---@param fillType integer
---@return table
function FillTypeManager:getSampleByFillType(fillType) end
