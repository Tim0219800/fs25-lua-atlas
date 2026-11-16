---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FillTriggerVehicle.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization that turns a vehicle with a fill unit (fuel, milk, water or slurry trailers, for example) into a fill source: it creates a FillTrigger on a node of the vehicle so other vehicles can be filled from it. Requires the FillUnit specialization. Configured under vehicle.fillTriggerVehicle in the XML.
---@class FillTriggerVehicle
FillTriggerVehicle = {}

--- Returns true only if the FillUnit specialization is present.
---@param specializations table
---@return boolean
function FillTriggerVehicle.prerequisitesPresent(specializations) end

--- Registers the XML keys triggerNode, fillUnitIndex (default 1) and litersPerSecond (default 200) under vehicle.fillTriggerVehicle.
function FillTriggerVehicle.initSpecialization() end

--- Overrides getDrawFirstFillText on the vehicle type.
---@param vehicleType any
function FillTriggerVehicle.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onReadStream and onWriteStream. Note: no onReadStream function is defined in this file, so that listener points to nothing here.
---@param vehicleType any
function FillTriggerVehicle.registerEventListeners(vehicleType) end

--- If a triggerNode is configured, creates the FillTrigger with the fill unit index and flow rate. Outside the shop configuration, the server also registers a finance money type (finance_purchaseFuel) on the trigger.
---@param savegame table
function FillTriggerVehicle:onLoad(savegame) end

--- Deletes the fill trigger if one exists.
function FillTriggerVehicle:onDelete() end

--- Server to client: writes the id of the trigger's money change type as a 16-bit integer when a trigger exists. No matching read function exists in this file, so the client side is UNVERIFIED.
---@param streamId any
---@param connection any
function FillTriggerVehicle:onWriteStream(streamId, connection) end

--- On clients, returns true when the configured fill unit is empty but has a non-zero capacity; otherwise defers to the parent implementation.
---@param superFunc any
function FillTriggerVehicle:getDrawFirstFillText(superFunc) end
