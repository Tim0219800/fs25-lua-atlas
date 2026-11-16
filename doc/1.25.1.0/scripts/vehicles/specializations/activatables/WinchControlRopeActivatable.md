# vehicles/specializations/activatables/WinchControlRopeActivatable.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/activatables/WinchControlRopeActivatable.md)*

Source: `dataS/scripts/vehicles/specializations/activatables/WinchControlRopeActivatable.lua` — FS25 1.25.1.0

✍ Activatable for controlling a tensioned winch rope with a tree already attached: wind/unwind, detach the tree or start attaching another one. One instance per rope, selected when the local player stands near the rope line. Work is delegated to the vehicle's winch methods (UNVERIFIED: defined in Winch.lua, outside this file).

- **WinchControlRopeActivatable** (l.16)

## Functions

| Function | Line | Description |
|---|---|---|
| `WinchControlRopeActivatable.new(vehicle: table, rope: any) → table` | 22 | ✍ Creates the activatable for one winch rope; caches the winch texts and rope list from `spec_winch`. |
| `WinchControlRopeActivatable:registerCustomInput(inputContext: any)` | 37 | ✍ Registers three action events at very high priority: winch control (`WINCH_CONTROL`, analog capable), tree detach (`WINCH_DETACH`) and attach-another-tree mode (`WINCH_ATTACH_MODE`), each with its text. |
| `WinchControlRopeActivatable:removeCustomInput(inputContext: any)` | 54 | ✍ Removes every input action event registered by this object (all events bound to it as target). |
| `WinchControlRopeActivatable:onControlWinch(actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 60 | ✍ Input callback: forwards the input value to the vehicle with `setWinchControlInput` for this rope index (winds or unwinds the rope). |
| `WinchControlRopeActivatable:onDetachTree(actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 66 | ✍ Input callback: calls `detachTreeFromWinch` on the vehicle for this rope index. |
| `WinchControlRopeActivatable:onAttachMode(actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 72 | ✍ Input callback: enters attach mode for this rope if it can still take more trees; otherwise shows a blinking warning for 2500 ms. |
| `WinchControlRopeActivatable:update(dt: any)` | 82 | ✍ Enables the attach-another-tree action only when the local player is within the rope's `maxSubLength` plus `SUB_ATTACH_ADDITIONAL_RANGE` of the first tree's hook (horizontal distance). Note: indexes `attachedTrees[1]` without a nil check. |
| `WinchControlRopeActivatable:getIsActivatable()` | 94 | ✍ True when the vehicle is owned by the local farm, no other rope has a player in range or attach mode active, and the local player (controlled, no hand tool) is closer than `Winch.CONTROL_RANGE`. |
| `WinchControlRopeActivatable:activate()` | 124 | ✍ Empty hook; nothing happens when the activatable becomes the selected one. |
| `WinchControlRopeActivatable:deactivate()` | 129 | ✍ Empty hook; nothing happens when the activatable stops being the selected one. |
| `WinchControlRopeActivatable:getDistance(x: any, y: any, z: any)` | 134 | ✍ Returns the horizontal distance from the point to the rope segment between rope node and first tree hook; `math.huge` if another rope is active, no tree is attached or the hook node no longer exists. |
| `WinchControlRopeActivatable:draw()` | 163 | ✍ Empty hook; this activatable draws nothing on screen. |
