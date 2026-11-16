---@meta
-- FS25 1.25.1.0 : vehicles/specializations/IKChains.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization that loads inverse kinematics chains from vehicle.ikChains and updates them every frame through the IKUtil helper. Used to pose articulated parts such as arms or hoses between targets. The solving itself is in IKUtil, which is not covered here (UNVERIFIED).
---@class IKChains
IKChains = {}

--- Always returns true: no prerequisite on other specializations.
---@param specializations any
function IKChains.prerequisitesPresent(specializations) end

--- Registers the XML paths of an IK chain under vehicle.ikChains.ikChain through IKUtil.
function IKChains.initSpecialization() end

--- Subscribes the specialization to onLoad and onUpdate.
---@param vehicleType any
function IKChains.registerEventListeners(vehicleType) end

--- Loads every ikChain entry with IKUtil into the specialization's chain list. If none was loaded, removes the onUpdate listener.
---@param savegame any
function IKChains:onLoad(savegame) end

--- Each frame, asks IKUtil to update all loaded IK chains of the vehicle.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function IKChains:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end
