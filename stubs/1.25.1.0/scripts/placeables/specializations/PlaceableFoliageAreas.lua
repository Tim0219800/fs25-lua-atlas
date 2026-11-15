---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableFoliageAreas.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableFoliageAreas
PlaceableFoliageAreas = {}

---@param specializations table
---@return boolean
function PlaceableFoliageAreas.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableFoliageAreas.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableFoliageAreas.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableFoliageAreas.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableFoliageAreas:onLoad(savegame) end

---@param xmlFile any
---@param key any
---@param area any
function PlaceableFoliageAreas:loadFoliageArea(xmlFile, key, area) end

function PlaceableFoliageAreas:onPostFinalizePlacement() end
