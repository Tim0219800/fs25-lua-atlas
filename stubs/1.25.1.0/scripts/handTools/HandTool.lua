---@meta
-- FS25 1.25.1.0 : handTools/HandTool.lua (generated stub, FS25 Lua Atlas)

---@class HandTool : Object
HandTool = {}

function HandTool.init() end

function HandTool.postInit() end

function HandTool.registerXMLPaths() end

---@param savegameXMLSchema XMLSchema
function HandTool.registerSavegameXMLPaths(savegameXMLSchema) end

---@param handToolType table
function HandTool.registerEvents(handToolType) end

---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return HandTool
function HandTool.new(isServer, isClient, customMt) end

---@param filename any
function HandTool:setFilename(filename) end

---@param typeDef any
function HandTool:setType(typeDef) end

---@param loadCallbackFunction any
---@param loadCallbackFunctionTarget any
---@param loadCallbackFunctionArguments any
function HandTool:setLoadCallback(loadCallbackFunction, loadCallbackFunctionTarget, loadCallbackFunctionArguments) end

---@param i3dNode any
---@param failedReason any
---@param arguments any
---@param i3dLoadingId any
function HandTool:i3dFileLoaded(i3dNode, failedReason, arguments, i3dLoadingId) end

function HandTool:loadFinished() end

function HandTool:onFinishedLoading() end

---@param target any
---@return table
function HandTool:createLoadingTask(target) end

---@param task table
function HandTool:finishLoadingTask(task) end

---@param loadingState any
function HandTool:setLoadingState(loadingState) end

---@param loadingStep SpecializationLoadStep
function HandTool:setLoadingStep(loadingStep) end

function HandTool:delete() end

---@param streamId integer
---@param connection Connection
function HandTool:writeStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
---@param objectId integer
function HandTool:readStream(streamId, connection, objectId) end

---@param streamId integer
---@param connection table
function HandTool:postWriteStream(streamId, connection) end

---@param streamId integer
---@param connection table
function HandTool:postReadStream(streamId, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function HandTool:writeUpdateStream(streamId, connection, dirtyMask) end

---@param streamId integer
---@param timestamp table
---@param connection table
function HandTool:readUpdateStream(streamId, timestamp, connection) end

function HandTool:getNeedsSaving() end

---@param xmlFile XMLFile
---@param key string
---@param usedModNames table
function HandTool:saveToXMLFile(xmlFile, key, usedModNames) end

---@return string
function HandTool:getUniqueId() end

---@param uniqueId string
function HandTool:setUniqueId(uniqueId) end

---@param alreadySent any
function HandTool:register(alreadySent) end

---@return boolean
function HandTool:getIsSynchronized() end

---@param dt number
function HandTool:update(dt) end

---@param dt any
function HandTool:updateTick(dt) end

function HandTool:startHolding() end

function HandTool:stopHolding() end

---@return boolean
function HandTool:getIsCarried() end

---@param player Player
function HandTool:setCarryingPlayer(player) end

---@return Player
function HandTool:getCarryingPlayer() end

function HandTool:periodChanged() end

function HandTool:getPrice() end

---@return number
function HandTool:getSellPrice() end

---@param storeItem any
---@param age any
---@param price any
function HandTool.calculateSellPrice(storeItem, age, price) end

---@return boolean
function HandTool:getIsHeld() end

function HandTool:setCarryingPlayerStyleChanged() end

function HandTool:attachTool() end

function HandTool:detachTool() end

function HandTool:attachToolToHand() end

function HandTool:attachToolToCamera() end

---@param clearCarriedActionEvents boolean?
function HandTool:clearActionEvents(clearCarriedActionEvents) end
