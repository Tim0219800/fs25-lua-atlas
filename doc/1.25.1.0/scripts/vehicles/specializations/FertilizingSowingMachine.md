# vehicles/specializations/FertilizingSowingMachine.lua

Source: `dataS/scripts/vehicles/specializations/FertilizingSowingMachine.lua` — FS25 1.25.1.0

- **FertilizingSowingMachine** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `FertilizingSowingMachine.prerequisitesPresent(specializations: table) → boolean` | 19 |  |
| `FertilizingSowingMachine.initSpecialization()` | 25 |  |
| `FertilizingSowingMachine.registerOverwrittenFunctions(vehicleType: any)` | 36 |  |
| `FertilizingSowingMachine.registerEventListeners(vehicleType: any)` | 44 |  |
| `FertilizingSowingMachine:onLoad(savegame: any)` | 50 |  |
| `FertilizingSowingMachine:processSowingMachineArea(superFunc: any, workArea: any, dt: any)` | 62 |  |
| `FertilizingSowingMachine:getUseSprayerAIRequirements(superFunc: any)` | 201 |  |
| `FertilizingSowingMachine:getAreEffectsVisible(superFunc: any)` | 207 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `processSowingMachineArea` | 37 |
| registerOverwrittenFunction | `getUseSprayerAIRequirements` | 38 |
| registerOverwrittenFunction | `getAreEffectsVisible` | 39 |
| registerEventListener | `onLoad` | 45 |
