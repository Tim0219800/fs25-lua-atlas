---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableHeapSpawner.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableHeapSpawner
PlaceableHeapSpawner = {}

---@param specializations table
---@return boolean
function PlaceableHeapSpawner.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableHeapSpawner.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableHeapSpawner.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableHeapSpawner:onLoad(savegame) end

---@param savegame any
function PlaceableHeapSpawner:onFinalizePlacement(savegame) end
