# ai/tasks/AITaskDischarge.lua

*[Version française](../../../fr/scripts/ai/tasks/AITaskDischarge.md)*

Source: `dataS/scripts/ai/tasks/AITaskDischarge.lua` — FS25 1.25.1.0

✍ AI task that drives a vehicle to an unload trigger and then makes a discharge vehicle unload there. Positioning is server-only: the target comes from the trigger's AI target position and direction, shifted by an offset. If the discharge cannot start, the job is stopped with an unloading-station-full error message.

- **AITaskDischarge** inherits from `AITask` (l.15)

## Functions

| Function | Line | Description |
|---|---|---|
| `AITaskDischarge.new(isServer: any, job: any, customMt: any)` | 19 | ✍ Creates the task with no vehicle or trigger, a zero offset, a max speed of 5 and the driving state. The speed unit is UNVERIFIED (set by the AI target call). |
| `AITaskDischarge:reset()` | 35 | ✍ Clears the vehicle, trigger, discharge vehicle and node, resets the offset and driving state, then runs the parent reset. |
| `AITaskDischarge:setVehicle(vehicle: any)` | 47 | ✍ Sets the vehicle that is driven to the unload trigger. |
| `AITaskDischarge:setUnloadTrigger(unloadTrigger: any)` | 53 | ✍ Sets the unload trigger the vehicle drives to. It must provide getAITargetPositionAndDirection. |
| `AITaskDischarge:setDischargeNode(vehicle: any, dischargeNode: any, offsetZ: any)` | 59 | ✍ Stores the discharge node and its vehicle. If a vehicle is given, it also stores the Z offset and selects the node index as the vehicle's current discharge node. |
| `AITaskDischarge:start()` | 71 | ✍ On the server, computes the trigger target shifted back by the offset, reads the terrain height and sets an AI target on the vehicle, then enters the driving state. Always runs the parent start. |
| `AITaskDischarge:onTargetReached()` | 87 | ✍ Callback when the vehicle arrives: clears the AI target and, if the discharge vehicle allows an AI discharge, starts it. Otherwise it stops the job with an unloading-station-full error. |
| `AITaskDischarge:onError(errorMessage: any)` | 100 | ✍ Empty callback for AI errors; nothing is done with the message. |
| `AITaskDischarge:finishedDischarge()` | 105 | ✍ Called by the discharging vehicle when it is done; marks the task as finished. |
