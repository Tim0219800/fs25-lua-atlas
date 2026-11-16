# vehicles/specializations/activatables/WinchAttachTreeActivatable.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/activatables/WinchAttachTreeActivatable.md)*

Source: `dataS/scripts/vehicles/specializations/activatables/WinchAttachTreeActivatable.lua` — FS25 1.25.1.0

✍ Activatable for the forestry winch: lets the owner player toggle attach mode and attach a tree to one rope of the vehicle `spec_winch`. One instance exists per rope. It registers its own action events while selected and delegates all actual work to winch methods on the vehicle (UNVERIFIED: those methods are defined in Winch.lua, not in this file).

- **WinchAttachTreeActivatable** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `WinchAttachTreeActivatable.new(vehicle: table, rope: any) → table` | 20 | ✍ Creates the activatable for one winch rope; caches the winch texts and rope list from `spec_winch` and keeps an empty prompt text. |
| `WinchAttachTreeActivatable:registerCustomInput(inputContext: any)` | 35 | ✍ Registers the winch attach-mode toggle (`WINCH_ATTACH_MODE`) and tree attach (`WINCH_ATTACH`) action events with very high text priority, then forces a refresh via `update`. |
| `WinchAttachTreeActivatable:removeCustomInput(inputContext: any)` | 49 | ✍ Removes every input action event registered by this object (all events bound to it as target). |
| `WinchAttachTreeActivatable:onToggleAttachTreeMode()` | 55 | ✍ Input callback: asks the vehicle to switch the attach mode of this rope via `setWinchTreeAttachMode`. |
| `WinchAttachTreeActivatable:onAttachTree()` | 61 | ✍ Input callback: if `getCanAttachWinchTree` allows it for this rope, calls `onAttachTreeInputEvent` on the vehicle. |
| `WinchAttachTreeActivatable:update(dt: any)` | 69 | ✍ Per-frame refresh of the prompts: toggle text shows start or stop attach mode, and the attach action is enabled only when a tree can be attached. |
| `WinchAttachTreeActivatable:getIsActivatable()` | 76 | ✍ False if the vehicle belongs to another farm, the rope already holds its maximum number of trees, or another rope is in attach mode; true otherwise. |
| `WinchAttachTreeActivatable:activate()` | 96 | ✍ Empty hook; nothing happens when the activatable becomes the selected one. |
| `WinchAttachTreeActivatable:deactivate()` | 101 | ✍ Empty hook; nothing happens when the activatable stops being the selected one. |
| `WinchAttachTreeActivatable:getDistance(x: any, y: any, z: any)` | 106 | ✍ Returns 0 while this rope is in attach mode (so it always wins selection); otherwise the 3D distance from the point to the rope node. |
| `WinchAttachTreeActivatable:draw()` | 117 | ✍ Empty hook; this activatable draws nothing on screen. |
