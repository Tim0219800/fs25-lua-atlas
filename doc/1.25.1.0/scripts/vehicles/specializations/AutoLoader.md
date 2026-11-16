# vehicles/specializations/AutoLoader.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AutoLoader.md)*

Source: `dataS/scripts/vehicles/specializations/AutoLoader.lua` — FS25 1.25.1.0

✍ Specialization for trailers or loaders that automatically pick up objects (vehicles with AutoLoadable, or bales) entering trigger nodes and place them on one or more load areas, using a 2D placement grid and an overlap check. All logic runs on the server. Mounted objects and their grid positions are saved. It plugs into the action controller as an 'auto load' action. Some functions (`onUnmountObject`, savegame restore, `onPostLoad`) have no body in the SDK dump: UNVERIFIED.

- **AutoLoader** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `AutoLoader.prerequisitesPresent(specializations: any)` | 15 | ✍ Always returns true: no prerequisite specialization. |
| `AutoLoader.initSpecialization()` | 21 | ✍ Registers the XML keys for load areas (`vehicle.autoLoader.areas.area`: node, length, width, height, spacing, triggers with an alwaysActive flag) and the savegame keys for each mounted object. |
| `AutoLoader.registerFunctions(vehicleType: any)` | 47 | ✍ Registers the trigger and overlap callbacks, `getIsValidAutoLoaderObject`, `getIsAutoLoadingAllowed` and `onUnmountObject`. |
| `AutoLoader.registerOverwrittenFunctions(vehicleType: any)` | 57 | ✍ Overrides `getDynamicMountTimeToMount`, `addToPhysics` and `removeFromPhysics`. |
| `AutoLoader.registerEventListeners(vehicleType: any)` | 65 | ✍ Subscribes to onLoad, onPostLoad, onDelete, onUpdate and onRootVehicleChanged. A debug-only onDraw registration is commented out. |
| `AutoLoader:onLoad(savegame: any)` | 76 | ✍ Server: builds the area list from XML (default 6 x 2.5 x 4 with 0.1 spacing), creates a PlacementGrid2D per area and adds the pickup triggers. All sides: resets the active flag and loads the 'no space' and 'too large' warning texts. |
| `AutoLoader:onDelete()` | 186 | ✍ On the server, stops listening to pending objects, unmounts all mounted ones, deletes the grids and removes the triggers, then clears the object tables. |
| `AutoLoader:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 218 | ✍ Saves each mounted object's grid position, size and area index, plus the vehicle unique id for a vehicle or the full bale data for a bale. |
| `AutoLoader:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 243 | ✍ Server: ticks down skipped objects, remounts vehicles restored from a savegame, rebuilds grids when needed, then for each pending object finds a free spot, checks overlap with an `overlapBox` and mounts it via `autoLoad`. Shows a blinking warning when there is no space or the object is too large. |
| `AutoLoader:onDraw()` | 362 | ✍ Debug drawing of each area grid. It is only registered in debug builds, since the listener line is commented out. |
| `AutoLoader:addToPhysics(superFunc: any)` | 373 | ✍ Calls the parent function, then on the server re-adds every mounted object to physics. Returns false if the parent failed. |
| `AutoLoader:removeFromPhysics(superFunc: any)` | 392 | ✍ Calls the parent function, then on the server removes every mounted object from physics. Returns the parent's result. |
| `AutoLoader:getIsValidAutoLoaderObject(object: any)` | 417 | ✍ Returns true if the object is a different, not yet mounted Vehicle or Bale that supports auto loading and that the vehicle's active farm may access. |
| `AutoLoader:autoLoaderPickupTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 448 | ✍ Trigger callback. On enter, a valid, allowed object becomes pending for that trigger and the vehicle is woken up; objects recently skipped are refused on always-active triggers. On leave, the pending entry is removed. |
| `AutoLoader:autoLoaderOverlapCallback(transformId: any)` | 474 | ✍ Overlap test callback: sets the area-blocked flag and stops the query when a non-trigger shape of another object (not itself, not mounted, not the pending one) is found. Returns true to continue otherwise. |
| `AutoLoader:getIsAutoLoadingAllowed()` | 490 | ✍ Returns false when the vehicle has tipped over (the local up axis rises less than 0.5 above the node), true otherwise. |
| `AutoLoader:getDynamicMountTimeToMount(superFunc: any)` | 503 | ✍ Overrides the dynamic mount delay: returns -1 when auto loading is allowed, math.huge when it is not (never mounts). The parent function is ignored. |
| `AutoLoader:onRootVehicleChanged(rootVehicle: table)` | 510 | ✍ Registers or moves the `autoLoaderLoad` action in the root vehicle's action controller, available while objects are pending, or removes it when there is no controller. |
| `AutoLoader.actionControllerEvent(self: any, direction: any)` | 535 | ✍ Action controller callback: a negative direction turns auto loading off, any other turns it on. Always returns true. |
| `AutoLoader.onDeletePendingObject(self: any, object: any)` | 548 | ✍ Delete listener: removes the deleted object from the pending table. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `autoLoaderPickupTriggerCallback` | 48 |
| registerFunction | `autoLoaderOverlapCallback` | 49 |
| registerFunction | `getIsValidAutoLoaderObject` | 50 |
| registerFunction | `getIsAutoLoadingAllowed` | 51 |
| registerFunction | `onUnmountObject` | 52 |
| registerOverwrittenFunction | `getDynamicMountTimeToMount` | 58 |
| registerOverwrittenFunction | `addToPhysics` | 59 |
| registerOverwrittenFunction | `removeFromPhysics` | 60 |
| registerEventListener | `onLoad` | 66 |
| registerEventListener | `onPostLoad` | 67 |
| registerEventListener | `onDelete` | 68 |
| registerEventListener | `onUpdate` | 69 |
| registerEventListener | `onRootVehicleChanged` | 70 |
