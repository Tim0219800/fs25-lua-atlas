---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableDoghouse.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableDoghouse
PlaceableDoghouse = {}

---@param specializations table
---@return boolean
function PlaceableDoghouse.prerequisitesPresent(specializations) end

function PlaceableDoghouse.initSpecialization() end

---@param placeableType any
function PlaceableDoghouse.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableDoghouse.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableDoghouse.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableDoghouse.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableDoghouse.registerSavegameXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableDoghouse:onLoad(savegame) end

function PlaceableDoghouse:onDelete() end

function PlaceableDoghouse:onFinalizePlacement() end

---@param streamId any
---@param connection any
function PlaceableDoghouse:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection table
function PlaceableDoghouse:onWriteStream(streamId, connection) end

---@param xmlFile any
---@param key any
function PlaceableDoghouse:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableDoghouse:saveToXMLFile(xmlFile, key, usedModNames) end

---@param node any
---@param failedReason any
---@param args any
function PlaceableDoghouse:onPreviewDogLoaded(node, failedReason, args) end

---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function PlaceableDoghouse:dogInteractionTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

---@return boolean
function PlaceableDoghouse:isDoghouseRegistered() end

---@return boolean
function PlaceableDoghouse:registerDoghouseToMission() end

---@return boolean
function PlaceableDoghouse:unregisterDoghouseToMission() end

---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableDoghouse:setOwnerFarmId(superFunc, farmId, noEventSend) end

---@param isFilled any
---@param noEventSend any
function PlaceableDoghouse:setFoodBowlState(isFilled, noEventSend) end

function PlaceableDoghouse:getDog() end

function PlaceableDoghouse:getSpawnNode() end

---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param farmId any
function PlaceableDoghouse:getCanBePlacedAt(superFunc, x, y, z, farmId) end

---@param superFunc any
function PlaceableDoghouse:canBuy(superFunc) end

---@param superFunc any
function PlaceableDoghouse:getNeedHourChanged(superFunc) end

function PlaceableDoghouse:onHourChanged() end
