---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableHotspots.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableHotspots
PlaceableHotspots = {}

---@param specializations table
---@return boolean
function PlaceableHotspots.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableHotspots.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableHotspots.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableHotspots.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableHotspots:onLoad(savegame) end

function PlaceableHotspots:onDelete() end

function PlaceableHotspots:onPostFinalizePlacement() end

function PlaceableHotspots:onOwnerChanged() end

---@param index any
function PlaceableHotspots:getHotspot(index) end
