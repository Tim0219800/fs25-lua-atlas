# ai/jobs/AIJobLoadAndDeliver.lua

*[Version française](../../../fr/scripts/ai/jobs/AIJobLoadAndDeliver.md)*

Source: `dataS/scripts/ai/jobs/AIJobLoadAndDeliver.lua` — FS25 1.25.1.0

✍ Job in which an AI driver loads a chosen fill type at a loading station, drives to an unloading station and discharges, optionally looping. Tasks are drive to loading, `AITaskLoading`, drive to unloading and `AITaskDischarge`; parameters are vehicle, loading station, fill type, unloading station and looping. Fill units and discharge nodes of the vehicle and its children are collected and processed one by one.

- **AIJobLoadAndDeliver** inherits from `AIJob` (l.18)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIJobLoadAndDeliver.new(isServer: any, customMt: any)` | 22 | ✍ Creates the four tasks, the five parameters and their UI groups (vehicle, loading station with fill type, unloading station, looping). |
| `AIJobLoadAndDeliver:setValues()` | 73 | ✍ Collects AI fill units and discharge nodes of the vehicle and children sorted by Z offset, sets target offsets, then for the chosen fill type takes positions, directions and triggers from both stations' `getAITargetPositionAndDirection`. Returns early if vehicle or a station is missing. |
| `AIJobLoadAndDeliver:validate(farmId: any)` | 175 | ✍ Validates the vehicle (needs discharge and loading nodes), fill type, loading station and unloading station for the fill type and farm, marking invalid ones. Returns the result and the first error text. |
| `AIJobLoadAndDeliver:applyCurrentState(vehicle: any, mission: any, farmId: any, isDirectStart: any)` | 217 | ✍ Enables looping, reuses stations and looping from the vehicle's last job of this class, then fills the lists of selectable unloading and loading stations (accessible, AI-capable, sorted by name) and updates the fill types. |
| `AIJobLoadAndDeliver:updateFillTypes(loadingStation: any)` | 262 | ✍ Gives the fill type parameter the AI-supported fill types of the loading station with the current fill level of the local player's farm. Uses `g_localPlayer`, so it is client-side. |
| `AIJobLoadAndDeliver:onParameterValueChanged(parameter: any)` | 276 | ✍ When the loading station parameter changes, refreshes the selectable fill types. |
| `AIJobLoadAndDeliver:start(farmId: any)` | 285 | ✍ Base start, then on the server creates the agent and calls `vehicle:aiJobStarted`. |
| `AIJobLoadAndDeliver:stop(aiMessage: any)` | 298 | ✍ On the server deletes the agent and calls `vehicle:aiJobFinished`, runs the base stop, then clears the node info lists. |
| `AIJobLoadAndDeliver:startTask(task: any)` | 314 | ✍ Starting the drive-to-loading task marks all discharge nodes dirty, starting the drive-to-unloading task marks all loading fill units dirty; then runs the base `startTask`. |
| `AIJobLoadAndDeliver:getStartTaskIndex()` | 332 | ✍ Starts by driving to loading if any loading fill unit is empty, otherwise directly with driving to unloading. |
| `AIJobLoadAndDeliver:canContinueWork()` | 377 | ✍ Fails with the matching `AIMessageError*` if vehicle or either station was deleted or the unloading station has no free capacity. During loading, if the station has none of the fill type left and no loaded unit holds it, ends with `AIMessageSuccessSiloEmpty`. |
| `AIJobLoadAndDeliver:getNextTaskIndex(isSkipTask: any)` | 421 | ✍ After driving to loading or loading, picks the next empty dirty fill unit and stays in loading; after driving to unloading or discharging, picks the next dirty discharge node holding the chosen fill type and goes to discharge; otherwise defers to the base index. |
| `AIJobLoadAndDeliver:getIsAvailableForVehicle(vehicle: any)` | 464 | ✍ Requires `createAgent`, `setAITarget`, AI start capability and job support, then AI discharge nodes and AI fill units on the vehicle or its children. Note: it returns true as soon as a child has discharge nodes, before checking for fill units (apparent oversight). |
| `AIJobLoadAndDeliver:getTitle()` | 538 | ✍ Returns the vehicle name from the vehicle parameter, or an empty string when there is no vehicle. |
| `AIJobLoadAndDeliver:getDescription()` | 549 | ✍ Appends to the base description a localized text for the current task: driving to loading, loading, driving to unloading or unloading. |
| `AIJobLoadAndDeliver:getIsLooping()` | 568 | ✍ Returns the value of the looping parameter. |
| `AIJobLoadAndDeliver:getIsStartable(connection: any)` | 574 | ✍ Server-side check before starting: refuses if the AI limit is reached, the vehicle is gone, the player lacks the `hireAssistant` permission, or the vehicle is in use. Returns true plus `AIJob.START_SUCCESS`, else false plus a `AIJobLoadAndDeliver.START_ERROR_*` state. |
| `AIJobLoadAndDeliver.getIsStartErrorText(state: any)` | 597 | ✍ Maps a start state returned by `getIsStartable` to a localized text: limit reached, vehicle deleted, no permission, vehicle in use, otherwise the success text. The `AIJobLoadAndDeliver.START_ERROR_*` constants are not defined in this file (UNVERIFIED). |
