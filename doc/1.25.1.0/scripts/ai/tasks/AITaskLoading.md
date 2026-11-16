# ai/tasks/AITaskLoading.lua

*[Version française](../../../fr/scripts/ai/tasks/AITaskLoading.md)*

Source: `dataS/scripts/ai/tasks/AITaskLoading.lua` — FS25 1.25.1.0

✍ AI task that drives a vehicle to a load trigger and starts loading a chosen fill type into a fill unit of a load vehicle. Positioning is server-only and uses the trigger's AI target position and direction shifted by an offset. Loading is delegated to the load vehicle (aiPrepareLoading, aiStartLoadingFromTrigger, aiFinishLoading), which later calls finishedLoading.

- **AITaskLoading** inherits from `AITask` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `AITaskLoading.new(isServer: any, job: any, customMt: any)` | 19 | ✍ Creates the task with no vehicle, trigger, fill type or fill unit, a zero offset and a max speed of 5. Speed unit UNVERIFIED. |
| `AITaskLoading:reset()` | 35 | ✍ Clears the vehicle, load trigger, load vehicle and fill type, then runs the parent reset. The offset and fill unit index are not cleared. |
| `AITaskLoading:setVehicle(vehicle: any)` | 45 | ✍ Sets the vehicle that is driven to the load trigger. |
| `AITaskLoading:setLoadTrigger(loadTrigger: any)` | 51 | ✍ Sets the load trigger to drive to. It must provide getAITargetPositionAndDirection. |
| `AITaskLoading:setFillType(fillType: any)` | 57 | ✍ Sets the fill type to load. |
| `AITaskLoading:setFillUnit(vehicle: any, fillUnitIndex: any, offsetZ: any)` | 63 | ✍ Sets the load vehicle, the index of its fill unit to fill and the Z offset applied to the trigger target position. |
| `AITaskLoading:start()` | 71 | ✍ On the server, computes the trigger target shifted back by the offset, reads terrain height and sets an AI target on the vehicle. Always runs the parent start. |
| `AITaskLoading:finishedLoading()` | 98 | ✍ Called when loading is done: tells the load vehicle via aiFinishLoading, then marks the task finished. |
| `AITaskLoading:onTargetReached()` | 109 | ✍ On arrival, clears the AI target, enters the loading state, prepares the load vehicle and starts loading the fill type from the trigger. |
| `AITaskLoading:onError(errorMessage: any)` | 121 | ✍ Empty callback for AI errors; nothing is done with the message. |
