# handTools/specializations/HandToolMotorized.lua

*[Version française](../../../fr/scripts/handTools/specializations/HandToolMotorized.md)*

Source: `dataS/scripts/handTools/specializations/HandToolMotorized.lua` — FS25 1.25.1.0

✍ Hand tool specialization for any tool with a motor (such as the chainsaw): it simulates RPM that rises or falls toward a target at configurable rates, a load value, start/idle/stop sounds, exhaust effects and optional vibration of a node. RPM and load are synchronised in the update stream, and it can combine its vibration with HandToolBob. XML keys are under `handTool.motorized`. Note: `startTime` is read but not used in this file.

- **HandToolMotorized** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandToolMotorized.registerXMLPaths(xmlSchema: any)` | 16 | ✍ Registers the motor attributes (min/max RPM, gain and loss speed, variability), vibration node and amount, the start/stop/idle sounds and the exhaust effects. |
| `HandToolMotorized.registerFunctions(handToolType: any)` | 42 | ✍ Registers the RPM, load, target RPM, sound and vibration functions on the hand tool type. |
| `HandToolMotorized.registerOverwrittenFunctions(handToolType: any)` | 67 | ✍ Overrides `updateBobNode` so vibration can be applied on top of the bob (see HandToolBob). |
| `HandToolMotorized.registerEventListeners(handToolType: any)` | 73 | ✍ Subscribes to load, post-load, delete, update, update stream read/write, held start/end and debug draw. |
| `HandToolMotorized.prerequisitesPresent(specializations: any)` | 87 | ✍ Always returns true: no prerequisite. |
| `HandToolMotorized:onLoad(xmlFile: any, baseDirectory: any)` | 93 | ✍ Reads min RPM (default 10), max RPM (default 100), gain/loss speeds (default max minus min per second), variability and vibration settings. Starts at min RPM with zero load. On clients loads sounds and exhaust effects; sound keys use the base path `sounds.motorized.sounds`, which differs from the registered `handTool.motorized.sounds` (UNVERIFIED which one is intended). |
| `HandToolMotorized:onPostLoad(savegame: any)` | 130 | ✍ Detects whether a bob node of HandToolBob is the same node as the vibration node, and records it so `updateVibrations` can skip it. |
| `HandToolMotorized:onDelete()` | 149 | ✍ On clients frees the samples and tries to delete `fillEffects`, which this file never sets; the exhaust effects are not deleted here. Note: likely a leftover name. |
| `HandToolMotorized:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 159 | ✍ Writes, when the dirty flag is set, the RPM as a fraction between min and max and the load, each compressed to 8 bits. |
| `HandToolMotorized:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 169 | ✍ Reads RPM and load. Applies them on the server, or on a client when the player carrying the tool is not the owner. |
| `HandToolMotorized:onHeldStart()` | 185 | ✍ On clients, plays the start sound followed by the idle loop (if idle is not already playing), stops the stop sound and starts exhaust effects. |
| `HandToolMotorized:onHeldEnd()` | 200 | ✍ On clients, stops start and idle sounds, plays the stop sound and stops exhaust effects. |
| `HandToolMotorized:onUpdate(dt: any)` | 213 | ✍ Updates RPM every frame, and on clients also updates sound parameters and vibrations. |
| `HandToolMotorized:updateRPM(dt: any)` | 224 | ✍ Moves current RPM toward the target at the gain or loss rate per second. With variability set, the target is lowered by a time-based pseudo-random offset that grows with load. |
| `HandToolMotorized:updateSounds(dt: any)` | 249 | ✍ Feeds the idle loop synthesis sound with the RPM fraction and the current load. |
| `HandToolMotorized:updateVibrations(dt: any)` | 257 | ✍ Sets the vibration node translation to a random offset, unless the bob specialization drives that same node. |
| `HandToolMotorized:getVibrationOffset() → number, number, number` | 278 | ✍ Returns a random X, Y, Z offset in metres within the configured amount, scaled by low RPM (strongest at idle) and reduced by load. |
| `HandToolMotorized:updateBobNode(superFunc: function, bobNode: table, dt: number, isActive: boolean, speed: number)` | 300 | ✍ Overwritten function: calls the original, then, on clients, adds the vibration to the bob node if it is the vibration node. |
| `HandToolMotorized:getTimeToReachRPM(rpm: number) → number` | 318 | ✍ Returns seconds needed to reach the given RPM from the current one, using the gain rate going up and the loss rate going down; 0 if equal. |
| `HandToolMotorized:getRPMGainPerSecond()` | 338 | ✍ Returns the RPM gain rate per second. |
| `HandToolMotorized:setRPMGainPerSecond(rpmGainPerSecond: any)` | 344 | ✍ Sets the RPM gain rate per second. |
| `HandToolMotorized:getRPMLossPerSecond()` | 350 | ✍ Returns the RPM loss rate per second. |
| `HandToolMotorized:setRPMLossPerSecond(rpmLossPerSecond: any)` | 356 | ✍ Sets the RPM loss rate per second. |
| `HandToolMotorized:getCurrentLoad()` | 362 | ✍ Returns the current load, 0 to 1. |
| `HandToolMotorized:setCurrentLoad(currentLoad: any)` | 368 | ✍ Clamps load to 0..1 and stores it. If it changed by more than 0.01, flags a network update (server, or owning player). |
| `HandToolMotorized:getCurrentRPM()` | 384 | ✍ Returns the current RPM. |
| `HandToolMotorized:setCurrentRPM(currentRPM: any)` | 390 | ✍ Clamps RPM between min and max and stores it. If it changed by more than 1, flags a network update (server, or owning player). |
| `HandToolMotorized:getTargetRPM()` | 407 | ✍ Returns the target RPM. |
| `HandToolMotorized:getMaxRPM()` | 413 | ✍ Returns the maximum RPM. |
| `HandToolMotorized:getMinRPM()` | 419 | ✍ Returns the minimum (idle) RPM. |
| `HandToolMotorized:setTargetRPM(targetRPM: any)` | 425 | ✍ Sets the target RPM, clamped between min and max. |
| `HandToolMotorized:setTargetRPMToIdle()` | 433 | ✍ Sets the target RPM to the minimum. |
| `HandToolMotorized:setTargetRPMToMax()` | 439 | ✍ Sets the target RPM to the maximum. |
| `HandToolMotorized:onDebugDraw(x: any, y: any, textSize: any)` | 445 | ✍ Adds debug lines for current RPM, target RPM, load and vibration percentage; returns the updated y position. |

## Specialization

| Type | Name | Line |
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
