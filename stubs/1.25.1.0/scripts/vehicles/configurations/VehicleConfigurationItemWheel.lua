---@meta
-- FS25 1.25.1.0 : vehicles/configurations/VehicleConfigurationItemWheel.lua (generated stub, FS25 Lua Atlas)

--- Configuration item (subclass of VehicleConfigurationItem) for wheels. Besides brand and speed values, it can generate wheel configurations dynamically from tire dimensions in the vehicle XML, using g_wheelManager to find matching tires, whitelists of tire combinations and tire categories. It rewrites the in-memory XML of generated entries, adjusts the vehicle width, and offers a fallback matcher for renamed save ids.
---@class VehicleConfigurationItemWheel : VehicleConfigurationItem
VehicleConfigurationItemWheel = {}

--- Constructor, calls the parent constructor. Note: the customMt argument is ignored, the class metatable is always passed to the parent constructor.
---@param configName any
---@param customMt any
function VehicleConfigurationItemWheel.new(configName, customMt) end

--- Loads brand and speed values and reads base wheel data (radius, width, offsets) from dimensions or wheel files. If wheels define dimensions it prepares the dynamic generation data (tire categories, tire combination whitelists merged through parent configs, max dynamic count); a brand on a dynamic config is refused with a warning. Returns true, or false if the parent fails.
---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function VehicleConfigurationItemWheel:loadFromXML(xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end

--- Returns false when wheel brand names differ, otherwise uses the parent name comparison, so same-named entries are only renamed within the same brand.
---@param otherItem any
function VehicleConfigurationItemWheel:getNeedsRenaming(otherItem) end

--- Applies the parent size handling. For generated configs it also writes the generated XML and, unless a size width is defined manually, widens sizeData.width by the largest extra tire width, offsets and additional wheel offsets.
---@param xmlFile any
---@param sizeData any
function VehicleConfigurationItemWheel:onSizeLoad(xmlFile, sizeData) end

--- Static. After the parent postLoad, makes each base item with dimension combinations non-selectable and generates dynamic entries from it, then warns about selectable items without a brand if any item has one.
---@param xmlFile any
---@param baseKey any
---@param baseDir any
---@param customEnvironment any
---@param isMod any
---@param configurationItems any
---@param storeItem any
---@param configName any
function VehicleConfigurationItemWheel.postLoad(xmlFile, baseKey, baseDir, customEnvironment, isMod, configurationItems, storeItem, configName) end

--- Static. For an unknown save id, splits ids at underscores and returns the index and saveId of the config sharing the longest leading run of parts, or nil, nil.
---@param configs any
---@param configId any
---@param configName any
---@param configFileName any
function VehicleConfigurationItemWheel.getFallbackConfigId(configs, configId, configName, configFileName) end

--- Static. Asks g_wheelManager for tires matching the dimension combinations and appends one dynamic item per combination, copying price, default flag, speeds, dependent configs and shop offsets from the base item, with saveId made of base id and wheel id.
---@param configurationItems any
---@param xmlFile any
---@param configName any
---@param baseConfigItem any
function VehicleConfigurationItemWheel.generateConfigurations(configurationItems, xmlFile, configName, baseConfigItem) end

--- For a dynamic config, copies the base config subtree in the in-memory XML, sets the real tire filename in place of dimensions and adjusts the physics yOffset by the radius change; wheels without a tire get a dummy tag so the parent wheel loads.
---@param xmlFile any
function VehicleConfigurationItemWheel:applyGeneratedConfiguration(xmlFile) end

--- Applies the object changes of this wheel configuration to the vehicle, first recursing into the parent configuration so parent changes are applied before child ones.
---@param vehicle any
---@param configurationIndexToParentConfigIndex any
---@param index any
function VehicleConfigurationItemWheel:applyObjectChanges(vehicle, configurationIndexToParentConfigIndex, index) end

--- Static. Registers the parent XML paths plus brand, maxForwardSpeed and maxForwardSpeedShop.
---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationItemWheel.registerXMLPaths(schema, rootPath, configPath) end
