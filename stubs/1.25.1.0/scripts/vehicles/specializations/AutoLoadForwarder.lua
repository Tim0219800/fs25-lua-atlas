---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AutoLoadForwarder.lua (generated stub, FS25 Lua Atlas)

--- Returns true only if the vehicle type includes the AutomaticArmControlForwarder specialization.
---@param specializations table
---@return boolean
function AutoLoadForwarder.prerequisitesPresent(specializations) end

--- Registers the XML keys under `vehicle.autoLoadForwarder` (idle, drop and crane tree joint nodes, load places with fill unit and drop offset, grab animation) and the savegame key for the tree i3d file name.
function AutoLoadForwarder.initSpecialization() end

--- Declares the event `onAutoLoadForwaderMountedTree` (spelling as in the source), raised each time a tree is mounted to the crane or a load place.
---@param vehicleType any
function AutoLoadForwarder.registerEvents(vehicleType) end

--- Registers `mountTreeToCrane`, `addTreeToLoadPlaces`, `removeMountedObject` and `sortLoadedTreeObjects` on the vehicle type.
---@param vehicleType any
function AutoLoadForwarder.registerFunctions(vehicleType) end

--- Overrides `getAreControlledActionsAllowed` and `addToPhysics`.
---@param vehicleType any
function AutoLoadForwarder.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onDelete, onUpdate and onRootVehicleChanged.
---@param vehicleType any
function AutoLoadForwarder.registerEventListeners(vehicleType) end

--- Reads the nodes, the list of load places (only those with a valid node), the fill unit index, the drop offset and the grab animation settings, and caches the 'no tree in range' warning text.
---@param savegame any
function AutoLoadForwarder:onLoad(savegame) end

--- Sets the grab animation to its end, then if the fill unit holds logs and the savegame is not reset, empties it and recreates one ForestryLog per unit from the saved i3d file, adding each to a load place. Note: `savegame` is used without a nil check there.
---@param savegame any
function AutoLoadForwarder:onPostLoad(savegame) end

--- Deletes every tree object still mounted on a load place.
function AutoLoadForwarder:onDelete() end

--- If the fill unit is not empty, saves the i3d file name of the first tree found on a load place, converted to a network file name and HTML-encoded.
---@param xmlFile any
---@param key any
---@param usedModNames any
function AutoLoadForwarder:saveToXMLFile(xmlFile, key, usedModNames) end

--- State machine of the automatic loading: moves the arm to the target tree, grabs it, carries it to the next free load place and drops it, or returns to the idle node when no tree is in range or the unit is full. Only active when the platform allows automatic vehicle control.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function AutoLoadForwarder:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Registers or moves the `forwarderLoading` action in the root vehicle's action controller. It is available only when no tree is grabbed and the fill unit has free space. Removes it when there is no controller.
---@param rootVehicle table
function AutoLoadForwarder:onRootVehicleChanged(rootVehicle) end

--- Action controller callback: a negative direction asks for a return to the idle position and reopens the grab, otherwise it just clears the pending return. Both reset the automatic alignment. Always returns true.
---@param self any
---@param direction any
function AutoLoadForwarder.actionControllerEvent(self, direction) end

--- When switching the action on (direction 1), returns false plus the 'no tree in range' warning if there is no target tree; otherwise defers to the parent function. Switching off is always allowed.
---@param superFunc any
---@return boolean
---@return string
function AutoLoadForwarder:getAreControlledActionsAllowed(superFunc) end

--- Calls the parent function, then remounts each log on its load place as kinematic so it does not collide with the vehicle, and raises `onAutoLoadForwaderMountedTree` for each. Returns false if the parent failed.
---@param superFunc any
---@return boolean
function AutoLoadForwarder:addToPhysics(superFunc) end

--- Mounts the tree object for a node id kinematically on the crane joint node, offset by its `logRadius` user attribute (default 0.5), and raises the mounted event. Returns true on success, false if no object matches the node.
---@param treeId any
function AutoLoadForwarder:mountTreeToCrane(treeId) end

--- Adds one unit to the fill unit and mounts the tree on the first free load place, flipping it by 180 degrees if it points the other way. If no place is free, the tree is deleted.
---@param treeObject any
function AutoLoadForwarder:addTreeToLoadPlaces(treeObject) end

--- Frees the load place holding the given object, removes one unit from the fill unit, then compacts the remaining logs. The `isDeleting` argument is not used.
---@param object integer
---@param isDeleting boolean
function AutoLoadForwarder:removeMountedObject(object, isDeleting) end

--- Moves logs toward the first load places so no free place remains between occupied ones, remounting each moved log kinematically.
function AutoLoadForwarder:sortLoadedTreeObjects() end
