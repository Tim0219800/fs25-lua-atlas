# vehicles/specializations/FertilizingCultivator.lua

*[Version française](../../../fr/scripts/vehicles/specializations/FertilizingCultivator.md)*

Source: `dataS/scripts/vehicles/specializations/FertilizingCultivator.lua` — FS25 1.25.1.0

✍ Vehicle specialization for cultivators that also spread fertilizer in the same pass. It requires both the Cultivator and Sprayer specializations and overrides the cultivator work-area processing so that cultivation and spray density-map updates happen together. It also adjusts the AI prohibited ranges for already-fertilized ground.

- **FertilizingCultivator** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `FertilizingCultivator.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Returns true only if both the Cultivator and Sprayer specializations are present on the vehicle type. |
| `FertilizingCultivator.initSpecialization()` | 25 | ✍ Registers the XML key vehicle.fertilizingCultivator#needsSetIsTurnedOn (default false). |
| `FertilizingCultivator.registerOverwrittenFunctions(vehicleType: any)` | 36 | ✍ Overrides processCultivatorArea and setSprayerAITerrainDetailProhibitedRange on the vehicle type. |
| `FertilizingCultivator.registerEventListeners(vehicleType: any)` | 43 | ✍ Subscribes the specialization to the onLoad vehicle event. |
| `FertilizingCultivator:onLoad(savegame: any)` | 49 | ✍ Reads needsSetIsTurnedOn, disables the sprayer speed limit, clears the AI terrain-detail required range and refreshes the cultivator AI requirements. |
| `FertilizingCultivator:processCultivatorArea(superFunc: any, workArea: any, dt: any)` | 60 | ✍ Per work area: stops the AI job when its fertilizer source runs out (depending on helper settings), erases tire tracks, cultivates (deep or disc harrow, plus vine and subsoiler) and sprays using the FERTILIZER spray type. Remote clients beyond the update radius return 0, 0. Returns changed and total cultivated area. |
| `FertilizingCultivator:setSprayerAITerrainDetailProhibitedRange(superFunc: any, fillType: any)` | 139 | ✍ Replaces the sprayer version: clears prohibited ranges, then, for the given fill type's spray type, forbids AI work on ground already holding that spray type and on ground at maximum spray level. Does nothing if the vehicle has no AI prohibition support. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `processCultivatorArea` | 37 |
| registerOverwrittenFunction | `setSprayerAITerrainDetailProhibitedRange` | 38 |
| registerEventListener | `onLoad` | 44 |
