# ai/jobs/AIJobDeliver.lua

Source: `dataS/scripts/ai/jobs/AIJobDeliver.lua` — FS25 1.25.1.0

- **AIJobDeliver** inherits from `AIJob` (l.18)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AIJobDeliver.new(isServer: any, customMt: any)` | 22 |  |
| `AIJobDeliver:setValues()` | 69 |  |
| `AIJobDeliver:validate(farmId: any)` | 139 |  |
| `AIJobDeliver:applyCurrentState(vehicle: any, mission: any, farmId: any, isDirectStart: any)` | 172 |  |
| `AIJobDeliver:start(farmId: any)` | 216 |  |
| `AIJobDeliver:stop(aiMessage: any)` | 229 |  |
| `AIJobDeliver:startTask(task: any)` | 244 |  |
| `AIJobDeliver:getStartTaskIndex()` | 257 |  |
| `AIJobDeliver:getNextTaskIndex(isSkipTask: any)` | 292 |  |
| `AIJobDeliver:canContinueWork()` | 349 |  |
| `AIJobDeliver:getHasLoadedValidFillType()` | 386 |  |
| `AIJobDeliver:getCanSkipTask()` | 405 |  |
| `AIJobDeliver:skipCurrentTask()` | 417 |  |
| `AIJobDeliver:getIsAvailableForVehicle(vehicle: any)` | 425 |  |
| `AIJobDeliver:getTitle()` | 456 |  |
| `AIJobDeliver:getIsLooping()` | 467 |  |
| `AIJobDeliver:getIsStartable(connection: any)` | 473 |  |
| `AIJobDeliver:getDescription()` | 496 |  |
| `AIJobDeliver.getIsStartErrorText(state: any)` | 515 |  |
