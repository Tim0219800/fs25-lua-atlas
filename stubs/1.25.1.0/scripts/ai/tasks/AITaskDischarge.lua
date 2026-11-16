---@meta
-- FS25 1.25.1.0 : ai/tasks/AITaskDischarge.lua (generated stub, FS25 Lua Atlas)

--- AI task that drives a vehicle to an unload trigger and then makes a discharge vehicle unload there. Positioning is server-only: the target comes from the trigger's AI target position and direction, shifted by an offset. If the discharge cannot start, the job is stopped with an unloading-station-full error message.
---@class AITaskDischarge : AITask
AITaskDischarge = {}

--- Creates the task with no vehicle or trigger, a zero offset, a max speed of 5 and the driving state. The speed unit is UNVERIFIED (set by the AI target call).
---@param isServer any
---@param job any
---@param customMt any
function AITaskDischarge.new(isServer, job, customMt) end

--- Clears the vehicle, trigger, discharge vehicle and node, resets the offset and driving state, then runs the parent reset.
function AITaskDischarge:reset() end

--- Sets the vehicle that is driven to the unload trigger.
---@param vehicle any
function AITaskDischarge:setVehicle(vehicle) end

--- Sets the unload trigger the vehicle drives to. It must provide getAITargetPositionAndDirection.
---@param unloadTrigger any
function AITaskDischarge:setUnloadTrigger(unloadTrigger) end

--- Stores the discharge node and its vehicle. If a vehicle is given, it also stores the Z offset and selects the node index as the vehicle's current discharge node.
---@param vehicle any
---@param dischargeNode any
---@param offsetZ any
function AITaskDischarge:setDischargeNode(vehicle, dischargeNode, offsetZ) end

--- On the server, computes the trigger target shifted back by the offset, reads the terrain height and sets an AI target on the vehicle, then enters the driving state. Always runs the parent start.
function AITaskDischarge:start() end

--- Callback when the vehicle arrives: clears the AI target and, if the discharge vehicle allows an AI discharge, starts it. Otherwise it stops the job with an unloading-station-full error.
function AITaskDischarge:onTargetReached() end

--- Empty callback for AI errors; nothing is done with the message.
---@param errorMessage any
function AITaskDischarge:onError(errorMessage) end

--- Called by the discharging vehicle when it is done; marks the task as finished.
function AITaskDischarge:finishedDischarge() end
