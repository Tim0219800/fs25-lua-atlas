# vehicles/specializations/AutoLoadFork.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AutoLoadFork.md)*

Source: `dataS/scripts/vehicles/specializations/AutoLoadFork.lua` — FS25 1.25.1.0

✍ Specialization for a fork-style vehicle that picks up a pallet or bale entering a trigger and carries it mounted on a joint node, with an optional lift animation and an unload input. Detection runs on the server only. Mounted bales or vehicle ids are written to and restored from the savegame. Several registered functions (`mountObjectToFork`, `doUnloadFork`, `getCanUnloadFork`, `getIsForkUnloadingAllowed`, `onUnmountObject`) have no body in the SDK dump: UNVERIFIED.


## Functions

| Function | Line | Description |
|---|---|---|
| `AutoLoadFork.prerequisitesPresent(specializations: table) → boolean` | 20 | ✍ Always returns true: this specialization has no prerequisite. |
| `AutoLoadFork.initSpecialization()` | 26 | ✍ Registers the XML keys `vehicle.autoLoadFork` (trigger node, joint node, lift animation name and speed scale) and the savegame keys for lift animation time and mounted vehicles or bales. |
| `AutoLoadFork.registerFunctions(vehicleType: any)` | 46 | ✍ Registers the vehicle functions of this specialization: trigger callback, unload checks, `doUnloadFork`, `onUnmountObject` and `mountObjectToFork`. |
| `AutoLoadFork.registerOverwrittenFunctions(vehicleType: any)` | 57 | ✍ Overrides `addToPhysics` and `removeFromPhysics` so the carried objects follow the vehicle in and out of the physics world. |
| `AutoLoadFork.registerEventListeners(vehicleType: any)` | 64 | ✍ Subscribes to onLoad, onPostLoad, onDelete, onUpdate, onDeactivate, onRootVehicleChanged and onRegisterActionEvents. |
| `AutoLoadFork:onLoad(savegame: any)` | 76 | ✍ Reads the XML configuration. On the server it registers the pallet detection trigger; on all sides it reads the joint node and lift animation and creates the empty mounted and unmounted object lists. |
| `AutoLoadFork:onPostLoad(savegame: any)` | 100 | ✍ When loading a non-reset savegame, restores the lift animation time, queues saved vehicles by unique id, and recreates, registers and mounts saved bales on the fork. |
| `AutoLoadFork:onDelete()` | 138 | ✍ On the server, releases every mounted object with `unmountKinematic`, then removes the trigger if there is one. |
| `AutoLoadFork:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 185 | ✍ Saves the lift animation time and each mounted object: a vehicle by unique id, a bale through its own save routine. |
| `AutoLoadFork:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 210 | ✍ On clients, registers the UNLOAD_FORK input action when the vehicle is active for input, ignoring selection, with normal text priority. |
| `AutoLoadFork:onRootVehicleChanged(rootVehicle: table)` | 224 | ✍ Keeps a `forkLifting` action in the root vehicle's action controller: creates it with its callback and icons, moves it to a new controller, or removes it when there is none. |
| `AutoLoadFork.actionControllerEvent(self: any, direction: any)` | 246 | ✍ Action controller callback: plays the lift animation forward or backward according to `direction`, scaled by its speed. Always returns true. |
| `AutoLoadFork.onDeleteMountedObject(self: any, object: any)` | 258 | ✍ Delete listener: when a mounted object is deleted, drops it from the mounted list and records it in the unmounted list with the current time. |
| `AutoLoadFork:onAutoLoadForkTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 272 | ✍ Trigger callback for pallets and bales. On enter, if nothing is mounted and the remount distance is zero or less, mounts the object unless it just left (`BLOCK_REMOUNT_TIME`). On leave, forgets it. Note: the first inner loop over mounted objects can never run. |
| `AutoLoadFork.actionEventUnloadFork(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 360 | ✍ Input callback for UNLOAD_FORK: simply calls `doUnloadFork` on the vehicle. |
| `AutoLoadFork:addToPhysics(superFunc: any)` | 385 | ✍ Calls the parent function, then on the server re-adds each carried object to physics. Returns false if the parent failed. |
| `AutoLoadFork:removeFromPhysics(superFunc: any)` | 406 | ✍ Calls the parent function, then on the server removes each carried object from physics. Returns the parent's result. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onAutoLoadForkTriggerCallback` | 47 |
| registerFunction | `getCanUnloadFork` | 48 |
| registerFunction | `getIsForkUnloadingAllowed` | 49 |
| registerFunction | `doUnloadFork` | 50 |
| registerFunction | `onUnmountObject` | 51 |
| registerFunction | `mountObjectToFork` | 52 |
| registerOverwrittenFunction | `addToPhysics` | 58 |
| registerOverwrittenFunction | `removeFromPhysics` | 59 |
| registerEventListener | `onLoad` | 65 |
| registerEventListener | `onPostLoad` | 66 |
| registerEventListener | `onDelete` | 67 |
| registerEventListener | `onUpdate` | 68 |
| registerEventListener | `onDeactivate` | 69 |
| registerEventListener | `onRootVehicleChanged` | 70 |
| registerEventListener | `onRegisterActionEvents` | 71 |
