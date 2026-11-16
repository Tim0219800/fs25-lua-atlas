# ai/tasks/AITaskDriveTo.lua

*[Version française](../../../fr/scripts/ai/tasks/AITaskDriveTo.md)*

Source: `dataS/scripts/ai/tasks/AITaskDriveTo.lua` — FS25 1.25.1.0

✍ AI task that drives a vehicle to a ground position with a target heading, optionally via an offset position placed behind the target along that heading. On the server, it first waits for the vehicle to be ready (with a timeout) and then sets AI targets. The task finishes when the final position is reached.

- **AITaskDriveTo** inherits from `AITask` (l.18)

## Functions

| Function | Line | Description |
|---|---|---|
| `AITaskDriveTo.new(isServer: any, job: any, customMt: any)` | 22 | ✍ Creates the task with no target or vehicle, initial state drive-to-offset, max speed 10, zero offset and zero prepare timeout. Speed unit UNVERIFIED. |
| `AITaskDriveTo:reset()` | 41 | ✍ Clears the vehicle, target position and direction, restores the initial state, speed and offset, then runs the parent reset. |
| `AITaskDriveTo:setVehicle(vehicle: any)` | 53 | ✍ Sets the vehicle to drive. |
| `AITaskDriveTo:setTargetOffset(offset: any)` | 59 | ✍ Sets the distance behind the target, along the target direction, of an intermediate waypoint. Zero means drive straight to the target. |
| `AITaskDriveTo:setTargetPosition(x: any, z: any)` | 65 | ✍ Stores the target x and z. Note: the branch meant to update a running target is empty, and it reads self.isActive, so a change after start has no effect. |
| `AITaskDriveTo:setTargetDirection(dirX: any, dirZ: any)` | 77 | ✍ Stores the target direction (dirX, dirZ). The update-while-active branch is empty, so a change after start has no effect. |
| `AITaskDriveTo:update(dt: any)` | 88 | ✍ Server only, in the prepare state: asks the vehicle if it is ready and starts driving when so. If not ready and not preparing, it accumulates time and stops the AI job with a could-not-prepare error after PREPARE_TIMEOUT. |
| `AITaskDriveTo:start()` | 108 | ✍ On the server, switches to the prepare state, asks the vehicle to prepare for AI driving and flags the task active. Always runs the parent start. |
| `AITaskDriveTo:stop(wasJobStopped: any)` | 123 | ✍ Runs the parent stop, then on the server clears the vehicle's AI target and flags the task inactive. |
| `AITaskDriveTo:startDriving()` | 135 | ✍ Reads the terrain height and sets the first AI target: the target position, or the offset waypoint when an offset is set (state becomes drive-to-offset, otherwise drive-to-final). |
| `AITaskDriveTo:onTargetReached()` | 155 | ✍ Callback on arrival. From the offset waypoint it sets the final target with the max speed and switches state; from the final position it marks the task finished. |
| `AITaskDriveTo:onError(errorMessage: any)` | 167 | ✍ Empty callback for AI errors; nothing is done with the message. |
