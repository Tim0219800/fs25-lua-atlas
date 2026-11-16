---@meta
-- FS25 1.25.1.0 : vehicles/configurations/VehicleConfigurationItemVehicleType.lua (generated stub, FS25 Lua Atlas)

--- Configuration item (subclass of VehicleConfigurationItem) that selects which vehicle type a configuration uses. It only stores the vehicleType name read from XML.
---@class VehicleConfigurationItemVehicleType : VehicleConfigurationItem
VehicleConfigurationItemVehicleType = {}

--- Constructor, calls the parent constructor. Note: the customMt argument is ignored, the class metatable is always passed to the parent constructor.
---@param configName any
---@param customMt any
function VehicleConfigurationItemVehicleType.new(configName, customMt) end

--- Loads the parent data, then #vehicleType. Returns false if the parent load fails.
---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function VehicleConfigurationItemVehicleType:loadFromXML(xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end

--- Static. Registers the parent XML paths plus #vehicleType.
---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationItemVehicleType.registerXMLPaths(schema, rootPath, configPath) end
