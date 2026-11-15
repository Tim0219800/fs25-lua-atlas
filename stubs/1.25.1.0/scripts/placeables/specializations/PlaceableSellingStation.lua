---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableSellingStation.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableSellingStation
PlaceableSellingStation = {}

---@param specializations table
---@return boolean
function PlaceableSellingStation.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableSellingStation.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableSellingStation.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableSellingStation.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableSellingStation.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableSellingStation.registerSavegameXMLPaths(schema, basePath) end

function PlaceableSellingStation.initSpecialization() end

---@param savegame table
function PlaceableSellingStation:onLoad(savegame) end

function PlaceableSellingStation:onDelete() end

function PlaceableSellingStation:onFinalizePlacement() end

---@param streamId any
---@param connection any
function PlaceableSellingStation:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableSellingStation:onWriteStream(streamId, connection) end

function PlaceableSellingStation:getSellingStation() end

---@param superFunc any
---@param node any
function PlaceableSellingStation:collectPickObjects(superFunc, node) end

---@param xmlFile any
---@param key any
function PlaceableSellingStation:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableSellingStation:saveToXMLFile(xmlFile, key, usedModNames) end
