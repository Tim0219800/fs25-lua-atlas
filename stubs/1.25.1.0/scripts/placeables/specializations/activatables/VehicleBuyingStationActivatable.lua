---@meta
-- FS25 1.25.1.0 : placeables/specializations/activatables/VehicleBuyingStationActivatable.lua (generated stub, FS25 Lua Atlas)

--- Activatable object for a vehicle buying station placeable. It takes a prompt text and a callback, is available to players who can access the placeable, and running it simply calls the callback (the vehicle shop dialog is opened there).
---@class VehicleBuyingStationActivatable
VehicleBuyingStationActivatable = {}

--- Creates the activatable for a placeable with a callback function and prompt text.
---@param placeable any
---@param callbackFunc any
---@param text any
function VehicleBuyingStationActivatable.new(placeable, callbackFunc, text) end

--- Returns whether the local player may access the placeable according to the access handler.
function VehicleBuyingStationActivatable:getIsActivatable() end

--- Calls the stored callback with no arguments.
function VehicleBuyingStationActivatable:run() end
