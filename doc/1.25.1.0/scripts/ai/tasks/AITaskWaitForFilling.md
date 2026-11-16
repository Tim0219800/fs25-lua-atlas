# ai/tasks/AITaskWaitForFilling.lua

*[Version française](../../../fr/scripts/ai/tasks/AITaskWaitForFilling.md)*

Source: `dataS/scripts/ai/tasks/AITaskWaitForFilling.lua` — FS25 1.25.1.0

✍ AI task that waits on the server until a set of fill units is full, then waits a short extra delay (3 seconds) before finishing. If a unit holds a non-allowed fill type, the job is stopped with a no-valid-fill-type error. It prepares and releases loading on each unit via aiPrepareLoading and aiFinishLoading.

- **AITaskWaitForFilling** inherits from `AITask` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AITaskWaitForFilling.new(isServer: any, job: any, customMt: any)` | 16 | ✍ Creates the task with empty allowed fill types and fill unit list, a wait duration of 3000 ms and the not-fully-loaded state. |
| `AITaskWaitForFilling:reset()` | 31 | ✍ Clears the vehicle, allowed fill types, fill units and wait state, then runs the parent reset. |
| `AITaskWaitForFilling:addAllowedFillType(fillType: any)` | 42 | ✍ Adds a fill type to the set of types considered valid in the watched units. |
| `AITaskWaitForFilling:update(dt: any)` | 48 | ✍ Server only. A unit is valid if empty or holding an allowed type; if none is valid, the job stops with an error. Once every unit has no free capacity, it waits waitDuration (g_time based) and then finishes. |
| `AITaskWaitForFilling:start()` | 88 | ✍ Runs the parent start; on the server resets the fully-loaded flag and calls aiPrepareLoading on every registered fill unit. |
| `AITaskWaitForFilling:stop(wasJobStopped: any)` | 101 | ✍ Runs the parent stop; on the server calls aiFinishLoading on every registered fill unit. |
| `AITaskWaitForFilling:setVehicle(vehicle: any)` | 113 | ✍ Stores the vehicle reference. It is not used by the update logic, which relies on the registered fill units. |
| `AITaskWaitForFilling:addFillUnits(vehicle: any, fillUnitIndex: any)` | 119 | ✍ Registers a vehicle and fill unit index to be watched. Despite the plural name it adds a single unit per call. |
