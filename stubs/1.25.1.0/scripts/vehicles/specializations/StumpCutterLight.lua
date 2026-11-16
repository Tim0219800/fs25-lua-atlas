---@meta
-- FS25 1.25.1.0 : vehicles/specializations/StumpCutterLight.lua (generated stub, FS25 Lua Atlas)

--- Returns true only if the vehicle type also has the TurnOnVehicle specialization.
---@param specializations table
---@return boolean
function StumpCutterLight.prerequisitesPresent(specializations) end

--- Registers the XML schema: cut reference node, cut radius (default 1), cut time (default 1) and the effects under vehicle.stumpCutterLight.
function StumpCutterLight.initSpecialization() end

--- Registers removeTreeStump and stumpCutterLightOverlapCallback on the vehicle type.
---@param vehicleType any
function StumpCutterLight.registerFunctions(vehicleType) end

--- Overrides getAreControlledActionsAllowed, getDirtMultiplier, getWearMultiplier and getConsumingLoad.
---@param vehicleType any
function StumpCutterLight.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onUpdate, onDeactivate, onTurnedOn and onTurnedOff.
---@param vehicleType any
function StumpCutterLight.registerEventListeners(vehicleType) end

--- Reads the cut node, radius and time, initializes the stump list, loads effects on clients and the 'no stump in range' warning text. Removes listeners that are useless on the current side (onUpdate on clients, effect listeners on servers without client).
---@param savegame table
function StumpCutterLight:onLoad(savegame) end

--- Deletes the effects.
function StumpCutterLight:onDelete() end

--- Server only. While turned on, accumulates the cut timer if stumps were found and, once exceeded with no overlap pending, removes them all and turns off (via controlled actions on platforms with automatic control). Starts a new async sphere overlap when none is pending.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function StumpCutterLight:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Stops the effects.
function StumpCutterLight:onDeactivate() end

--- Sets the effect fill type to wood chips and starts the effects.
function StumpCutterLight:onTurnedOn() end

--- Stops the effects.
function StumpCutterLight:onTurnedOff() end

--- Server only. Replants a tree of the stump's tree type at its position with a random yaw, increments the farm's plantedTreeCount stat, then deletes the stump node.
---@param shapeId integer
function StumpCutterLight:removeTreeStump(shapeId) end

--- Async overlap callback: keeps the object if it is a mesh split shape with the user attribute isTreeStump, then marks the overlap check as finished. Ignored if the vehicle was deleted.
---@param objectId any
function StumpCutterLight:stumpCutterLightOverlapCallback(objectId, ...) end

--- Override: returns false with the 'no stump in range' warning text when no stump is currently found; otherwise defers to the parent.
---@param superFunc any
function StumpCutterLight:getAreControlledActionsAllowed(superFunc) end

--- Override adding the work dirt multiplier while turned on.
---@param superFunc any
---@return number
function StumpCutterLight:getDirtMultiplier(superFunc) end

--- Override adding the work wear multiplier while turned on.
---@param superFunc any
---@return number
function StumpCutterLight:getWearMultiplier(superFunc) end

--- Override that adds one load entry: 1 while turned on, otherwise 0, and increments the count.
---@param superFunc any
function StumpCutterLight:getConsumingLoad(superFunc) end
