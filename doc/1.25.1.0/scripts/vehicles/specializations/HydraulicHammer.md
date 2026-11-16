# vehicles/specializations/HydraulicHammer.lua

*[Version française](../../../fr/scripts/vehicles/specializations/HydraulicHammer.md)*

Source: `dataS/scripts/vehicles/specializations/HydraulicHammer.lua` — FS25 1.25.1.0

✍ Vehicle specialization for a hydraulic hammer that breaks destructible map objects. It requires TurnOnVehicle and AnimatedVehicle. While turned on, it periodically casts a short ray from a work node, asks the mission's destructible map object system for the destructible hit, checks land access for the owner farm and adds damage per hit. On clients it plays effects, sounds (pitch shifted by progress), animation nodes and an optional hit animation. The destructible system class itself is not in this dump (UNVERIFIED).

- **HydraulicHammer** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `HydraulicHammer.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Returns true only if the vehicle type has both TurnOnVehicle and AnimatedVehicle. |
| `HydraulicHammer.initSpecialization()` | 24 | ✍ Registers the XML schema under vehicle.hydraulicHammer: work node (raycast node, aligned node, damage, hit interval, raycast distance, supported types), effects, start/stop/idle/work sounds with a progress pitch factor, animation nodes and a hit animation. |
| `HydraulicHammer.registerFunctions(vehicleType: any)` | 53 | ✍ Registers hydraulicHammerRaycastCallback as a vehicle function. |
| `HydraulicHammer.registerOverwrittenFunctions(vehicleType: any)` | 59 | ✍ Overrides getDirtMultiplier, getWearMultiplier and getConsumingLoad to account for recent hammering. |
| `HydraulicHammer.registerEventListeners(vehicleType: any)` | 67 | ✍ Subscribes to onLoad, onDelete, onUpdate, onDeactivate, onTurnedOn and onTurnedOff. |
| `HydraulicHammer:onLoad(savegame: table)` | 79 | ✍ Loads the work node settings (damage per hit, hit interval range in ms, ray distance, supported destructible types), the static-object collision mask and, on clients, effects, sounds, animation nodes and the hit animation. Note: code defaults (damage 1, distance 0.4) differ from the schema defaults (5, 0.3). |
| `HydraulicHammer:onDelete()` | 136 | ✍ Deletes the sound samples, animation nodes and work node effects. |
| `HydraulicHammer:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 148 | ✍ While turned on and once the next hit time is reached, stops effects and fires a closest-hit raycast down the work node's -Y axis against static objects. The callback handles the hit. |
| `HydraulicHammer:hydraulicHammerRaycastCallback(actorId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 166 | ✍ Raycast callback. Finds the destructible at the hit, refuses (with a warning to the driver) if the farm has no land access or the type is unsupported, otherwise adds damage and plays hit animation, pitch-shifted sound and effects, then schedules the next hit. Returns false to stop further callbacks when handled. |
| `HydraulicHammer:onDeactivate()` | 223 | ✍ Client only: stops the work node effects when the vehicle is deactivated. |
| `HydraulicHammer:onTurnedOn()` | 232 | ✍ Client only: stops all sounds, plays the start sound then the idle sound after it, and starts the animation nodes. |
| `HydraulicHammer:onTurnedOff()` | 244 | ✍ Client only: stops effects, sounds, animation nodes and the hit animation, and plays the stop sound. |
| `HydraulicHammer:getDirtMultiplier(superFunc: any) → number` | 262 | ✍ Adds the work dirt multiplier to the parent value if a hit occurred in the last 500 ms. |
| `HydraulicHammer:getWearMultiplier(superFunc: any) → number` | 276 | ✍ Adds the work wear multiplier to the parent value if a hit occurred in the last 500 ms. |
| `HydraulicHammer:getConsumingLoad(superFunc: any)` | 289 | ✍ Adds one unit of load (value and count) to the parent result while a hit occurred in the last 500 ms. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `hydraulicHammerRaycastCallback` | 54 |
| registerOverwrittenFunction | `getDirtMultiplier` | 60 |
| registerOverwrittenFunction | `getWearMultiplier` | 61 |
| registerOverwrittenFunction | `getConsumingLoad` | 62 |
| registerEventListener | `onLoad` | 68 |
| registerEventListener | `onDelete` | 69 |
| registerEventListener | `onUpdate` | 70 |
| registerEventListener | `onDeactivate` | 71 |
| registerEventListener | `onTurnedOn` | 72 |
| registerEventListener | `onTurnedOff` | 73 |
