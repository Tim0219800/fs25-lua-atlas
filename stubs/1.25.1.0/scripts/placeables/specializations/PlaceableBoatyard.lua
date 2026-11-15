---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableBoatyard.lua (stub généré, atlas Lua FS25)

---@class PlaceableBoatyard
PlaceableBoatyard = {}

---@param specializations table
---@return boolean
function PlaceableBoatyard.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableBoatyard.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableBoatyard.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableBoatyard.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableBoatyard.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableBoatyard.registerSavegameXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableBoatyard:onLoad(savegame) end

---@param superFunc any
---@param node any
function PlaceableBoatyard:collectPickObjects(superFunc, node) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableBoatyard:saveToXMLFile(xmlFile, key, usedModNames) end

---@param xmlFile any
---@param key any
function PlaceableBoatyard:loadFromXMLFile(xmlFile, key) end

---@param streamId any
---@param connection any
function PlaceableBoatyard:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableBoatyard:onWriteStream(streamId, connection) end

---@param superFunc any
---@param farmId any
function PlaceableBoatyard:setOwnerFarmId(superFunc, farmId) end
