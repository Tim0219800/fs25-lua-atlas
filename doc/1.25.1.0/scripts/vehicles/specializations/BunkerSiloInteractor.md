# vehicles/specializations/BunkerSiloInteractor.lua

*[Version française](../../../fr/scripts/vehicles/specializations/BunkerSiloInteractor.md)*

Source: `dataS/scripts/vehicles/specializations/BunkerSiloInteractor.lua` — FS25 1.25.1.0

✍ Small specialization that lets a bunker silo hook into a vehicle: the silo stores a callback on the vehicle and the vehicle calls it to report fill level changes with a world position. The class itself does not decide when to notify; other specializations or the silo code call notifiyBunkerSilo (the spelling is in the source).

- **BunkerSiloInteractor** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `BunkerSiloInteractor.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Always returns true: no other specialization is required. |
| `BunkerSiloInteractor.registerFunctions(vehicleType: any)` | 23 | ✍ Registers setBunkerSiloInteractorCallback and notifiyBunkerSilo on the vehicle type. |
| `BunkerSiloInteractor.registerEventListeners(vehicleType: any)` | 30 | ✍ Registers the onLoad listener only. |
| `BunkerSiloInteractor:onLoad(savegame: any)` | 36 | ✍ Resets the stored callback and its target to nil. |
| `BunkerSiloInteractor:setBunkerSiloInteractorCallback(callback: function, callbackTarget: table)` | 47 | ✍ Stores the function and target object to invoke later; passing nil values clears the link. Only one callback is kept at a time. |
| `BunkerSiloInteractor:notifiyBunkerSilo(changedFillLevel: any, fillType: any, x: any, y: any, z: any)` | 55 | ✍ If a callback is set, calls it with the target, this vehicle, the changed fill level, the fill type and the x, y, z position. Does nothing otherwise. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `setBunkerSiloInteractorCallback` | 24 |
| registerFunction | `notifiyBunkerSilo` | 25 |
| registerEventListener | `onLoad` | 31 |
