---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryMeadow.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableHusbandryMeadow
PlaceableHusbandryMeadow = {}

---@param specializations table
---@return boolean
function PlaceableHusbandryMeadow.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableHusbandryMeadow.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandryMeadow.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableHusbandryMeadow.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableHusbandryMeadow.registerSavegameXMLPaths(schema, basePath) end

---@param savegame any
function PlaceableHusbandryMeadow:onLoad(savegame) end

---@param streamId any
---@param connection any
function PlaceableHusbandryMeadow:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableHusbandryMeadow:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function PlaceableHusbandryMeadow:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function PlaceableHusbandryMeadow:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param xmlFile any
---@param key any
function PlaceableHusbandryMeadow:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableHusbandryMeadow:saveToXMLFile(xmlFile, key, usedModNames) end

---@param superFunc any
function PlaceableHusbandryMeadow:getFoodInfos(superFunc) end

---@param superFunc any
---@param infoTable any
function PlaceableHusbandryMeadow:updateInfo(superFunc, infoTable) end
