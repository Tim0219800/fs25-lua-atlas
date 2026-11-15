# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreSoilSample.lua

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreSoilSample.lua` — FS25 1.25.1.0

- **EnvironmentalScoreSoilSample** inherits from `EnvironmentalScoreValue` (l.16)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `EnvironmentalScoreSoilSample.new(pfModule: any, customMt: any)` | 20 |  |
| `EnvironmentalScoreSoilSample:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 35 |  |
| `EnvironmentalScoreSoilSample:update(dt: any)` | 45 |  |
| `EnvironmentalScoreSoilSample:getScore(farmlandId: any)` | 50 |  |
| `EnvironmentalScoreSoilSample:initFarmlandData()` | 66 |  |
| `EnvironmentalScoreSoilSample:loadFarmlandData(data: any, xmlFile: any, key: any)` | 74 |  |
| `EnvironmentalScoreSoilSample:saveFarmlandData(data: any, xmlFile: any, key: any)` | 80 |  |
| `EnvironmentalScoreSoilSample:readFarmlandDataFromStream(data: any, streamId: any, connection: any)` | 86 |  |
| `EnvironmentalScoreSoilSample:writeFarmlandDataToStream(data: any, streamId: any, connection: any)` | 93 |  |
| `EnvironmentalScoreSoilSample:onHarvestScoreReset(farmlandId: any)` | 100 |  |
| `EnvironmentalScoreSoilSample:updateFarmlandSampleState(farmlandId: any)` | 106 |  |
| `EnvironmentalScoreSoilSample:overwriteGameFunctions(pfModule: any)` | 124 |  |
