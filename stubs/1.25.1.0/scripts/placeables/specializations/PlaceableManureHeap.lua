---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableManureHeap.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableManureHeap
PlaceableManureHeap = {}

---@param specializations table
---@return boolean
function PlaceableManureHeap.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableManureHeap.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableManureHeap.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableManureHeap.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableManureHeap.registerSavegameXMLPaths(schema, basePath) end

function PlaceableManureHeap.initSpecialization() end

---@param savegame table
function PlaceableManureHeap:onLoad(savegame) end

function PlaceableManureHeap:onDelete() end

function PlaceableManureHeap:onFinalizePlacement() end

---@param streamId any
---@param connection any
function PlaceableManureHeap:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableManureHeap:onWriteStream(streamId, connection) end

---@param xmlFile any
---@param key any
function PlaceableManureHeap:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableManureHeap:saveToXMLFile(xmlFile, key, usedModNames) end

---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableManureHeap:setOwnerFarmId(superFunc, farmId, noEventSend) end

---@param superFunc any
---@param node any
function PlaceableManureHeap:collectPickObjects(superFunc, node) end

---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param farmId any
function PlaceableManureHeap:getCanBePlacedAt(superFunc, x, y, z, farmId) end

---@param superFunc any
---@param infoTable any
function PlaceableManureHeap:updateInfo(superFunc, infoTable) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function PlaceableManureHeap.loadSpecValueCapacity(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
function PlaceableManureHeap.getSpecValueCapacity(storeItem, realItem) end
