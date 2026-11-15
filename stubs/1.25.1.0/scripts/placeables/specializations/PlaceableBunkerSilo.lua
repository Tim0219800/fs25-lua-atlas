---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableBunkerSilo.lua (stub généré, atlas Lua FS25)

---@class PlaceableBunkerSilo
PlaceableBunkerSilo = {}

---@param specializations table
---@return boolean
function PlaceableBunkerSilo.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableBunkerSilo.registerEventListeners(placeableType) end

---@param placeableType any
function PlaceableBunkerSilo.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableBunkerSilo.registerOverwrittenFunctions(placeableType) end

---@param schema any
---@param basePath any
function PlaceableBunkerSilo.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableBunkerSilo.registerSavegameXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableBunkerSilo:onLoad(savegame) end

function PlaceableBunkerSilo:onDelete() end

function PlaceableBunkerSilo:onFinalizePlacement() end

---@param streamId any
---@param connection any
function PlaceableBunkerSilo:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableBunkerSilo:onWriteStream(streamId, connection) end

---@param xmlFile any
---@param key any
function PlaceableBunkerSilo:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableBunkerSilo:saveToXMLFile(xmlFile, key, usedModNames) end

---@param isLeftVisible any
---@param isRightVisible any
function PlaceableBunkerSilo:setWallVisibility(isLeftVisible, isRightVisible) end

function PlaceableBunkerSilo:getIsBunkerSiloExtendable() end

---@param isDeleting any
function PlaceableBunkerSilo:updateBunkerSiloWalls(isDeleting) end

---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableBunkerSilo:setOwnerFarmId(superFunc, farmId, noEventSend) end

function PlaceableBunkerSilo:onSell() end

---@param superFunc any
function PlaceableBunkerSilo:canBeSold(superFunc) end

---@param superFunc function
---@param x number?
---@param y number?
---@param z number?
---@param rotY number?
function PlaceableBunkerSilo:startPlacementCheck(superFunc, x, y, z, rotY) end

---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param rotY any
---@param checkFunc any
function PlaceableBunkerSilo:getHasOverlap(superFunc, x, y, z, rotY, checkFunc) end

---@param superFunc any
---@param x any
---@param y any
---@param z any
function PlaceableBunkerSilo:getPlacementRotation(superFunc, x, y, z) end

---@param superFunc any
---@param x any
---@param y any
---@param z any
function PlaceableBunkerSilo:getPlacementPosition(superFunc, x, y, z) end
