# vehicles/specializations/FertilizingSowingMachine.lua

*[Version française](../../../fr/scripts/vehicles/specializations/FertilizingSowingMachine.md)*

Source: `dataS/scripts/vehicles/specializations/FertilizingSowingMachine.lua` — FS25 1.25.1.0

✍ Vehicle specialization for seeders that also spread fertilizer during sowing. It requires the SowingMachine and Sprayer specializations and overrides the sowing work-area processing to sow and update the spray density map in one pass, update farm spray statistics and stop AI jobs on missing seed, fertilizer or wrong field type. Note: this file reads FertilizingSowingMachine.CLIENT_DM_UPDATE_RADIUS but does not define it anywhere in the dump (UNVERIFIED where it is set).

- **FertilizingSowingMachine** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `FertilizingSowingMachine.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Returns true only if both the SowingMachine and Sprayer specializations are present. |
| `FertilizingSowingMachine.initSpecialization()` | 25 | ✍ Registers the XML key vehicle.fertilizingSowingMachine#needsSetIsTurnedOn (default false). |
| `FertilizingSowingMachine.registerOverwrittenFunctions(vehicleType: any)` | 36 | ✍ Overrides processSowingMachineArea, getUseSprayerAIRequirements and getAreEffectsVisible on the vehicle type. |
| `FertilizingSowingMachine.registerEventListeners(vehicleType: any)` | 44 | ✍ Subscribes the specialization to the onLoad vehicle event. |
| `FertilizingSowingMachine:onLoad(savegame: any)` | 50 | ✍ Reads needsSetIsTurnedOn, lets the sprayer run without being filled and without speed limit, and sets needWaterInfo to true on the vehicle. |
| `FertilizingSowingMachine:processSowingMachineArea(superFunc: any, workArea: any, dt: any)` | 62 | ✍ Per work area: checks water/land seeding, seed availability, fertilizer source and required field type (stopping AI jobs with an error when needed), erases tire tracks, then sows (normal or direct) and sprays FERTILIZER on the density maps. Updates farm spray statistics. Returns changed and total area, or 0, 0 when nothing is done. |
| `FertilizingSowingMachine:getUseSprayerAIRequirements(superFunc: any)` | 201 | ✍ Always returns false, so the sprayer's own AI requirements are not applied to this combined machine. |
| `FertilizingSowingMachine:getAreEffectsVisible(superFunc: any)` | 207 | ✍ Effects are visible only if the parent says so and the sprayer fill unit currently holds a known fill type (not UNKNOWN). |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `processSowingMachineArea` | 37 |
| registerOverwrittenFunction | `getUseSprayerAIRequirements` | 38 |
| registerOverwrittenFunction | `getAreEffectsVisible` | 39 |
| registerEventListener | `onLoad` | 45 |
