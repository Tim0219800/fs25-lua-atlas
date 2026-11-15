# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScorePH.lua

Source : `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScorePH.lua` — FS25 1.25.1.0

- **EnvironmentalScorePH** hérite de `EnvironmentalScoreValue` (l.15)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `EnvironmentalScorePH.new(pfModule: any, customMt: any)` | 19 |  |
| `EnvironmentalScorePH:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 29 |  |
| `EnvironmentalScorePH:update(dt: any)` | 61 |  |
| `EnvironmentalScorePH:getScore(farmlandId: any)` | 66 |  |
| `EnvironmentalScorePH:initFarmlandData()` | 83 |  |
| `EnvironmentalScorePH:loadFarmlandData(data: any, xmlFile: any, key: any)` | 93 |  |
| `EnvironmentalScorePH:saveFarmlandData(data: any, xmlFile: any, key: any)` | 101 |  |
| `EnvironmentalScorePH:readFarmlandDataFromStream(data: any, streamId: any, connection: any)` | 109 |  |
| `EnvironmentalScorePH:writeFarmlandDataToStream(data: any, streamId: any, connection: any)` | 116 |  |
| `EnvironmentalScorePH:onHarvestScoreReset(farmlandId: any)` | 123 |  |
| `EnvironmentalScorePH:addWorkedArea(farmlandId: any, area: any, nOffset: any)` | 130 |  |
| `EnvironmentalScorePH:overwriteGameFunctions(pfModule: any)` | 148 |  |
