---@meta
-- FS25 1.25.1.0 : vehicles/specializations/BaseMaterial.lua (generated stub, FS25 Lua Atlas)

--- Empty specialization kept for compatibility. Despite the declared purpose of applying materials from the vehicle XML, the only code is an onLoad that warns about deprecated FS22 XML elements (vehicle.baseMaterial and the old design material configuration blocks) and points to vehicle.designColorConfigurations.
---@class BaseMaterial
BaseMaterial = {}

--- Always returns true: no other specialization is required.
---@param specializations any
function BaseMaterial.prerequisitesPresent(specializations) end

--- Empty hook, registers no XML schema entries.
function BaseMaterial.initSpecialization() end

--- Empty hook, registers no vehicle functions.
---@param vehicleType any
function BaseMaterial.registerFunctions(vehicleType) end

--- Registers the onLoad listener only.
---@param vehicleType any
function BaseMaterial.registerEventListeners(vehicleType) end

--- Checks the vehicle XML for deprecated FS22 elements (baseMaterial, baseMaterialConfigurations, designMaterialConfigurations, designMaterial2/3Configurations) and logs a deprecation message; applies no material itself.
---@param savegame any
function BaseMaterial:onLoad(savegame) end
