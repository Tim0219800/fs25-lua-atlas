---@meta
-- FS25 1.25.1.0 : vehicles/configurations/data/VehicleConfigurationDataSize.lua (generated stub, FS25 Lua Atlas)

--- Configuration data module that lets every configuration override or extend the occupied size of the vehicle (width, length, height, minimum sizes and offsets) used for example by the shop.
---@class VehicleConfigurationDataSize
VehicleConfigurationDataSize = {}

--- Static. Registers (shared registration) the .size attributes width, length, height, minWidth, minLength, minHeight and the three offsets.
---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationDataSize.registerXMLPaths(schema, rootPath, configPath) end

--- Writes configured width, length, height and offsets into sizeData (replacing the values), and raises the minimum sizes to the larger of old and new. Skipped without a config key.
---@param configItem any
---@param xmlFile any
---@param sizeData any
function VehicleConfigurationDataSize.onSizeLoad(configItem, xmlFile, sizeData) end
