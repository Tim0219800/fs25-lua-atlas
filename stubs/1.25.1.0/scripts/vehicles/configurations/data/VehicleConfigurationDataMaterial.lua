---@meta
-- FS25 1.25.1.0 : vehicles/configurations/data/VehicleConfigurationDataMaterial.lua (generated stub, FS25 Lua Atlas)

--- Configuration data module that adds material changes to every configuration: either applying a VehicleMaterial (base, design, rim color or XML-defined) to a target material slot, or replacing one slot material by another over the vehicle components.
---@class VehicleConfigurationDataMaterial
VehicleConfigurationDataMaterial = {}

--- Static. Registers (shared registration) the .material entries: VehicleMaterial paths, ignoreWarning, node, source and target slot names, useBaseColor, useDesignColorIndex (1 to 16) and useRimColor.
---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationDataMaterial.registerXMLPaths(schema, rootPath, configPath) end

--- For each .material entry: with a materialSlotName, applies the material from the base, design or rim color configuration or a new one from XML, with a warning if the slot is missing; otherwise swaps the source slot material for the target one on the vehicle or a given node, with warnings for missing or unpaired names.
---@param vehicle any
---@param configItem any
---@param configId any
function VehicleConfigurationDataMaterial.onLoadFinished(vehicle, configItem, configId, ...) end
