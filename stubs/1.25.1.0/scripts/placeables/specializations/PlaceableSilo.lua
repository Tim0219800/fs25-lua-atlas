---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableSilo.lua (stub généré, atlas Lua FS25)

---@class PlaceableSilo
PlaceableSilo = {}

---@class PlaceableSiloActivatable
PlaceableSiloActivatable = {}

---@class PlaceableSiloRefillEvent : Event
PlaceableSiloRefillEvent = {}

---@param specializations table
---@return boolean
function PlaceableSilo.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableSilo.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableSilo.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableSilo.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableSilo.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableSilo.registerSavegameXMLPaths(schema, basePath) end

function PlaceableSilo.initSpecialization() end

---@param savegame table
function PlaceableSilo:onLoad(savegame) end

function PlaceableSilo:onDelete() end

function PlaceableSilo:onFinalizePlacement() end

---@param streamId any
---@param connection any
function PlaceableSilo:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableSilo:onWriteStream(streamId, connection) end

---@param superFunc any
---@param node any
function PlaceableSilo:collectPickObjects(superFunc, node) end

---@param superFunc any
function PlaceableSilo:canBeSold(superFunc) end

---@param xmlFile any
---@param key any
function PlaceableSilo:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableSilo:saveToXMLFile(xmlFile, key, usedModNames) end

---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableSilo:setOwnerFarmId(superFunc, farmId, noEventSend) end

---@param fillType any
---@param amount any
function PlaceableSilo:setAmount(fillType, amount) end

---@param fillTypeIndex any
---@param amount any
---@param price any
function PlaceableSilo:refillAmount(fillTypeIndex, amount, price) end

function PlaceableSilo:getFillLevels() end

function PlaceableSilo:onSell() end

---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function PlaceableSilo:onPlayerActionTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

---@param superFunc any
---@param infoTable any
function PlaceableSilo:updateInfo(superFunc, infoTable) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function PlaceableSilo.loadSpecValueVolume(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
function PlaceableSilo.getSpecValueVolume(storeItem, realItem) end

---@param placeable any
function PlaceableSiloActivatable.new(placeable) end

function PlaceableSiloActivatable:run() end

function PlaceableSiloRefillEvent.emptyNew() end

---@param placeable any
---@param fillTypeIndex any
---@param amount any
---@param price any
function PlaceableSiloRefillEvent.new(placeable, fillTypeIndex, amount, price) end

---@param streamId any
---@param connection any
function PlaceableSiloRefillEvent:writeStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableSiloRefillEvent:readStream(streamId, connection) end

---@param connection any
function PlaceableSiloRefillEvent:run(connection) end
