---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableVehicleBuyingStation.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for a vehicle shop point. It reads a player trigger, a list of store items with price and transport cost, spawn places and result messages, then opens a vehicle shop dialog through a VehicleBuyingStationActivatable when the player has the buy-vehicle permission. Configured under `placeable.vehicleBuyingStation`.
---@class PlaceableVehicleBuyingStation
PlaceableVehicleBuyingStation = {}

--- Always returns true: no prerequisite specialization.
---@param specializations table
---@return boolean
function PlaceableVehicleBuyingStation.prerequisitesPresent(specializations) end

--- Loads the trigger node, store items (price defaults to the store price, transport costs to 15000), spawn places, messages, title and texts, then creates the activatable. Returns false without spawn places. `vehicleShopCallback` and the trigger callback are not defined in this file (UNVERIFIED).
---@param savegame table
function PlaceableVehicleBuyingStation:onLoad(savegame) end

--- Removes the trigger node if it was created.
function PlaceableVehicleBuyingStation:onDelete() end
