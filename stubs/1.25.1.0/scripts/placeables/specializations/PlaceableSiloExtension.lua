---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableSiloExtension.lua (stub généré, atlas Lua FS25)

---@class PlaceableSiloExtension
PlaceableSiloExtension = {}

---@param specializations table
---@return boolean
function PlaceableSiloExtension.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableSiloExtension.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableSiloExtension.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableSiloExtension.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableSiloExtension.registerSavegameXMLPaths(schema, basePath) end

function PlaceableSiloExtension.initSpecialization() end

---@param savegame table
function PlaceableSiloExtension:onLoad(savegame) end

function PlaceableSiloExtension:onDelete() end

function PlaceableSiloExtension:onFinalizePlacement() end

---@param streamId any
---@param connection any
function PlaceableSiloExtension:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableSiloExtension:onWriteStream(streamId, connection) end

---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param farmId any
function PlaceableSiloExtension:getCanBePlacedAt(superFunc, x, y, z, farmId) end

---@param superFunc any
function PlaceableSiloExtension:canBeSold(superFunc) end

---@param xmlFile any
---@param key any
function PlaceableSiloExtension:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableSiloExtension:saveToXMLFile(xmlFile, key, usedModNames) end

---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableSiloExtension:setOwnerFarmId(superFunc, farmId, noEventSend) end

function PlaceableSiloExtension:onSell() end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function PlaceableSiloExtension.loadSpecValueVolume(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
function PlaceableSiloExtension.getSpecValueVolume(storeItem, realItem) end
