# handTools/specializations/HandToolMotorized.lua

Source : `dataS/scripts/handTools/specializations/HandToolMotorized.lua` — FS25 1.25.1.0

- **HandToolMotorized** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `HandToolMotorized.registerXMLPaths(xmlSchema: any)` | 16 |  |
| `HandToolMotorized.registerFunctions(handToolType: any)` | 42 |  |
| `HandToolMotorized.registerOverwrittenFunctions(handToolType: any)` | 67 |  |
| `HandToolMotorized.registerEventListeners(handToolType: any)` | 73 |  |
| `HandToolMotorized.prerequisitesPresent(specializations: any)` | 87 |  |
| `HandToolMotorized:onLoad(xmlFile: any, baseDirectory: any)` | 93 |  |
| `HandToolMotorized:onPostLoad(savegame: any)` | 130 |  |
| `HandToolMotorized:onDelete()` | 149 |  |
| `HandToolMotorized:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 159 |  |
| `HandToolMotorized:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 169 |  |
| `HandToolMotorized:onHeldStart()` | 185 |  |
| `HandToolMotorized:onHeldEnd()` | 200 |  |
| `HandToolMotorized:onUpdate(dt: any)` | 213 |  |
| `HandToolMotorized:updateRPM(dt: any)` | 224 |  |
| `HandToolMotorized:updateSounds(dt: any)` | 249 |  |
| `HandToolMotorized:updateVibrations(dt: any)` | 257 |  |
| `HandToolMotorized:getVibrationOffset() → number, number, number` | 278 |  |
| `HandToolMotorized:updateBobNode(superFunc: function, bobNode: table, dt: number, isActive: boolean, speed: number)` | 300 |  |
| `HandToolMotorized:getTimeToReachRPM(rpm: number) → number` | 318 |  |
| `HandToolMotorized:getRPMGainPerSecond()` | 338 |  |
| `HandToolMotorized:setRPMGainPerSecond(rpmGainPerSecond: any)` | 344 |  |
| `HandToolMotorized:getRPMLossPerSecond()` | 350 |  |
| `HandToolMotorized:setRPMLossPerSecond(rpmLossPerSecond: any)` | 356 |  |
| `HandToolMotorized:getCurrentLoad()` | 362 |  |
| `HandToolMotorized:setCurrentLoad(currentLoad: any)` | 368 |  |
| `HandToolMotorized:getCurrentRPM()` | 384 |  |
| `HandToolMotorized:setCurrentRPM(currentRPM: any)` | 390 |  |
| `HandToolMotorized:getTargetRPM()` | 407 |  |
| `HandToolMotorized:getMaxRPM()` | 413 |  |
| `HandToolMotorized:getMinRPM()` | 419 |  |
| `HandToolMotorized:setTargetRPM(targetRPM: any)` | 425 |  |
| `HandToolMotorized:setTargetRPMToIdle()` | 433 |  |
| `HandToolMotorized:setTargetRPMToMax()` | 439 |  |
| `HandToolMotorized:onDebugDraw(x: any, y: any, textSize: any)` | 445 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `getTimeToReachRPM` | 43 |
| registerFunction | `getRPMGainPerSecond` | 44 |
| registerFunction | `setRPMGainPerSecond` | 45 |
| registerFunction | `getRPMLossPerSecond` | 46 |
| registerFunction | `setRPMLossPerSecond` | 47 |
| registerFunction | `getCurrentLoad` | 48 |
| registerFunction | `setCurrentLoad` | 49 |
| registerFunction | `getCurrentRPM` | 50 |
| registerFunction | `setCurrentRPM` | 51 |
| registerFunction | `getMinRPM` | 52 |
| registerFunction | `getTargetRPM` | 53 |
| registerFunction | `getMaxRPM` | 54 |
| registerFunction | `setTargetRPM` | 55 |
| registerFunction | `setTargetRPMToIdle` | 56 |
| registerFunction | `setTargetRPMToMax` | 57 |
| registerFunction | `updateRPM` | 59 |
| registerFunction | `updateSounds` | 60 |
| registerFunction | `updateVibrations` | 61 |
| registerFunction | `getVibrationOffset` | 62 |
| registerOverwrittenFunction | `updateBobNode` | 68 |
| registerEventListener | `onDelete` | 74 |
| registerEventListener | `onLoad` | 75 |
| registerEventListener | `onPostLoad` | 76 |
| registerEventListener | `onUpdate` | 77 |
| registerEventListener | `onWriteUpdateStream` | 78 |
| registerEventListener | `onReadUpdateStream` | 79 |
| registerEventListener | `onHeldStart` | 80 |
| registerEventListener | `onHeldEnd` | 81 |
| registerEventListener | `onDebugDraw` | 82 |
