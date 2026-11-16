---@meta
-- FS25 1.25.1.0 : objects/WashingStation.lua (generated stub, FS25 Lua Atlas)

--- Washing station for vehicles: this file only declares the XML schema (trigger node, wash duration, price per wash, sounds, effects) and an activatable that lets a player start a wash. The wash itself (startWashing, effects, payment) is not in this file and is UNVERIFIED here. It extends Object.
---@class WashingStation : Object
WashingStation = {}

--- Washing station for vehicles: this file only declares the XML schema (trigger node, wash duration, price per wash, sounds, effects) and an activatable that lets a player start a wash. The wash itself (startWashing, effects, payment) is not in this file and is UNVERIFIED here. It extends Object.
---@class WashingStationActivatable
WashingStationActivatable = {}

--- Registers the XML paths: vehicle trigger node, `#washDuration`, `#pricePerWash`, the `active` sound sample paths and the effect paths under `.effects`.
---@param schema any
---@param basePath any
function WashingStation.registerXMLPaths(schema, basePath) end

--- Creates an activatable for a washing station and its trigger node, with the localized `action_startWashing` text as prompt.
---@param washingStation any
---@param triggerNode any
function WashingStationActivatable.new(washingStation, triggerNode) end

--- Returns whether the local player's farm may access the washing station according to the mission access handler.
function WashingStationActivatable:getIsActivatable() end

--- Client side: sends a `WashingStationEvent` for this station to the server connection.
function WashingStationActivatable:run() end

--- Returns the distance from the given point to the trigger node's world position.
---@param x any
---@param y any
---@param z any
function WashingStationActivatable:getDistance(x, y, z) end
