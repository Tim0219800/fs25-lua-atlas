---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableWorkshop.lua (stub généré, atlas Lua FS25)

---@class PlaceableWorkshop
PlaceableWorkshop = {}

---@param specializations table
---@return boolean
function PlaceableWorkshop.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableWorkshop.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableWorkshop.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableWorkshop.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableWorkshop:onLoad(savegame) end

function PlaceableWorkshop:onDelete() end

---@param superFunc any
---@param ownerFarmId any
---@param noEventSend any
function PlaceableWorkshop:setOwnerFarmId(superFunc, ownerFarmId, noEventSend) end
