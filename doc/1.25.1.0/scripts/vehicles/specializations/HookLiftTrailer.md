# vehicles/specializations/HookLiftTrailer.lua

*[Version française](../../../fr/scripts/vehicles/specializations/HookLiftTrailer.md)*

Source: `dataS/scripts/vehicles/specializations/HookLiftTrailer.lua` — FS25 1.25.1.0

✍ Vehicle specialization for hooklift trailers (requires AnimatedVehicle and Foldable). A reference animation (default unfoldHand) loads and unloads the container, a separate animation tips it. The script animates physics joint limits from keyframes, can create an extra joint when the container is fully lifted, controls detaching and tipping rules, drives visual rolls, hook lock visuals and foldable HUD texts, and keeps PTO power on during animations. Works with HookLiftContainer on the container side.

- **HookLiftTrailer** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `HookLiftTrailer.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Returns true only if the vehicle type has both AnimatedVehicle and Foldable. |
| `HookLiftTrailer.initSpecialization()` | 23 | ✍ Registers the XML schema under vehicle.hookLiftTrailer: joint limit keyframes, the additional joint, unloading animation, hook lock, container lock, visual rolls and the HUD texts. |
| `HookLiftTrailer.registerFunctions(vehicleType: any)` | 76 | ✍ Registers startTipping, stopTipping, getIsTippingAllowed, getCanDetachContainer, the lock and joint update functions and setHookLiftContainerPhysicsState. |
| `HookLiftTrailer.registerOverwrittenFunctions(vehicleType: any)` | 88 | ✍ Overrides getIsFoldAllowed, isDetachAllowed, getDoConsumePtoPower, getPtoRpm, addToPhysics and removeFromPhysics. |
| `HookLiftTrailer.registerEventListeners(vehicleType: any)` | 99 | ✍ Subscribes to onLoad, onPostLoad, onUpdateTick, onPostAttachImplement, onPreDetachImplement and onUpdateAnimation. |
| `HookLiftTrailer:onLoad(savegame: table)` | 111 | ✍ Loads the reference animation name, the joint-limit curves (rotation and translation min and max per key time), the additional joint settings, unloading animation, hook lock (client only), container lock, visual rolls and the localized texts. Note: the visualRoll direction default in the code is 1 while the schema declares -1. |
| `HookLiftTrailer:onPostLoad(savegame: table)` | 202 | ✍ Sets the Foldable specialization's direction texts to the unload arm and load arm labels. |
| `HookLiftTrailer:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 214 | ✍ While a container is attached, allows its detaching once the reference animation is above 0.95 and applies the interpolated joint limits to its physics joints while the animation runs, locking them once it reaches 0.99. On clients, also toggles the hook lock visual when the container's joint is close to the reference node. |
| `HookLiftTrailer:onPostAttachImplement(attachable: table, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 279 | ✍ If the attached implement uses a hooklift joint type, records it as the attached container with its joint index and switches the foldable texts to the container labels. Then refreshes the lock state. |
| `HookLiftTrailer:onPreDetachImplement(implement: integer)` | 305 | ✍ When the carried container is detached, unlocks it, restores the arm texts, removes the additional joint and its helper transform group, and forgets the container. Then refreshes the lock state. |
| `HookLiftTrailer:onUpdateAnimation(name: any)` | 334 | ✍ For the reference animation, updates the lock state and spins the visual rolls that touch the container's bottom line, by the distance moved along it. On the server, during the unloading animation, re-aims the additional joint frame. |
| `HookLiftTrailer:startTipping()` | 398 | ✍ Plays the unloading animation forward at its configured speed from the current time, so the container tips. |
| `HookLiftTrailer:stopTipping()` | 405 | ✍ Plays the unloading animation backward at the configured reverse speed from the current time. |
| `HookLiftTrailer:getIsTippingAllowed() → boolean` | 413 | ✍ Returns true only when the reference animation is exactly at its start (time 0), meaning the container is fully down on the trailer. |
| `HookLiftTrailer:getCanDetachContainer()` | 420 | ✍ Returns true only when the reference animation is exactly at its end (time 1), meaning the container is fully lowered to the ground. |
| `HookLiftTrailer:updateHookLiftContainerLockState()` | 427 | ✍ Updates the container lock (true when the arm is fully loaded and a container is attached), applying object changes and notifying the container. On the server also toggles the additional joint state against its lock time. |
| `HookLiftTrailer:updateAdditionalHookLiftContainerJoint()` | 453 | ✍ Creates the extra physics joint between container and trailer when it should be active and both are in physics, using the additional joint limits, or removes it and its helper node otherwise. Does nothing without an additional joint node. Assumes limits exist when creating. |
| `HookLiftTrailer:setHookLiftContainerPhysicsState(container: any, state: any)` | 511 | ✍ Called when the carried container enters or leaves physics: refreshes or zeroes the stored joint index (resetting the limit lock when re-added), then updates the additional joint. |
| `HookLiftTrailer:addToPhysics(superFunc: any) → boolean` | 532 | ✍ After the parent, tells the carried container's physics state to true. Returns false if the parent failed. |
| `HookLiftTrailer:removeFromPhysics(superFunc: any)` | 547 | ✍ Sets the carried container's physics state to false before the parent removes the trailer. Returns false if the parent failed. |
| `HookLiftTrailer:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any) → boolean` | 564 | ✍ Refuses folding as long as the unloading animation is not at its start, otherwise defers to the parent. |
| `HookLiftTrailer:isDetachAllowed(superFunc: any) → boolean` | 576 | ✍ Allows detaching the trailer (parent decision) only when the unloading animation is at 0, otherwise returns false with nil. |
| `HookLiftTrailer:getDoConsumePtoPower(superFunc: any) → boolean` | 587 | ✍ Returns true if the parent does or if the reference or unloading animation is currently playing, so the arm consumes PTO power while moving. |
| `HookLiftTrailer:getPtoRpm(superFunc: any) → number` | 597 | ✍ While one of the two animations plays, returns the PTO rpm of the power consumer specialization, otherwise the parent value. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `startTipping` | 77 |
| registerFunction | `stopTipping` | 78 |
| registerFunction | `getIsTippingAllowed` | 79 |
| registerFunction | `getCanDetachContainer` | 80 |
| registerFunction | `updateHookLiftContainerLockState` | 81 |
| registerFunction | `updateAdditionalHookLiftContainerJoint` | 82 |
| registerFunction | `setHookLiftContainerPhysicsState` | 83 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 89 |
| registerOverwrittenFunction | `isDetachAllowed` | 90 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 91 |
| registerOverwrittenFunction | `getPtoRpm` | 92 |
| registerOverwrittenFunction | `addToPhysics` | 93 |
| registerOverwrittenFunction | `removeFromPhysics` | 94 |
| registerEventListener | `onLoad` | 100 |
| registerEventListener | `onPostLoad` | 101 |
| registerEventListener | `onUpdateTick` | 102 |
| registerEventListener | `onPostAttachImplement` | 103 |
| registerEventListener | `onPreDetachImplement` | 104 |
| registerEventListener | `onUpdateAnimation` | 105 |
