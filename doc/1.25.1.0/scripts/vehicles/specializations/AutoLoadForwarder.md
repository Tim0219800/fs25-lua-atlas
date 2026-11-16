# vehicles/specializations/AutoLoadForwarder.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AutoLoadForwarder.md)*

Source: `dataS/scripts/vehicles/specializations/AutoLoadForwarder.lua` — FS25 1.25.1.0

✍ Specialization for forestry forwarders with an automatic crane: it picks a tree (log) in range, carries it on the crane joint node, then drops it on the next free load place and counts it in a fill unit. It requires AutomaticArmControlForwarder, whose alignment functions drive the arm, and uses the vehicle action controller as a one-button automatic loading action. The loaded log file name is saved so logs can be recreated on load. The automatic part only runs if `Platform.gameplay.automaticVehicleControl` is true.


## Functions

| Function | Line | Description |
|---|---|---|
| `AutoLoadForwarder.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Returns true only if the vehicle type includes the AutomaticArmControlForwarder specialization. |
| `AutoLoadForwarder.initSpecialization()` | 25 | ✍ Registers the XML keys under `vehicle.autoLoadForwarder` (idle, drop and crane tree joint nodes, load places with fill unit and drop offset, grab animation) and the savegame key for the tree i3d file name. |
| `AutoLoadForwarder.registerEvents(vehicleType: any)` | 48 | ✍ Declares the event `onAutoLoadForwaderMountedTree` (spelling as in the source), raised each time a tree is mounted to the crane or a load place. |
| `AutoLoadForwarder.registerFunctions(vehicleType: any)` | 54 | ✍ Registers `mountTreeToCrane`, `addTreeToLoadPlaces`, `removeMountedObject` and `sortLoadedTreeObjects` on the vehicle type. |
| `AutoLoadForwarder.registerOverwrittenFunctions(vehicleType: any)` | 63 | ✍ Overrides `getAreControlledActionsAllowed` and `addToPhysics`. |
| `AutoLoadForwarder.registerEventListeners(vehicleType: any)` | 70 | ✍ Subscribes to onLoad, onPostLoad, onDelete, onUpdate and onRootVehicleChanged. |
| `AutoLoadForwarder:onLoad(savegame: any)` | 80 | ✍ Reads the nodes, the list of load places (only those with a valid node), the fill unit index, the drop offset and the grab animation settings, and caches the 'no tree in range' warning text. |
| `AutoLoadForwarder:onPostLoad(savegame: any)` | 114 | ✍ Sets the grab animation to its end, then if the fill unit holds logs and the savegame is not reset, empties it and recreates one ForestryLog per unit from the saved i3d file, adding each to a load place. Note: `savegame` is used without a nil check there. |
| `AutoLoadForwarder:onDelete()` | 146 | ✍ Deletes every tree object still mounted on a load place. |
| `AutoLoadForwarder:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 159 | ✍ If the fill unit is not empty, saves the i3d file name of the first tree found on a load place, converted to a network file name and HTML-encoded. |
| `AutoLoadForwarder:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 175 | ✍ State machine of the automatic loading: moves the arm to the target tree, grabs it, carries it to the next free load place and drops it, or returns to the idle node when no tree is in range or the unit is full. Only active when the platform allows automatic vehicle control. |
| `AutoLoadForwarder:onRootVehicleChanged(rootVehicle: table)` | 277 | ✍ Registers or moves the `forwarderLoading` action in the root vehicle's action controller. It is available only when no tree is grabbed and the fill unit has free space. Removes it when there is no controller. |
| `AutoLoadForwarder.actionControllerEvent(self: any, direction: any)` | 302 | ✍ Action controller callback: a negative direction asks for a return to the idle position and reopens the grab, otherwise it just clears the pending return. Both reset the automatic alignment. Always returns true. |
| `AutoLoadForwarder:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 323 | ✍ When switching the action on (direction 1), returns false plus the 'no tree in range' warning if there is no target tree; otherwise defers to the parent function. Switching off is always allowed. |
| `AutoLoadForwarder:addToPhysics(superFunc: any) → boolean` | 337 | ✍ Calls the parent function, then remounts each log on its load place as kinematic so it does not collide with the vehicle, and raises `onAutoLoadForwaderMountedTree` for each. Returns false if the parent failed. |
| `AutoLoadForwarder:mountTreeToCrane(treeId: any)` | 359 | ✍ Mounts the tree object for a node id kinematically on the crane joint node, offset by its `logRadius` user attribute (default 0.5), and raises the mounted event. Returns true on success, false if no object matches the node. |
| `AutoLoadForwarder:addTreeToLoadPlaces(treeObject: any)` | 381 | ✍ Adds one unit to the fill unit and mounts the tree on the first free load place, flipping it by 180 degrees if it points the other way. If no place is free, the tree is deleted. |
| `AutoLoadForwarder:removeMountedObject(object: integer, isDeleting: boolean)` | 412 | ✍ Frees the load place holding the given object, removes one unit from the fill unit, then compacts the remaining logs. The `isDeleting` argument is not used. |
| `AutoLoadForwarder:sortLoadedTreeObjects()` | 428 | ✍ Moves logs toward the first load places so no free place remains between occupied ones, remounting each moved log kinematically. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onAutoLoadForwaderMountedTree` | 49 |
| registerFunction | `mountTreeToCrane` | 55 |
| registerFunction | `addTreeToLoadPlaces` | 56 |
| registerFunction | `removeMountedObject` | 57 |
| registerFunction | `sortLoadedTreeObjects` | 58 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 64 |
| registerOverwrittenFunction | `addToPhysics` | 65 |
| registerEventListener | `onLoad` | 71 |
| registerEventListener | `onPostLoad` | 72 |
| registerEventListener | `onDelete` | 73 |
| registerEventListener | `onUpdate` | 74 |
| registerEventListener | `onRootVehicleChanged` | 75 |
