# internalMods/FS25_precisionFarming/scripts/misc/AdditionalFieldBuyInfo.lua

Source : `dataS/scripts/internalMods/FS25_precisionFarming/scripts/misc/AdditionalFieldBuyInfo.lua` — FS25 1.25.1.0

- **AdditionalFieldBuyInfo** (l.14)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AdditionalFieldBuyInfo.new(pfModule: any, customMt: any)` | 18 |  |
| `AdditionalFieldBuyInfo:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 59 |  |
| `AdditionalFieldBuyInfo:loadFromItemsXML(xmlFile: any, key: any)` | 69 |  |
| `AdditionalFieldBuyInfo:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 74 |  |
| `AdditionalFieldBuyInfo:delete()` | 79 |  |
| `AdditionalFieldBuyInfo:readInfoFromStream(farmlandId: any, streamId: any, connection: any)` | 85 |  |
| `AdditionalFieldBuyInfo:writeInfoToStream(farmlandId: any, streamId: any, connection: any)` | 113 |  |
| `AdditionalFieldBuyInfo:setColorBlindMode(isActive: any)` | 132 |  |
| `AdditionalFieldBuyInfo:setMapFrame(mapFrame: any)` | 167 |  |
| `AdditionalFieldBuyInfo:updateSoilBars()` | 177 |  |
| `AdditionalFieldBuyInfo:updateUIValues()` | 190 |  |
| `AdditionalFieldBuyInfo:onFarmlandSelectionChanged(selectedFarmland: any)` | 253 |  |
| `AdditionalFieldBuyInfo:onShowContextBox(farmland: any, contextBox: any)` | 298 |  |
| `AdditionalFieldBuyInfo:updateContextBox()` | 304 |  |
| `AdditionalFieldBuyInfo:getFarmlandFieldInfo(farmlandId: any)` | 332 |  |
| `AdditionalFieldBuyInfo:updateFieldSoilDistributionData()` | 358 |  |
| `AdditionalFieldBuyInfo:onAllPlaceablesLoaded()` | 439 |  |
| `AdditionalFieldBuyInfo:overwriteGameFunctions(pfModule: any)` | 463 |  |

## Messages

- écoute `MessageType.SETTING_CHANGED` (l.61)
- écoute `MessageType.LOADED_ALL_SAVEGAME_PLACEABLES` (l.62)
