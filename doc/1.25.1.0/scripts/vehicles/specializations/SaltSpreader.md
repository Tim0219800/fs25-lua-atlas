# vehicles/specializations/SaltSpreader.lua

*[Version française](../../../fr/scripts/vehicles/specializations/SaltSpreader.md)*

Source: `dataS/scripts/vehicles/specializations/SaltSpreader.lua` — FS25 1.25.1.0

✍ Specialization for road salt spreaders. It requires WorkArea and TurnOnVehicle, registers the "saltSpreader" work area type and consumes salt from a fill unit while turned on (usage in liters per second, optionally scaled by a work area width). On the server the work area calls the SnowSystem (`g_currentMission.snowSystem:saltArea`); effects are played on the client through the EffectManager.

- **SaltSpreader** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `SaltSpreader.initSpecialization()` | 15 | ✍ Registers the "saltSpreader" work area type and declares the XML schema: fill unit index, unload info index, usage work area, usage in liters per second, and the effects. |
| `SaltSpreader.prerequisitesPresent(specializations: table) → boolean` | 35 | ✍ Returns true only if the vehicle type has WorkArea and TurnOnVehicle. |
| `SaltSpreader.registerFunctions(vehicleType: any)` | 41 | ✍ Registers `processSaltSpreaderArea` on the vehicle type. |
| `SaltSpreader.registerOverwrittenFunctions(vehicleType: any)` | 47 | ✍ Overrides `doCheckSpeedLimit`, `getDirtMultiplier`, `getWearMultiplier`, `getAreControlledActionsAllowed`, `getCanBeTurnedOn`, `getTurnedOnNotAllowedWarning` and `getVariableWorkWidthUsage`. |
| `SaltSpreader.registerEventListeners(vehicleType: any)` | 59 | ✍ Subscribes to onLoad, onDelete, onUpdateTick, onTurnedOn and onTurnedOff. |
| `SaltSpreader:onLoad(savegame: table)` | 70 | ✍ Reads the fill unit, unload info, usage work area and usage (converted from l/s to l/ms), loads the effects on the client and caches the SnowSystem and the "fill the tool first" text. Removes onUpdateTick on non-servers. |
| `SaltSpreader:onDelete()` | 92 | ✍ Deletes the effects through the EffectManager. |
| `SaltSpreader:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 102 | ✍ Server tick: while turned on and the tank is not empty, removes salt from the fill unit proportionally to dt and the usage width; when the fill level reaches 0 it turns the spreader off. |
| `SaltSpreader:onTurnedOn()` | 125 | ✍ Client side: if the fill unit contains a known fill type, sets that type on the effects and starts them. |
| `SaltSpreader:onTurnedOff()` | 139 | ✍ Client side: stops the effects. |
| `SaltSpreader:doCheckSpeedLimit(superFunc: any) → boolean` | 149 | ✍ Returns true if the parent does or if the spreader is turned on, so the speed limit applies while spreading. |
| `SaltSpreader:getDirtMultiplier(superFunc: any)` | 155 | ✍ Adds the work dirt multiplier to the parent value while turned on. |
| `SaltSpreader:getWearMultiplier(superFunc: any)` | 165 | ✍ Adds the work wear multiplier to the parent value while turned on. |
| `SaltSpreader:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 177 | ✍ Returns false plus the "fill the tool first" warning when the tank is empty; otherwise defers to the parent. |
| `SaltSpreader:getCanBeTurnedOn(superFunc: any)` | 189 | ✍ Returns false when the fill unit is empty; otherwise defers to the parent. |
| `SaltSpreader:getTurnedOnNotAllowedWarning(superFunc: any)` | 200 | ✍ Returns the "fill the tool first" warning when the tank is empty; otherwise defers to the parent. |
| `SaltSpreader:getVariableWorkWidthUsage(superFunc: any) → number` | 212 | ✍ If the parent gives no usage, returns the salt usage in liters per minute (usage times work width times 1000 times 60) while turned on, else 0; otherwise returns the parent value. |
| `SaltSpreader.getDefaultSpeedLimit() → number` | 234 | ✍ Static function returning the default speed limit, 20 (km/h presumably; unit not stated in this file). |
| `SaltSpreader:processSaltSpreaderArea(workArea: any)` | 240 | ✍ Work area callback: on the server, calls `snowSystem:saltArea` with the area corners and returns its two results; on clients returns 0, 0. The SnowSystem class is not in the dump, so its return values are UNVERIFIED. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `processSaltSpreaderArea` | 42 |
| registerOverwrittenFunction | `doCheckSpeedLimit` | 48 |
| registerOverwrittenFunction | `getDirtMultiplier` | 49 |
| registerOverwrittenFunction | `getWearMultiplier` | 50 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 51 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 52 |
| registerOverwrittenFunction | `getTurnedOnNotAllowedWarning` | 53 |
| registerOverwrittenFunction | `getVariableWorkWidthUsage` | 54 |
| registerEventListener | `onLoad` | 60 |
| registerEventListener | `onDelete` | 61 |
| registerEventListener | `onUpdateTick` | 62 |
| registerEventListener | `onTurnedOn` | 63 |
| registerEventListener | `onTurnedOff` | 64 |
