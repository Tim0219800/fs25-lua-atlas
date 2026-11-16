---@meta
-- FS25 1.25.1.0 : vehicles/configurations/data/VehicleConfigurationDataAttacherJoint.lua (generated stub, FS25 Lua Atlas)

--- Configuration data module that lets any configuration add attacher joints to a vehicle with the AttacherJoints specialization.
---@class VehicleConfigurationDataAttacherJoint
VehicleConfigurationDataAttacherJoint = {}

--- Static. Registers the attacher joint XML paths under the configuration path through AttacherJoints.registerAttacherJointXMLPaths.
---@param schema any
---@param rootPath any
---@param configPath any
function VehicleConfigurationDataAttacherJoint.registerXMLPaths(schema, rootPath, configPath) end

--- Before post-load, loads each .attacherJoint of the configuration and appends it to the vehicle's attacher joint list; skipped without a config key or without the specialization.
---@param vehicle any
---@param configItem any
---@param configId any
function VehicleConfigurationDataAttacherJoint.onPrePostLoad(vehicle, configItem, configId) end
