---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableFactory.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableFactory
PlaceableFactory = {}

---@param specializations table
---@return boolean
function PlaceableFactory.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableFactory.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableFactory.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableFactory.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableFactory.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableFactory.registerSavegameXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableFactory:onLoad(savegame) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableFactory:saveToXMLFile(xmlFile, key, usedModNames) end

---@param xmlFile any
---@param key any
function PlaceableFactory:loadFromXMLFile(xmlFile, key) end

---@param streamId any
---@param connection any
function PlaceableFactory:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableFactory:onWriteStream(streamId, connection) end

---@param superFunc any
---@param farmId any
function PlaceableFactory:setOwnerFarmId(superFunc, farmId) end
