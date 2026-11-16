---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/specializations/configurations/VehicleConfigurationDataSprayerNodes.lua (generated stub, FS25 Lua Atlas)

--- Helper for vehicle configuration data in Precision Farming. It reads per-configuration sprayer nozzle nodes and weed spot spray sensor nodes from the vehicle XML and hands them to the ExtendedSprayerEffects and WeedSpotSpray specializations.
---@class VehicleConfigurationDataSprayerNodes
VehicleConfigurationDataSprayerNodes = {}

--- Registers the configuration XML keys: sprayerNozzles.nozzle (node, translation, rotation) and weedSpotSpraySensors.sensorNode (id, node, translation, rotation, bracketSize, default 1).
---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationDataSprayerNodes.registerXMLPaths(schema, rootPath, configPath) end

--- Called for a chosen configuration item. For each nozzle, clones a sprayer effect node and adds it through addExtendedSprayerNozzleEffect. If WeedSpotSpray is enabled, collects the sensor nodes and calls addWeedSpotSpraySensorNodes. Does nothing if the config key is empty.
---@param vehicle any
---@param configItem any
---@param configId any
function VehicleConfigurationDataSprayerNodes.onPrePostLoad(vehicle, configItem, configId) end
