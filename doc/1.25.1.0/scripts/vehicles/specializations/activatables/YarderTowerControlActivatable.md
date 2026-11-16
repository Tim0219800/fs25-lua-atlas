# vehicles/specializations/activatables/YarderTowerControlActivatable.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/activatables/YarderTowerControlActivatable.md)*

Source: `dataS/scripts/vehicles/specializations/activatables/YarderTowerControlActivatable.lua` — FS25 1.25.1.0

✍ Activatable for operating the carriage of a yarder tower (cable logging): follow modes, manual move and lift, attach and detach trees. Selected when the player is within the vehicle's control range. Behaviour of the called methods lives in the YarderTower specialization (UNVERIFIED, not in this file).

- **YarderTowerControlActivatable** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `YarderTowerControlActivatable.new(vehicle: table) → table` | 20 | ✍ Creates the activatable for a yarder tower vehicle with an empty prompt text. |
| `YarderTowerControlActivatable:registerCustomInput(inputContext: any)` | 32 | ✍ Registers the yarder carriage action events (follow me, follow home, follow pickup, left/right move, up/down lift, attach, detach) at very high priority, sets their texts, then calls `updateActionEventTexts`. |
| `YarderTowerControlActivatable:removeCustomInput(inputContext: any)` | 64 | ✍ Removes every input action event registered by this object (all events bound to it as target). |
| `YarderTowerControlActivatable:onToggleFollowMeMode()` | 70 | ✍ Input callback: toggles the carriage follow-me mode; sets `FOLLOW_MODE_NONE` if already following the player, otherwise `FOLLOW_MODE_ME`. |
| `YarderTowerControlActivatable:onToggleFollowHome()` | 81 | ✍ Input callback: sets the carriage follow mode to `FOLLOW_MODE_HOME` (return toward the tower). |
| `YarderTowerControlActivatable:onToggleFollowPickup()` | 87 | ✍ Input callback: sets the carriage follow mode to `FOLLOW_MODE_PICKUP` (move to the stored pickup position). |
| `YarderTowerControlActivatable:onManualControlLeftRight(actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 93 | ✍ Input callback: passes the input value to `setYarderCarriageMoveInput` for manual carriage movement along the rope. |
| `YarderTowerControlActivatable:onManualControlUpDown(actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 99 | ✍ Input callback: passes the input value to `setYarderCarriageLiftInput` to raise or lower the carriage load. |
| `YarderTowerControlActivatable:onTreeAttach(actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 105 | ✍ Input callback: calls `onYarderCarriageAttach` on the vehicle to hook trees near the carriage. |
| `YarderTowerControlActivatable:onTreeDetach(actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 111 | ✍ Input callback: calls `onYarderCarriageDetach` with the input value to release the attached trees. |
| `YarderTowerControlActivatable:update(dt: any)` | 117 | ✍ Per frame, if a carriage vehicle exists: enables attach only with a tree in mount range, and detach and lift/lower only when trees are attached. |
| `YarderTowerControlActivatable:updateActionEventTexts()` | 130 | ✍ Refreshes the follow-me text, and enables follow-home/follow-pickup only when no follow mode is active and the carriage is more than 5 (rope-length units, metres presumably) from the target. |
| `YarderTowerControlActivatable:getIsActivatable()` | 153 | ✍ Returns whether the player is inside the yarder control range, via `getIsPlayerInYarderControlRange`. |
| `YarderTowerControlActivatable:activate()` | 160 | ✍ Empty hook; nothing happens when the activatable becomes the selected one. |
| `YarderTowerControlActivatable:deactivate()` | 165 | ✍ Empty hook; nothing happens when the activatable stops being the selected one. |
| `YarderTowerControlActivatable:getDistance(x: any, y: any, z: any)` | 170 | ✍ Returns the distance computed by `getIsPlayerInYarderControlRange` (the point argument is ignored). |
| `YarderTowerControlActivatable:draw()` | 177 | ✍ Empty hook; this activatable draws nothing on screen. |
