---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AutoLoader.lua (generated stub, FS25 Lua Atlas)

--- Specialization for trailers or loaders that automatically pick up objects (vehicles with AutoLoadable, or bales) entering trigger nodes and place them on one or more load areas, using a 2D placement grid and an overlap check. All logic runs on the server. Mounted objects and their grid positions are saved. It plugs into the action controller as an 'auto load' action. Some functions (`onUnmountObject`, savegame restore, `onPostLoad`) have no body in the SDK dump: UNVERIFIED.
---@class AutoLoader
AutoLoader = {}

--- Always returns true: no prerequisite specialization.
---@param specializations any
function AutoLoader.prerequisitesPresent(specializations) end

--- Registers the XML keys for load areas (`vehicle.autoLoader.areas.area`: node, length, width, height, spacing, triggers with an alwaysActive flag) and the savegame keys for each mounted object.
function AutoLoader.initSpecialization() end

--- Registers the trigger and overlap callbacks, `getIsValidAutoLoaderObject`, `getIsAutoLoadingAllowed` and `onUnmountObject`.
---@param vehicleType any
function AutoLoader.registerFunctions(vehicleType) end

--- Overrides `getDynamicMountTimeToMount`, `addToPhysics` and `removeFromPhysics`.
---@param vehicleType any
function AutoLoader.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onDelete, onUpdate and onRootVehicleChanged. A debug-only onDraw registration is commented out.
---@param vehicleType any
function AutoLoader.registerEventListeners(vehicleType) end

--- Server: builds the area list from XML (default 6 x 2.5 x 4 with 0.1 spacing), creates a PlacementGrid2D per area and adds the pickup triggers. All sides: resets the active flag and loads the 'no space' and 'too large' warning texts.
---@param savegame any
function AutoLoader:onLoad(savegame) end

--- On the server, stops listening to pending objects, unmounts all mounted ones, deletes the grids and removes the triggers, then clears the object tables.
function AutoLoader:onDelete() end

--- Saves each mounted object's grid position, size and area index, plus the vehicle unique id for a vehicle or the full bale data for a bale.
---@param xmlFile any
---@param key any
---@param usedModNames any
function AutoLoader:saveToXMLFile(xmlFile, key, usedModNames) end

--- Server: ticks down skipped objects, remounts vehicles restored from a savegame, rebuilds grids when needed, then for each pending object finds a free spot, checks overlap with an `overlapBox` and mounts it via `autoLoad`. Shows a blinking warning when there is no space or the object is too large.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function AutoLoader:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Debug drawing of each area grid. It is only registered in debug builds, since the listener line is commented out.
function AutoLoader:onDraw() end

--- Calls the parent function, then on the server re-adds every mounted object to physics. Returns false if the parent failed.
---@param superFunc any
function AutoLoader:addToPhysics(superFunc) end

--- Calls the parent function, then on the server removes every mounted object from physics. Returns the parent's result.
---@param superFunc any
function AutoLoader:removeFromPhysics(superFunc) end

--- Returns true if the object is a different, not yet mounted Vehicle or Bale that supports auto loading and that the vehicle's active farm may access.
---@param object any
function AutoLoader:getIsValidAutoLoaderObject(object) end

--- Trigger callback. On enter, a valid, allowed object becomes pending for that trigger and the vehicle is woken up; objects recently skipped are refused on always-active triggers. On leave, the pending entry is removed.
---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function AutoLoader:autoLoaderPickupTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end

--- Overlap test callback: sets the area-blocked flag and stops the query when a non-trigger shape of another object (not itself, not mounted, not the pending one) is found. Returns true to continue otherwise.
---@param transformId any
function AutoLoader:autoLoaderOverlapCallback(transformId) end

--- Returns false when the vehicle has tipped over (the local up axis rises less than 0.5 above the node), true otherwise.
function AutoLoader:getIsAutoLoadingAllowed() end

--- Overrides the dynamic mount delay: returns -1 when auto loading is allowed, math.huge when it is not (never mounts). The parent function is ignored.
---@param superFunc any
function AutoLoader:getDynamicMountTimeToMount(superFunc) end

--- Registers or moves the `autoLoaderLoad` action in the root vehicle's action controller, available while objects are pending, or removes it when there is no controller.
---@param rootVehicle table
function AutoLoader:onRootVehicleChanged(rootVehicle) end

--- Action controller callback: a negative direction turns auto loading off, any other turns it on. Always returns true.
---@param self any
---@param direction any
function AutoLoader.actionControllerEvent(self, direction) end

--- Delete listener: removes the deleted object from the pending table.
---@param self any
---@param object any
function AutoLoader.onDeletePendingObject(self, object) end
