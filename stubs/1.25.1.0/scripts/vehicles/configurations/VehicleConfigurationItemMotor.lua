---@meta
-- FS25 1.25.1.0 : vehicles/configurations/VehicleConfigurationItemMotor.lua (generated stub, FS25 Lua Atlas)

--- Configuration item (subclass of VehicleConfigurationItem) for motor options. It only adds values shown in the shop (power in hp, max speed) and an index of the consumer configuration to use.
---@class VehicleConfigurationItemMotor : VehicleConfigurationItem
VehicleConfigurationItemMotor = {}

--- Constructor, calls the parent constructor. Note: the customMt argument is ignored, the class metatable is always passed to the parent constructor.
---@param configName any
---@param customMt any
function VehicleConfigurationItemMotor.new(configName, customMt) end

--- Loads the parent data, then #hp, #maxSpeed and #consumerConfigurationIndex. Returns false if the parent load fails.
---@param xmlFile any
---@param baseKey any
---@param configKey any
---@param baseDirectory any
---@param customEnvironment any
function VehicleConfigurationItemMotor:loadFromXML(xmlFile, baseKey, configKey, baseDirectory, customEnvironment) end

--- Static. Registers the parent XML paths plus hp, maxSpeed and consumerConfigurationIndex.
---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationItemMotor.registerXMLPaths(schema, rootPath, configPath) end
