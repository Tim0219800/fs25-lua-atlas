---@meta
-- FS25 1.25.1.0 : ai/parameters/AIParameterVehicle.lua (generated stub, FS25 Lua Atlas)

--- AI job parameter that references one vehicle by network object id. It is displayed as the vehicle name and cannot be edited by the player once set. It is saved by vehicle unique id and validates that the vehicle exists and, by default, supports AI targets.
---@class AIParameterVehicle : AIParameter
AIParameterVehicle = {}

--- Creates the parameter with type TEXT and no vehicle selected.
---@param customMt any
function AIParameterVehicle.new(customMt) end

--- Writes the unique id of the vehicle to `#vehicleUniqueId` when a vehicle is resolved. Nothing is written otherwise.
---@param xmlFile any
---@param key any
---@param usedModNames any
function AIParameterVehicle:saveToXMLFile(xmlFile, key, usedModNames) end

--- Reads a presence flag and, if set, the network node object id of the vehicle.
---@param streamId any
---@param connection any
function AIParameterVehicle:readStream(streamId, connection) end

--- Writes a presence flag and, if a vehicle is set, its network node object id.
---@param streamId any
---@param connection any
function AIParameterVehicle:writeStream(streamId, connection) end

--- Always returns false: the player cannot change this parameter in the UI.
function AIParameterVehicle:getCanBeChanged() end

--- Returns the vehicle name for display, or an empty string if it cannot be resolved.
function AIParameterVehicle:getString() end

--- Stores the network object id of the given vehicle.
---@param vehicle any
function AIParameterVehicle:setVehicle(vehicle) end

--- Resolves the stored id to a vehicle and returns it only if it is synchronized, otherwise nil.
function AIParameterVehicle:getVehicle() end

--- Fails if no vehicle is set or it no longer exists. Unless the argument is false, it also requires the vehicle to have `setAITarget`. Returns a boolean and a localized error.
---@param needsAITarget any
function AIParameterVehicle:validate(needsAITarget) end
