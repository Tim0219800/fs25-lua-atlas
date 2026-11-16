# ai/jobs/AIJobFieldWork.lua

*[Version française](../../../fr/scripts/ai/jobs/AIJobFieldWork.md)*

Source: `dataS/scripts/ai/jobs/AIJobFieldWork.lua` — FS25 1.25.1.0

✍ Job in which an AI driver goes to a start position and then works a field with the attached tools: an `AITaskDriveTo` followed by an `AITaskFieldWork`. Parameters are the vehicle and a position/angle. Settings of the AI mode are streamed along with the job, and the vehicle is notified of start and stop (agent creation on the server).

- **AIJobFieldWork** inherits from `AIJob` (l.18)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIJobFieldWork.new(isServer: any, customMt: any)` | 22 | ✍ Creates the drive-to and field-work tasks, the vehicle and position-angle (no snapping) parameters and their groups. |
| `AIJobFieldWork:readStream(streamId: any, connection: any)` | 53 | ✍ Base read, then if a flag is set reads the AI mode settings via `AIModeSelection.readAIModeSettingsFromStream` into `pendingData` and sets `pendingVehicle`, to be applied once the vehicle is available. |
| `AIJobFieldWork:writeStream(streamId: any, connection: any)` | 64 | ✍ Base write, then a flag telling whether a vehicle exists and, if so, the vehicle's AI mode settings through `writeAIModeSettingsToStream`. |
| `AIJobFieldWork:getStartTaskIndex()` | 90 | ✍ Returns 2 (field work) for a direct start or when the vehicle is within 3 m of the target position, otherwise 1 (drive first). |
| `AIJobFieldWork:start(farmId: any)` | 109 | ✍ Base start, then on the server creates the agent and calls `vehicle:aiJobStarted`. |
| `AIJobFieldWork:stop(aiMessage: any)` | 122 | ✍ On the server deletes the agent and calls `vehicle:aiJobFinished`, then runs the base stop. |
| `AIJobFieldWork:applyCurrentState(vehicle: any, mission: any, farmId: any, isDirectStart: any)` | 134 | ✍ Takes position and angle from the last field-work job of the vehicle (unless direct start), else from the vehicle's pose, and sets the angle snapping to the larger of the vehicle's direction snap angle and a terrain-based angle of at least 45 degrees. |
| `AIJobFieldWork:getIsAvailableForVehicle(vehicle: any)` | 167 | ✍ True when the vehicle can start field work (`getCanStartFieldWork`) and lists this job class as supported. |
| `AIJobFieldWork:getTarget()` | 177 | ✍ Returns the drive task's target x, z and the heading angle derived from its direction (0 if none). |
| `AIJobFieldWork:getTitle()` | 188 | ✍ Returns the vehicle name from the vehicle parameter, or an empty string when there is no vehicle. |
| `AIJobFieldWork:setValues()` | 199 | ✍ Resets tasks, sets the vehicle on both tasks and turns the position-angle parameter into the drive task's target position and direction. |
| `AIJobFieldWork:validate(farmId: any)` | 215 | ✍ Marks parameters valid, then validates the vehicle parameter and flags it invalid on failure. Returns the result and error text. |
| `AIJobFieldWork:getDescription()` | 228 | ✍ Appends to the base description a localized text for the current task: driving to the field or field work. |
| `AIJobFieldWork:getIsStartable(connection: any)` | 243 | ✍ Server-side check before starting: refuses if the AI limit is reached, the vehicle is gone, the player lacks the `hireAssistant` permission, or the vehicle is in use. Returns true plus `AIJob.START_SUCCESS`, else false plus a `AIJobFieldWork.START_ERROR_*` state. |
| `AIJobFieldWork.getIsStartErrorText(state: any)` | 266 | ✍ Maps a start state returned by `getIsStartable` to a localized text: limit reached, vehicle deleted, no permission, vehicle in use, otherwise the success text. The `AIJobFieldWork.START_ERROR_*` constants are not defined in this file (UNVERIFIED). |
| `AIJobFieldWork:getPricePerMs()` | 282 | ✍ Returns 0.0005 per millisecond. |
