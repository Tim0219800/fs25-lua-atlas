---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableBeehivePalletSpawner.lua (stub généré, atlas Lua FS25)

---@class PlaceableBeehivePalletSpawner
PlaceableBeehivePalletSpawner = {}

---@param specializations table
---@return boolean
function PlaceableBeehivePalletSpawner.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableBeehivePalletSpawner.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableBeehivePalletSpawner.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableBeehivePalletSpawner.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableBeehivePalletSpawner.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableBeehivePalletSpawner.registerSavegameXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableBeehivePalletSpawner:onLoad(savegame) end

function PlaceableBeehivePalletSpawner:onDelete() end

function PlaceableBeehivePalletSpawner:onFinalizePlacement() end

---@param streamId any
---@param connection any
function PlaceableBeehivePalletSpawner:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableBeehivePalletSpawner:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function PlaceableBeehivePalletSpawner:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function PlaceableBeehivePalletSpawner:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param xmlFile any
---@param key any
function PlaceableBeehivePalletSpawner:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableBeehivePalletSpawner:saveToXMLFile(xmlFile, key, usedModNames) end

---@param fillLevel any
function PlaceableBeehivePalletSpawner:addFillLevel(fillLevel) end

function PlaceableBeehivePalletSpawner:updatePallets() end

---@param pallet any
---@param result any
---@param fillTypeIndex any
function PlaceableBeehivePalletSpawner:getPalletCallback(pallet, result, fillTypeIndex) end

---@param superFunc any
---@param infoTable any
function PlaceableBeehivePalletSpawner:updateInfo(superFunc, infoTable) end

---@param superFunc any
function PlaceableBeehivePalletSpawner:canBuy(superFunc) end
