---@meta
-- FS25 1.25.1.0 : placeables/PlaceableSystem.lua (stub généré, atlas Lua FS25)

---@class PlaceableSystem
PlaceableSystem = {}

---@param mission table
---@param customMt table?
---@return PlaceableSystem
function PlaceableSystem.new(mission, customMt) end

function PlaceableSystem:delete() end

function PlaceableSystem:deleteAll() end

---@param placeable any
function PlaceableSystem:addPlaceable(placeable) end

---@param placeable any
function PlaceableSystem:removePlaceable(placeable) end

---@param placeableLoadingData any
function PlaceableSystem:addPendingPlaceableLoad(placeableLoadingData) end

---@param placeableLoadingData any
function PlaceableSystem:removePendingPlaceableLoad(placeableLoadingData) end

function PlaceableSystem:canStartMission() end

---@param weatherStation any
function PlaceableSystem:addWeatherStation(weatherStation) end

---@param weatherStation any
function PlaceableSystem:removeWeatherStation(weatherStation) end

---@param bunkerSilo any
function PlaceableSystem:addBunkerSilo(bunkerSilo) end

---@param bunkerSilo any
function PlaceableSystem:removeBunkerSilo(bunkerSilo) end

function PlaceableSystem:getBunkerSilos() end

---@param xmlFilename string
---@param ownerFarmId integer?
---@param excludeBoughtWithFarmland boolean?
---@return Placeable?
function PlaceableSystem:getExistingPlaceableByXMLFilename(xmlFilename, ownerFarmId, excludeBoughtWithFarmland) end

---@param farmId any
function PlaceableSystem:getHasWeatherStation(farmId) end

---@param farmhouse any
function PlaceableSystem:addFarmhouse(farmhouse) end

---@param farmhouse any
function PlaceableSystem:removeFarmhouse(farmhouse) end

---@param farmId any
function PlaceableSystem:getFarmhouse(farmId) end

---@param xmlFilename any
---@param usedModNames any
function PlaceableSystem:save(xmlFilename, usedModNames) end

---@param xmlFile any
---@param usedModNames any
---@param savePreplaced any
function PlaceableSystem:saveToXML(xmlFile, usedModNames, savePreplaced) end

---@param xmlFile any
---@param key any
---@param defaultItemsToSPFarm any
---@param preplacedData any
---@param callback any
---@param callbackTarget any
---@param callbackArguments any
function PlaceableSystem:loadPlaceableFromXML(xmlFile, key, defaultItemsToSPFarm, preplacedData, callback, callbackTarget, callbackArguments) end

---@param placeable any
---@param loadingState any
---@param arguments any
function PlaceableSystem:loadPlaceableFinished(placeable, loadingState, arguments) end

---@param includePreplaced any
function PlaceableSystem:consoleCommandDeleteAllPlaceables(includePreplaced) end

function PlaceableSystem:consoleCommandReloadAllPlaceables() end

---@param modsOnly string?
function PlaceableSystem:consoleCommandLoadAllPlaceables(modsOnly) end
