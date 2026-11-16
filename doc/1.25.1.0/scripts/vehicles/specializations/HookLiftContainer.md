# vehicles/specializations/HookLiftContainer.lua

*[Version française](../../../fr/scripts/vehicles/specializations/HookLiftContainer.md)*

Source: `dataS/scripts/vehicles/specializations/HookLiftContainer.lua` — FS25 1.25.1.0

✍ Vehicle specialization for containers carried by a hooklift trailer. It requires AnimatedVehicle and Attachable. It cooperates with HookLiftTrailer: it blocks discharge and detaching unless the trailer allows them, makes the trailer tilt when the container tips, forwards physics add/remove to the trailer, and toggles a lock visual and connection hoses. It defines visual roll reference nodes read by the trailer.

- **HookLiftContainer** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `HookLiftContainer.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Returns true only if the vehicle type has both AnimatedVehicle and Attachable. |
| `HookLiftContainer.initSpecialization()` | 23 | ✍ Registers the XML keys: tiltContainerOnDischarge, the visualRollReference start and end nodes (bottom of the container) and the object changes of containerLock. |
| `HookLiftContainer.registerFunctions(vehicleType: any)` | 39 | ✍ Registers onHookLiftContainerLockChanged as a vehicle function, called by the trailer. |
| `HookLiftContainer.registerOverwrittenFunctions(vehicleType: any)` | 45 | ✍ Overrides getCanDischargeToObject, getCanDischargeToGround, isDetachAllowed, addToPhysics, removeFromPhysics and getBrakeForce. |
| `HookLiftContainer.registerEventListeners(vehicleType: any)` | 56 | ✍ Subscribes to onLoad, onStartTipping and onStopTipping. |
| `HookLiftContainer:onLoad(savegame: table)` | 65 | ✍ Reads the tilt option, the visual reference nodes and the lock object changes (set to off), and switches connection hoses off if the vehicle has them. |
| `HookLiftContainer:getCanDischargeToObject(superFunc: any, dischargeNode: any)` | 84 | ✍ Returns false when the carrying trailer says tipping is not allowed (getIsTippingAllowed), otherwise defers to the parent check. |
| `HookLiftContainer:getCanDischargeToGround(superFunc: any, dischargeNode: any)` | 97 | ✍ Same rule as for objects: ground discharge is refused while the carrying trailer does not allow tipping, otherwise the parent decides. |
| `HookLiftContainer:isDetachAllowed(superFunc: any)` | 110 | ✍ Returns false (with nil as second value) unless the trailer reports it can detach the container, otherwise defers to the parent. |
| `HookLiftContainer:onStartTipping(tipSideIndex: any)` | 123 | ✍ If tiltContainerOnDischarge is enabled, asks the carrying trailer to start its tipping animation. |
| `HookLiftContainer:onStopTipping()` | 133 | ✍ If tiltContainerOnDischarge is enabled, asks the carrying trailer to play its tipping animation back. |
| `HookLiftContainer:onHookLiftContainerLockChanged(state: any)` | 144 | ✍ Called by the trailer when the lock state changes: switches the container's connection hoses (if attached) and applies the containerLock object changes. Assumes an attacher vehicle exists. |
| `HookLiftContainer:addToPhysics(superFunc: any)` | 160 | ✍ After the parent adds the container to physics, notifies the carrying trailer (setHookLiftContainerPhysicsState true). Returns false if the parent failed. |
| `HookLiftContainer:removeFromPhysics(superFunc: any) → boolean` | 176 | ✍ Notifies the carrying trailer first (physics state false), then lets the parent remove the container. Returns false if the parent failed. |
| `HookLiftContainer:getBrakeForce(superFunc: any)` | 191 | ✍ Returns 0 while the container is attached to a vehicle (no own braking), otherwise the parent value. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onHookLiftContainerLockChanged` | 40 |
| registerOverwrittenFunction | `getCanDischargeToObject` | 46 |
| registerOverwrittenFunction | `getCanDischargeToGround` | 47 |
| registerOverwrittenFunction | `isDetachAllowed` | 48 |
| registerOverwrittenFunction | `addToPhysics` | 49 |
| registerOverwrittenFunction | `removeFromPhysics` | 50 |
| registerOverwrittenFunction | `getBrakeForce` | 51 |
| registerEventListener | `onLoad` | 57 |
| registerEventListener | `onStartTipping` | 58 |
| registerEventListener | `onStopTipping` | 59 |
