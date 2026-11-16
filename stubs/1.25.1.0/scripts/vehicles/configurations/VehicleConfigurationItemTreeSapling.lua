---@meta
-- FS25 1.25.1.0 : vehicles/configurations/VehicleConfigurationItemTreeSapling.lua (generated stub, FS25 Lua Atlas)

--- Configuration item (subclass of VehicleConfigurationItem) for tree sapling vehicles (planters). It stores the sapling fill unit, tree type, variation and optional i3d file, and can replace the item list by one entry per plantable tree type of the map (g_treePlantManager).
---@class VehicleConfigurationItemTreeSapling : VehicleConfigurationItem
VehicleConfigurationItemTreeSapling = {}

--- Constructor, calls the parent constructor. Note: the customMt argument is ignored, the class metatable is always passed to the parent constructor.
---@param configName any
---@param customMt any
function VehicleConfigurationItemTreeSapling.new(configName, customMt) end

--- Loads the parent data, then #useMapTreeTypes (reading the capacity from the store data as number of saplings), #fillUnitIndex (default 1), #treeType (default spruce), #variationName and #filename. Returns false if the parent fails.
---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function VehicleConfigurationItemTreeSapling:loadFromXML(xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end

--- Static. After the parent postLoad, if an item uses map tree types it replaces the whole list with generated entries and stops.
---@param xmlFile any
---@param baseKey any
---@param baseDir any
---@param customEnvironment any
---@param isMod any
---@param configurationItems any
---@param storeItem any
---@param configName any
function VehicleConfigurationItemTreeSapling.postLoad(xmlFile, baseKey, baseDir, customEnvironment, isMod, configurationItems, storeItem, configName) end

--- Static. Empties the list, then adds one item per tree type with several growth stages that supports planting, priced as sapling price times the number of saplings, saveId set to the tree type name.
---@param configurationItems any
---@param xmlFile any
---@param configName any
---@param baseConfigItem any
function VehicleConfigurationItemTreeSapling.generateConfigurations(configurationItems, xmlFile, configName, baseConfigItem) end

--- Static. Registers the parent XML paths plus useMapTreeTypes, fillUnitIndex, treeType, variationName and filename.
---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationItemTreeSapling.registerXMLPaths(schema, rootPath, configPath) end
