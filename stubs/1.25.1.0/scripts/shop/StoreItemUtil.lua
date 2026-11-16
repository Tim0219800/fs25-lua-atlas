---@meta
-- FS25 1.25.1.0 : shop/StoreItemUtil.lua (generated stub, FS25 Lua Atlas)

--- Static helpers for store item tables: species checks (vehicle, animal, placeable, object, hand tool), configurability and leasing checks, cost sums including configuration extras, and parsing of functions, specs, brand, VRAM usage and size from store XML. It also computes footprint sizes with configuration overrides and 90-degree rotation, and registers the configuration-set XML schema paths. Depends on g_storeManager, g_brandManager, StoreSpecies and ConfigurationUtil defined elsewhere.
---@class StoreItemUtil
StoreItemUtil = {}

--- Returns true if the store item is non-nil and its species is StoreSpecies.VEHICLE.
---@param storeItem table
---@return boolean
function StoreItemUtil.getIsVehicle(storeItem) end

--- Returns true if the store item is non-nil and its species is StoreSpecies.ANIMAL.
---@param storeItem table
---@return boolean
function StoreItemUtil.getIsAnimal(storeItem) end

--- Returns true if the store item is non-nil and its species is StoreSpecies.PLACEABLE.
---@param storeItem table
---@return boolean
function StoreItemUtil.getIsPlaceable(storeItem) end

--- Returns true if the store item is non-nil and its species is StoreSpecies.OBJECT.
---@param storeItem table
---@return boolean
function StoreItemUtil.getIsObject(storeItem) end

--- Returns true if the store item is non-nil and its species is StoreSpecies.HANDTOOL.
---@param storeItem table
---@return boolean
function StoreItemUtil.getIsHandTool(storeItem) end

--- Returns true if the item has configurations and at least one configuration type offers more than one selectable option (isSelectable not false).
---@param storeItem table
---@return boolean
function StoreItemUtil.getIsConfigurable(storeItem) end

--- Returns false for hand tools, which are bought directly, and true for every other item, which goes through the shop config screen.
---@param storeItem table
---@return boolean
function StoreItemUtil.getCanBeShownInConfigScreen(storeItem) end

--- Returns true if the item allows leasing, has a runningLeasingFactor and is not a placeable.
---@param storeItem table
---@return boolean
function StoreItemUtil.getIsLeasable(storeItem) end

--- Returns the default configuration index for a configuration name by delegating to ConfigurationUtil.getDefaultConfigIdFromItems. Errors if the item has no configurations table.
---@param storeItem table
---@param configurationName string
---@return integer
function StoreItemUtil.getDefaultConfigId(storeItem, configurationName) end

--- Returns the base price plus the price of each selected configuration, via getCosts with the `price` field.
---@param storeItem table
---@param configurations table?
---@return integer
function StoreItemUtil.getDefaultPrice(storeItem, configurations) end

--- Returns the base daily upkeep plus the upkeep of each selected configuration, via getCosts with the `dailyUpkeep` field.
---@param storeItem table
---@param configurations table?
---@return integer
function StoreItemUtil.getDailyUpkeep(storeItem, configurations) end

--- Sums the item's value for a cost field (0 if absent) with the same field of each selected configuration item. Returns 0 for a nil item; the configurations argument must be a table when the item has configurations.
---@param storeItem table
---@param configurations table?
---@param costType string
---@return integer
function StoreItemUtil.getCosts(storeItem, configurations, costType) end

--- Reads the list of function texts under `<parent>.functions.function`, translated in the given mod environment, and returns them as an array, or nil if none are present.
---@param xmlFile XMLFile
---@param storeDataXMLName string
---@param customEnvironment string
---@return table?
function StoreItemUtil.getFunctionsFromXML(xmlFile, storeDataXMLName, customEnvironment) end

--- Lazily loads an item's specs from its XML if not already loaded, then does the same recursively for the items of its bundle. Spec loading itself is done by getSpecsFromXML.
---@param item any
function StoreItemUtil.loadSpecsFromXML(item) end

--- Builds a specs table by calling each registered spec type's loadFunc for the item's species, keyed by spec name. Returns the table (possibly empty).
---@param specTypes table
---@param species XMLFile
---@param xmlFile XMLFile
---@param customEnvironment string
---@param baseDirectory any
---@return table
function StoreItemUtil.getSpecsFromXML(specTypes, species, xmlFile, customEnvironment, baseDirectory) end

--- Reads the `.brand` name under the given key (default empty) and returns its index via g_brandManager. Unknown names log a warning and fall back to the default brand.
---@param xmlFile XMLFile
---@param storeDataXMLKey string
---@return integer
function StoreItemUtil.getBrandIndexFromXML(xmlFile, storeDataXMLKey) end

--- Reads memory usage values from the XML and returns shared VRAM (vertex, index and texture buffers), per-instance VRAM (instance vertex and index buffers) and the ignoreVramUsage flag. Units are as written in the XML (UNVERIFIED).
---@param xmlFile XMLFile
---@param storeDataXMLName string
---@return integer
---@return integer
---@return boolean
function StoreItemUtil.getVRamUsageFromXML(xmlFile, storeDataXMLName) end

--- Returns the position in the sub-configuration value list whose item group contains the given configuration index, or nil. Errors if the item has no subConfigurations entry for that name.
---@param storeItem any
---@param configName any
---@param configIndex any
function StoreItemUtil.getSubConfigurationIndex(storeItem, configName, configIndex) end

--- Returns the list of configuration items belonging to the sub-configuration value at position `state`. Errors if the item has no subConfigurations entry for that name.
---@param storeItem any
---@param configName any
---@param state any
function StoreItemUtil.getSubConfigurationItems(storeItem, configName, state) end

--- Loads a vehicle XML and returns its footprint size table (width, length, height and offsets) for a rotation and configurations. Returns default Vehicle sizes if the file cannot be loaded.
---@param xmlFilename any
---@param baseName any
---@param rotationOffset any
---@param configurations any
function StoreItemUtil.getSizeValues(xmlFilename, baseName, rotationOffset, configurations) end

--- Reads the base size from an already open vehicle XML, using the `base.size` element and Vehicle.DEFAULT_SIZE defaults, by delegating to getSizeValuesFromXMLByKey.
---@param xmlFilename any
---@param xmlFile any
---@param baseName any
---@param rotationOffset any
---@param configurations any
function StoreItemUtil.getSizeValuesFromXML(xmlFilename, xmlFile, baseName, rotationOffset, configurations) end

--- Reads size attributes, lets selected configuration items adjust them through onSizeLoad and applies optional minimum sizes. The rotation is snapped to 90-degree steps, swapping width and length and rotating the offsets accordingly. Returns the size table.
---@param xmlFilename any
---@param xmlFile any
---@param baseName any
---@param baseKey any
---@param elementKey any
---@param configKey any
---@param rotationOffset any
---@param configurations any
---@param defaults any
function StoreItemUtil.getSizeValuesFromXMLByKey(xmlFilename, xmlFile, baseName, baseKey, elementKey, configKey, rotationOffset, configurations, defaults) end

--- Registers on an XML schema the paths of the `configurationSets` block (title, yes/no flag, sets with name, params, default flag and configuration name, index and showWarning), matching what ConfigurationUtil.getConfigurationSetsFromXML reads.
---@param schema any
---@param baseKey any
function StoreItemUtil.registerConfigurationSetXMLPaths(schema, baseKey) end
