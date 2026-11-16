# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScorePH.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScorePH.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScorePH.lua` — FS25 1.25.1.0

✍ Environmental score criterion for soil pH management. On each harvest it records the difference between actual and target pH, averaged per harvested area, and maps it to a 0 to 1 score with an XML curve (scoreMapping.scoreValue with phOffset and score). Server-side hook on HarvestExtension; clients get a compressed score. Subclass of EnvironmentalScoreValue.

- **EnvironmentalScorePH** inherits from `EnvironmentalScoreValue` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `EnvironmentalScorePH.new(pfModule: any, customMt: any)` | 19 | ✍ Constructor: builds on the parent constructor and sets the xmlKey to "ph". |
| `EnvironmentalScorePH:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 29 | ✍ Loads the score curve from scoreMapping.scoreValue entries. Each phOffset is divided by the pH change of one state from g_precisionFarming.pHMap when that map exists. |
| `EnvironmentalScorePH:update(dt: any)` | 61 | ✍ Empty update hook. |
| `EnvironmentalScorePH:getScore(farmlandId: any)` | 66 | ✍ Returns the pH score: the client score if present, else the curve value for the average offset (sum over harvested area, rescaled by COMPRESSION), or 0.5 with no harvested area. |
| `EnvironmentalScorePH:initFarmlandData()` | 83 | ✍ Creates the per-farmland record: harvestedArea 0, phOffsetSum 0, pendingReset false. |
| `EnvironmentalScorePH:loadFarmlandData(data: any, xmlFile: any, key: any)` | 93 | ✍ Reads harvestedArea, phOffsetSum and pendingReset from the savegame XML. |
| `EnvironmentalScorePH:saveFarmlandData(data: any, xmlFile: any, key: any)` | 101 | ✍ Writes harvestedArea, phOffsetSum and pendingReset to the savegame XML. |
| `EnvironmentalScorePH:readFarmlandDataFromStream(data: any, streamId: any, connection: any)` | 109 | ✍ Client side: reads an 8 bit score and stores it as clientScore, rounded to two decimals. |
| `EnvironmentalScorePH:writeFarmlandDataToStream(data: any, streamId: any, connection: any)` | 116 | ✍ Server side: writes the current score as an 8 bit value (score times 255). |
| `EnvironmentalScorePH:onHarvestScoreReset(farmlandId: any)` | 123 | ✍ Flags the farmland so its accumulated values are cleared on the next harvest record. |
| `EnvironmentalScorePH:addWorkedArea(farmlandId: any, area: any, nOffset: any)` | 130 | ✍ Adds a harvested area and its pH offset (both divided by COMPRESSION) to the farmland sums, resetting them first if a reset is pending. The third parameter is named nOffset in the source but carries a pH difference. |
| `EnvironmentalScorePH:overwriteGameFunctions(pfModule: any)` | 148 | ✍ Server only. Hooks HarvestExtension.setLastScoringValues and records pHActual minus pHTarget for the harvested area when both values are present. |
