---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableBuyingStation.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableBuyingStation
PlaceableBuyingStation = {}

---@param specializations table
---@return boolean
function PlaceableBuyingStation.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableBuyingStation.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableBuyingStation.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableBuyingStation.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableBuyingStation.registerXMLPaths(schema, basePath) end

function PlaceableBuyingStation.initSpecialization() end

---@param savegame table
function PlaceableBuyingStation:onLoad(savegame) end

function PlaceableBuyingStation:onDelete() end

function PlaceableBuyingStation:onFinalizePlacement() end

---@param streamId any
---@param connection any
function PlaceableBuyingStation:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection table
function PlaceableBuyingStation:onWriteStream(streamId, connection) end

---@param superFunc any
---@param node any
function PlaceableBuyingStation:collectPickObjects(superFunc, node) end

function PlaceableBuyingStation:getBuyingStation() end
