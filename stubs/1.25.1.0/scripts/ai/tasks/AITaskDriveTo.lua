---@meta
-- FS25 1.25.1.0 : ai/tasks/AITaskDriveTo.lua (generated stub, FS25 Lua Atlas)

--- AI task that drives a vehicle to a ground position with a target heading, optionally via an offset position placed behind the target along that heading. On the server, it first waits for the vehicle to be ready (with a timeout) and then sets AI targets. The task finishes when the final position is reached.
---@class AITaskDriveTo : AITask
AITaskDriveTo = {}

--- Creates the task with no target or vehicle, initial state drive-to-offset, max speed 10, zero offset and zero prepare timeout. Speed unit UNVERIFIED.
---@param isServer any
---@param job any
---@param customMt any
function AITaskDriveTo.new(isServer, job, customMt) end

--- Clears the vehicle, target position and direction, restores the initial state, speed and offset, then runs the parent reset.
function AITaskDriveTo:reset() end

--- Sets the vehicle to drive.
---@param vehicle any
function AITaskDriveTo:setVehicle(vehicle) end

--- Sets the distance behind the target, along the target direction, of an intermediate waypoint. Zero means drive straight to the target.
---@param offset any
function AITaskDriveTo:setTargetOffset(offset) end

--- Stores the target x and z. Note: the branch meant to update a running target is empty, and it reads self.isActive, so a change after start has no effect.
---@param x any
---@param z any
function AITaskDriveTo:setTargetPosition(x, z) end

--- Stores the target direction (dirX, dirZ). The update-while-active branch is empty, so a change after start has no effect.
---@param dirX any
---@param dirZ any
function AITaskDriveTo:setTargetDirection(dirX, dirZ) end

--- Server only, in the prepare state: asks the vehicle if it is ready and starts driving when so. If not ready and not preparing, it accumulates time and stops the AI job with a could-not-prepare error after PREPARE_TIMEOUT.
---@param dt any
function AITaskDriveTo:update(dt) end

--- On the server, switches to the prepare state, asks the vehicle to prepare for AI driving and flags the task active. Always runs the parent start.
function AITaskDriveTo:start() end

--- Runs the parent stop, then on the server clears the vehicle's AI target and flags the task inactive.
---@param wasJobStopped any
function AITaskDriveTo:stop(wasJobStopped) end

--- Reads the terrain height and sets the first AI target: the target position, or the offset waypoint when an offset is set (state becomes drive-to-offset, otherwise drive-to-final).
function AITaskDriveTo:startDriving() end

--- Callback on arrival. From the offset waypoint it sets the final target with the max speed and switches state; from the final position it marks the task finished.
function AITaskDriveTo:onTargetReached() end

--- Empty callback for AI errors; nothing is done with the message.
---@param errorMessage any
function AITaskDriveTo:onError(errorMessage) end
