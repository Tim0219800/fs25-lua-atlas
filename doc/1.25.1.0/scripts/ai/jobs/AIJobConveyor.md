# ai/jobs/AIJobConveyor.lua

*[Version française](../../../fr/scripts/ai/jobs/AIJobConveyor.md)*

Source: `dataS/scripts/ai/jobs/AIJobConveyor.lua` — FS25 1.25.1.0

✍ Job that runs a conveyor belt vehicle (`spec_aiConveyorBelt`) with a single `AITaskConveyor` task and one vehicle parameter. The vehicle itself notifies clients of start and stop; the cost per ms is much lower than for driving jobs.

- **AIJobConveyor** inherits from `AIJob` (l.18)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIJobConveyor.new(isServer: any, customMt: any)` | 22 | ✍ Creates the job with one `AITaskConveyor`, a vehicle parameter named "vehicle" and its parameter group. |
| `AIJobConveyor:getPricePerMs()` | 43 | ✍ Returns 0.00005 per millisecond. |
| `AIJobConveyor:start(farmId: any)` | 49 | ✍ Calls the base start and, on the server, calls `vehicle:aiJobStarted` for the job's vehicle, which notifies clients. No agent is created. |
| `AIJobConveyor:stop(aiMessage: any)` | 61 | ✍ On the server calls `vehicle:aiJobFinished()` before running the base stop. |
| `AIJobConveyor:applyCurrentState(vehicle: any, mission: any, farmId: any, isDirectStart: any)` | 73 | ✍ Stores the given vehicle in the vehicle parameter after the base initialization. |
| `AIJobConveyor:getIsAvailableForVehicle(vehicle: any)` | 81 | ✍ True when the vehicle has `spec_aiConveyorBelt`, can start AI and lists this job class as supported through `getIsAIJobSupported`. |
| `AIJobConveyor:getTitle()` | 87 | ✍ Returns the vehicle name from the vehicle parameter, or an empty string when there is no vehicle. |
| `AIJobConveyor:setValues()` | 98 | ✍ Resets the tasks and passes the parameter's vehicle to the conveyor task. |
| `AIJobConveyor:validate(farmId: any)` | 106 | ✍ Marks all parameters valid, then validates the vehicle parameter without requiring an AI target, flagging it invalid on failure. Returns the result and error text. |
| `AIJobConveyor:getIsStartable(connection: any)` | 119 | ✍ Server-side check before starting: refuses if the AI limit is reached, the vehicle is gone, the player lacks the `hireAssistant` permission, or the vehicle is in use. Returns true plus `AIJob.START_SUCCESS`, else false plus a `AIJobConveyor.START_ERROR_*` state. |
| `AIJobConveyor.getIsStartErrorText(state: any)` | 142 | ✍ Maps a start state returned by `getIsStartable` to a localized text: limit reached, vehicle deleted, no permission, vehicle in use, otherwise the success text. The `AIJobConveyor.START_ERROR_*` constants are not defined in this file (UNVERIFIED). |
