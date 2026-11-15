---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableBeehive.lua (stub généré, atlas Lua FS25)

---@class PlaceableBeehive
PlaceableBeehive = {}

---@param specializations table
---@return boolean
function PlaceableBeehive.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableBeehive.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableBeehive.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableBeehive.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableBeehive.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableBeehive:onLoad(savegame) end

function PlaceableBeehive:onDelete() end

function PlaceableBeehive:onFinalizePlacement() end

---@param wx any
---@param wz any
function PlaceableBeehive:getBeehiveInfluenceFactor(wx, wz) end

function PlaceableBeehive:updateBeehiveState() end

function PlaceableBeehive:getHoneyAmountToSpawn() end

---@param superFunc any
---@param infoTable any
function PlaceableBeehive:updateInfo(superFunc, infoTable) end

function PlaceableBeehive:onBuy() end
