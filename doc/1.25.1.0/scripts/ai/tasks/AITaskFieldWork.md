# ai/tasks/AITaskFieldWork.lua

*[Version française](../../../fr/scripts/ai/tasks/AITaskFieldWork.md)*

Source: `dataS/scripts/ai/tasks/AITaskFieldWork.lua` — FS25 1.25.1.0

✍ AI task that runs the vehicle's field worker for the duration of the task. It calls startFieldWorker when started and stopFieldWorker when stopped, and expects the vehicle to provide both. The actual work (steering, tool control) is implemented in the vehicle, not here.

- **AITaskFieldWork** inherits from `AITask` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AITaskFieldWork.new(isServer: any, job: any, customMt: any)` | 16 | ✍ Creates the task with no vehicle assigned. |
| `AITaskFieldWork:reset()` | 26 | ✍ Clears the vehicle reference, then runs the parent reset. |
| `AITaskFieldWork:update(dt: any)` | 33 | ✍ Empty per-frame override; nothing happens here. |
| `AITaskFieldWork:setVehicle(vehicle: any)` | 38 | ✍ Sets the vehicle whose field worker is started and stopped. |
| `AITaskFieldWork:start()` | 44 | ✍ Calls startFieldWorker on the vehicle, or logs a developer error if no vehicle is set, then runs the parent start. |
| `AITaskFieldWork:stop(wasJobStopped: any)` | 56 | ✍ Runs the parent stop, then calls stopFieldWorker on the vehicle, or logs a developer error if no vehicle is set. |
