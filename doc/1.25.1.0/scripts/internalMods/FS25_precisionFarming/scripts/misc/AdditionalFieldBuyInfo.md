# internalMods/FS25_precisionFarming/scripts/misc/AdditionalFieldBuyInfo.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/misc/AdditionalFieldBuyInfo.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/misc/AdditionalFieldBuyInfo.lua` — FS25 1.25.1.0

✍ Precision Farming helper that adds soil type distribution and yield potential to the farmland purchase panel of the in-game map. The server computes per-farmland soil shares from the soil map and the field mask, sends them to clients on request, and the class multiplies the farmland price by the yield potential. It hooks FarmlandManager, FieldManager, Farmland and Placeable through overwriteGameFunctions.

- **AdditionalFieldBuyInfo** (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `AdditionalFieldBuyInfo.new(pfModule: any, customMt: any)` | 18 | ✍ Creates the instance with empty soil distribution tables (4 soil types), yield potential values and a reference to the Precision Farming module. |
| `AdditionalFieldBuyInfo:loadFromXML(xmlFile: any, key: any, baseDirectory: any, configFileName: any, mapFilename: any)` | 59 | ✍ Reads the colour blind setting and subscribes to the colour blind setting change and to the end of savegame placeable loading messages. Always returns true. |
| `AdditionalFieldBuyInfo:loadFromItemsXML(xmlFile: any, key: any)` | 69 | ✍ Empty hook, nothing is loaded from the items XML. |
| `AdditionalFieldBuyInfo:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 74 | ✍ Empty hook, nothing is saved. |
| `AdditionalFieldBuyInfo:delete()` | 79 | ✍ Unsubscribes this object from every message center subscription. |
| `AdditionalFieldBuyInfo:readInfoFromStream(farmlandId: any, streamId: any, connection: any)` | 85 | ✍ Client side: reads a valid flag, then field number, field area, soil shares (8 bits each) and yield potential (8 bits, scaled by 1.25) for a farmland, and refreshes the UI. If the flag is false the info window is hidden. |
| `AdditionalFieldBuyInfo:writeInfoToStream(farmlandId: any, streamId: any, connection: any)` | 113 | ✍ Server side: writes the counterpart of readInfoFromStream for a farmland (valid flag, field number, area, soil shares, yield potential). Only writes data when the farmland has a field area and a soil distribution. |
| `AdditionalFieldBuyInfo:setColorBlindMode(isActive: any)` | 132 | ✍ Updates the stored colour blind flag and redraws the soil bars when the value changed. |
| `AdditionalFieldBuyInfo:setMapFrame(mapFrame: any)` | 167 | ✍ Stores the map frame, caches the maximum soil bar width on first call and hides the field buy info window. |
| `AdditionalFieldBuyInfo:updateSoilBars()` | 177 | ✍ Sets the soil type names and bar colours (normal or colour blind palette) in the map frame from the soil map's soil types, if a soil map exists. |
| `AdditionalFieldBuyInfo:updateUIValues()` | 190 | ✍ Resizes the farmland context box and fills the soil percentage bars, yield potential bar and texts. Hides the window when the selected field size is below 0.01, and finally calls updateContextBox. |
| `AdditionalFieldBuyInfo:onFarmlandSelectionChanged(selectedFarmland: any)` | 253 | ✍ Reacts to a farmland selection on the map. On the server it reads the stored soil data; on a client it sends a RequestFieldBuyInfoEvent to the server. With no selection it resets the displayed values. |
| `AdditionalFieldBuyInfo:onShowContextBox(farmland: any, contextBox: any)` | 298 | ✍ Remembers the last farmland context box shown so it can be updated later. |
| `AdditionalFieldBuyInfo:updateContextBox()` | 304 | ✍ Rewrites the farmland value text (price and price per ha) and the size text (farmland area and field area) in the remembered context box, then calls updatePrecisionFarmingContextActions on the map frame if present. |
| `AdditionalFieldBuyInfo:getFarmlandFieldInfo(farmlandId: any)` | 332 | ✍ Returns the field number of the first field belonging to the farmland (0 if none) and the farmland's totalFieldArea (0 if unset). |
| `AdditionalFieldBuyInfo:updateFieldSoilDistributionData()` | 358 | ✍ Scans the soil map pixel by pixel, counts per farmland the field pixels and soil types, then derives soil shares, yield potential (clamped 0 to 1.25) and field area in ha, and updates prices. Heavy loop, logs the map's overall yield potential and its duration. |
| `AdditionalFieldBuyInfo:onAllPlaceablesLoaded()` | 439 | ✍ Marks placeables as loaded and, if a delayed soil computation is pending, runs it once no field update task is queued and every unowned allowed field is initialised. |
| `AdditionalFieldBuyInfo:overwriteGameFunctions(pfModule: any)` | 463 | ✍ Registers game function overrides: Placeable.setLoadingStep (client only), FarmlandManager.loadFarmlandData, FieldManager.onFinishFieldUpdateTask and Farmland.updatePrice (price multiplied by yield potential). They trigger or delay the soil distribution computation. |

## Messages

- subscribes `MessageType.SETTING_CHANGED` (l.61)
- subscribes `MessageType.LOADED_ALL_SAVEGAME_PLACEABLES` (l.62)
