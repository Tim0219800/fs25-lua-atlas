# vehicles/specializations/BaleGrab.lua

*[Version française](../../../fr/scripts/vehicles/specializations/BaleGrab.md)*

Source: `dataS/scripts/vehicles/specializations/BaleGrab.lua` — FS25 1.25.1.0

✍ Specialization for bale grabs (front-loader or telehandler tools) that hold bales by dynamically mounting them once the grab arms are closed. Everything is server-side: a trigger node collects bales in reach, and component-joint offsets (rotation or translation) tell when each grab has closed. Closing is also throttled by a timer and by blocking configured moving tools. It also registers two shop spec values (round and square bale sizes). Reads the `vehicle.baleGrab` XML keys. The constant `BaleGrab.CLOSE_TIMER` is used but not defined in this file (UNVERIFIED where it is set).

- **BaleGrab** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `BaleGrab.prerequisitesPresent(specializations: any)` | 17 | ✍ Always returns true: this specialization has no prerequisites on other specializations. |
| `BaleGrab.initSpecialization()` | 23 | ✍ Registers the `vehicle.baleGrab` XML schema keys (sizes, trigger, mount type, per-grab joint and moving-tool settings) and declares the two shop spec types for round and square bale sizes. |
| `BaleGrab.registerFunctions(vehicleType: any)` | 58 | ✍ Adds the grab's vehicle functions: trigger callback, add/remove dynamic mounted object, closed check, and mount/unmount of a bale. |
| `BaleGrab.registerOverwrittenFunctions(vehicleType: any)` | 69 | ✍ Overrides `getMovingToolMoveValue` so that closing moving tools can be blocked while a bale is being gripped. |
| `BaleGrab.registerEventListeners(vehicleType: any)` | 75 | ✍ Subscribes to onLoad, onPostLoad, onDelete and onUpdateTick. |
| `BaleGrab:onLoad(savegame: table)` | 85 | ✍ Server only: reads the trigger, root node, mount type, force acceleration and each grab (joint index, rotation or translation axis and threshold, moving tools). Creates a joint node and the trigger. If no trigger node is set, removes the other listeners. |
| `BaleGrab:onPostLoad(savegame: any)` | 190 | ✍ Resolves each grab's moving-tool nodes into real moving tools and drops entries with no match. |
| `BaleGrab:onDelete()` | 206 | ✍ Removes delete and mount-state listeners from pending bales, unmounts every mounted object, and removes the trigger. |
| `BaleGrab:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 239 | ✍ Server only: per grab, runs the close timer and a joint checksum so that small impacts do not toggle the state. When all grabs are closed, it mounts pending bales and raises joint damping; otherwise it unmounts them and restores the damping. |
| `BaleGrab:getMovingToolMoveValue(superFunc: any, movingTool: any)` | 326 | ✍ Override: returns the normal move value, but forces 0 when a bale is pending and the tool is moving in its closing direction while the close timer is running. Also stores the last move value. |
| `BaleGrab:addDynamicMountedObject(object: table)` | 351 | ✍ Records an object in the table of objects currently mounted on the grab. |
| `BaleGrab:removeDynamicMountedObject(object: table, isDeleting: boolean)` | 360 | ✍ Calls `unmountDynamic` on the object if it is dynamically mounted and forgets it. With `isDeleting` it is also removed from the pending list. |
| `BaleGrab.onPendingObjectDelete(self: any, object: any)` | 375 | ✍ Delete listener: when a pending or mounted object is deleted, removes it from the grab with the deleting flag. |
| `BaleGrab.onPendingObjectMountStateChanged(self: any, object: any, mountState: any, mountObject: any)` | 384 | ✍ Mount-state listener: if the object gets mounted by something other than this grab, it is released from the grab's pending and mounted tables. |
| `BaleGrab:baleGrabTriggerCallback(triggerId: integer, otherActorId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 401 | ✍ Trigger callback. On enter, counts the shapes of a mountable object (with mount-state listener support) and registers listeners on its first shape. On leave, decrements the count and releases the object at zero. |
| `BaleGrab:getIsBaleGrabClosed(grab: any)` | 429 | ✍ Returns true when one grab is closed: false while its moving tools are fully open, otherwise true if the joint offset exceeds the rotation or translation threshold. Updates the cached offsets. |
| `BaleGrab:mountBaleGrabObject(object: table) → boolean` | 478 | ✍ Places the joint node at the object's center of mass and calls `mountDynamic`. On success sets the joint springs, registers the object as mounted and returns true. |
| `BaleGrab:unmountBaleGrabObject(object: table) → boolean` | 503 | ✍ Releases a mounted object from the grab (without the deleting flag). Always returns true. |
| `BaleGrab:updateDebugValues(values: any)` | 511 | ✍ Server only: adds debug lines to the given table: offset, threshold and state per grab, moving-tool direction (with blocked flag), and the pending or mounted objects. |
| `BaleGrab.loadSpecValueMaxSize(xmlFile: any, minKey: any, maxKey: any)` | 572 | ✍ Reads a min and max size from two XML keys, rounded to 2 decimals. Returns a table with minSize and maxSize, or nil if both are 0. |
| `BaleGrab.loadSpecValueMaxSizeRound(xmlFile: any, customEnvironment: any, baseDir: any)` | 585 | ✍ Shop loader for round bale sizes, using `vehicle.baleGrab#minSizeRound` and `#maxSizeRound`. |
| `BaleGrab.loadSpecValueMaxSizeSquare(xmlFile: any, customEnvironment: any, baseDir: any)` | 591 | ✍ Shop loader for square bale sizes, using `vehicle.baleGrab#minSizeSquare` and `#maxSizeSquare`. |
| `BaleGrab.getSpecValueMaxSize(specName: any, storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 597 | ✍ Formats the stored bale size for the shop, in cm (values multiplied by 100). Returns a text such as a range or a single value, or raw numbers plus the unit when `returnValues` is set. |
| `BaleGrab.getSpecValueMaxSizeRound(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 625 | ✍ Shop getter for round bale size; delegates to `getSpecValueMaxSize` with the `baleGrabMaxSizeRound` spec. |
| `BaleGrab.getSpecValueMaxSizeSquare(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 631 | ✍ Shop getter for square bale size; delegates to `getSpecValueMaxSize` with the `baleGrabMaxSizeSquare` spec. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `baleGrabTriggerCallback` | 59 |
| registerFunction | `addDynamicMountedObject` | 60 |
| registerFunction | `removeDynamicMountedObject` | 61 |
| registerFunction | `getIsBaleGrabClosed` | 62 |
| registerFunction | `mountBaleGrabObject` | 63 |
| registerFunction | `unmountBaleGrabObject` | 64 |
| registerOverwrittenFunction | `getMovingToolMoveValue` | 70 |
| registerEventListener | `onLoad` | 76 |
| registerEventListener | `onPostLoad` | 77 |
| registerEventListener | `onDelete` | 78 |
| registerEventListener | `onUpdateTick` | 79 |
