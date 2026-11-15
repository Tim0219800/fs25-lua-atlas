---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceablePointOfInterest.lua (stub généré, atlas Lua FS25)

---@class PlaceablePointOfInterest
PlaceablePointOfInterest = {}

---@param specializations table
---@return boolean
function PlaceablePointOfInterest.prerequisitesPresent(specializations) end

---@param schema any
---@param basePath any
function PlaceablePointOfInterest.registerXMLPaths(schema, basePath) end

---@param placeableType any
function PlaceablePointOfInterest.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceablePointOfInterest.registerEventListeners(placeableType) end

---@param savegame table
function PlaceablePointOfInterest:onLoad(savegame) end

function PlaceablePointOfInterest:onDelete() end

---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceablePointOfInterest:setOwnerFarmId(superFunc, farmId, noEventSend) end
