---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableNPCSpot.lua (stub généré, atlas Lua FS25)

---@class PlaceableNPCSpot
PlaceableNPCSpot = {}

---@param specializations table
---@return boolean
function PlaceableNPCSpot.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableNPCSpot.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableNPCSpot.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableNPCSpot:onLoad(savegame) end

function PlaceableNPCSpot:onFinalizePlacement() end

function PlaceableNPCSpot:onDelete() end
