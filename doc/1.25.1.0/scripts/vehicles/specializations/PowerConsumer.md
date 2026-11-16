# vehicles/specializations/PowerConsumer.lua

*[Version française](../../../fr/scripts/vehicles/specializations/PowerConsumer.md)*

Source: `dataS/scripts/vehicles/specializations/PowerConsumer.lua` — FS25 1.25.1.0

✍ Specialization for implements that draw engine power, either through the PTO or as a pulling resistance. It has no prerequisites. It reads vehicle.powerConsumer (optionally per powerConsumer configuration), adds a drag force while moving, reports PTO torque and rpm to the root motor, and can refuse turn-on when the tractor motor lacks torque. It also provides the 'neededPower' store spec and an optional speed limit offset depending on the source motor power.

- **PowerConsumer** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PowerConsumer.initSpecialization()` | 15 | ✍ Registers the 'powerConsumer' configuration type and the 'neededPower' store spec, then the XML paths (base and per configuration), the store data keys and the work mode attributes forceScale and ptoPowerScale. |
| `PowerConsumer.registerPowerConsumerXMLPaths(schema: any, basePath: any)` | 40 | ✍ Registers all powerConsumer XML attributes under a given base path: force nodes, maxForce (kN), forceDir, turn-on peak settings, PTO power and rpm, virtual power multiplier and speedLimitModifier entries. |
| `PowerConsumer.prerequisitesPresent(specializations: table) → boolean` | 70 | ✍ Always returns true: no prerequisite specializations. |
| `PowerConsumer.registerFunctions(vehicleType: any)` | 76 | ✍ Adds loadPowerSetup, getPtoRpm, getDoConsumePtoPower, getPowerMultiplier, getConsumedPtoTorque and getConsumingLoad to the vehicle type. |
| `PowerConsumer.registerOverwrittenFunctions(vehicleType: any)` | 87 | ✍ Overrides getCanBeTurnedOn, getCanBeTurnedOnAll, getTurnedOnNotAllowedWarning, getRawSpeedLimit and loadWorkModeFromXML. |
| `PowerConsumer.registerEventListeners(vehicleType: any)` | 97 | ✍ Subscribes to onLoad, onUpdate, onStateChange, onWorkModeChanged and onTurnedOn. |
| `PowerConsumer:onLoad(savegame: table)` | 108 | ✍ Reads force, turn-on peak and speedLimitModifier settings from the configuration key (or vehicle.powerConsumer if absent) and calls loadPowerSetup. Horsepower limits are converted to kW. Note: it removes an 'onPostDetach' listener that was never registered here. |
| `PowerConsumer:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 161 | ✍ While active and moving in forceDir, applies a braking force at the force node, equal to a friction term capped by maxForce and scaled by getPowerMultiplier. Also counts down the turn-on peak timer. |
| `PowerConsumer:loadPowerSetup(xmlFile: table, baseKey: any)` | 192 | ✍ Loads min and max needed PTO power (kW at ptoRpm), PTO rpm and the virtual power multiplier from the XML. Warns on a deprecated key and if max is below min. |
| `PowerConsumer:getPtoRpm() → number` | 210 | ✍ Returns the configured PTO rpm while the vehicle consumes PTO power, otherwise 0. |
| `PowerConsumer:getDoConsumePtoPower() → boolean` | 221 | ✍ True if useTurnOnState is set and the vehicle is turned on (it needs getIsTurnedOn). |
| `PowerConsumer:getPowerMultiplier() → number` | 228 | ✍ Returns 1 by default; meant to be overridden to scale the drag force in onUpdate. |
| `PowerConsumer:getConsumedPtoTorque(expected: any, ignoreTurnOnPeak: any) → number` | 236 | ✍ Returns the PTO torque (kNm) and a virtual multiplier. Power is interpolated between min and max by the average consuming load, divided by angular speed, with a temporary peak after turn-on unless ignoreTurnOnPeak. Returns 0, 1 when idle. |
| `PowerConsumer:getConsumingLoad()` | 264 | ✍ Default returns 0, 0 (load, count); specializations override it to report their load for getConsumedPtoTorque. |
| `PowerConsumer:getCanBeTurnedOn(superFunc: any) → boolean` | 271 | ✍ Returns false (plus a not-enough-power flag) when the expected torque of this and all implements, scaled to engine side, exceeds 90 percent of the root motor peak torque and the tool is off. Otherwise defers to the parent. |
| `PowerConsumer:getCanBeTurnedOnAll(superFunc: any) → boolean` | 299 | ✍ Same torque check for the whole implement chain: returns false with the turn-on warning text if all PTO torques exceed 90 percent of peak motor torque and this tool is off. |
| `PowerConsumer:getTurnedOnNotAllowedWarning(superFunc: any) → string` | 325 | ✍ Returns the insufficient-power warning if getCanBeTurnedOn reports missing power; otherwise defers to the parent. |
| `PowerConsumer:getRawSpeedLimit(superFunc: any)` | 337 | ✍ Adds the offset of the last speedLimitModifier whose power range contains the source motor peak power (kW) to the parent speed limit. |
| `PowerConsumer:loadWorkModeFromXML(superFunc: any, xmlFile: any, key: any, workMode: any)` | 353 | ✍ After the parent loads a work mode, reads its forceScale and ptoPowerScale (default 1). Returns false if the parent failed. |
| `PowerConsumer:onStateChange(state: any, data: any)` | 366 | ✍ On attach or detach, stores the root vehicle motor peak power in sourceMotorPeakPower (math.huge without a motor). |
| `PowerConsumer:onWorkModeChanged(workMode: any, oldWorkMode: any)` | 381 | ✍ Rescales maxForce and the min/max needed PTO power from their original values using the work mode forceScale. Note: ptoPowerScale is loaded but not used here. |
| `PowerConsumer:onTurnedOn()` | 398 | ✍ Starts the turn-on peak timer at 1.5 times the peak duration. |
| `PowerConsumer.getTotalConsumedPtoTorque(self: table?, excludeVehicle: table?, expected: boolean?, ignoreTurnOnPeak: boolean?) → number, number` | 409 | ✍ Recursively sums consumed PTO torque (kNm) over a vehicle and its attached implements, optionally excluding one vehicle. Returns the total and a torque-weighted virtual multiplier. |
| `PowerConsumer.getMaxPtoRpm(self: any) → number` | 438 | ✍ Recursively returns the highest PTO rpm requested by a vehicle or any implement attached to it. |
| `PowerConsumer:consoleSetPowerConsumer(neededMinPtoPower: any, neededMaxPtoPower: any, forceFactor: any, maxForce: any, forceDir: any, ptoRpm: any)` | 458 | ✍ Console command handler: overrides power and force values on the selected implement and on all vehicles with the same config file, for live tuning. Returns a status or usage string. |
| `PowerConsumer.loadSpecValueNeededPower(xmlFile: XMLFile, customEnvironment: string, baseDir: any) → number` | 500 | ✍ Store spec loader: reads neededPower, its maxPower and one value per powerConsumer configuration from the XML into a table (base, maxPower, config). |
| `PowerConsumer.getSpecValueNeededPower(storeItem: table, realItem: table, configurations: any, saleItem: any, returnValues: any, returnRange: any) → string, number, number` | 529 | ✍ Builds the shop text for needed power, a single kW/HP value or an HP range across configurations. Returns nil if no power is set or the minimum is 0. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadPowerSetup` | 77 |
| registerFunction | `getPtoRpm` | 78 |
| registerFunction | `getDoConsumePtoPower` | 79 |
| registerFunction | `getPowerMultiplier` | 80 |
| registerFunction | `getConsumedPtoTorque` | 81 |
| registerFunction | `getConsumingLoad` | 82 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 88 |
| registerOverwrittenFunction | `getCanBeTurnedOnAll` | 89 |
| registerOverwrittenFunction | `getTurnedOnNotAllowedWarning` | 90 |
| registerOverwrittenFunction | `getRawSpeedLimit` | 91 |
| registerOverwrittenFunction | `loadWorkModeFromXML` | 92 |
| registerEventListener | `onLoad` | 98 |
| registerEventListener | `onUpdate` | 99 |
| registerEventListener | `onStateChange` | 100 |
| registerEventListener | `onWorkModeChanged` | 101 |
| registerEventListener | `onTurnedOn` | 102 |
