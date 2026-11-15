# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreHerbicide.lua

Source : `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreHerbicide.lua` — FS25 1.25.1.0

- **EnvironmentalScoreHerbicide** hérite de `EnvironmentalScoreValue` (l.17)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `EnvironmentalScoreHerbicide:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 29 |  |
| `EnvironmentalScoreHerbicide:update(dt: any)` | 39 |  |
| `EnvironmentalScoreHerbicide:getScore(farmlandId: any)` | 44 |  |
| `EnvironmentalScoreHerbicide:initFarmlandData()` | 70 |  |
| `EnvironmentalScoreHerbicide:loadFarmlandData(data: any, xmlFile: any, key: any)` | 83 |  |
| `EnvironmentalScoreHerbicide:saveFarmlandData(data: any, xmlFile: any, key: any)` | 93 |  |
| `EnvironmentalScoreHerbicide:readFarmlandDataFromStream(data: any, streamId: any, connection: any)` | 103 |  |
| `EnvironmentalScoreHerbicide:writeFarmlandDataToStream(data: any, streamId: any, connection: any)` | 110 |  |
| `EnvironmentalScoreHerbicide:onHarvestScoreReset(farmlandId: any)` | 117 |  |
| `EnvironmentalScoreHerbicide:addWorkedArea(farmlandId: any, area: any, type: any)` | 124 |  |
| `EnvironmentalScoreHerbicide:overwriteGameFunctions(pfModule: any)` | 140 |  |
