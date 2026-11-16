# vehicles/VehicleActionController.lua

*[Version française](../../fr/scripts/vehicles/VehicleActionController.md)*

Source: `dataS/scripts/vehicles/VehicleActionController.lua` — FS25 1.25.1.0

✍ Per-vehicle controller for "controlled actions": a set of prioritized actions (fold, lower, turn on...) that the player triggers together with one key (`InputAction.VEHICLE_ACTION_CONTROL`). It keeps the list of `VehicleActionControllerAction` objects, runs them as an ordered sequence (reversed when going back), saves/restores the last direction in the savegame and offers a debug overlay. Only the root vehicle of a vehicle chain registers the input.

- **VehicleActionController** (l.8)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleActionController.new(vehicle: any, customMt: any)` | 14 | ✍ Creates the controller for a vehicle with empty action lists, `lastDirection` = -1 and no pending reactivation. Accepts an optional custom metatable. |
| `VehicleActionController:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 35 | ✍ Writes `#lastDirection`, `#numActions` and, for each action whose `getIsSaved()` is true, its name, identifier and last direction under `action(i)`. Writes nothing when there are no actions. |
| `VehicleActionController:load(savegame: any)` | 55 | ✍ Reads the saved direction and action list from the savegame XML (skipped if `resetVehicles`) and stores the load time. If no saved action has a positive direction, the loaded list is discarded. |
| `VehicleActionController:registerAction(name: any, inputAction: any, prio: any)` | 92 | ✍ Creates a `VehicleActionControllerAction` with name, input action and priority, adds it to the controller and returns it so the caller can configure callbacks. |
| `VehicleActionController:addAction(action: any)` | 101 | ✍ Appends an action, rebuilds the priority-sorted lists, flags the actions as dirty (so they get aligned with the controller direction in `update`) and requests an action-event refresh on the vehicle. |
| `VehicleActionController:removeAction(action: any)` | 113 | ✍ Removes an action. If automatic vehicle control is enabled on the platform and the action was on, it is first toggled back when it resets on deactivation. Resets the direction when the last action is gone. |
| `VehicleActionController:updateSortedActions()` | 139 | ✍ Groups actions into buckets by identical priority and builds two sorted copies: highest priority first (`sortedActions`) and lowest first (`sortedActionsRev`). |
| `VehicleActionController:activate()` | 165 | ✍ Called when the vehicle becomes active. For the root vehicle with a pending reactivation, flips the direction and replays the sequence so actions switched off by deactivation (e.g. turn on) are restored. |
| `VehicleActionController:deactivate()` | 182 | ✍ Called when the vehicle is deactivated. For the root vehicle, if the last direction was positive it marks a pending reactivation instead of undoing the actions, to keep folding and lowered states. |
| `VehicleActionController:registerActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 192 | ✍ For the root vehicle with actions, clears and re-registers the per-action events and registers the `VEHICLE_ACTION_CONTROL` input event with `actionSequenceEvent`, replacing any previous one. |
| `VehicleActionController:actionEvent(actionName: any, inputValue: any, actionIndex: any, isAnalog: any)` | 210 | ✍ Input callback that triggers the actions at index `actionIndex` through `doAction`. Other parameters are unused. |
| `VehicleActionController:doAction(actionIndex: any, customTable: any, direction: any)` | 216 | ✍ Executes every action in one priority bucket (from the optional custom table or the default one) with the given direction. Returns true if at least one succeeded. |
| `VehicleActionController:actionSequenceEvent()` | 234 | ✍ Input handler for the controlled-actions key. Does nothing right after loading, when actions are not accessible, not available or not allowed (a blinking warning may be shown); otherwise starts the sequence. |
| `VehicleActionController:startActionSequence(force: any)` | 265 | ✍ Starts a sequence in the direction opposite to the last one (high to low priority when positive). Unless `force`, if all actions already sit in the target state it flips direction. Mid-sequence calls reverse the index. Stops if nothing could run. |
| `VehicleActionController:continueActionSequence()` | 311 | ✍ Advances to the next priority bucket and executes it; ends the sequence after the last one, and recurses immediately if the bucket executed nothing. |
| `VehicleActionController:stopActionSequence()` | 326 | ✍ Clears the current sequence state (actions list, index and max index). |
| `VehicleActionController:getActionsByIndex(actionIndex: any, customTable: any)` | 334 | ✍ Returns the action bucket at the given index, from the custom table if provided, otherwise from the controller's priority list. |
| `VehicleActionController:getAreControlledActionsAvailable()` | 344 | ✍ True only if there is at least one action and every action reports `isAvailable()`. |
| `VehicleActionController:getAreControlledActionsAccessible()` | 356 | ✍ True only if there is at least one action and every action reports `isAccessible()`. Note: `VehicleActionControllerAction:isAccessible` is not defined in this dump (only the setter exists), UNVERIFIED elsewhere. |
| `VehicleActionController:getControlledActionIcons()` | 368 | ✍ Returns the icons (positive, negative, change-colour flag) of the first action that defines them, or nil. |
| `VehicleActionController:playControlledActions()` | 381 | ✍ Starts the action sequence, unless savegame actions are still being re-applied. |
| `VehicleActionController:resetCurrentState()` | 389 | ✍ Resets the stored direction to -1 (off state) without running any action. |
| `VehicleActionController:getActionControllerDirection()` | 395 | ✍ Returns the direction the next sequence would take, i.e. the negation of the last direction. |
| `VehicleActionController:update(dt: any)` | 401 | ✍ Per-frame update: advances the running sequence when the current bucket is finished, updates each action, re-applies the savegame state about 500 ms after load once the motor is started, and aligns newly added actions with the controller direction. |
| `VehicleActionController:updateForAI(dt: any)` | 468 | ✍ Forwards the AI update to every action. |
| `VehicleActionController:onAIEvent(sourceVehicle: any, eventName: any)` | 476 | ✍ Forwards an AI event name to the actions whose source vehicle matches `sourceVehicle`. |
| `VehicleActionController:drawDebugRendering()` | 486 | ✍ Draws debug text lists of all actions and of the current sequence, highlighting the running step (green done, orange current). Uses `renderText` directly. |
| `VehicleActionController.registerXMLPaths(schema: any, basePath: any)` | 542 | ✍ Registers the savegame XML schema paths: `#lastDirection`, `#numActions` and `action(?)` with `#name`, `#identifier`, `#lastDirection` under the given base path. |
