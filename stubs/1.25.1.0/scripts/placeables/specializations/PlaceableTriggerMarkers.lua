---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableTriggerMarkers.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableTriggerMarkers
PlaceableTriggerMarkers = {}

---@param specializations table
---@return boolean
function PlaceableTriggerMarkers.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableTriggerMarkers.registerEventListeners(placeableType) end

---@param placeableType any
function PlaceableTriggerMarkers.registerFunctions(placeableType) end

---@param schema any
---@param basePath any
function PlaceableTriggerMarkers.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableTriggerMarkers:onLoad(savegame) end

---@param i3dNode any
---@param failedReason any
---@param args any
function PlaceableTriggerMarkers:onMarkerFileLoaded(i3dNode, failedReason, args) end

function PlaceableTriggerMarkers:onDelete() end

function PlaceableTriggerMarkers:onFinalizePlacement() end
