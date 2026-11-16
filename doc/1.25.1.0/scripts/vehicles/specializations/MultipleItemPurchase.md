# vehicles/specializations/MultipleItemPurchase.lua

*[Version française](../../../fr/scripts/vehicles/specializations/MultipleItemPurchase.md)*

Source: `dataS/scripts/vehicles/specializations/MultipleItemPurchase.lua` — FS25 1.25.1.0

✍ Specialization of a temporary root vehicle used to buy several bales or vehicles at once. It requires FillUnit. It adds a multipleItemPurchaseAmount configuration, spawns the items at XML-defined positions while loading, and outside the shop configuration it deletes itself on the first server update, leaving the spawned items behind.

- **MultipleItemPurchase** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `MultipleItemPurchase.initSpecialization()` | 15 | ✍ Registers the multipleItemPurchaseAmount configuration type and the XML paths under vehicle.multipleItemPurchase (item filename, isVehicle, bale fill type, wrapped flag, variation, offsets by amount, item positions and rotations). |
| `MultipleItemPurchase.prerequisitesPresent(specializations: any)` | 38 | ✍ Returns true only if the vehicle type has the FillUnit specialization. |
| `MultipleItemPurchase.registerFunctions(vehicleType: any)` | 44 | ✍ Adds loadItemAtPosition and onFinishLoadingVehicle as vehicle functions. |
| `MultipleItemPurchase.registerOverwrittenFunctions(vehicleType: any)` | 51 | ✍ Overrides getTotalMass, getFillUnitCapacity, setVisibility, addToPhysics and removeFromPhysics. |
| `MultipleItemPurchase.registerEventListeners(vehicleType: any)` | 61 | ✍ Subscribes to load, pre-load-finished, delete and update events. |
| `MultipleItemPurchase:onLoad(savegame: table)` | 71 | ✍ Reads the item settings and builds the position list, applying the offset that matches the selected amount configuration. It removes vehicle and dynamic-object collision bits from the components, and drops the update listener on clients. |
| `MultipleItemPurchase:onPreLoadFinished(savegame: table)` | 139 | ✍ Spawns one item per position, up to the number chosen in the amount configuration. |
| `MultipleItemPurchase:loadItemAtPosition(position: any)` | 150 | ✍ Server (or shop config) only: creates a bale from the config XML (fill type, farm, variation, optional wrapping and base colour; registered unless in shop config) or starts loading a vehicle with matching configurations. Items are kept out of physics. |
| `MultipleItemPurchase:onFinishLoadingVehicle(vehicles: any, vehicleLoadState: any, loadingTask: any)` | 213 | ✍ Loading callback: if this vehicle is already being deleted, it deletes the loaded vehicles; otherwise it removes them from physics, hides them and stores them. It then completes the loading task. |
| `MultipleItemPurchase:onDelete()` | 243 | ✍ Deletes the loaded bales and vehicles only in the shop configuration, icon generator or vehicle debug-load cases; in normal purchases the items are kept. |
| `MultipleItemPurchase:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 262 | ✍ Server only: outside the shop configuration the vehicle deletes itself, which is what makes it a throwaway carrier. |
| `MultipleItemPurchase:getTotalMass(superFunc: any, onlyGivenVehicle: any)` | 270 | ✍ In shop config returns the summed mass of the loaded bales and vehicles; otherwise 0. The parent is not called. |
| `MultipleItemPurchase:getFillUnitCapacity(superFunc: any, fillUnitIndex: any)` | 290 | ✍ In shop config returns the summed fill level of the loaded bales plus the first fill unit capacity of loaded vehicles; otherwise 0. The parent is not called. |
| `MultipleItemPurchase:setVisibility(superFunc: any, state: any)` | 312 | ✍ Forwards the visibility state to the loaded vehicles, then to the parent. |
| `MultipleItemPurchase:addToPhysics(superFunc: any)` | 323 | ✍ Adds the vehicle to physics via the parent; if that succeeds, also adds the loaded bales and vehicles. Returns false if the parent fails. |
| `MultipleItemPurchase:removeFromPhysics(superFunc: any)` | 341 | ✍ Removes the loaded bales and vehicles from physics, then calls the parent and returns its result. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadItemAtPosition` | 45 |
| registerFunction | `onFinishLoadingVehicle` | 46 |
| registerOverwrittenFunction | `getTotalMass` | 52 |
| registerOverwrittenFunction | `getFillUnitCapacity` | 53 |
| registerOverwrittenFunction | `setVisibility` | 54 |
| registerOverwrittenFunction | `addToPhysics` | 55 |
| registerOverwrittenFunction | `removeFromPhysics` | 56 |
| registerEventListener | `onLoad` | 62 |
| registerEventListener | `onPreLoadFinished` | 63 |
| registerEventListener | `onDelete` | 64 |
| registerEventListener | `onUpdate` | 65 |
