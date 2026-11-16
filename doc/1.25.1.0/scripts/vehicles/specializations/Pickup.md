# vehicles/specializations/Pickup.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Pickup.md)*

Source: `dataS/scripts/vehicles/specializations/Pickup.lua` — FS25 1.25.1.0

✍ Specialization for implements with a pickup that can be lowered on its own (forage wagon, baler and similar). It requires AnimatedVehicle. It stores the lowered state, plays a configurable lift or lower animation, syncs the state through PickupSetStateEvent, adds a LOWER_IMPLEMENT action, registers a controlled action for the root vehicle's action controller, and raises dirt and wear while the pickup is lowered and working.

- **Pickup** (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `Pickup.prerequisitesPresent(specializations: any)` | 19 | ✍ Returns true only if the vehicle type has the AnimatedVehicle specialization. |
| `Pickup.initSpecialization()` | 25 | ✍ Registers the XML paths of the pickup animation (name, lowerSpeed, liftSpeed, isDefaultLowered) under the key held in Pickup.PICKUP_XML_KEY, which is defined outside the lines visible in this dump (UNVERIFIED value). |
| `Pickup.registerFunctions(vehicleType: any)` | 39 | ✍ Registers allowPickingUp, setPickupState, loadPickupFromXML and getCanChangePickupState on the vehicle type. |
| `Pickup.registerOverwrittenFunctions(vehicleType: any)` | 48 | ✍ Overrides getIsLowered, dirt and wear multipliers, both lowering action event registrations, and the ground and object discharge checks. |
| `Pickup.registerEventListeners(vehicleType: any)` | 60 | ✍ Subscribes to load, post-load, stream read/write, lower-all, root vehicle changed and fold time changed events. |
| `Pickup:onLoad(savegame: any)` | 72 | ✍ Loads the pickup settings from the vehicle.pickup XML key into the spec via loadPickupFromXML. |
| `Pickup:onPostLoad(savegame: any)` | 78 | ✍ If an animation exists, jumps it to its end position at once: lowered when default-lowered is set (and marks the state lowered), lifted otherwise. |
| `Pickup:onReadStream(streamId: any, connection: any)` | 94 | ✍ Client on join: reads the lowered flag and applies it with setPickupState without sending an event. |
| `Pickup:onWriteStream(streamId: any, connection: any)` | 101 | ✍ Server on join: writes the current lowered flag. |
| `Pickup:onSetLoweredAll(doLowering: any, jointDescIndex: any)` | 108 | ✍ Follows the lower-all command of the vehicle chain by setting the pickup state to the requested lowering value. |
| `Pickup:onRootVehicleChanged(rootVehicle: table)` | 115 | ✍ Registers (or re-parents) a lowerPickup controlled action on the new root vehicle's action controller, saved with AI line-start and end listeners if the AI needs lowering; removes it when no controller applies. Skipped when there is no animation. |
| `Pickup:onFoldTimeChanged(foldAnimTime: number)` | 145 | ✍ Refreshes the lowering action event text and availability when the fold time changes. |
| `Pickup:actionControllerLowerPickupEvent(direction: any)` | 151 | ✍ Action controller callback: lowers the pickup when the direction is positive, lifts it otherwise, and returns true. |
| `Pickup:setPickupState(isPickupLowered: any, noEventSend: any)` | 158 | ✍ Changes the lowered state if it differs, sends PickupSetStateEvent unless noEventSend, plays the lower or lift animation from the current time and refreshes the action event. |
| `Pickup:allowPickingUp()` | 184 | ✍ Returns true while the pickup is lowered, meaning crop can be picked up. |
| `Pickup:getIsLowered(superFunc: any, default: any)` | 191 | ✍ Returns the pickup's own lowered state, ignoring the default argument and the parent. |
| `Pickup:loadPickupFromXML(xmlFile: any, key: any, spec: any)` | 198 | ✍ Reads the animation name and speeds from a given key into the given spec table. If the animation is missing, the name is cleared and the state is lowered. The lift speed defaults to the negated lower speed. Always returns true. |
| `Pickup:getCanChangePickupState(spec: any, newState: any)` | 217 | ✍ Hook that always returns true; it takes the spec table and the new state as arguments and can be overridden by other code to restrict toggling. |
| `Pickup:getDirtMultiplier(superFunc: any)` | 223 | ✍ While the pickup is lowered and the vehicle is on (or cannot be turned on), adds the work dirt multiplier scaled by speed over the speed limit to the parent value. |
| `Pickup:getWearMultiplier(superFunc: any)` | 235 | ✍ While the pickup is lowered and the vehicle is on (or cannot be turned on), adds the work wear multiplier scaled by speed over the speed limit to the parent value. |
| `Pickup:registerLoweringActionEvent(superFunc: any, actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any)` | 247 | ✍ When an animation exists, registers a powered LOWER_IMPLEMENT toggle action for the pickup and skips the parent registration if that input is the requested one; otherwise calls the parent. |
| `Pickup:registerSelfLoweringActionEvent(superFunc: any, actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any, ignoreCollisions: any)` | 265 | ✍ Delegates to the same logic as registerLoweringActionEvent. |
| `Pickup:getCanDischargeToGround(superFunc: any, dischargeNode: any)` | 271 | ✍ Returns false while the pickup is lowered, unless spec_pickup.allowWhileTipping is set (not set anywhere in this file); otherwise defers to the parent. |
| `Pickup:getCanDischargeToObject(superFunc: any, dischargeNode: any)` | 283 | ✍ Returns false while the pickup is lowered, unless spec_pickup.allowWhileTipping is set (not set anywhere in this file); otherwise defers to the parent. |
| `Pickup.updateActionEvents(self: any)` | 295 | ✍ Static helper: sets the lift or lower text on the LOWER_IMPLEMENT action and enables it according to getCanChangePickupState; only when an animation exists. |
| `Pickup.actionEventTogglePickup(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 314 | ✍ Input callback: toggles the pickup state if getCanChangePickupState allows it. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `allowPickingUp` | 40 |
| registerFunction | `setPickupState` | 41 |
| registerFunction | `loadPickupFromXML` | 42 |
| registerFunction | `getCanChangePickupState` | 43 |
| registerOverwrittenFunction | `getIsLowered` | 49 |
| registerOverwrittenFunction | `getDirtMultiplier` | 50 |
| registerOverwrittenFunction | `getWearMultiplier` | 51 |
| registerOverwrittenFunction | `registerLoweringActionEvent` | 52 |
| registerOverwrittenFunction | `registerSelfLoweringActionEvent` | 53 |
| registerOverwrittenFunction | `getCanDischargeToGround` | 54 |
| registerOverwrittenFunction | `getCanDischargeToObject` | 55 |
| registerEventListener | `onLoad` | 61 |
| registerEventListener | `onPostLoad` | 62 |
| registerEventListener | `onReadStream` | 63 |
| registerEventListener | `onWriteStream` | 64 |
| registerEventListener | `onSetLoweredAll` | 65 |
| registerEventListener | `onRootVehicleChanged` | 66 |
| registerEventListener | `onFoldTimeChanged` | 67 |
