# internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSowingMachine.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSowingMachine.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedSowingMachine.lua` — FS25 1.25.1.0

✍ Precision Farming specialization added to sowing machines (requires SowingMachine and PrecisionFarmingStatistic). It adds a seed rate mode (automatic from soil type or manual) synchronised by ExtendedSowingMachineRateEvent, scales seed usage by the real rate, records seed statistics, and reads recommended seed rate and tramline width from the maps. It wraps processSowingMachineArea and processOverSeedingArea.

- **ExtendedSowingMachine** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `ExtendedSowingMachine.prerequisitesPresent(specializations: table) → boolean` | 25 | ✍ Returns true when the vehicle type has both SowingMachine and PrecisionFarmingStatistic. |
| `ExtendedSowingMachine:onDelete()` | 84 | ✍ Deletes the HUD extension if one was created. |
| `ExtendedSowingMachine:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 93 | ✍ Once the vehicle moved far enough, samples the soil and tramline maps at the first work area, and stores the recommended seed rate and tramline width (nil if off field). Also adds the HUD extension when active for input. |
| `ExtendedSowingMachine:onEndWorkAreaProcessing(dt: any, hasProcessed: any)` | 141 | ✍ Server only: when area was sown, computes seed usage from the fruit's per-sqm usage, usage scale and vehicle damage, for both the adjusted and the regular area, and adds them to the usedSeeds and usedSeedsRegular statistics. |
| `ExtendedSowingMachine:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 169 | ✍ Client only: when active for input, registers the auto mode toggle and seed rate change actions (high priority) and updates their state; flags that the attach state changed. |
| `ExtendedSowingMachine:setSeedRateAutoMode(state: any, noEventSend: any)` | 191 | ✍ Sets or toggles (state nil) the automatic seed rate mode, refreshes action texts on clients and sends ExtendedSowingMachineRateEvent unless noEventSend is set. |
| `ExtendedSowingMachine:setManualSeedRate(seedRate: any, noEventSend: any)` | 210 | ✍ Clamps the manual seed rate between ExtendedSowingMachine.MIN_SEED_RATE and MAX_SEED_RATE, stores it if changed and sends ExtendedSowingMachineRateEvent unless noEventSend is set. |
| `ExtendedSowingMachine:onTramlinesChanged()` | 222 | ✍ Forces the next onUpdate to resample the ground data by setting the travelled distance counter to infinity. |
| `ExtendedSowingMachine:processSowingMachineArea(superFunc: any, workArea: any, dt: any)` | 229 | ✍ Override: after the base sowing, asks the seed rate map to update the seed area with the auto or manual rate, and rescales the changed area by the real seed usage ratio. Stores the last seed rate and index, returns the base areas. |
| `ExtendedSowingMachine:processOverSeedingArea(superFunc: any, workArea: any, dt: any)` | 262 | ✍ Override with the same logic as processSowingMachineArea, applied to over-seeding work areas. |
| `ExtendedSowingMachine.actionEventToggleAuto(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 295 | ✍ Input callback that toggles the automatic seed rate mode. |
| `ExtendedSowingMachine.actionEventChangeSeedRate(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, ...: any)` | 301 | ✍ Input callback that changes the manual seed rate by one step in the direction of the input value sign. |
| `ExtendedSowingMachine.updateActionEventState(self: any)` | 308 | ✍ Sets the auto mode action text from the current mode and enables the seed rate change action only when auto mode is off. |
