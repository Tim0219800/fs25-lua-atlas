# ai/jobs/AIJob.lua

*[Version française](../../../fr/scripts/ai/jobs/AIJob.md)*

Source: `dataS/scripts/ai/jobs/AIJob.lua` — FS25 1.25.1.0

✍ Base class of all AI helper jobs. A job owns an ordered list of tasks and named/grouped parameters; the server drives task start, update and stop and broadcasts `AITaskStartEvent`/`AITaskStopEvent`, while clients are only notified. It also handles per-millisecond cost, notifications and XML/stream (de)serialization of its parameters. Concrete jobs such as `AIJobFieldWork` or `AIJobGoTo` subclass it.

- **AIJob** (l.18)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIJob.new(isServer: any, customMt: any)` | 22 | ✍ Creates a job with empty task and parameter lists, `currentTaskIndex` 0, no job id and no pending cost. `isServer` decides whether the instance drives the tasks. |
| `AIJob:delete()` | 41 | ✍ Deletes every named parameter and every task of the job. |
| `AIJob:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 52 | ✍ Writes each named parameter that supports saving as a `parameter(i)` entry with its name, delegating the content to the parameter. Returns true. |
| `AIJob:loadFromXMLFile(xmlFile: any, key: any)` | 69 | ✍ Iterates the `parameter` entries under the key and lets the matching named parameter load itself when it supports loading. Unknown names are ignored. |
| `AIJob:readStream(streamId: any, connection: any)` | 83 | ✍ Reads the direct-start flag, the optional job id, every named parameter in order, calls `setValues` and then reads the current task index (uint8). |
| `AIJob:writeStream(streamId: any, connection: any)` | 101 | ✍ Writes the same data `readStream` expects: direct-start flag, optional job id, all named parameters and the current task index. |
| `AIJob:update(dt: any)` | 117 | ✍ Server only. With no active task it checks `canStartWork` and starts the first task or stops the job with a message. Otherwise it updates the current task and, when finished, checks `canContinueWork`, moves to the next task, loops if `getIsLooping`, or stops with `AIMessageSuccessFinishedJob`. |
| `AIJob:updateCost(dt: any)` | 168 | ✍ Accumulates the running cost (`getPricePerMs` times dt times the economy cost multiplier) and stops the job with `AIMessageErrorOutOfMoney` if the farm balance would go negative. Once pending cost exceeds 25 it is booked as money of type `MoneyType.AI`. |
| `AIJob:canContinueWork()` | 191 | ✍ Hook called after a task finishes; returns true and a nil message by default. Subclasses return false plus an `AIMessage` to abort the job. |
| `AIJob:canStartWork()` | 197 | ✍ Hook called before the first task starts; returns true and nil by default. Subclasses can refuse with a message. |
| `AIJob:getPricePerMs()` | 203 | ✍ Returns the base cost per millisecond, 0.0004 by default; subclasses override it (for example field work and conveyor). |
| `AIJob:getNextTaskIndex()` | 209 | ✍ Returns the index of the following task, the current index plus one. Subclasses override it to branch. |
| `AIJob:validate(farmId: any)` | 215 | ✍ Hook that checks the job parameters before start; returns true and nil by default, subclasses return false plus an error text. |
| `AIJob:getIsLooping()` | 221 | ✍ Returns false by default: the job ends after its last task. Looping jobs override it. |
| `AIJob:setValues()` | 227 | ✍ Empty hook that copies the parameter values into the tasks; subclasses implement it and `readStream` calls it. |
| `AIJob:startTask(task: any)` | 232 | ✍ Makes the task current, calls `task:start()` and, on the server, broadcasts an `AITaskStartEvent`. |
| `AIJob:stopTask(task: any, wasJobStopped: any)` | 243 | ✍ Calls `task:stop(wasJobStopped)` and, on the server, broadcasts an `AITaskStopEvent`. |
| `AIJob:start(farmId: any)` | 253 | ✍ Picks a random helper from `g_helperManager`, stores its index and the farm id, marks the job as running and, on the server, resets the task index to 0. |
| `AIJob:getCanSkipTask()` | 266 | ✍ Returns false by default; jobs with skippable tasks override it. |
| `AIJob:skipCurrentTask()` | 272 | ✍ Empty hook for skipping the current task; overridden where `getCanSkipTask` can be true. |
| `AIJob:stop(aiMessage: any)` | 277 | ✍ Marks the job as not running; on the server stops the current task with `wasJobStopped` true, books any pending cost, shows the notification for the given message and resets all tasks. |
| `AIJob:addTask(task: any)` | 298 | ✍ Appends a task and assigns its `taskIndex`. Asserts that the task was not already added. |
| `AIJob:resetTasks()` | 306 | ✍ Calls `reset()` on every task of the job. |
| `AIJob:getTaskByIndex(taskIndex: any)` | 314 | ✍ Returns the task at the given index, or nil. |
| `AIJob:getTitle()` | 320 | ✍ Returns the title of the helper assigned to the job. |
| `AIJob:getDescription()` | 327 | ✍ Returns the title of the job type from `aiJobTypeManager` for this job's `jobTypeIndex`. Subclasses append the current task description. |
| `AIJob:getHelperName()` | 334 | ✍ Returns the helper title, which is the name inserted into AI messages. |
| `AIJob:showNotification(aiMessage: any)` | 341 | ✍ Shows an in-game notification for the message, only on the client whose local player belongs to the farm that started the job. The notification kind (critical, OK, info) follows `aiMessage:getType()`. Does nothing if the helper no longer exists. |
| `AIJob:getStartTaskIndex()` | 369 | ✍ Returns the index of the first task to run, 1 by default; subclasses may skip ahead. |
| `AIJob:addNamedParameter(name: any, parameter: any)` | 375 | ✍ Registers a parameter under a name so it can be saved, streamed and looked up by name. |
| `AIJob:setParameterValid(isValid: any)` | 381 | ✍ Sets the validity flag of every named parameter to the given value. |
| `AIJob:getNamedParameters()` | 389 | ✍ Returns the list of `{name, parameter}` entries. |
| `AIJob:getNamedParameter(name: any)` | 395 | ✍ Finds a parameter by name, case-insensitively. Returns nil for a nil or unknown name. |
| `AIJob:getGroupedParameters()` | 412 | ✍ Returns the parameter groups used to lay out the job in the UI. |
| `AIJob:applyCurrentState(vehicle: any, mission: any, farmId: any, isDirectStart: any)` | 418 | ✍ Hook that initializes the parameters from the vehicle and mission state; the base version only stores the direct-start flag. |
| `AIJob:getIsAvailableForVehicle(vehicle: any)` | 424 | ✍ Returns true by default, meaning the job can be offered for any vehicle; subclasses restrict it. |
| `AIJob:setId(id: any)` | 430 | ✍ Stores the job id used to identify the job in network events. |
| `AIJob:onParameterValueChanged(parameter: any)` | 436 | ✍ Empty hook called when a parameter value changes in the UI; subclasses react to it. |
| `AIJob:getIsStartable(connection: any)` | 441 | ✍ Returns true and `AIJob.START_SUCCESS` by default; subclasses return false plus a start-error state. `AIJob.START_SUCCESS` is not defined in this file (UNVERIFIED). |
