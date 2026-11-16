# ai/tasks/AITaskConveyor.lua

*[Version française](../../../fr/scripts/ai/tasks/AITaskConveyor.md)*

Source: `dataS/scripts/ai/tasks/AITaskConveyor.lua` — FS25 1.25.1.0

✍ AI task that switches a vehicle's field worker on while the task runs and off when it stops. It is used for conveyor-style work and is the same start and stop pattern as AITaskFieldWork. It extends AITask and relies on the vehicle providing startFieldWorker and stopFieldWorker.

- **AITaskConveyor** inherits from `AITask` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AITaskConveyor.new(isServer: any, job: any, customMt: any)` | 16 | ✍ Creates the task with no vehicle assigned. |
| `AITaskConveyor:reset()` | 26 | ✍ Clears the vehicle reference, then runs the parent reset. |
| `AITaskConveyor:setVehicle(vehicle: any)` | 33 | ✍ Sets the vehicle on which the field worker is started and stopped. |
| `AITaskConveyor:start()` | 39 | ✍ Calls startFieldWorker on the vehicle, or logs a developer error if no vehicle is set, then runs the parent start. |
| `AITaskConveyor:stop(wasJobStopped: any)` | 51 | ✍ Runs the parent stop, then calls stopFieldWorker on the vehicle, or logs a developer error if no vehicle is set. |
