---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableWashingStation.lua (stub généré, atlas Lua FS25)

---@class PlaceableWashingStation
PlaceableWashingStation = {}

---@param specializations table
---@return boolean
function PlaceableWashingStation.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableWashingStation.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableWashingStation.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableWashingStation.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableWashingStation:onLoad(savegame) end

function PlaceableWashingStation:onDelete() end

function PlaceableWashingStation:onFinalizePlacement() end

---@param streamId any
---@param connection any
function PlaceableWashingStation:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableWashingStation:onWriteStream(streamId, connection) end

---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableWashingStation:setOwnerFarmId(superFunc, farmId, noEventSend) end
