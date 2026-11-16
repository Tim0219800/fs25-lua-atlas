---@meta
-- FS25 1.25.1.0 : vehicles/specializations/HighPressureWasher.lua (generated stub, FS25 Lua Atlas)

--- Always returns true: no prerequisite on other specializations.
---@param specializations any
function HighPressureWasher.prerequisitesPresent(specializations) end

--- Registers the XML paths under vehicle.highPressureWasher for animation nodes, effects and the start, stop and work sound samples.
function HighPressureWasher.initSpecialization() end

--- Subscribes to onLoad, onDelete, onHandToolStoredInHolder and onHandToolTakenFromHolder. Note: the two hand tool handlers are not defined in this file (UNVERIFIED).
---@param vehicleType any
function HighPressureWasher.registerEventListeners(vehicleType) end

--- Client only: loads animation nodes, effects and the three sound samples from the XML. On a dedicated server it removes the onDelete and onUpdate listeners.
---@param savegame table
function HighPressureWasher:onLoad(savegame) end

--- Client only: deletes the sound samples, animation nodes and effects created in onLoad.
function HighPressureWasher:onDelete() end
