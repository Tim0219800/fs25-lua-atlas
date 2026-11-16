# vehicles/VehicleActionControllerAction.lua

*[Version française](../../fr/scripts/vehicles/VehicleActionControllerAction.md)*

Source: `dataS/scripts/vehicles/VehicleActionControllerAction.lua` — FS25 1.25.1.0

✍ One controlled action owned by a `VehicleActionController`: it wraps an input callback (called with a direction +1/-1), an optional finished-check function, optional availability, accessibility and auto-deactivate functions, icons, an AI event listener list and a flag for savegame persistence. It tracks `lastDirection` and `lastValidDirection`.

- **VehicleActionControllerAction** (l.8)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleActionControllerAction.new(parent: any, name: any, inputAction: any, priority: any, customMt: any)` | 12 | ✍ Creates an action for a parent controller with name, input action and priority. Defaults: direction -1, saved = false, reset on deactivation = true, empty identifier. |
| `VehicleActionControllerAction:remove()` | 32 | ✍ Removes this action from its parent controller. |
| `VehicleActionControllerAction:updateParent(parent: any)` | 38 | ✍ Moves the action to another controller (removing it from the old one and adding it to the new one) when it differs from the current parent. |
| `VehicleActionControllerAction:setCallback(callbackTarget: any, inputCallback: any, inputCallbackRev: any)` | 49 | ✍ Sets the target and the callbacks for forward and reverse input, and takes the target's `configFileName` as the action identifier (empty string if absent). Only `inputCallback` is invoked by `doAction`. |
| `VehicleActionControllerAction:setFinishedFunctions(finishedFunctionTarget: any, finishedFunc: any, finishedResult: any, finishedResultRev: any, finishedFuncRev: any)` | 59 | ✍ Sets the function used to know when the action is done, and the values it must return for the positive and the reverse direction (`finishedResult`, `finishedResultRev`). |
| `VehicleActionControllerAction:setDeactivateFunction(deactivateFunctionTarget: any, deactivateFunc: any, inverseDeactivateFunc: any)` | 69 | ✍ Sets a function that, while the action is on and returns true (or false if inverted), makes the parent start a new sequence in `update`. |
| `VehicleActionControllerAction:setIsAvailableFunction(availableFunc: any)` | 77 | ✍ Sets the function that tells whether the action is currently available. |
| `VehicleActionControllerAction:setIsAccessibleFunction(accessibleFunc: any)` | 83 | ✍ Stores the accessibility function. Note: no method in this dump reads it, although the controller calls `isAccessible()` on actions (UNVERIFIED where it is defined). |
| `VehicleActionControllerAction:setActionIcons(iconPos: any, iconNeg: any, changeColor: any)` | 89 | ✍ Sets the positive and negative icons and whether the colour changes. |
| `VehicleActionControllerAction:setResetOnDeactivation(resetOnDeactivation: any)` | 97 | ✍ Sets whether the action is toggled back when removed from the controller. |
| `VehicleActionControllerAction:setIsSaved(isSaved: any)` | 103 | ✍ Sets whether this action is written to the savegame. |
| `VehicleActionControllerAction:getIsSaved()` | 109 | ✍ Returns whether this action is saved. |
| `VehicleActionControllerAction:isAvailable()` | 115 | ✍ Calls the availability function if set, otherwise returns true. |
| `VehicleActionControllerAction:getControlledActionIcons()` | 133 | ✍ Returns positive icon, negative icon and the colour-change flag. |
| `VehicleActionControllerAction:getLastDirection()` | 139 | ✍ Returns the last requested direction (+1 or -1). |
| `VehicleActionControllerAction:getDoResetOnDeactivation()` | 145 | ✍ Returns whether the action is toggled back on removal. |
| `VehicleActionControllerAction:addAIEventListener(sourceVehicle: any, eventName: any, direction: any, forceUntilFinished: any)` | 151 | ✍ Registers an AI event name to react to, with the direction to apply and a flag to keep forcing it until it succeeds; also records the source vehicle. |
| `VehicleActionControllerAction:registerActionEvents(target: any, vehicle: any, actionEvents: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 165 | ✍ Does nothing: the body is only commented-out code, so no per-action input event is registered. |
| `VehicleActionControllerAction:actionEvent(actionName: any, inputValue: any, actionIndex: any, isAnalog: any)` | 172 | ✍ Input callback that runs `doAction()` with the opposite of the last direction. |
| `VehicleActionControllerAction:doAction(direction: any, isAIEvent: any)` | 178 | ✍ Sets the direction (default: opposite of the last one) and calls the input callback with target, direction and AI flag. Records `lastValidDirection` on success and returns the callback's result. |
| `VehicleActionControllerAction:getIsFinished(direction: any)` | 194 | ✍ Compares the finished function's result to the expected value for the direction; true when no finished function is set. |
| `VehicleActionControllerAction:getSourceVehicle()` | 208 | ✍ Returns the vehicle set by `addAIEventListener`, or nil. |
| `VehicleActionControllerAction:onAIEvent(eventName: any)` | 214 | ✍ For each listener matching the event name, runs the action with its direction. If it fails and forcing is requested, remembers the direction to retry; otherwise clears a contrary forced direction and stops the parent's sequence. |
| `VehicleActionControllerAction:update(dt: any)` | 234 | ✍ While the action is on and its deactivate function returns the triggering value, asks the parent to start a sequence, unless one is running or a forced AI direction is pending. |
| `VehicleActionControllerAction:updateForAI(dt: any)` | 248 | ✍ Retries the forced AI direction; on success clears it and stops the parent's sequence. |
| `VehicleActionControllerAction:getDebugText()` | 259 | ✍ Builds a debug line with priority, vehicle name, action name and current/target finished values. Calls the finished function and `getName()` on the callback target. |
