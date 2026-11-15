---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableTipOcclusionAreas.lua (stub généré, atlas Lua FS25)

---@class PlaceableTipOcclusionAreas
PlaceableTipOcclusionAreas = {}

---@param specializations table
---@return boolean
function PlaceableTipOcclusionAreas.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableTipOcclusionAreas.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableTipOcclusionAreas.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableTipOcclusionAreas.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableTipOcclusionAreas:onLoad(savegame) end

function PlaceableTipOcclusionAreas:onDelete() end

---@param xmlFile any
---@param key any
---@param area any
function PlaceableTipOcclusionAreas:loadTipOcclusionArea(xmlFile, key, area) end

function PlaceableTipOcclusionAreas:onFinalizePlacement() end

function PlaceableTipOcclusionAreas:updateTipOcclusionAreas() end
