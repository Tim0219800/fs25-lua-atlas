---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableChargingStation.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for an electric vehicle charging station, built on top of `PlaceableBuyingStation` (required). It reuses the buying station's load trigger to detect vehicles being charged with ELECTRICCHARGE, drives an indicator node and light (colour, blinking) and shows the remaining charge time to nearby players. The dump contains no `registerEventListeners` for it, so how `onLoad` and `onUpdate` are wired is UNVERIFIED.
---@class PlaceableChargingStation
PlaceableChargingStation = {}

--- Returns true only if the `PlaceableBuyingStation` specialization is present on the placeable type.
---@param specializations table
---@return boolean
function PlaceableChargingStation.prerequisitesPresent(specializations) end

--- Registers `getIsCharging` and `getChargeState`.
---@param placeableType any
function PlaceableChargingStation.registerFunctions(placeableType) end

--- Reads the charge indicator settings (intensity 20, blink speed 5, colours, interaction radius 5 by default), initializes the indicator shader and light, takes the buying station's load trigger and loads the fill sound, which becomes the trigger's load sound if it has none.
---@param savegame table
function PlaceableChargingStation:onLoad(savegame) end

--- Returns whether the load trigger is currently loading; false when there is no load trigger.
function PlaceableChargingStation:getIsCharging() end

--- Returns fill level and capacity of the ELECTRICCHARGE fill unit of the first vehicle in the load trigger; returns 0, 1 when there is none.
function PlaceableChargingStation:getChargeState() end

--- Client-style update: colours the indicator (full colour above 95 percent charge), sets blinking while loading and sets the light alpha. While loading, shows the remaining time and percentage as extra HUD text for a nearby player or one seated in the charging vehicle. Keeps itself active while a vehicle is present. Note: it calls `localPlayer:getCurrentVehicle()` in a branch reached when `g_localPlayer` is nil.
---@param dt number
function PlaceableChargingStation:onUpdate(dt) end
