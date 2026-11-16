---@meta
-- FS25 1.25.1.0 : vehicles/configurations/data/VehicleConfigurationDataOverwrites.lua (generated stub, FS25 Lua Atlas)

--- Configuration data module that lets a configuration edit the vehicle's in-memory XML before loading: remove properties, set string values, or clear a list while keeping one item.
---@class VehicleConfigurationDataOverwrites
VehicleConfigurationDataOverwrites = {}

--- Static. Registers the .xmlOverwrites entries: remove (path), set (path, value) and clearList (path, keepIndex).
---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationDataOverwrites.registerXMLPaths(schema, rootPath, configPath) end

--- On the vehicle XML, removes the listed paths, sets the listed values as strings, and for each clearList removes every item of the list except keepIndex. Skipped without a config key.
---@param vehicle any
---@param configItem any
---@param configId any
function VehicleConfigurationDataOverwrites.onPreLoad(vehicle, configItem, configId) end
