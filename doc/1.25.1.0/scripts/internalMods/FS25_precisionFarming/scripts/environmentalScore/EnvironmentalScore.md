# internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScore.lua

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/environmentalScore/EnvironmentalScore.lua` — FS25 1.25.1.0

- **EnvironmentalScore** (l.30)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `EnvironmentalScore.new(pfModule: any, customMt: any)` | 34 |  |
| `EnvironmentalScore:delete()` | 107 |  |
| `EnvironmentalScore:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 118 |  |
| `EnvironmentalScore:loadFromItemsXML(xmlFile: any, key: any)` | 167 |  |
| `EnvironmentalScore:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 188 |  |
| `EnvironmentalScore:readStream(streamId: integer, connection: Connection, farmId: any)` | 210 |  |
| `EnvironmentalScore:writeStream(streamId: integer, connection: Connection, farmId: any)` | 223 |  |
| `EnvironmentalScore:update(dt: any)` | 234 |  |
| `EnvironmentalScore:toggleWindowSize(state: any)` | 288 |  |
| `EnvironmentalScore:setMapFrame(mapFrame: any)` | 298 |  |
| `EnvironmentalScore:onEnvScoreDetailsButton()` | 312 |  |
| `EnvironmentalScore:updateInputGlyphs()` | 318 |  |
| `EnvironmentalScore:onMapFrameOpen(mapFrame: any)` | 333 |  |
| `EnvironmentalScore:onHarvestScoreReset(farmlandId: any)` | 346 |  |
| `EnvironmentalScore:getFarmlandScore(farmlandId: any)` | 357 |  |
| `EnvironmentalScore:getTotalScoreFromValue(scoreValue: any, farmId: any)` | 368 |  |
| `EnvironmentalScore:getTotalScore(farmId: any)` | 402 |  |
| `EnvironmentalScore:updateUI()` | 447 |  |
| `EnvironmentalScore:onDraw(element: any, ingameMap: any)` | 483 |  |
| `EnvironmentalScore:onDrawFieldNumber(element: any, ingameMap: any, x: any, y: any, farmland: any)` | 503 |  |
| `EnvironmentalScore:drawFarmlandScore(x: any, y: any, dataKey: any, farmlandId: any, zoom: any)` | 514 |  |
| `EnvironmentalScore:onPeriodChanged(currentPeriod: any)` | 599 |  |
| `EnvironmentalScore:setColorBlindMode()` | 614 |  |
| `EnvironmentalScore:overwriteGameFunctions(pfModule: any)` | 629 |  |

## Messages

- subscribes `MessageType.PERIOD_CHANGED` (l.99)
- subscribes `MessageType.SETTING_CHANGED` (l.100)
