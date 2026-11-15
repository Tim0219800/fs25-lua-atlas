---@meta
-- FS25 1.25.1.0 : handTools/HandToolHolder.lua (generated stub, FS25 Lua Atlas)

---@class HandToolHolder : Object
HandToolHolder = {}

---@param schema any
---@param basePath any
function HandToolHolder.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function HandToolHolder.registerSavegameXMLPaths(schema, basePath) end

---@param parent any
---@param isServer any
---@param isClient any
---@param customMt any
function HandToolHolder.new(parent, isServer, isClient, customMt) end

---@param xmlFile any
---@param key any
---@param callback any
---@param callbackTarget any
---@param callbackArgs any
---@param components any
---@param i3dMappings any
---@param baseDirectory any
---@param customEnv any
function HandToolHolder:load(xmlFile, key, callback, callbackTarget, callbackArgs, components, i3dMappings, baseDirectory, customEnv) end

---@param i3dNode any
---@param failedReason any
---@param args any
function HandToolHolder:onDummyHandToolI3DLoaded(i3dNode, failedReason, args) end

---@param handTool any
---@param loadingState any
function HandToolHolder:onSpawnedHandToolLoaded(handTool, loadingState) end

function HandToolHolder:onFinishedLoading() end

function HandToolHolder:delete() end

---@param xmlFile any
---@param key any
function HandToolHolder:saveToXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
function HandToolHolder:loadFromXMLFile(xmlFile, key) end

---@param streamId integer
---@param connection Connection
function HandToolHolder:writeStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
---@param objectId integer
function HandToolHolder:readStream(streamId, connection, objectId) end

---@param alreadySent any
function HandToolHolder:register(alreadySent) end

---@return string
function HandToolHolder:getUniqueId() end

---@param uniqueId string
function HandToolHolder:setUniqueId(uniqueId) end

function HandToolHolder:getHolderName() end

---@param name any
function HandToolHolder:setHolderName(name) end

function HandToolHolder:getHandTool() end

function HandToolHolder:getSpawnedHandTool() end

function HandToolHolder:getSpawnsHandTool() end

---@param handTool any
function HandToolHolder:getHolderNodePair(handTool) end

---@param handTool any
function HandToolHolder:getCanPickupHandToolFromMenu(handTool) end

---@param handTool any
function HandToolHolder:getCanPickupHandTool(handTool) end

---@param handTool any
function HandToolHolder:onPickupHandTool(handTool) end

---@param isInRange any
function HandToolHolder:setPlayerInRange(isInRange) end

function HandToolHolder:updateDummyHandTool() end

---@param handTool any
function HandToolHolder:onDropHandTool(handTool) end

function HandToolHolder:drawDebug() end

---@param farmId any
---@param noEventSend any
function HandToolHolder:setOwnerFarmId(farmId, noEventSend) end

---@param storeCallback any
function HandToolHolder:setStoreCallback(storeCallback) end

---@param pickupCallback any
function HandToolHolder:setPickupCallback(pickupCallback) end

---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function HandToolHolder:onPlayerCallback(triggerId, otherId, onEnter, onLeave, onStay) end
