# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreNitrogen.lua

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreNitrogen.lua` — FS25 1.25.1.0

- **EnvironmentalScoreNitrogen** inherits from `EnvironmentalScoreValue` (l.15)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `EnvironmentalScoreNitrogen.new(pfModule: any, customMt: any)` | 19 |  |
| `EnvironmentalScoreNitrogen:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 29 |  |
| `EnvironmentalScoreNitrogen:update(dt: any)` | 61 |  |
| `EnvironmentalScoreNitrogen:getScore(farmlandId: any)` | 66 |  |
| `EnvironmentalScoreNitrogen:initFarmlandData()` | 83 |  |
| `EnvironmentalScoreNitrogen:loadFarmlandData(data: any, xmlFile: any, key: any)` | 93 |  |
| `EnvironmentalScoreNitrogen:saveFarmlandData(data: any, xmlFile: any, key: any)` | 101 |  |
| `EnvironmentalScoreNitrogen:readFarmlandDataFromStream(data: any, streamId: any, connection: any)` | 109 |  |
| `EnvironmentalScoreNitrogen:writeFarmlandDataToStream(data: any, streamId: any, connection: any)` | 116 |  |
| `EnvironmentalScoreNitrogen:onHarvestScoreReset(farmlandId: any)` | 123 |  |
| `EnvironmentalScoreNitrogen:addWorkedArea(farmlandId: any, area: any, nOffset: any)` | 130 |  |
| `EnvironmentalScoreNitrogen:overwriteGameFunctions(pfModule: any)` | 148 |  |
