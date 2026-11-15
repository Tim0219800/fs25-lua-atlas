---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableChargingStation.lua (stub généré, atlas Lua FS25)

---@class PlaceableChargingStation
PlaceableChargingStation = {}

---@param specializations table
---@return boolean
function PlaceableChargingStation.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableChargingStation.registerFunctions(placeableType) end

---@param savegame table
function PlaceableChargingStation:onLoad(savegame) end

function PlaceableChargingStation:getIsCharging() end

function PlaceableChargingStation:getChargeState() end

---@param dt number
function PlaceableChargingStation:onUpdate(dt) end
