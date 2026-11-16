# internalMods/FS25_precisionFarming/scripts/specializations/ManureSensor.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ManureSensor.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/ManureSensor.lua` — FS25 1.25.1.0

✍ Vehicle specialization of Precision Farming for manure sensors on sprayers/spreaders (requires Sprayer and PrecisionFarmingStatistic). It registers a 'manureSensor' configuration, attaches a sensor model, and overrides the nitrogen offset functions so that with a sensor the applied amount is exact and without one it drifts over time.

- **ManureSensor** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `ManureSensor.prerequisitesPresent(specializations: table) → boolean` | 23 | ✍ True only if the vehicle has both the Sprayer and PrecisionFarmingStatistic specializations. |
| `ManureSensor.initSpecialization()` | 29 | ✍ Registers the 'manureSensor' configuration type and the XML keys linkNode#node and linkNode#type (DEFAULT, LARGE, SMALL or STANDALONE) in the vehicle schema. |
| `ManureSensor:onLoad(savegame: any)` | 59 | ✍ Initialises a random curve offset and checks if any fill unit accepts liquid manure or digestate (sensor required). Links the sensor from the selected configuration, and for configs above 1 uses linkage data from g_precisionFarming by config file name. |
| `ManureSensor:linkManureSensor(linkData: any)` | 100 | ✍ Clones a sensor node of the given type for each link node (found by node or i3d mapping name), links it, applies optional translation, rotation and scale, then marks the sensor as available. |
| `ManureSensor:getManureSensorNitrogenOffset(lastChangeLevels: any)` | 134 | ✍ Computes a time-varying nitrogen offset from three summed sine waves over g_time, scaled by lastChangeLevels and MAX_NITROGEN_OFFSET_PCT, rounded to whole steps and sign-preserved. Simulates uncertain manure nitrogen content. |
| `ManureSensor:getCurrentNitrogenLevelOffset(superFunc: any, lastChangeLevels: any)` | 146 | ✍ Override. Without a required sensor it calls the parent. If a sensor is required but missing it returns the drifting offset; with a sensor it returns 0. |
| `ManureSensor:getCurrentNitrogenUsageLevelOffset(superFunc: any, lastChangeLevels: any)` | 162 | ✍ Override. Without a required sensor it calls the parent. With a sensor it returns the drifting offset, without one it returns 0 (the opposite of the level offset above). |
| `ManureSensor:getIsUsingExactNitrogenAmount(superFunc: any)` | 178 | ✍ Override. Returns the parent value if no sensor is required, otherwise whether a sensor is available. |
