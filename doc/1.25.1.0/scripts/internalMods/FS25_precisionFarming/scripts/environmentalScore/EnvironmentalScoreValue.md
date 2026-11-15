# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreValue.lua

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreValue.lua` — FS25 1.25.1.0

- **EnvironmentalScoreValue** (l.12)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `EnvironmentalScoreValue.new(pfModule: any, customMt: any)` | 16 |  |
| `EnvironmentalScoreValue:initFarmlandData()` | 27 |  |
| `EnvironmentalScoreValue:getFarmlandData(farmlandId: any)` | 33 |  |
| `EnvironmentalScoreValue:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 44 |  |
| `EnvironmentalScoreValue:loadFromItemsXML(xmlFile: any, key: any)` | 52 |  |
| `EnvironmentalScoreValue:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 64 |  |
| `EnvironmentalScoreValue:loadFarmlandData(data: any, xmlFile: any, key: any)` | 76 |  |
| `EnvironmentalScoreValue:saveFarmlandData(data: any, xmlFile: any, key: any)` | 81 |  |
| `EnvironmentalScoreValue:readStream(streamId: integer, connection: Connection, farmId: any)` | 88 |  |
| `EnvironmentalScoreValue:writeStream(streamId: integer, connection: Connection, farmId: any)` | 101 |  |
| `EnvironmentalScoreValue:readFarmlandDataFromStream(data: any, streamId: any, connection: any)` | 121 |  |
| `EnvironmentalScoreValue:writeFarmlandDataToStream(data: any, streamId: any, connection: any)` | 126 |  |
| `EnvironmentalScoreValue:update(dt: any)` | 131 |  |
| `EnvironmentalScoreValue:getScore()` | 136 |  |
| `EnvironmentalScoreValue:overwriteGameFunctions(pfModule: any)` | 142 |  |
