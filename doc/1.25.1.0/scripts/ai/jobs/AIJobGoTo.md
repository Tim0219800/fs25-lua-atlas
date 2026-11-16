# ai/jobs/AIJobGoTo.lua

*[Version française](../../../fr/scripts/ai/jobs/AIJobGoTo.md)*

Source: `dataS/scripts/ai/jobs/AIJobGoTo.lua` — FS25 1.25.1.0

✍ Simplest driving job: the AI drives a vehicle to a chosen position and heading with one `AITaskDriveTo`. Parameters are the vehicle and a position/angle without angle snapping.

- **AIJobGoTo** inherits from `AIJob` (l.18)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIJobGoTo.new(isServer: any, customMt: any)` | 22 | ✍ Creates the drive-to task, the vehicle and position-angle parameters and their groups. |
| `AIJobGoTo:start(farmId: any)` | 48 | ✍ Base start, then for a non-nil vehicle creates the agent on the server and calls `vehicle:aiJobStarted` (on server and client alike). |
| `AIJobGoTo:stop(aiMessage: any)` | 62 | ✍ For a non-nil vehicle deletes the agent on the server and calls `vehicle:aiJobFinished`, then runs the base stop. |
| `AIJobGoTo:getTarget()` | 81 | ✍ Returns the drive task's target x, z and the heading angle from its direction (nil if no direction is set). |
| `AIJobGoTo:getIsAvailableForVehicle(vehicle: any)` | 92 | ✍ Requires `createAgent`, `setAITarget`, AI start capability and support for this job class. |
| `AIJobGoTo:getTitle()` | 106 | ✍ Returns the vehicle name from the vehicle parameter, or an empty string when there is no vehicle. |
| `AIJobGoTo:applyCurrentState(vehicle: any, mission: any, farmId: any, isDirectStart: any)` | 117 | ✍ Takes the position and angle from the vehicle's last go-to job (unless direct start), else from the vehicle's pose, with angle snapping disabled. |
| `AIJobGoTo:setValues()` | 147 | ✍ Resets tasks and feeds the vehicle plus the parameter's position and direction into the drive task. |
| `AIJobGoTo:validate(farmId: any)` | 161 | ✍ Validates vehicle and position parameters, flagging each invalid one; returns the result and the first error text. |
| `AIJobGoTo:getDescription()` | 182 | ✍ Appends the localized "drive to target" text to the base description while the drive task is current. |
| `AIJobGoTo:getIsStartable(connection: any)` | 195 | ✍ Server-side check before starting: refuses if the AI limit is reached, the vehicle is gone, the player lacks the `hireAssistant` permission, or the vehicle is in use. Returns true plus `AIJob.START_SUCCESS`, else false plus a `AIJobGoTo.START_ERROR_*` state. |
| `AIJobGoTo.getIsStartErrorText(state: any)` | 218 | ✍ Maps a start state returned by `getIsStartable` to a localized text: limit reached, vehicle deleted, no permission, vehicle in use, otherwise the success text. The `AIJobGoTo.START_ERROR_*` constants are not defined in this file (UNVERIFIED). |
