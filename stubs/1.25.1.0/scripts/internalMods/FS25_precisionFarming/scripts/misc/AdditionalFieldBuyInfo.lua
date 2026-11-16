---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/misc/AdditionalFieldBuyInfo.lua (generated stub, FS25 Lua Atlas)

--- Precision Farming helper that adds soil type distribution and yield potential to the farmland purchase panel of the in-game map. The server computes per-farmland soil shares from the soil map and the field mask, sends them to clients on request, and the class multiplies the farmland price by the yield potential. It hooks FarmlandManager, FieldManager, Farmland and Placeable through overwriteGameFunctions.
---@class AdditionalFieldBuyInfo
AdditionalFieldBuyInfo = {}

--- Creates the instance with empty soil distribution tables (4 soil types), yield potential values and a reference to the Precision Farming module.
---@param pfModule any
---@param customMt any
function AdditionalFieldBuyInfo.new(pfModule, customMt) end

--- Reads the colour blind setting and subscribes to the colour blind setting change and to the end of savegame placeable loading messages. Always returns true.
---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function AdditionalFieldBuyInfo:loadFromXML(xmlFile, key, baseDirectory, configFileName, mapFilename) end

--- Empty hook, nothing is loaded from the items XML.
---@param xmlFile any
---@param key any
function AdditionalFieldBuyInfo:loadFromItemsXML(xmlFile, key) end

--- Empty hook, nothing is saved.
---@param xmlFile any
---@param key any
---@param usedModNames any
function AdditionalFieldBuyInfo:saveToXMLFile(xmlFile, key, usedModNames) end

--- Unsubscribes this object from every message center subscription.
function AdditionalFieldBuyInfo:delete() end

--- Client side: reads a valid flag, then field number, field area, soil shares (8 bits each) and yield potential (8 bits, scaled by 1.25) for a farmland, and refreshes the UI. If the flag is false the info window is hidden.
---@param farmlandId any
---@param streamId any
---@param connection any
function AdditionalFieldBuyInfo:readInfoFromStream(farmlandId, streamId, connection) end

--- Server side: writes the counterpart of readInfoFromStream for a farmland (valid flag, field number, area, soil shares, yield potential). Only writes data when the farmland has a field area and a soil distribution.
---@param farmlandId any
---@param streamId any
---@param connection any
function AdditionalFieldBuyInfo:writeInfoToStream(farmlandId, streamId, connection) end

--- Updates the stored colour blind flag and redraws the soil bars when the value changed.
---@param isActive any
function AdditionalFieldBuyInfo:setColorBlindMode(isActive) end

--- Stores the map frame, caches the maximum soil bar width on first call and hides the field buy info window.
---@param mapFrame any
function AdditionalFieldBuyInfo:setMapFrame(mapFrame) end

--- Sets the soil type names and bar colours (normal or colour blind palette) in the map frame from the soil map's soil types, if a soil map exists.
function AdditionalFieldBuyInfo:updateSoilBars() end

--- Resizes the farmland context box and fills the soil percentage bars, yield potential bar and texts. Hides the window when the selected field size is below 0.01, and finally calls updateContextBox.
function AdditionalFieldBuyInfo:updateUIValues() end

--- Reacts to a farmland selection on the map. On the server it reads the stored soil data; on a client it sends a RequestFieldBuyInfoEvent to the server. With no selection it resets the displayed values.
---@param selectedFarmland any
function AdditionalFieldBuyInfo:onFarmlandSelectionChanged(selectedFarmland) end

--- Remembers the last farmland context box shown so it can be updated later.
---@param farmland any
---@param contextBox any
function AdditionalFieldBuyInfo:onShowContextBox(farmland, contextBox) end

--- Rewrites the farmland value text (price and price per ha) and the size text (farmland area and field area) in the remembered context box, then calls updatePrecisionFarmingContextActions on the map frame if present.
function AdditionalFieldBuyInfo:updateContextBox() end

--- Returns the field number of the first field belonging to the farmland (0 if none) and the farmland's totalFieldArea (0 if unset).
---@param farmlandId any
function AdditionalFieldBuyInfo:getFarmlandFieldInfo(farmlandId) end

--- Scans the soil map pixel by pixel, counts per farmland the field pixels and soil types, then derives soil shares, yield potential (clamped 0 to 1.25) and field area in ha, and updates prices. Heavy loop, logs the map's overall yield potential and its duration.
function AdditionalFieldBuyInfo:updateFieldSoilDistributionData() end

--- Marks placeables as loaded and, if a delayed soil computation is pending, runs it once no field update task is queued and every unowned allowed field is initialised.
function AdditionalFieldBuyInfo:onAllPlaceablesLoaded() end

--- Registers game function overrides: Placeable.setLoadingStep (client only), FarmlandManager.loadFarmlandData, FieldManager.onFinishFieldUpdateTask and Farmland.updatePrice (price multiplied by yield potential). They trigger or delay the soil distribution computation.
---@param pfModule any
function AdditionalFieldBuyInfo:overwriteGameFunctions(pfModule) end
