---@meta
-- FS25 1.25.1.0 : ai/jobs/AIJob.lua (generated stub, FS25 Lua Atlas)

--- Base class of all AI helper jobs. A job owns an ordered list of tasks and named/grouped parameters; the server drives task start, update and stop and broadcasts `AITaskStartEvent`/`AITaskStopEvent`, while clients are only notified. It also handles per-millisecond cost, notifications and XML/stream (de)serialization of its parameters. Concrete jobs such as `AIJobFieldWork` or `AIJobGoTo` subclass it.
---@class AIJob
AIJob = {}

--- Creates a job with empty task and parameter lists, `currentTaskIndex` 0, no job id and no pending cost. `isServer` decides whether the instance drives the tasks.
---@param isServer any
---@param customMt any
function AIJob.new(isServer, customMt) end

--- Deletes every named parameter and every task of the job.
function AIJob:delete() end

--- Writes each named parameter that supports saving as a `parameter(i)` entry with its name, delegating the content to the parameter. Returns true.
---@param xmlFile any
---@param key any
---@param usedModNames any
function AIJob:saveToXMLFile(xmlFile, key, usedModNames) end

--- Iterates the `parameter` entries under the key and lets the matching named parameter load itself when it supports loading. Unknown names are ignored.
---@param xmlFile any
---@param key any
function AIJob:loadFromXMLFile(xmlFile, key) end

--- Reads the direct-start flag, the optional job id, every named parameter in order, calls `setValues` and then reads the current task index (uint8).
---@param streamId any
---@param connection any
function AIJob:readStream(streamId, connection) end

--- Writes the same data `readStream` expects: direct-start flag, optional job id, all named parameters and the current task index.
---@param streamId any
---@param connection any
function AIJob:writeStream(streamId, connection) end

--- Server only. With no active task it checks `canStartWork` and starts the first task or stops the job with a message. Otherwise it updates the current task and, when finished, checks `canContinueWork`, moves to the next task, loops if `getIsLooping`, or stops with `AIMessageSuccessFinishedJob`.
---@param dt any
function AIJob:update(dt) end

--- Accumulates the running cost (`getPricePerMs` times dt times the economy cost multiplier) and stops the job with `AIMessageErrorOutOfMoney` if the farm balance would go negative. Once pending cost exceeds 25 it is booked as money of type `MoneyType.AI`.
---@param dt any
function AIJob:updateCost(dt) end

--- Hook called after a task finishes; returns true and a nil message by default. Subclasses return false plus an `AIMessage` to abort the job.
function AIJob:canContinueWork() end

--- Hook called before the first task starts; returns true and nil by default. Subclasses can refuse with a message.
function AIJob:canStartWork() end

--- Returns the base cost per millisecond, 0.0004 by default; subclasses override it (for example field work and conveyor).
function AIJob:getPricePerMs() end

--- Returns the index of the following task, the current index plus one. Subclasses override it to branch.
function AIJob:getNextTaskIndex() end

--- Hook that checks the job parameters before start; returns true and nil by default, subclasses return false plus an error text.
---@param farmId any
function AIJob:validate(farmId) end

--- Returns false by default: the job ends after its last task. Looping jobs override it.
function AIJob:getIsLooping() end

--- Empty hook that copies the parameter values into the tasks; subclasses implement it and `readStream` calls it.
function AIJob:setValues() end

--- Makes the task current, calls `task:start()` and, on the server, broadcasts an `AITaskStartEvent`.
---@param task any
function AIJob:startTask(task) end

--- Calls `task:stop(wasJobStopped)` and, on the server, broadcasts an `AITaskStopEvent`.
---@param task any
---@param wasJobStopped any
function AIJob:stopTask(task, wasJobStopped) end

--- Picks a random helper from `g_helperManager`, stores its index and the farm id, marks the job as running and, on the server, resets the task index to 0.
---@param farmId any
function AIJob:start(farmId) end

--- Returns false by default; jobs with skippable tasks override it.
function AIJob:getCanSkipTask() end

--- Empty hook for skipping the current task; overridden where `getCanSkipTask` can be true.
function AIJob:skipCurrentTask() end

--- Marks the job as not running; on the server stops the current task with `wasJobStopped` true, books any pending cost, shows the notification for the given message and resets all tasks.
---@param aiMessage any
function AIJob:stop(aiMessage) end

--- Appends a task and assigns its `taskIndex`. Asserts that the task was not already added.
---@param task any
function AIJob:addTask(task) end

--- Calls `reset()` on every task of the job.
function AIJob:resetTasks() end

--- Returns the task at the given index, or nil.
---@param taskIndex any
function AIJob:getTaskByIndex(taskIndex) end

--- Returns the title of the helper assigned to the job.
function AIJob:getTitle() end

--- Returns the title of the job type from `aiJobTypeManager` for this job's `jobTypeIndex`. Subclasses append the current task description.
function AIJob:getDescription() end

--- Returns the helper title, which is the name inserted into AI messages.
function AIJob:getHelperName() end

--- Shows an in-game notification for the message, only on the client whose local player belongs to the farm that started the job. The notification kind (critical, OK, info) follows `aiMessage:getType()`. Does nothing if the helper no longer exists.
---@param aiMessage any
function AIJob:showNotification(aiMessage) end

--- Returns the index of the first task to run, 1 by default; subclasses may skip ahead.
function AIJob:getStartTaskIndex() end

--- Registers a parameter under a name so it can be saved, streamed and looked up by name.
---@param name any
---@param parameter any
function AIJob:addNamedParameter(name, parameter) end

--- Sets the validity flag of every named parameter to the given value.
---@param isValid any
function AIJob:setParameterValid(isValid) end

--- Returns the list of `{name, parameter}` entries.
function AIJob:getNamedParameters() end

--- Finds a parameter by name, case-insensitively. Returns nil for a nil or unknown name.
---@param name any
function AIJob:getNamedParameter(name) end

--- Returns the parameter groups used to lay out the job in the UI.
function AIJob:getGroupedParameters() end

--- Hook that initializes the parameters from the vehicle and mission state; the base version only stores the direct-start flag.
---@param vehicle any
---@param mission any
---@param farmId any
---@param isDirectStart any
function AIJob:applyCurrentState(vehicle, mission, farmId, isDirectStart) end

--- Returns true by default, meaning the job can be offered for any vehicle; subclasses restrict it.
---@param vehicle any
function AIJob:getIsAvailableForVehicle(vehicle) end

--- Stores the job id used to identify the job in network events.
---@param id any
function AIJob:setId(id) end

--- Empty hook called when a parameter value changes in the UI; subclasses react to it.
---@param parameter any
function AIJob:onParameterValueChanged(parameter) end

--- Returns true and `AIJob.START_SUCCESS` by default; subclasses return false plus a start-error state. `AIJob.START_SUCCESS` is not defined in this file (UNVERIFIED).
---@param connection any
function AIJob:getIsStartable(connection) end
