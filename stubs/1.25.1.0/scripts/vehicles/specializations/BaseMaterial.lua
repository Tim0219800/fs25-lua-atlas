---@meta
-- FS25 1.25.1.0 : vehicles/specializations/BaseMaterial.lua (stub généré, atlas Lua FS25)

---@class BaseMaterial
BaseMaterial = {}

---@param specializations any
function BaseMaterial.prerequisitesPresent(specializations) end

function BaseMaterial.initSpecialization() end

---@param vehicleType any
function BaseMaterial.registerFunctions(vehicleType) end

---@param vehicleType any
function BaseMaterial.registerEventListeners(vehicleType) end

---@param savegame any
function BaseMaterial:onLoad(savegame) end
