---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableWeatherStation.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for a weather station building. When finalized it registers itself with the placeable system (`addWeatherStation`) and removes itself on delete; on clients it plays an optional idle sound under `placeable.weatherStation.sounds`. What the placeable system does with the registered stations is UNVERIFIED here.
---@class PlaceableWeatherStation
PlaceableWeatherStation = {}

--- Always returns true: no prerequisite specialization.
---@param specializations table
---@return boolean
function PlaceableWeatherStation.prerequisitesPresent(specializations) end

--- Subscribes to onLoad, onDelete and onFinalizePlacement.
---@param placeableType any
function PlaceableWeatherStation.registerEventListeners(placeableType) end

--- Declares the sound XML paths of the sample named `idle` under `.weatherStation.sounds`.
---@param schema any
---@param basePath any
function PlaceableWeatherStation.registerXMLPaths(schema, basePath) end

--- Client only: loads the `idle` sound sample from the XML in the environment audio group.
---@param savegame table
function PlaceableWeatherStation:onLoad(savegame) end

--- Removes this weather station from the placeable system and, on clients, deletes the sound sample.
function PlaceableWeatherStation:onDelete() end

--- Adds this weather station to the placeable system and, on clients, starts the idle sound if loaded.
function PlaceableWeatherStation:onFinalizePlacement() end
