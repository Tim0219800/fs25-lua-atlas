# ai/jobs/AIJob.lua

Source: `dataS/scripts/ai/jobs/AIJob.lua` — FS25 1.25.1.0

- **AIJob** (l.18)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AIJob.new(isServer: any, customMt: any)` | 22 |  |
| `AIJob:delete()` | 41 |  |
| `AIJob:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 52 |  |
| `AIJob:loadFromXMLFile(xmlFile: any, key: any)` | 69 |  |
| `AIJob:readStream(streamId: any, connection: any)` | 83 |  |
| `AIJob:writeStream(streamId: any, connection: any)` | 101 |  |
| `AIJob:update(dt: any)` | 117 |  |
| `AIJob:updateCost(dt: any)` | 168 |  |
| `AIJob:canContinueWork()` | 191 |  |
| `AIJob:canStartWork()` | 197 |  |
| `AIJob:getPricePerMs()` | 203 |  |
| `AIJob:getNextTaskIndex()` | 209 |  |
| `AIJob:validate(farmId: any)` | 215 |  |
| `AIJob:getIsLooping()` | 221 |  |
| `AIJob:setValues()` | 227 |  |
| `AIJob:startTask(task: any)` | 232 |  |
| `AIJob:stopTask(task: any, wasJobStopped: any)` | 243 |  |
| `AIJob:start(farmId: any)` | 253 |  |
| `AIJob:getCanSkipTask()` | 266 |  |
| `AIJob:skipCurrentTask()` | 272 |  |
| `AIJob:stop(aiMessage: any)` | 277 |  |
| `AIJob:addTask(task: any)` | 298 |  |
| `AIJob:resetTasks()` | 306 |  |
| `AIJob:getTaskByIndex(taskIndex: any)` | 314 |  |
| `AIJob:getTitle()` | 320 |  |
| `AIJob:getDescription()` | 327 |  |
| `AIJob:getHelperName()` | 334 |  |
| `AIJob:showNotification(aiMessage: any)` | 341 |  |
| `AIJob:getStartTaskIndex()` | 369 |  |
| `AIJob:addNamedParameter(name: any, parameter: any)` | 375 |  |
| `AIJob:setParameterValid(isValid: any)` | 381 |  |
| `AIJob:getNamedParameters()` | 389 |  |
| `AIJob:getNamedParameter(name: any)` | 395 |  |
| `AIJob:getGroupedParameters()` | 412 |  |
| `AIJob:applyCurrentState(vehicle: any, mission: any, farmId: any, isDirectStart: any)` | 418 |  |
| `AIJob:getIsAvailableForVehicle(vehicle: any)` | 424 |  |
| `AIJob:setId(id: any)` | 430 |  |
| `AIJob:onParameterValueChanged(parameter: any)` | 436 |  |
| `AIJob:getIsStartable(connection: any)` | 441 |  |
