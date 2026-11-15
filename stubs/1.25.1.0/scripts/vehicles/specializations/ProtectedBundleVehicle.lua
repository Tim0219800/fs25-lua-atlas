---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ProtectedBundleVehicle.lua (generated stub, FS25 Lua Atlas)

---@class ProtectedBundleVehicle
ProtectedBundleVehicle = {}

---@param specializations table
---@return boolean
function ProtectedBundleVehicle.prerequisitesPresent(specializations) end

function ProtectedBundleVehicle.initSpecialization() end

---@param vehicleType any
function ProtectedBundleVehicle.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function ProtectedBundleVehicle.registerEventListeners(vehicleType) end

---@param savegame table
function ProtectedBundleVehicle:onLoad(savegame) end

function ProtectedBundleVehicle:onPostDetach() end

---@param superFunc any
---@return string
function ProtectedBundleVehicle:getReloadXML(superFunc) end
