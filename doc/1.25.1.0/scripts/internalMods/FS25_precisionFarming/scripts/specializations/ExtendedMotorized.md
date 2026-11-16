# internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMotorized.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMotorized.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ExtendedMotorized.lua` — FS25 1.25.1.0

✍ Precision Farming specialization added to motorized vehicles (requires Motorized and PrecisionFarmingStatistic). It adds the diesel consumed while on a field to the vehicle's Precision Farming statistics. The class doc comment says it tracks fuel usage on fields.

- **ExtendedMotorized** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `ExtendedMotorized.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Returns true when the vehicle type has both Motorized and PrecisionFarmingStatistic. |
| `ExtendedMotorized:updateConsumers(superFunc: any, dt: any, accInput: any)` | 33 | ✍ Override: after the base update, if the vehicle is on a field, adds the diesel used by permanent consumers (lastFuelUsage in l/h scaled to the frame time dt) to the usedFuel statistic. |
