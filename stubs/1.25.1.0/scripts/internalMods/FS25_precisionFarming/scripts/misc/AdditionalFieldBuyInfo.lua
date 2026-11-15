---@meta
-- FS25 1.25.1.0 : internalMods/FS25_precisionFarming/scripts/misc/AdditionalFieldBuyInfo.lua (generated stub, FS25 Lua Atlas)

---@class AdditionalFieldBuyInfo
AdditionalFieldBuyInfo = {}

---@param pfModule any
---@param customMt any
function AdditionalFieldBuyInfo.new(pfModule, customMt) end

---@param xmlFile any
---@param key any
---@param baseDirectory any
---@param configFileName any
---@param mapFilename any
function AdditionalFieldBuyInfo:loadFromXML(xmlFile, key, baseDirectory, configFileName, mapFilename) end

---@param xmlFile any
---@param key any
function AdditionalFieldBuyInfo:loadFromItemsXML(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function AdditionalFieldBuyInfo:saveToXMLFile(xmlFile, key, usedModNames) end

function AdditionalFieldBuyInfo:delete() end

---@param farmlandId any
---@param streamId any
---@param connection any
function AdditionalFieldBuyInfo:readInfoFromStream(farmlandId, streamId, connection) end

---@param farmlandId any
---@param streamId any
---@param connection any
function AdditionalFieldBuyInfo:writeInfoToStream(farmlandId, streamId, connection) end

---@param isActive any
function AdditionalFieldBuyInfo:setColorBlindMode(isActive) end

---@param mapFrame any
function AdditionalFieldBuyInfo:setMapFrame(mapFrame) end

function AdditionalFieldBuyInfo:updateSoilBars() end

function AdditionalFieldBuyInfo:updateUIValues() end

---@param selectedFarmland any
function AdditionalFieldBuyInfo:onFarmlandSelectionChanged(selectedFarmland) end

---@param farmland any
---@param contextBox any
function AdditionalFieldBuyInfo:onShowContextBox(farmland, contextBox) end

function AdditionalFieldBuyInfo:updateContextBox() end

---@param farmlandId any
function AdditionalFieldBuyInfo:getFarmlandFieldInfo(farmlandId) end

function AdditionalFieldBuyInfo:updateFieldSoilDistributionData() end

function AdditionalFieldBuyInfo:onAllPlaceablesLoaded() end

---@param pfModule any
function AdditionalFieldBuyInfo:overwriteGameFunctions(pfModule) end
