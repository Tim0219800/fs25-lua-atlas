---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AIVehicleObstacle.lua (generated stub, FS25 Lua Atlas)

--- Specialization intended to make a vehicle an obstacle for AI navigation. In this SDK dump only the prerequisite check and the event listener registration remain; all handler bodies (onLoad, onDelete, onUpdate, onEnterVehicle, onLeaveVehicle) are stripped, so the actual behaviour is UNVERIFIED.
---@class AIVehicleObstacle
AIVehicleObstacle = {}

--- Always returns true: no prerequisite specialization.
---@param specializations table
---@return boolean
function AIVehicleObstacle.prerequisitesPresent(specializations) end

--- Subscribes to onLoad, onDelete, onUpdate, onEnterVehicle and onLeaveVehicle. The handler bodies are not in the dump (UNVERIFIED).
---@param vehicleType any
function AIVehicleObstacle.registerEventListeners(vehicleType) end
