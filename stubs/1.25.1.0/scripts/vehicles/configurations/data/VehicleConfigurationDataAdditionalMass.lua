---@meta
-- FS25 1.25.1.0 : vehicles/configurations/data/VehicleConfigurationDataAdditionalMass.lua (generated stub, FS25 Lua Atlas)

--- Static. Registers (as a shared registration) the .component entries: node, additionalMassNode, offset, additionalMass, useTotalMassReference and dependentComponentJoint index and factors.
---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationDataAdditionalMass.registerXMLPaths(schema, rootPath, configPath) end

--- For each component entry of the configuration, adds additionalMass (XML value times 0.001, so kg to t is assumed, UNVERIFIED) to the component default mass, moves its center of mass toward the given node or offset by the mass ratio, and sets dependent joint spring and damping factors if supported.
---@param vehicle any
---@param configItem any
---@param configId any
function VehicleConfigurationDataAdditionalMass.onLoad(vehicle, configItem, configId) end
