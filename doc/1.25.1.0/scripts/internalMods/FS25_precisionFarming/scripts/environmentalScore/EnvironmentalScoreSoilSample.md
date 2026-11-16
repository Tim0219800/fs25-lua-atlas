# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreSoilSample.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreSoilSample.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreSoilSample.lua` — FS25 1.25.1.0

✍ Environmental score criterion for soil sampling. It stores, per farmland, the fraction of the field that has been sampled (-1 when unknown) and uses it directly as the score. The fraction is refreshed from the Precision Farming coverMap after sampler work, soil map purchases and the analyse cheat command (server hooks). Subclass of EnvironmentalScoreValue.

- **EnvironmentalScoreSoilSample** inherits from `EnvironmentalScoreValue` (l.16)

## Functions

| Function | Line | Description |
|---|---|---|
| `EnvironmentalScoreSoilSample.new(pfModule: any, customMt: any)` | 20 | ✍ Constructor: sets the xmlKey to "soilSample" and defines type weights (none 0, sampled 1). |
| `EnvironmentalScoreSoilSample:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 35 | ✍ Calls the parent loadFromXML (through EnvironmentalScoreTillage:superClass(), the same parent class) and returns its result. |
| `EnvironmentalScoreSoilSample:update(dt: any)` | 45 | ✍ Empty update hook. |
| `EnvironmentalScoreSoilSample:getScore(farmlandId: any)` | 50 | ✍ Returns the sampled fraction of the farmland (0 to 1), the client score if present, or 0.5 while no sample state is known. |
| `EnvironmentalScoreSoilSample:initFarmlandData()` | 66 | ✍ Creates the per-farmland record with samplePercentage set to -1 (unknown). |
| `EnvironmentalScoreSoilSample:loadFarmlandData(data: any, xmlFile: any, key: any)` | 74 | ✍ Reads samplePercentage from the savegame XML. |
| `EnvironmentalScoreSoilSample:saveFarmlandData(data: any, xmlFile: any, key: any)` | 80 | ✍ Writes samplePercentage to the savegame XML. |
| `EnvironmentalScoreSoilSample:readFarmlandDataFromStream(data: any, streamId: any, connection: any)` | 86 | ✍ Client side: reads an 8 bit score and stores it as clientScore, rounded to two decimals. |
| `EnvironmentalScoreSoilSample:writeFarmlandDataToStream(data: any, streamId: any, connection: any)` | 93 | ✍ Server side: writes the current score as an 8 bit value (score times 255). |
| `EnvironmentalScoreSoilSample:onHarvestScoreReset(farmlandId: any)` | 100 | ✍ When the harvest scoring period ends, recomputes the sampled percentage of the farmland instead of flagging a reset. |
| `EnvironmentalScoreSoilSample:updateFarmlandSampleState(farmlandId: any)` | 106 | ✍ Reads the sampled share of a farmland from pfModule.coverMap:getFarmlandSampleState and stores it clamped to 0 to 1. |
| `EnvironmentalScoreSoilSample:overwriteGameFunctions(pfModule: any)` | 124 | ✍ Server only. Hooks SoilSampler.processSoilSampling, CoverMap.onCoverUpdateFinished and CoverMap.analyseArea. Note: the second hook calls self:onFarmlandSampleStatesFinished, which is not defined in this dump (UNVERIFIED). |
