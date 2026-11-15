---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableDynamicallyLoadedParts.lua (stub généré, atlas Lua FS25)

---@class PlaceableDynamicallyLoadedParts
PlaceableDynamicallyLoadedParts = {}

---@param specializations table
---@return boolean
function PlaceableDynamicallyLoadedParts.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableDynamicallyLoadedParts.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableDynamicallyLoadedParts.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableDynamicallyLoadedParts.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableDynamicallyLoadedParts:onLoad(savegame) end

---@param i3dNode any
---@param failedReason any
---@param args any
function PlaceableDynamicallyLoadedParts:onDynamicallyPartI3DLoaded(i3dNode, failedReason, args) end

function PlaceableDynamicallyLoadedParts:onDelete() end
