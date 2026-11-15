---@meta
-- FS25 1.25.1.0 : placeables/Placeable.lua (generated stub, FS25 Lua Atlas)

---@class Placeable : Object
Placeable = {}

---@param placeableType any
function Placeable.registerEvents(placeableType) end

---@param placeableType any
function Placeable.registerFunctions(placeableType) end

function Placeable.init() end

function Placeable.postInit() end

---@param isServer any
---@param isClient any
---@param customMt any
function Placeable.new(isServer, isClient, customMt) end

---@param filename any
function Placeable:setFilename(filename) end

---@param configurations any
---@param boughtConfigurations any
---@param configurationData any
function Placeable:setConfigurations(configurations, boughtConfigurations, configurationData) end

---@param typeDef any
function Placeable:setType(typeDef) end

---@param loadCallbackFunction any
---@param loadCallbackFunctionTarget any
---@param loadCallbackFunctionArguments any
function Placeable:setLoadCallback(loadCallbackFunction, loadCallbackFunctionTarget, loadCallbackFunctionArguments) end

function Placeable:loadCallback() end

---@param placeableLoadingData any
function Placeable:load(placeableLoadingData) end

---@param i3dNode any
---@param failedReason any
---@param args any
---@param i3dLoadingId any
function Placeable:i3dFileLoaded(i3dNode, failedReason, args, i3dLoadingId) end

function Placeable:onFinishedLoading() end

---@param msg any
function Placeable:onLoadingError(msg, ...) end

---@param target any
---@return table
function Placeable:createLoadingTask(target) end

---@param task table
function Placeable:finishLoadingTask(task) end

function Placeable:finalizePlacement() end

---@param immediate any
function Placeable:delete(immediate) end

---@param streamId integer
---@param connection table
---@param objectId any
function Placeable:readStream(streamId, connection, objectId) end

---@param streamId integer
---@param connection table
function Placeable:writeStream(streamId, connection) end

---@param streamId integer
---@param connection table
function Placeable:postReadStream(streamId, connection) end

---@param streamId integer
---@param connection table
function Placeable:postWriteStream(streamId, connection) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function Placeable:readUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Placeable:writeUpdateStream(streamId, connection, dirtyMask) end

---@param xmlFile string
---@param key any
---@param usedModNames any
---@return string
---@return string
function Placeable:saveToXMLFile(xmlFile, key, usedModNames) end

---@param state any
function Placeable:setPropertyState(state) end

function Placeable:getPropertyState() end

---@param state any
function Placeable:setVisibility(state) end

function Placeable:getIsSynchronized() end

function Placeable:getNeedsSaving() end

---@return string
function Placeable:getUniqueId() end

---@param uniqueId string
function Placeable:setUniqueId(uniqueId) end

---@param dt any
function Placeable:update(dt) end

---@param dt any
function Placeable:updateTick(dt) end

function Placeable:draw() end

function Placeable:drawDebug() end

---@return string
function Placeable:getName() end

function Placeable:getImageFilename() end

---@param farmId any
function Placeable:getCanBeRenamedByFarm(farmId) end

---@param name string
---@param noEventSend boolean
---@return boolean
function Placeable:setName(name, noEventSend) end

---@param nameL10nKey string
function Placeable:setNameL10nKey(nameL10nKey) end

function Placeable:onBuy() end

function Placeable:onSell() end

function Placeable:getPrice() end

---@return boolean
function Placeable:canBuy() end

---@param x any
---@param y any
---@param z any
---@param farmId any
function Placeable:getCanBePlacedAt(x, y, z, farmId) end

function Placeable:canBeSold() end

function Placeable:getDestructionMethod() end

---@param node any
function Placeable:previewNodeDestructionNodes(node) end

---@param node integer
---@return boolean
---@return boolean
function Placeable:performNodeDestruction(node) end

---@param farmlandId any
---@param farmId any
---@param loadFromSavegame any
function Placeable:onFarmlandStateChanged(farmlandId, farmId, loadFromSavegame) end

---@param alreadySent any
function Placeable:register(alreadySent) end

---@param farmId any
---@param noEventSend any
function Placeable:setOwnerFarmId(farmId, noEventSend) end

---@param loadingState any
function Placeable:setLoadingState(loadingState) end

---@param node integer
function Placeable:collectPickObjects(node) end

---@param loadingStep SpecializationLoadStep
function Placeable:setLoadingStep(loadingStep) end

---@param r any
---@param g any
---@param b any
---@param alpha any
function Placeable:setOverlayColor(r, g, b, alpha) end

---@param node integer
---@param nodeTable table
function Placeable:setOverlayColorNodes(node, nodeTable) end

---@return integer
function Placeable:getDailyUpkeep() end

---@return integer
---@return boolean
function Placeable:getSellPrice() end

---@return integer
function Placeable:getSellAction() end

function Placeable:addToPhysics() end

function Placeable:removeFromPhysics() end

---@param x any
---@param y any
---@param z any
---@param rotX any
---@param rotY any
---@param rotZ any
function Placeable:setPreviewPosition(x, y, z, rotX, rotY, rotZ) end

function Placeable:getNeedWeatherChanged() end

function Placeable:weatherChanged() end

function Placeable:getNeedHourChanged() end

---@param hour any
function Placeable:hourChanged(hour) end

function Placeable:getNeedMinuteChanged() end

---@param minute any
function Placeable:minuteChanged(minute) end

function Placeable:getNeedDayChanged() end

---@param day any
function Placeable:dayChanged(day) end

---@param period any
function Placeable:periodChanged(period) end

---@param storeItem any
---@param realItem any
function Placeable.getSpecValueSlots(storeItem, realItem) end
