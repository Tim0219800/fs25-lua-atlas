---@meta
-- FS25 1.25.1.0 : vehicles/ai/AIDriveStrategyConveyor.lua (generated stub, FS25 Lua Atlas)

--- AI drive strategy (subclass of AIDriveStrategy) that drives a vehicle with an aiConveyorBelt definition back and forth between two world targets, using wheel nodes of that vehicle as references. It suits conveyor-type machines that sweep sideways while moving, and relies on vehicle.aiConveyorBelt fields (wheel indices, current angle, speed).
---@class AIDriveStrategyConveyor : AIDriveStrategy
AIDriveStrategyConveyor = {}

--- Constructor, only builds the object from the parent class with the strategy metatable.
---@param reconstructionData any
---@param customMt any
function AIDriveStrategyConveyor.new(reconstructionData, customMt) end

--- Calls the parent method, then from the back and center wheel nodes and the belt angle computes the distance to cover and two world targets (left and right). Resets the target index and moved distance.
---@param vehicle any
function AIDriveStrategyConveyor:setAIVehicle(vehicle) end

--- Empty override, does nothing.
---@param dt any
function AIDriveStrategyConveyor:update(dt) end

--- Accumulates the distance moved by the back wheel, toggles between the two targets (and flips direction) once the distance is reached, the first time doubling it. Returns target x, z, direction and a speed scaled by a sine of progress (clamped to 0.1 to 0.5, then doubled).
---@param dt any
---@param vX any
---@param vY any
---@param vZ any
function AIDriveStrategyConveyor:getDriveData(dt, vX, vY, vZ) end
