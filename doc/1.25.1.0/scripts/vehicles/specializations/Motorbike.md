# vehicles/specializations/Motorbike.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Motorbike.md)*

Source: `dataS/scripts/vehicles/specializations/Motorbike.lua` — FS25 1.25.1.0

✍ Specialization for motorbikes. It requires AnimatedVehicle and Motorized. It tilts a node in corners, plays a foot animation at low speed and a backward-walking animation in reverse, and reduces the steering range at higher speeds; on leaving, a fallen bike is stood up again on the server.

- **Motorbike** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Motorbike.prerequisitesPresent(specializations: any)` | 15 | ✍ Returns true only if the vehicle type has both AnimatedVehicle and Motorized. |
| `Motorbike.initSpecialization()` | 21 | ✍ Registers the XML paths under vehicle.motorbike: tilt (node, maxTilt, idleTilt, backwardTilt, tiltSpeed), foot and backward animations, and steering high-speed scale and threshold. |
| `Motorbike.registerFunctions(vehicleType: any)` | 46 | ✍ Empty: registers no new vehicle functions. |
| `Motorbike.registerOverwrittenFunctions(vehicleType: any)` | 51 | ✍ Empty: overrides no vehicle functions. |
| `Motorbike.registerEventListeners(vehicleType: any)` | 56 | ✍ Subscribes to load, post-load, update and leave-vehicle events. |
| `Motorbike:onLoad(savegame: any)` | 65 | ✍ Reads the XML tilt, animation and steering settings, converts tiltSpeed to per millisecond, applies the idle tilt to the node and stores the motor's maximum backward speed. Note: the tilt node is used without a nil check. |
| `Motorbike:onPostLoad(savegame: any)` | 96 | ✍ Stores the vehicle's original steering limits (minRotTime, maxRotTime, wheelSteeringDuration) as the reference for later speed scaling. |
| `Motorbike:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 108 | ✍ Each frame it moves the tilt node toward a target based on speed and steering (idle or backward values when slow or reversing), toggles the foot and backward animations, and scales the steering limits down as speed rises. |
| `Motorbike:onLeaveVehicle()` | 167 | ✍ Server only: if the bike's up axis points mostly sideways or down (Y below 0.5), it is removed from physics and repositioned at the same spot with only its heading kept, so it stands upright again. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEventListener | `onLoad` | 57 |
| registerEventListener | `onPostLoad` | 58 |
| registerEventListener | `onUpdate` | 59 |
| registerEventListener | `onLeaveVehicle` | 60 |
