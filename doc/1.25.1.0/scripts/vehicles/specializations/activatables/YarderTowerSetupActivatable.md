# vehicles/specializations/activatables/YarderTowerSetupActivatable.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/activatables/YarderTowerSetupActivatable.md)*

Source: `dataS/scripts/vehicles/specializations/activatables/YarderTowerSetupActivatable.lua` — FS25 1.25.1.0

✍ Activatable used to set up and remove a yarder tower's main rope: start or cancel setup mode and confirm the target tree. Selected when the player is in range of the tower. The actual state is held in `spec_yarderTower` (defined elsewhere, UNVERIFIED).

- **YarderTowerSetupActivatable** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `YarderTowerSetupActivatable.new(vehicle: table) → table` | 20 | ✍ Creates the setup activatable for a yarder tower vehicle with an empty prompt text. |
| `YarderTowerSetupActivatable:registerCustomInput(inputContext: any)` | 32 | ✍ Registers the `ACTIVATE_OBJECT` toggle and `YARDER_SETUP_ROPE` set-target action events at very high priority, then updates their texts. |
| `YarderTowerSetupActivatable:removeCustomInput(inputContext: any)` | 45 | ✍ Removes every input action event registered by this object (all events bound to it as target). |
| `YarderTowerSetupActivatable:onToggleSetupMode()` | 51 | ✍ Input callback: if the main rope is active it deactivates the target; otherwise, when allowed, enters setup mode, else shows the returned warning for 2000 ms. |
| `YarderTowerSetupActivatable:onSetTarget()` | 68 | ✍ Input callback: calls `setYarderTargetActive(true)` to confirm the target tree and activate the main rope. |
| `YarderTowerSetupActivatable:updateActionEventTexts()` | 74 | ✍ Sets the toggle text (cancel, remove or start setup) from the yarder state, and enables the set-target action only in setup mode with a valid main rope. |
| `YarderTowerSetupActivatable:getIsActivatable()` | 96 | ✍ Returns whether the player is within the yarder setup range, via `getIsPlayerInYarderRange`. |
| `YarderTowerSetupActivatable:activate()` | 102 | ✍ Empty hook; nothing happens when the activatable becomes the selected one. |
| `YarderTowerSetupActivatable:deactivate()` | 107 | ✍ Empty hook; nothing happens when the activatable stops being the selected one. |
| `YarderTowerSetupActivatable:getDistance(x: any, y: any, z: any)` | 112 | ✍ Returns the 3D distance to `controlTriggerNode`, or `math.huge` if that node is nil. |
| `YarderTowerSetupActivatable:draw()` | 123 | ✍ Empty hook; this activatable draws nothing on screen. |
