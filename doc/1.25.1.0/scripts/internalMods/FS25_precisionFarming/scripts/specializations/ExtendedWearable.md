# internalMods/FS25_precisionFarming/scripts/specializations/ExtendedWearable.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedWearable.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedWearable.lua` — FS25 1.25.1.0

✍ Vehicle specialization of the Precision Farming internal mod. It requires Wearable and PrecisionFarmingStatistic, and turns wear damage into repair costs recorded in the farmland statistics while the vehicle is on a field.

- **ExtendedWearable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `ExtendedWearable.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Returns true only if the vehicle type has both the Wearable and PrecisionFarmingStatistic specializations. |
| `ExtendedWearable:onPostUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 42 | ✍ Compares the current wear damage with the previous tick, computes the repair price difference via Wearable.calculateRepairPrice, and if positive and the vehicle is on a field adds it to the 'vehicleCosts' statistic. Stores the damage for the next tick. Relies on spec fields set up in code absent from this file (UNVERIFIED). |
