# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreHerbicide.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreHerbicide.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreHerbicide.lua` — FS25 1.25.1.0

✍ Environmental score criterion for weed control. It accumulates treated area per method on each farmland (spot spraying, full spraying, mechanical weeding) and converts the proportions into a 0 to 1 score. Server hooks on Sprayer, Weeder and HarvestExtension feed the data; clients receive only a compressed score. Subclass of EnvironmentalScoreValue.

- **EnvironmentalScoreHerbicide** inherits from `EnvironmentalScoreValue` (l.17)

## Functions

| Function | Line | Description |
|---|---|---|
| `EnvironmentalScoreHerbicide:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 29 | ✍ Calls the parent loadFromXML (through EnvironmentalScoreTillage:superClass(), which is the same parent class) and returns its result. Note: no Herbicide.new is defined in this file; it relies on the inherited constructor. |
| `EnvironmentalScoreHerbicide:update(dt: any)` | 39 | ✍ Empty update hook. |
| `EnvironmentalScoreHerbicide:getScore(farmlandId: any)` | 44 | ✍ Returns the weed control score for a farmland. It uses the client score if present, 0.5 when nothing was treated, else a weighted share: spot spray 1, mechanical 0.75, full spray 0.6. |
| `EnvironmentalScoreHerbicide:initFarmlandData()` | 70 | ✍ Creates the per-farmland record: area by treatment type (all 0) and a pendingReset flag set to false. |
| `EnvironmentalScoreHerbicide:loadFarmlandData(data: any, xmlFile: any, key: any)` | 83 | ✍ Reads the three treated areas and pendingReset from the savegame XML attributes. |
| `EnvironmentalScoreHerbicide:saveFarmlandData(data: any, xmlFile: any, key: any)` | 93 | ✍ Writes the three treated areas and pendingReset as XML attributes. |
| `EnvironmentalScoreHerbicide:readFarmlandDataFromStream(data: any, streamId: any, connection: any)` | 103 | ✍ Client side: reads the score sent as an 8 bit value (0 to 255) and keeps it as clientScore, rounded to two decimals. |
| `EnvironmentalScoreHerbicide:writeFarmlandDataToStream(data: any, streamId: any, connection: any)` | 110 | ✍ Server side: writes the current score of the farmland as an 8 bit value (score times 255). |
| `EnvironmentalScoreHerbicide:onHarvestScoreReset(farmlandId: any)` | 117 | ✍ Flags the farmland so its treated areas are cleared at the next treatment instead of immediately. |
| `EnvironmentalScoreHerbicide:addWorkedArea(farmlandId: any, area: any, type: any)` | 124 | ✍ Adds treated area of a given type to a farmland, first clearing all three areas if a reset is pending. |
| `EnvironmentalScoreHerbicide:overwriteGameFunctions(pfModule: any)` | 140 | ✍ Server only. Hooks Sprayer.processSprayerArea (herbicide counts as spot or full spray depending on getIsSpotSprayEnabled), Weeder.processWeederArea (mechanical) and HarvestExtension.setLastScoringValues (grass harvests count as spot-spray area). |
