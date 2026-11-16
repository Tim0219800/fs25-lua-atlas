---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ProtectedBundleVehicle.lua (generated stub, FS25 Lua Atlas)

--- Specialization for vehicles made of several parts that must behave as one unit. A bundle root stays selectable and resettable, while a bundle child is hidden from selection and overview. It has no prerequisites and reads its settings from the vehicle XML under vehicle.protectedBundleVehicle.
---@class ProtectedBundleVehicle
ProtectedBundleVehicle = {}

--- Always returns true: this specialization has no prerequisite specializations.
---@param specializations table
---@return boolean
function ProtectedBundleVehicle.prerequisitesPresent(specializations) end

--- Registers the XML schema entries isBundleRoot, isBundleChild (booleans, default false) and bundleFilename (string path) under vehicle.protectedBundleVehicle.
function ProtectedBundleVehicle.initSpecialization() end

--- Overrides getReloadXML on the vehicle type so a reset can respawn the whole bundle.
---@param vehicleType any
function ProtectedBundleVehicle.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to the onLoad and onPostDetach events.
---@param vehicleType any
function ProtectedBundleVehicle.registerEventListeners(vehicleType) end

--- Reads the XML flags and the bundle file path, and warns if no store item exists for that path. A child gets canBeReset, showInVehicleOverview and allowSelection set to false. The onPostDetach listener is kept only for a child on the server.
---@param savegame table
function ProtectedBundleVehicle:onLoad(savegame) end

--- Deletes this child vehicle after it is detached, unless a reload or teleport is running or it is already being deleted. Only registered for server-side bundle children.
function ProtectedBundleVehicle:onPostDetach() end

--- For a bundle root with a bundle file, returns the reload XML with vehicle(0)#filename replaced by the bundle file, so a reset spawns the bundle. Otherwise returns the parent result unchanged.
---@param superFunc any
---@return string
function ProtectedBundleVehicle:getReloadXML(superFunc) end
