---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableMultiBunkerSilo.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableMultiBunkerSilo
PlaceableMultiBunkerSilo = {}

---@param specializations table
---@return boolean
function PlaceableMultiBunkerSilo.prerequisitesPresent(specializations) end

function PlaceableMultiBunkerSilo.initSpecialization() end

---@param placeableType any
function PlaceableMultiBunkerSilo.registerEventListeners(placeableType) end

---@param placeableType any
function PlaceableMultiBunkerSilo.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableMultiBunkerSilo.registerOverwrittenFunctions(placeableType) end

---@param schema any
---@param basePath any
function PlaceableMultiBunkerSilo.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableMultiBunkerSilo.registerSavegameXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableMultiBunkerSilo:onLoad(savegame) end

function PlaceableMultiBunkerSilo:onDelete() end

function PlaceableMultiBunkerSilo:onFinalizePlacement() end

---@param streamId any
---@param connection any
function PlaceableMultiBunkerSilo:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableMultiBunkerSilo:onWriteStream(streamId, connection) end

---@param xmlFile any
---@param key any
function PlaceableMultiBunkerSilo:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableMultiBunkerSilo:saveToXMLFile(xmlFile, key, usedModNames) end

---@param isLeftVisible any
---@param isBackVisible any
---@param isRightVisible any
function PlaceableMultiBunkerSilo:setWallVisibility(isLeftVisible, isBackVisible, isRightVisible) end

function PlaceableMultiBunkerSilo:getIsBunkerSiloExtendable() end

---@param isDeleting any
function PlaceableMultiBunkerSilo:updateBunkerSiloWalls(isDeleting) end

---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableMultiBunkerSilo:setOwnerFarmId(superFunc, farmId, noEventSend) end

function PlaceableMultiBunkerSilo:onSell() end

---@param superFunc any
function PlaceableMultiBunkerSilo:canBeSold(superFunc) end

---@param superFunc function
---@param x number?
---@param y number?
---@param z number?
---@param rotY number?
function PlaceableMultiBunkerSilo:startPlacementCheck(superFunc, x, y, z, rotY) end

---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param rotY any
---@param checkFunc any
function PlaceableMultiBunkerSilo:getHasOverlap(superFunc, x, y, z, rotY, checkFunc) end

---@param superFunc any
---@param x any
---@param y any
---@param z any
function PlaceableMultiBunkerSilo:getPlacementRotation(superFunc, x, y, z) end

---@param superFunc any
---@param x any
---@param y any
---@param z any
function PlaceableMultiBunkerSilo:getPlacementPosition(superFunc, x, y, z) end
