# internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistics.lua

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistics.lua` — FS25 1.25.1.0

- **FarmlandStatistics** (l.16)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `FarmlandStatistics.new(pfModule: any, customMt: any)` | 20 |  |
| `FarmlandStatistics:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 34 |  |
| `FarmlandStatistics:loadFromItemsXML(xmlFile: any, key: any)` | 42 |  |
| `FarmlandStatistics:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 58 |  |
| `FarmlandStatistics:delete()` | 71 |  |
| `FarmlandStatistics:readStatisticFromStream(farmlandId: any, streamId: any, connection: any)` | 80 |  |
| `FarmlandStatistics:writeStatisticToStream(farmlandId: any, streamId: any, connection: any)` | 100 |  |
| `FarmlandStatistics:setMapFrame(mapFrame: any)` | 114 |  |
| `FarmlandStatistics:collectFarmlandHotspotActions(actions: any)` | 120 |  |
| `FarmlandStatistics:openStatistics(farmlandId: any, noEventSend: any)` | 126 |  |
| `FarmlandStatistics:getFarmlandFieldInfo(farmlandId: any)` | 146 |  |
| `FarmlandStatistics:updateStatistic(farmlandId: any, name: any, value: any)` | 152 |  |
| `FarmlandStatistics:resetStatistic(farmlandId: any, clearTotal: any)` | 161 |  |
| `FarmlandStatistics:getFillLevelWeight(fillLevel: any, fillTypeIndex: any)` | 170 |  |
| `FarmlandStatistics:getFillLevelPrice(fillLevel: any, fillTypeIndex: any)` | 181 |  |
| `FarmlandStatistics:overwriteGameFunctions(pfModule: any)` | 206 |  |

## Messages

- subscribes `MessageType.FARMLAND_OWNER_CHANGED` (l.35)
