# internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistics.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistics.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/statistics/FarmlandStatistics.lua` — FS25 1.25.1.0

✍ Manager of all FarmlandStatistic objects of Precision Farming, created by the precision farming module. It saves/loads them, syncs a farmland's statistics to clients on request, opens the economic analysis dialog from the map, and converts quantities to weight or price. It hooks FarmlandManager.loadFarmlandData to create one statistic per farmland.

- **FarmlandStatistics** (l.16)

## Functions

| Function | Line | Description |
|---|---|---|
| `FarmlandStatistics.new(pfModule: any, customMt: any)` | 20 | ✍ Constructor. Keeps a reference to the precision farming module and creates empty lists of statistics (ordered and indexed by farmland id). |
| `FarmlandStatistics:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 34 | ✍ Subscribes to the FARMLAND_OWNER_CHANGED message (handler onFarmlandStateChanged, not in this file, UNVERIFIED) and returns true. Ignores the XML arguments. |
| `FarmlandStatistics:loadFromItemsXML(xmlFile: any, key: any)` | 42 | ✍ Loads each statistic from '<key>.farmlandStatistics.farmlandStatistic(i)' in list order, stopping at the first missing entry. |
| `FarmlandStatistics:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 58 | ✍ Saves every statistic as an indexed farmlandStatistic entry under '<key>.farmlandStatistics'. |
| `FarmlandStatistics:delete()` | 71 | ✍ Unsubscribes from all messages and clears the statistics lists. |
| `FarmlandStatistics:readStatisticFromStream(farmlandId: any, streamId: any, connection: any)` | 80 | ✍ Client side: reads an optional total field area (stored on the farmland) and the farmland's statistic, then opens the statistics dialog without sending a request back. |
| `FarmlandStatistics:writeStatisticToStream(farmlandId: any, streamId: any, connection: any)` | 100 | ✍ Server side: writes a flag and the farmland's total field area when the farmland exists, then the farmland's statistic. Counterpart of readStatisticFromStream. |
| `FarmlandStatistics:setMapFrame(mapFrame: any)` | 114 | ✍ Stores the map frame used later to clear the map selection when opening statistics. |
| `FarmlandStatistics:collectFarmlandHotspotActions(actions: any)` | 120 | ✍ Appends an 'economic analysis' action to the farmland hotspot action list, bound to openStatistics. |
| `FarmlandStatistics:openStatistics(farmlandId: any, noEventSend: any)` | 126 | ✍ Clears the map selection and shows FarmlandStatsDialog when the farmland has a statistic and a field area of at least 0.01. A client without server sends RequestFarmlandStatisticsEvent unless noEventSend is set. |
| `FarmlandStatistics:getFarmlandFieldInfo(farmlandId: any)` | 146 | ✍ Delegates to the precision farming module's getFarmlandFieldInfo and returns field number and area (implementation not in this file, UNVERIFIED). |
| `FarmlandStatistics:updateStatistic(farmlandId: any, name: any, value: any)` | 152 | ✍ Adds a value to the named counter of the given farmland's statistic, if that farmland has one. |
| `FarmlandStatistics:resetStatistic(farmlandId: any, clearTotal: any)` | 161 | ✍ Resets the period counter of a farmland's statistic, and the total too when clearTotal is true. |
| `FarmlandStatistics:getFillLevelWeight(fillLevel: any, fillTypeIndex: any)` | 170 | ✍ Converts a fill level into weight using the fill type's massPerLiter divided by FillTypeManager.MASS_SCALE; returns the level unchanged for an unknown type. |
| `FarmlandStatistics:getFillLevelPrice(fillLevel: any, fillTypeIndex: any)` | 181 | ✍ Returns fillLevel times price per liter. The special id 'soilSamples' uses the soil map's price per sample for the current economic difficulty. Unknown types return the level unchanged. |
| `FarmlandStatistics:overwriteGameFunctions(pfModule: any)` | 206 | ✍ Registers FarmlandStatsDialog and overrides FarmlandManager.loadFarmlandData: after the original succeeds, it creates one FarmlandStatistic per farmland. Returns false if the original fails. |

## Messages

- subscribes `MessageType.FARMLAND_OWNER_CHANGED` (l.35)
