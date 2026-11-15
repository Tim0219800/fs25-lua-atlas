# ai/jobs/AIJobLoadAndDeliver.lua

Source : `dataS/scripts/ai/jobs/AIJobLoadAndDeliver.lua` — FS25 1.25.1.0

- **AIJobLoadAndDeliver** hérite de `AIJob` (l.18)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIJobLoadAndDeliver.new(isServer: any, customMt: any)` | 22 |  |
| `AIJobLoadAndDeliver:setValues()` | 73 |  |
| `AIJobLoadAndDeliver:validate(farmId: any)` | 175 |  |
| `AIJobLoadAndDeliver:applyCurrentState(vehicle: any, mission: any, farmId: any, isDirectStart: any)` | 217 |  |
| `AIJobLoadAndDeliver:updateFillTypes(loadingStation: any)` | 262 |  |
| `AIJobLoadAndDeliver:onParameterValueChanged(parameter: any)` | 276 |  |
| `AIJobLoadAndDeliver:start(farmId: any)` | 285 |  |
| `AIJobLoadAndDeliver:stop(aiMessage: any)` | 298 |  |
| `AIJobLoadAndDeliver:startTask(task: any)` | 314 |  |
| `AIJobLoadAndDeliver:getStartTaskIndex()` | 332 |  |
| `AIJobLoadAndDeliver:canContinueWork()` | 377 |  |
| `AIJobLoadAndDeliver:getNextTaskIndex(isSkipTask: any)` | 421 |  |
| `AIJobLoadAndDeliver:getIsAvailableForVehicle(vehicle: any)` | 464 |  |
| `AIJobLoadAndDeliver:getTitle()` | 538 |  |
| `AIJobLoadAndDeliver:getDescription()` | 549 |  |
| `AIJobLoadAndDeliver:getIsLooping()` | 568 |  |
| `AIJobLoadAndDeliver:getIsStartable(connection: any)` | 574 |  |
| `AIJobLoadAndDeliver.getIsStartErrorText(state: any)` | 597 |  |
