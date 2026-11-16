# vehicles/specializations/Honk.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Honk.md)*

Source: `dataS/scripts/vehicles/specializations/Honk.lua` — FS25 1.25.1.0

✍ Vehicle specialization that adds a horn to drivable vehicles (requires Drivable). It loads one sound from vehicle.honk, binds the HONK input action while the vehicle is active for input, and plays or stops the sound while the key is held. Honk state changes are broadcast through HonkEvent so other clients hear it.

- **Honk** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `Honk.prerequisitesPresent(specializations: any)` | 18 | ✍ Returns true only if the vehicle type has the Drivable specialization. |
| `Honk.initSpecialization()` | 24 | ✍ Registers the sound sample XML paths under vehicle.honk (key "sound"). |
| `Honk.registerFunctions(vehicleType: any)` | 33 | ✍ Registers getIsHonkAvailable, setHonkInput and playHonk on the vehicle type. |
| `Honk.registerEventListeners(vehicleType: any)` | 41 | ✍ Subscribes to onLoad, onDelete, onUpdate, onLeaveVehicle and onRegisterActionEvents. |
| `Honk:onLoad(savegame: any)` | 51 | ✍ Resets the input and playing flags and, on clients, loads the horn sample. On a dedicated server removes the onUpdate listener. |
| `Honk:onDelete()` | 67 | ✍ Deletes the horn sound sample. |
| `Honk:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 74 | ✍ Client only, for the controlled vehicle: starts the horn while the input is pressed and the sample is not already playing, stops it once released, and clears the pressed flag each frame. |
| `Honk:onLeaveVehicle()` | 92 | ✍ Stops the horn when the player leaves the vehicle, without sending a network event. |
| `Honk:getIsHonkAvailable()` | 98 | ✍ Returns true by default; can be overridden by other specializations to disable the horn. |
| `Honk:setHonkInput()` | 104 | ✍ Marks the horn input as pressed for the current frame. |
| `Honk:playHonk(isPlaying: any, noEventSend: any)` | 111 | ✍ Sends HonkEvent, stores the playing state, then plays the sample on clients if the vehicle is active, or stops it. Pass noEventSend to avoid re-broadcasting. |
| `Honk:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 132 | ✍ Client only: rebuilds the action events and, when the vehicle is active for input and has a horn sample, binds InputAction.HONK with a low-priority help text. |
| `Honk.actionEventHonk(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 148 | ✍ Input callback for the HONK action: calls setHonkInput on the vehicle. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getIsHonkAvailable` | 34 |
| registerFunction | `setHonkInput` | 35 |
| registerFunction | `playHonk` | 36 |
| registerEventListener | `onLoad` | 42 |
| registerEventListener | `onDelete` | 43 |
| registerEventListener | `onUpdate` | 44 |
| registerEventListener | `onLeaveVehicle` | 45 |
| registerEventListener | `onRegisterActionEvents` | 46 |
