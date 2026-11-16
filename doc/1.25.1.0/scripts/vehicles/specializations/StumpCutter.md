# vehicles/specializations/StumpCutter.lua

*[Version française](../../../fr/scripts/vehicles/specializations/StumpCutter.md)*

Source: `dataS/scripts/vehicles/specializations/StumpCutter.lua` — FS25 1.25.1.0

✍ Specialization for stump cutters that grind tree trunks (split shapes) and clear decoration density-map areas. It requires TurnOnVehicle and declares a 'stumpCutter' work area type. Each cut node scans for a split shape in its cut plane, then the server cuts or crushes it after timers; the client drives wood-chip effects, sounds and animations. It also adds dirt/wear and engine load while cutting.

- **StumpCutter** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `StumpCutter.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Returns true only if the vehicle type also has the TurnOnVehicle specialization. |
| `StumpCutter.initSpecialization()` | 25 | ✍ Registers the 'stumpCutter' work area type and the XML schema: cut nodes (size, timers, thresholds, work area index, duration, effects), sounds, global effects and animation nodes. |
| `StumpCutter.registerFunctions(vehicleType: any)` | 60 | ✍ Registers crushSplitShape, stumpCutterSplitShapeCallback and processStumpCutterArea on the vehicle type. |
| `StumpCutter.registerOverwrittenFunctions(vehicleType: any)` | 68 | ✍ Overrides getDirtMultiplier, getWearMultiplier, getCultivatorLimitToField, getPlowLimitToField, getPlowForceLimitToField and getConsumingLoad. |
| `StumpCutter.registerEventListeners(vehicleType: any)` | 79 | ✍ Subscribes to onLoad, onDelete, onUpdateTick, onDeactivate, onTurnedOn and onTurnedOff. |
| `StumpCutter:onLoad(savegame: table)` | 91 | ✍ Reads every vehicle.stumpCutter.cutNode(i) (node, cut sizes, timers, thresholds, work area index, effects) until one is missing, and on clients loads sounds, global effects and animations. Warns on old FS17-FS22 XML keys. |
| `StumpCutter:onDelete()` | 170 | ✍ Deletes sound samples, animations, the global effects and the effects of every cut node. |
| `StumpCutter:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 188 | ✍ While turned on, processes one cut node per tick in rotation: finds a split shape in its plane, and on the server counts down and then crushes the tree or splits it. Clients start or stop wood-chip effects and the work sound. |
| `StumpCutter:onDeactivate()` | 311 | ✍ Client only: stops the global effects and the effects of every cut node. |
| `StumpCutter:onTurnedOn()` | 324 | ✍ Client only: stops running samples, plays the start sound followed by idle, and starts the animation nodes. |
| `StumpCutter:onTurnedOff()` | 337 | ✍ Client only: resets the work fade time, stops all effects and samples, plays the stop sound and stops the animations. |
| `StumpCutter:crushSplitShape(shape: integer)` | 355 | ✍ Server only: deletes the split shape and marks a 10 m square around it dirty in the height collision map and the AI system. |
| `StumpCutter:stumpCutterSplitShapeCallback(shape: integer, isBelow: boolean, isAbove: boolean, minY: number, maxY: number, minZ: number, maxZ: number)` | 375 | ✍ Callback of splitShape. Crushes the upper piece if shorter than 1 m, otherwise registers it with the tree plant manager. The lower piece is crushed if its cut centre is below terrain, else it is kept as the current shape. |
| `StumpCutter:processStumpCutterArea(workArea: any, dt: any)` | 402 | ✍ Work area callback: for cut nodes tied to this area, clears decoration density-map area (FSDensityMapUtil.clearDecoArea) and refreshes their last work time. Returns area and total area. Distant clients return 0, 0. Note: CLIENT_DM_UPDATE_RADIUS is not defined in this file (UNVERIFIED where it is set). |
| `StumpCutter:getDirtMultiplier(superFunc: any) → number` | 432 | ✍ Override adding the work dirt multiplier while a split shape is held in the specialization state. |
| `StumpCutter:getWearMultiplier(superFunc: any) → number` | 446 | ✍ Override adding the work wear multiplier while a split shape is held in the specialization state. |
| `StumpCutter:getCultivatorLimitToField(superFunc: any) → boolean` | 460 | ✍ Override that always returns false. |
| `StumpCutter:getPlowLimitToField() → boolean` | 467 | ✍ Returns false: the stump cutter is not limited to fields for plow logic. |
| `StumpCutter:getPlowForceLimitToField() → boolean` | 474 | ✍ Returns true, so the limit-to-field choice is forced. |
| `StumpCutter:getConsumingLoad(superFunc: any)` | 480 | ✍ Override that adds one load entry: 1 if any cut node worked in the last 500 ms, otherwise 0 (idle), and increments the count. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `crushSplitShape` | 61 |
| registerFunction | `stumpCutterSplitShapeCallback` | 62 |
| registerFunction | `processStumpCutterArea` | 63 |
| registerOverwrittenFunction | `getDirtMultiplier` | 69 |
| registerOverwrittenFunction | `getWearMultiplier` | 70 |
| registerOverwrittenFunction | `getCultivatorLimitToField` | 71 |
| registerOverwrittenFunction | `getPlowLimitToField` | 72 |
| registerOverwrittenFunction | `getPlowForceLimitToField` | 73 |
| registerOverwrittenFunction | `getConsumingLoad` | 74 |
| registerEventListener | `onLoad` | 80 |
| registerEventListener | `onDelete` | 81 |
| registerEventListener | `onUpdateTick` | 82 |
| registerEventListener | `onDeactivate` | 83 |
| registerEventListener | `onTurnedOn` | 84 |
| registerEventListener | `onTurnedOff` | 85 |
