---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableIndoorAreas.lua (stub généré, atlas Lua FS25)

---@class PlaceableIndoorAreas
PlaceableIndoorAreas = {}

---@param specializations table
---@return boolean
function PlaceableIndoorAreas.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableIndoorAreas.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableIndoorAreas.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableIndoorAreas.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableIndoorAreas:onLoad(savegame) end

function PlaceableIndoorAreas:onDelete() end

---@param xmlFile any
---@param key any
---@param area any
function PlaceableIndoorAreas:loadIndoorArea(xmlFile, key, area) end

function PlaceableIndoorAreas:onFinalizePlacement() end
