---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AutoLoadFork.lua (generated stub, FS25 Lua Atlas)

--- Always returns true: this specialization has no prerequisite.
---@param specializations table
---@return boolean
function AutoLoadFork.prerequisitesPresent(specializations) end

--- Registers the XML keys `vehicle.autoLoadFork` (trigger node, joint node, lift animation name and speed scale) and the savegame keys for lift animation time and mounted vehicles or bales.
function AutoLoadFork.initSpecialization() end

--- Registers the vehicle functions of this specialization: trigger callback, unload checks, `doUnloadFork`, `onUnmountObject` and `mountObjectToFork`.
---@param vehicleType any
function AutoLoadFork.registerFunctions(vehicleType) end

--- Overrides `addToPhysics` and `removeFromPhysics` so the carried objects follow the vehicle in and out of the physics world.
---@param vehicleType any
function AutoLoadFork.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onDelete, onUpdate, onDeactivate, onRootVehicleChanged and onRegisterActionEvents.
---@param vehicleType any
function AutoLoadFork.registerEventListeners(vehicleType) end

--- Reads the XML configuration. On the server it registers the pallet detection trigger; on all sides it reads the joint node and lift animation and creates the empty mounted and unmounted object lists.
---@param savegame any
function AutoLoadFork:onLoad(savegame) end

--- When loading a non-reset savegame, restores the lift animation time, queues saved vehicles by unique id, and recreates, registers and mounts saved bales on the fork.
---@param savegame any
function AutoLoadFork:onPostLoad(savegame) end

--- On the server, releases every mounted object with `unmountKinematic`, then removes the trigger if there is one.
function AutoLoadFork:onDelete() end

--- Saves the lift animation time and each mounted object: a vehicle by unique id, a bale through its own save routine.
---@param xmlFile any
---@param key any
---@param usedModNames any
function AutoLoadFork:saveToXMLFile(xmlFile, key, usedModNames) end

--- On clients, registers the UNLOAD_FORK input action when the vehicle is active for input, ignoring selection, with normal text priority.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function AutoLoadFork:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Keeps a `forkLifting` action in the root vehicle's action controller: creates it with its callback and icons, moves it to a new controller, or removes it when there is none.
---@param rootVehicle table
function AutoLoadFork:onRootVehicleChanged(rootVehicle) end

--- Action controller callback: plays the lift animation forward or backward according to `direction`, scaled by its speed. Always returns true.
---@param self any
---@param direction any
function AutoLoadFork.actionControllerEvent(self, direction) end

--- Delete listener: when a mounted object is deleted, drops it from the mounted list and records it in the unmounted list with the current time.
---@param self any
---@param object any
function AutoLoadFork.onDeleteMountedObject(self, object) end

--- Trigger callback for pallets and bales. On enter, if nothing is mounted and the remount distance is zero or less, mounts the object unless it just left (`BLOCK_REMOUNT_TIME`). On leave, forgets it. Note: the first inner loop over mounted objects can never run.
---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function AutoLoadFork:onAutoLoadForkTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

--- Input callback for UNLOAD_FORK: simply calls `doUnloadFork` on the vehicle.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AutoLoadFork.actionEventUnloadFork(self, actionName, inputValue, callbackState, isAnalog) end

--- Calls the parent function, then on the server re-adds each carried object to physics. Returns false if the parent failed.
---@param superFunc any
function AutoLoadFork:addToPhysics(superFunc) end

--- Calls the parent function, then on the server removes each carried object from physics. Returns the parent's result.
---@param superFunc any
function AutoLoadFork:removeFromPhysics(superFunc) end
