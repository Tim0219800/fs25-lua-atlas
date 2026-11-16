---@meta
-- FS25 1.25.1.0 : ai/tasks/AITaskLoading.lua (generated stub, FS25 Lua Atlas)

--- AI task that drives a vehicle to a load trigger and starts loading a chosen fill type into a fill unit of a load vehicle. Positioning is server-only and uses the trigger's AI target position and direction shifted by an offset. Loading is delegated to the load vehicle (aiPrepareLoading, aiStartLoadingFromTrigger, aiFinishLoading), which later calls finishedLoading.
---@class AITaskLoading : AITask
AITaskLoading = {}

--- Creates the task with no vehicle, trigger, fill type or fill unit, a zero offset and a max speed of 5. Speed unit UNVERIFIED.
---@param isServer any
---@param job any
---@param customMt any
function AITaskLoading.new(isServer, job, customMt) end

--- Clears the vehicle, load trigger, load vehicle and fill type, then runs the parent reset. The offset and fill unit index are not cleared.
function AITaskLoading:reset() end

--- Sets the vehicle that is driven to the load trigger.
---@param vehicle any
function AITaskLoading:setVehicle(vehicle) end

--- Sets the load trigger to drive to. It must provide getAITargetPositionAndDirection.
---@param loadTrigger any
function AITaskLoading:setLoadTrigger(loadTrigger) end

--- Sets the fill type to load.
---@param fillType any
function AITaskLoading:setFillType(fillType) end

--- Sets the load vehicle, the index of its fill unit to fill and the Z offset applied to the trigger target position.
---@param vehicle any
---@param fillUnitIndex any
---@param offsetZ any
function AITaskLoading:setFillUnit(vehicle, fillUnitIndex, offsetZ) end

--- On the server, computes the trigger target shifted back by the offset, reads terrain height and sets an AI target on the vehicle. Always runs the parent start.
function AITaskLoading:start() end

--- Called when loading is done: tells the load vehicle via aiFinishLoading, then marks the task finished.
function AITaskLoading:finishedLoading() end

--- On arrival, clears the AI target, enters the loading state, prepares the load vehicle and starts loading the fill type from the trigger.
function AITaskLoading:onTargetReached() end

--- Empty callback for AI errors; nothing is done with the message.
---@param errorMessage any
function AITaskLoading:onError(errorMessage) end
