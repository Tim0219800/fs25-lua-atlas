---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableClearAreas.lua (stub généré, atlas Lua FS25)

---@class PlaceableClearAreas
PlaceableClearAreas = {}

---@param specializations table
---@return boolean
function PlaceableClearAreas.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableClearAreas.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableClearAreas.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableClearAreas.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableClearAreas:onLoad(savegame) end

---@param xmlFile any
---@param key any
---@param area any
function PlaceableClearAreas:loadClearArea(xmlFile, key, area) end

function PlaceableClearAreas:onPostFinalizePlacement() end
