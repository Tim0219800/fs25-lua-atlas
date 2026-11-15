---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableWeatherStation.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableWeatherStation
PlaceableWeatherStation = {}

---@param specializations table
---@return boolean
function PlaceableWeatherStation.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableWeatherStation.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableWeatherStation.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableWeatherStation:onLoad(savegame) end

function PlaceableWeatherStation:onDelete() end

function PlaceableWeatherStation:onFinalizePlacement() end
