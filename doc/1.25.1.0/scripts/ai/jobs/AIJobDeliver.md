# ai/jobs/AIJobDeliver.lua

*[Version française](../../../fr/scripts/ai/jobs/AIJobDeliver.md)*

Source: `dataS/scripts/ai/jobs/AIJobDeliver.lua` — FS25 1.25.1.0

✍ Job in which an AI driver waits for its trailer to be filled, drives to an unloading station and discharges, optionally looping. Tasks are `AITaskDriveTo` (loading position), `AITaskWaitForFilling`, `AITaskDriveTo` (unloading) and `AITaskDischarge`; parameters are vehicle, unloading station, looping and a position/angle for loading. Discharge nodes of the vehicle and its children are collected and sorted by Z offset.

- **AIJobDeliver** inherits from `AIJob` (l.18)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIJobDeliver.new(isServer: any, customMt: any)` | 22 | ✍ Creates the four tasks, the vehicle, unloading station, looping and position-angle parameters (snap 5 degrees) and their UI groups. |
| `AIJobDeliver:setValues()` | 69 | ✍ Rebuilds task data from the parameters: sets the vehicle on all tasks, collects the discharge nodes (sorted by Z offset) and allowed fill types of the station, sets target offsets and the loading position and direction. Returns early if vehicle, station or discharge nodes are missing. |
| `AIJobDeliver:validate(farmId: any)` | 139 | ✍ Validates vehicle (must have discharge nodes), unloading station and loading position, marking each invalid parameter. Returns the global result and the first error text. |
| `AIJobDeliver:applyCurrentState(vehicle: any, mission: any, farmId: any, isDirectStart: any)` | 172 | ✍ Initializes from the vehicle: enables looping, reuses station, looping and position from the vehicle's last `AIJobDeliver` if any, else uses the vehicle's position and heading. Lists accessible unloading stations that support AI fill types, sorted by name. |
| `AIJobDeliver:start(farmId: any)` | 216 | ✍ Base start, then on the server creates the AI agent for the vehicle and calls `vehicle:aiJobStarted`. |
| `AIJobDeliver:stop(aiMessage: any)` | 229 | ✍ On the server deletes the agent and calls `vehicle:aiJobFinished`, then runs the base stop and clears the discharge node list. |
| `AIJobDeliver:startTask(task: any)` | 244 | ✍ When the wait-for-filling task starts, marks all discharge node infos dirty again, then runs the base `startTask`. |
| `AIJobDeliver:getStartTaskIndex()` | 257 | ✍ Chooses the entry task: if the vehicle is within 1 m of the target position it starts at waiting (skipping it if no fill unit is empty); otherwise it starts by driving to loading, skipping driving and waiting when nothing is empty. |
| `AIJobDeliver:getNextTaskIndex(isSkipTask: any)` | 292 | ✍ After waiting or discharging, looks for dirty discharge nodes with content: repeats discharge for the same trigger, or sets up the drive to the unloading position for the next fill type. Nodes whose fill type the station does not support are dropped; otherwise defers to the base index. |
| `AIJobDeliver:canContinueWork()` | 349 | ✍ Fails with `AIMessageErrorVehicleDeleted` or `AIMessageErrorUnloadingStationDeleted` when those no longer exist. During the waiting task it fails with `AIMessageErrorUnloadingStationFull` if no loaded fill type has free capacity in the station. |
| `AIJobDeliver:getHasLoadedValidFillType()` | 386 | ✍ True if any discharge fill unit holds more than 1 unit of a fill type that the unloading station supports for AI. |
| `AIJobDeliver:getCanSkipTask()` | 405 | ✍ True only while the wait-for-filling task is running and unfinished and a valid fill type is already loaded, letting the player stop waiting. |
| `AIJobDeliver:skipCurrentTask()` | 417 | ✍ Skips the wait-for-filling task if it is the current one; other tasks are not skippable here. |
| `AIJobDeliver:getIsAvailableForVehicle(vehicle: any)` | 425 | ✍ Requires `createAgent`, `setAITarget`, AI start capability and support for this job class, plus at least one AI discharge node on the vehicle or one of its children. |
| `AIJobDeliver:getTitle()` | 456 | ✍ Returns the vehicle name from the vehicle parameter, or an empty string when there is no vehicle. |
| `AIJobDeliver:getIsLooping()` | 467 | ✍ Returns the value of the looping parameter. |
| `AIJobDeliver:getIsStartable(connection: any)` | 473 | ✍ Server-side check before starting: refuses if the AI limit is reached, the vehicle is gone, the player lacks the `hireAssistant` permission, or the vehicle is in use. Returns true plus `AIJob.START_SUCCESS`, else false plus a `AIJobDeliver.START_ERROR_*` state. |
| `AIJobDeliver:getDescription()` | 496 | ✍ Appends to the base description a localized text for the current task: driving to loading, waiting for filling, driving to unloading or unloading. |
| `AIJobDeliver.getIsStartErrorText(state: any)` | 515 | ✍ Maps a start state returned by `getIsStartable` to a localized text: limit reached, vehicle deleted, no permission, vehicle in use, otherwise the success text. The `AIJobDeliver.START_ERROR_*` constants are not defined in this file (UNVERIFIED). |
