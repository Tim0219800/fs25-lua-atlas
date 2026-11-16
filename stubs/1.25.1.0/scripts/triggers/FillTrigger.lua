---@meta
-- FS25 1.25.1.0 : triggers/FillTrigger.lua (generated stub, FS25 Lua Atlas)

--- Fuel-station style fill trigger: when a vehicle's fill unit node enters the trigger, the vehicle registers it as a fill unit trigger and can then be filled, either from a source object's fill unit or, with no source, by paying the economy price per liter. The default fill type is diesel. Methods such as getCurrentFillType and setMoneyChangeType are called but not defined in this file (UNVERIFIED, likely in elided code).
---@class FillTrigger
FillTrigger = {}

--- Map-load entry point for a trigger node placed in the i3d: builds a FillTrigger, registers a new "other" money type labelled finance_purchaseFuel, assigns it, and adds the trigger to the mission's non-updateables.
---@param id integer
function FillTrigger:onCreate(id) end

--- Creates the trigger on the given node, adds the physics trigger callback `fillTriggerCallback`, and creates a sound node at the trigger position. Stores the optional source object, fill unit index and liters-per-second cap; fill type starts as diesel and the trigger is enabled.
---@param id integer
---@param sourceObject table
---@param fillUnitIndex integer
---@param fillLitersPerSecond table?
---@param defaultFillType any
---@param customMt table?
---@return table
function FillTrigger.new(id, sourceObject, fillUnitIndex, fillLitersPerSecond, defaultFillType, customMt) end

--- Removes this trigger from every vehicle still inside it, deletes the sound sample and removes the physics trigger. Note: `self.sample` is never assigned in this file, so the sample deletion relies on code outside it.
function FillTrigger:delete() end

--- Forgets a vehicle that was deleted while in the trigger and flushes the pending money change display for its active farm, if a money type is set.
---@param vehicle table
function FillTrigger:onVehicleDeleted(vehicle) end

--- Transfers up to delta liters into the vehicle, capped by liters-per-second times dt (ms) and by the source's level and farm access. Takes from the source fill unit, or without a source charges the farm at the fill type's price per liter. Returns the amount actually added.
---@param vehicle table
---@param delta number
---@param dt any
---@return number
function FillTrigger:fillVehicle(vehicle, delta, dt) end

--- Returns true only when a source object exists, its fill unit is not empty and the vehicle's active farm may access it; a trigger without source is never activatable here.
---@param vehicle table
---@return boolean
function FillTrigger:getIsActivatable(vehicle) end

--- Physics callback that handles enter and leave events only. On enter it finds the vehicle's fill unit for the node and, if it accepts the current fill type, counts the node and calls addFillUnitTrigger on first entry. On the last leave it calls removeFillUnitTrigger and flushes money display.
---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function FillTrigger:fillTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end
