---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableAnimatedObjects.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableAnimatedObjects
PlaceableAnimatedObjects = {}

---@param specializations table
---@return boolean
function PlaceableAnimatedObjects.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableAnimatedObjects.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableAnimatedObjects.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableAnimatedObjects.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableAnimatedObjects.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableAnimatedObjects.registerSavegameXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableAnimatedObjects:onLoad(savegame) end

function PlaceableAnimatedObjects:onDelete() end

function PlaceableAnimatedObjects:onPostFinalizePlacement() end

---@param streamId any
---@param connection any
function PlaceableAnimatedObjects:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection table
function PlaceableAnimatedObjects:onWriteStream(streamId, connection) end

---@param xmlFile any
---@param key any
function PlaceableAnimatedObjects:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableAnimatedObjects:saveToXMLFile(xmlFile, key, usedModNames) end

---@param saveId string
---@return table?
function PlaceableAnimatedObjects:getAnimatedObjectBySaveId(saveId) end

---@param superFunc any
---@param ownerFarmId any
---@param noEventSend any
function PlaceableAnimatedObjects:setOwnerFarmId(superFunc, ownerFarmId, noEventSend) end
