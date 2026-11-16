# internalMods/FS25_precisionFarming/scripts/specializations/PrecisionFarmingStatistic.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/specializations/PrecisionFarmingStatistic.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/PrecisionFarmingStatistic.lua` — FS25 1.25.1.0

✍ Vehicle specialization of Precision Farming that caches, for each vehicle, the farmland under it, whether the player's farm may access it, the active contract and a smoothed on-field flag. It exposes the data and lets other specializations push values into the farmland statistics. Most setup code (load, spec fields) is not in this dump (UNVERIFIED).

- **PrecisionFarmingStatistic** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PrecisionFarmingStatistic.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Always returns true: no prerequisite specialization. |
| `PrecisionFarmingStatistic:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 60 | ✍ Every tick accumulates moved distance; when it exceeds the update distance (or no farmland is known) it refreshes farmland id, access right, contract at position and the on-field flags. The smoothed flag only flips back after moving more than 20 m from the last position. |
| `PrecisionFarmingStatistic:getPFStatisticInfo()` | 101 | ✍ Returns five values: the farmland statistics object, isOnField, farmlandId, isOnFieldSmoothed and the contract at the vehicle position. |
| `PrecisionFarmingStatistic:updatePFStatistic(name: any, value: any)` | 108 | ✍ Adds a value to the named farmland statistic, only if statistics exist, the vehicle is on a farmland the farm can access and no contract is active there. |
| `PrecisionFarmingStatistic:getPFYieldMap()` | 119 | ✍ Returns the yield map object stored in the specialization table (UNVERIFIED where it is assigned). |
