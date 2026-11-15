---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableProductionPoint.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableProductionPoint
PlaceableProductionPoint = {}

---@param specializations table
---@return boolean
function PlaceableProductionPoint.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableProductionPoint.registerEvents(placeableType) end

---@param placeableType any
function PlaceableProductionPoint.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableProductionPoint.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableProductionPoint.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableProductionPoint.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableProductionPoint.registerSavegameXMLPaths(schema, basePath) end

function PlaceableProductionPoint.initSpecialization() end

---@param savegame table
function PlaceableProductionPoint:onLoad(savegame) end

function PlaceableProductionPoint:onDelete() end

function PlaceableProductionPoint:onFinalizePlacement() end

---@param superFunc any
---@param infoTable any
function PlaceableProductionPoint:updateInfo(superFunc, infoTable) end

---@param outputs any
---@param state any
function PlaceableProductionPoint:outputsChanged(outputs, state) end

---@param production any
---@param status any
function PlaceableProductionPoint:productionStatusChanged(production, status) end

---@param streamId any
---@param connection any
function PlaceableProductionPoint:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableProductionPoint:onWriteStream(streamId, connection) end

---@param xmlFile any
---@param key any
function PlaceableProductionPoint:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableProductionPoint:saveToXMLFile(xmlFile, key, usedModNames) end

---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableProductionPoint:setOwnerFarmId(superFunc, farmId, noEventSend) end

---@param superFunc any
---@param node any
function PlaceableProductionPoint:collectPickObjects(superFunc, node) end

---@param superFunc any
function PlaceableProductionPoint:canBuy(superFunc) end

function PlaceableProductionPoint:onBuy() end
