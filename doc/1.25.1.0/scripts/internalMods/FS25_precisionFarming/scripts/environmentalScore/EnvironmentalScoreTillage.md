# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreTillage.lua

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreTillage.lua` — FS25 1.25.1.0

- **EnvironmentalScoreTillage** inherits from `EnvironmentalScoreValue` (l.18)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `EnvironmentalScoreTillage.new(pfModule: any, customMt: any)` | 22 |  |
| `EnvironmentalScoreTillage:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 39 |  |
| `EnvironmentalScoreTillage:update(dt: any)` | 49 |  |
| `EnvironmentalScoreTillage:getScore(farmlandId: any)` | 54 |  |
| `EnvironmentalScoreTillage:initFarmlandData()` | 75 |  |
| `EnvironmentalScoreTillage:loadFarmlandData(data: any, xmlFile: any, key: any)` | 89 |  |
| `EnvironmentalScoreTillage:saveFarmlandData(data: any, xmlFile: any, key: any)` | 99 |  |
| `EnvironmentalScoreTillage:readFarmlandDataFromStream(data: any, streamId: any, connection: any)` | 111 |  |
| `EnvironmentalScoreTillage:writeFarmlandDataToStream(data: any, streamId: any, connection: any)` | 118 |  |
| `EnvironmentalScoreTillage:addWorkedArea(farmlandId: any, area: any, type: any)` | 125 |  |
| `EnvironmentalScoreTillage:overwriteGameFunctions(pfModule: any)` | 165 |  |
