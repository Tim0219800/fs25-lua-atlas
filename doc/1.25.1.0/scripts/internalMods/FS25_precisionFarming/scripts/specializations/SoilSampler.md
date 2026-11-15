# internalMods/FS25_precisionFarming/scripts/specializations/SoilSampler.lua

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/specializations/SoilSampler.lua` — FS25 1.25.1.0

- **SoilSampler** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `SoilSampler.prerequisitesPresent(specializations: table) → boolean` | 22 |  |
| `SoilSampler.initSpecialization()` | 28 |  |
| `SoilSampler:onLoad(savegame: any)` | 88 |  |
| `SoilSampler:onPostLoad(savegame: any)` | 154 |  |
| `SoilSampler:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 164 |  |
| `SoilSampler:onReadStream(streamId: integer, connection: Connection)` | 173 |  |
| `SoilSampler:onWriteStream(streamId: integer, connection: Connection)` | 184 |  |
| `SoilSampler:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 194 |  |
| `SoilSampler:onFoldStateChanged(direction: any, moveToMiddle: any)` | 230 |  |
| `SoilSampler:onLeaveRootVehicle()` | 239 |  |
| `SoilSampler:onPreDetach()` | 250 |  |
| `SoilSampler:startSoilSampling(noEventSend: any)` | 261 |  |
| `SoilSampler:setNumCollectedSoilSamples(num: any, updateVisuals: any)` | 320 |  |
| `SoilSampler:getNormalizedSampleIndex()` | 337 |  |
| `SoilSampler:getCanStartSoilSampling()` | 353 |  |
| `SoilSampler:processSoilSampling()` | 394 |  |
| `SoilSampler:sendTakenSoilSamples(noEventSend: any)` | 407 |  |
| `SoilSampler:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 432 |  |
| `SoilSampler.updateActionEventState(self: any)` | 456 |  |
| `SoilSampler.actionEventStartSample(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 466 |  |
| `SoilSampler.actionEventSendSamples(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 477 |  |
| `SoilSampler.onSendSoilSamplesDialog(self: any)` | 486 |  |
| `SoilSampler:doCheckSpeedLimit(superFunc: any) → boolean` | 497 |  |
| `SoilSampler:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 503 |  |
