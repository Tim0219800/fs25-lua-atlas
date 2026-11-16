---@meta
-- FS25 1.25.1.0 : ai/jobs/AIJobDeliver.lua (generated stub, FS25 Lua Atlas)

--- Job in which an AI driver waits for its trailer to be filled, drives to an unloading station and discharges, optionally looping. Tasks are `AITaskDriveTo` (loading position), `AITaskWaitForFilling`, `AITaskDriveTo` (unloading) and `AITaskDischarge`; parameters are vehicle, unloading station, looping and a position/angle for loading. Discharge nodes of the vehicle and its children are collected and sorted by Z offset.
---@class AIJobDeliver : AIJob
AIJobDeliver = {}

--- Creates the four tasks, the vehicle, unloading station, looping and position-angle parameters (snap 5 degrees) and their UI groups.
---@param isServer any
---@param customMt any
function AIJobDeliver.new(isServer, customMt) end

--- Rebuilds task data from the parameters: sets the vehicle on all tasks, collects the discharge nodes (sorted by Z offset) and allowed fill types of the station, sets target offsets and the loading position and direction. Returns early if vehicle, station or discharge nodes are missing.
function AIJobDeliver:setValues() end

--- Validates vehicle (must have discharge nodes), unloading station and loading position, marking each invalid parameter. Returns the global result and the first error text.
---@param farmId any
function AIJobDeliver:validate(farmId) end

--- Initializes from the vehicle: enables looping, reuses station, looping and position from the vehicle's last `AIJobDeliver` if any, else uses the vehicle's position and heading. Lists accessible unloading stations that support AI fill types, sorted by name.
---@param vehicle any
---@param mission any
---@param farmId any
---@param isDirectStart any
function AIJobDeliver:applyCurrentState(vehicle, mission, farmId, isDirectStart) end

--- Base start, then on the server creates the AI agent for the vehicle and calls `vehicle:aiJobStarted`.
---@param farmId any
function AIJobDeliver:start(farmId) end

--- On the server deletes the agent and calls `vehicle:aiJobFinished`, then runs the base stop and clears the discharge node list.
---@param aiMessage any
function AIJobDeliver:stop(aiMessage) end

--- When the wait-for-filling task starts, marks all discharge node infos dirty again, then runs the base `startTask`.
---@param task any
function AIJobDeliver:startTask(task) end

--- Chooses the entry task: if the vehicle is within 1 m of the target position it starts at waiting (skipping it if no fill unit is empty); otherwise it starts by driving to loading, skipping driving and waiting when nothing is empty.
function AIJobDeliver:getStartTaskIndex() end

--- After waiting or discharging, looks for dirty discharge nodes with content: repeats discharge for the same trigger, or sets up the drive to the unloading position for the next fill type. Nodes whose fill type the station does not support are dropped; otherwise defers to the base index.
---@param isSkipTask any
function AIJobDeliver:getNextTaskIndex(isSkipTask) end

--- Fails with `AIMessageErrorVehicleDeleted` or `AIMessageErrorUnloadingStationDeleted` when those no longer exist. During the waiting task it fails with `AIMessageErrorUnloadingStationFull` if no loaded fill type has free capacity in the station.
function AIJobDeliver:canContinueWork() end

--- True if any discharge fill unit holds more than 1 unit of a fill type that the unloading station supports for AI.
function AIJobDeliver:getHasLoadedValidFillType() end

--- True only while the wait-for-filling task is running and unfinished and a valid fill type is already loaded, letting the player stop waiting.
function AIJobDeliver:getCanSkipTask() end

--- Skips the wait-for-filling task if it is the current one; other tasks are not skippable here.
function AIJobDeliver:skipCurrentTask() end

--- Requires `createAgent`, `setAITarget`, AI start capability and support for this job class, plus at least one AI discharge node on the vehicle or one of its children.
---@param vehicle any
function AIJobDeliver:getIsAvailableForVehicle(vehicle) end

--- Returns the vehicle name from the vehicle parameter, or an empty string when there is no vehicle.
function AIJobDeliver:getTitle() end

--- Returns the value of the looping parameter.
function AIJobDeliver:getIsLooping() end

--- Server-side check before starting: refuses if the AI limit is reached, the vehicle is gone, the player lacks the `hireAssistant` permission, or the vehicle is in use. Returns true plus `AIJob.START_SUCCESS`, else false plus a `AIJobDeliver.START_ERROR_*` state.
---@param connection any
function AIJobDeliver:getIsStartable(connection) end

--- Appends to the base description a localized text for the current task: driving to loading, waiting for filling, driving to unloading or unloading.
function AIJobDeliver:getDescription() end

--- Maps a start state returned by `getIsStartable` to a localized text: limit reached, vehicle deleted, no permission, vehicle in use, otherwise the success text. The `AIJobDeliver.START_ERROR_*` constants are not defined in this file (UNVERIFIED).
---@param state any
function AIJobDeliver.getIsStartErrorText(state) end
