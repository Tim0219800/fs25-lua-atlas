# vehicles/specializations/StumpCutterLight.lua

*[Version française](../../../fr/scripts/vehicles/specializations/StumpCutterLight.md)*

Source: `dataS/scripts/vehicles/specializations/StumpCutterLight.lua` — FS25 1.25.1.0

✍ Simplified stump cutter specialization (requires TurnOnVehicle) that removes tree stumps found near a reference node. The server runs asynchronous sphere overlap checks against tree collision, and after a delay replants each found stump as a new tree and deletes the stump. It also lowers controlled-action availability when no stump is in range. Note: the dump has no 'StumpCutterLight = {}' declaration line in this file (UNVERIFIED where the table is created).


## Functions

| Function | Line | Description |
|---|---|---|
| `StumpCutterLight.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Returns true only if the vehicle type also has the TurnOnVehicle specialization. |
| `StumpCutterLight.initSpecialization()` | 25 | ✍ Registers the XML schema: cut reference node, cut radius (default 1), cut time (default 1) and the effects under vehicle.stumpCutterLight. |
| `StumpCutterLight.registerFunctions(vehicleType: any)` | 40 | ✍ Registers removeTreeStump and stumpCutterLightOverlapCallback on the vehicle type. |
| `StumpCutterLight.registerOverwrittenFunctions(vehicleType: any)` | 47 | ✍ Overrides getAreControlledActionsAllowed, getDirtMultiplier, getWearMultiplier and getConsumingLoad. |
| `StumpCutterLight.registerEventListeners(vehicleType: any)` | 56 | ✍ Subscribes to onLoad, onDelete, onUpdate, onDeactivate, onTurnedOn and onTurnedOff. |
| `StumpCutterLight:onLoad(savegame: table)` | 68 | ✍ Reads the cut node, radius and time, initializes the stump list, loads effects on clients and the 'no stump in range' warning text. Removes listeners that are useless on the current side (onUpdate on clients, effect listeners on servers without client). |
| `StumpCutterLight:onDelete()` | 104 | ✍ Deletes the effects. |
| `StumpCutterLight:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 114 | ✍ Server only. While turned on, accumulates the cut timer if stumps were found and, once exceeded with no overlap pending, removes them all and turns off (via controlled actions on platforms with automatic control). Starts a new async sphere overlap when none is pending. |
| `StumpCutterLight:onDeactivate()` | 158 | ✍ Stops the effects. |
| `StumpCutterLight:onTurnedOn()` | 166 | ✍ Sets the effect fill type to wood chips and starts the effects. |
| `StumpCutterLight:onTurnedOff()` | 175 | ✍ Stops the effects. |
| `StumpCutterLight:removeTreeStump(shapeId: integer)` | 183 | ✍ Server only. Replants a tree of the stump's tree type at its position with a random yaw, increments the farm's plantedTreeCount stat, then deletes the stump node. |
| `StumpCutterLight:stumpCutterLightOverlapCallback(objectId: any, ...: any)` | 203 | ✍ Async overlap callback: keeps the object if it is a mesh split shape with the user attribute isTreeStump, then marks the overlap check as finished. Ignored if the vehicle was deleted. |
| `StumpCutterLight:getAreControlledActionsAllowed(superFunc: any)` | 218 | ✍ Override: returns false with the 'no stump in range' warning text when no stump is currently found; otherwise defers to the parent. |
| `StumpCutterLight:getDirtMultiplier(superFunc: any) → number` | 230 | ✍ Override adding the work dirt multiplier while turned on. |
| `StumpCutterLight:getWearMultiplier(superFunc: any) → number` | 243 | ✍ Override adding the work wear multiplier while turned on. |
| `StumpCutterLight:getConsumingLoad(superFunc: any)` | 255 | ✍ Override that adds one load entry: 1 while turned on, otherwise 0, and increments the count. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `removeTreeStump` | 41 |
| registerFunction | `stumpCutterLightOverlapCallback` | 42 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 48 |
| registerOverwrittenFunction | `getDirtMultiplier` | 49 |
| registerOverwrittenFunction | `getWearMultiplier` | 50 |
| registerOverwrittenFunction | `getConsumingLoad` | 51 |
| registerEventListener | `onLoad` | 57 |
| registerEventListener | `onDelete` | 58 |
| registerEventListener | `onUpdate` | 59 |
| registerEventListener | `onDeactivate` | 60 |
| registerEventListener | `onTurnedOn` | 61 |
| registerEventListener | `onTurnedOff` | 62 |
