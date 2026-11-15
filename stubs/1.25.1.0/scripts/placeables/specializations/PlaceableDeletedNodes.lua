---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableDeletedNodes.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableDeletedNodes
PlaceableDeletedNodes = {}

---@param specializations table
---@return boolean
function PlaceableDeletedNodes.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableDeletedNodes.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableDeletedNodes.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableDeletedNodes:onLoadFinished(savegame) end
