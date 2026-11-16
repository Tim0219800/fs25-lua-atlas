# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreNitrogen.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreNitrogen.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScoreNitrogen.lua` — FS25 1.25.1.0

✍ Environmental score criterion for nitrogen fertilisation accuracy. On each harvest it records the difference between applied and target nitrogen, averaged per harvested area, and maps it to a 0 to 1 score through a curve read from XML (scoreMapping.scoreValue with nOffset and score). Server-side hook on HarvestExtension; clients get a compressed score. Subclass of EnvironmentalScoreValue.

- **EnvironmentalScoreNitrogen** inherits from `EnvironmentalScoreValue` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `EnvironmentalScoreNitrogen.new(pfModule: any, customMt: any)` | 19 | ✍ Constructor: builds on the parent constructor and sets the xmlKey to "nitrogen". |
| `EnvironmentalScoreNitrogen:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 29 | ✍ Loads the score curve from scoreMapping.scoreValue entries. Each nOffset is divided by the nitrogen of one state change from g_precisionFarming.nitrogenMap when that map exists, so the curve is expressed in map states. |
| `EnvironmentalScoreNitrogen:update(dt: any)` | 61 | ✍ Empty update hook. |
| `EnvironmentalScoreNitrogen:getScore(farmlandId: any)` | 66 | ✍ Returns the nitrogen score: the client score if present, else the curve value for the average offset (offset sum over harvested area, rescaled by COMPRESSION), or 0.5 with no harvested area. |
| `EnvironmentalScoreNitrogen:initFarmlandData()` | 83 | ✍ Creates the per-farmland record: harvestedArea 0, nOffsetSum 0, pendingReset false. |
| `EnvironmentalScoreNitrogen:loadFarmlandData(data: any, xmlFile: any, key: any)` | 93 | ✍ Reads harvestedArea, nOffsetSum and pendingReset from the savegame XML. |
| `EnvironmentalScoreNitrogen:saveFarmlandData(data: any, xmlFile: any, key: any)` | 101 | ✍ Writes harvestedArea, nOffsetSum and pendingReset to the savegame XML. |
| `EnvironmentalScoreNitrogen:readFarmlandDataFromStream(data: any, streamId: any, connection: any)` | 109 | ✍ Client side: reads an 8 bit score and stores it as clientScore, rounded to two decimals. |
| `EnvironmentalScoreNitrogen:writeFarmlandDataToStream(data: any, streamId: any, connection: any)` | 116 | ✍ Server side: writes the current score as an 8 bit value (score times 255). |
| `EnvironmentalScoreNitrogen:onHarvestScoreReset(farmlandId: any)` | 123 | ✍ Flags the farmland so its accumulated values are cleared on the next harvest record. |
| `EnvironmentalScoreNitrogen:addWorkedArea(farmlandId: any, area: any, nOffset: any)` | 130 | ✍ Adds a harvested area and its nitrogen offset (both divided by COMPRESSION) to the farmland sums, resetting them first if a reset is pending. |
| `EnvironmentalScoreNitrogen:overwriteGameFunctions(pfModule: any)` | 148 | ✍ Server only. Hooks HarvestExtension.setLastScoringValues and records nActual minus nTarget for the harvested area; with ignoreOverfertilization, positive differences are clamped to 0. |
