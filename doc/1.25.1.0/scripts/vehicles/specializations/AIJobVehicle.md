# vehicles/specializations/AIJobVehicle.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AIJobVehicle.md)*

Source: `dataS/scripts/vehicles/specializations/AIJobVehicle.lua` — FS25 1.25.1.0

✍ Vehicle specialization that lets a vehicle be driven by an AI helper job. It requires the AIVehicle and Drivable specializations. It stores the current and last job, reads the AI steering and reverser nodes and the supported job types from the vehicle XML, and saves the last job and the start/stop permissions in the savegame. Many of its registered functions (job start/stop, helper lookup, hotspot handling) have their bodies stripped from this SDK dump, so only the parts present are described.

- **AIJobVehicle** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIJobVehicle.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Returns true only if the vehicle type also has the AIVehicle and Drivable specializations. |
| `AIJobVehicle.initSpecialization()` | 25 | ✍ Registers the XML schema keys under vehicle.ai (steering node, reverser node, steering speed, supportsAIJobs, supportedJobTypes) and the savegame keys for start/stop permission and the last job type. |
| `AIJobVehicle.registerEvents(vehicleType: any)` | 44 | ✍ Registers the vehicle events onAIJobStarted, onAIJobFinished, onAIJobVehicleBlock and onAIJobVehicleContinue. |
| `AIJobVehicle.registerFunctions(vehicleType: any)` | 52 | ✍ Registers the specialization's public vehicle functions (toggle, can-start/stop checks, job and helper accessors, AI nodes, block/continue and others). Several of the registered bodies are absent from the dump. |
| `AIJobVehicle.registerOverwrittenFunctions(vehicleType: any)` | 83 | ✍ Overrides a set of base vehicle functions, including getIsActive, getIsAIActive, getFullName, getActiveFarm, map hotspot functions and the leave-related getters. Only some of the overriding bodies are present in the dump. |
| `AIJobVehicle.registerEventListeners(vehicleType: any)` | 100 | ✍ Subscribes the specialization to onLoad, onDelete, onUpdate, onSetBroken, onReadStream, onWriteStream and onAIModeChanged. |
| `AIJobVehicle:onLoad(savegame: table)` | 113 | ✍ Initialises spec state, reads steering speed (scaled by 0.001), nodes, supportsAIJobs and supportedJobTypes from the XML, and caches HUD texts. When loading a savegame it recreates the last job through aiJobTypeManager and restores the start/stop flags. |
| `AIJobVehicle:onReadStream(streamId: integer, connection: Connection)` | 171 | ✍ Client side on join: reads whether a job is running and, if so, its id, farm and helper index, then calls aiJobStarted with the job found by id. Then reads the last job type and rebuilds it from the stream. |
| `AIJobVehicle:onWriteStream(streamId: integer, connection: Connection)` | 198 | ✍ Server side on join: writes the running job id, the starting farm and the helper index when a job exists, then the last job type and its data. Mirror of onReadStream. |
| `AIJobVehicle:onAIModeChanged(aiMode: any)` | 217 | ✍ When the AI mode becomes anything other than AIModeSelection.MODE.WORKER, stops the current job (if any) with a stopped-by-user message. |
| `AIJobVehicle:getShowAIToggleActionEvent() → boolean` | 235 | ✍ Returns whether the AI toggle input should be shown: false without an AI direction node, when AI is disabled, without the hireAssistant permission, or when the AI limit is reached while the AI is inactive. |
| `AIJobVehicle:getIsInUse(superFunc: any, connection: any)` | 372 | ✍ Override: returns true while the AI is active, otherwise defers to the parent implementation. |
| `AIJobVehicle:getIsActive(superFunc: any)` | 382 | ✍ Override: the vehicle counts as active whenever the AI is active, otherwise the parent result is used. |
| `AIJobVehicle:getIsAIActive(superFunc: any)` | 396 | ✍ Override: true if the parent says so or if a job is currently assigned to this vehicle. |
| `AIJobVehicle:toggleAIVehicle()` | 429 | ✍ If the AI runs, stops the job as if the user did it. Otherwise sends an AIJobStartRequestEvent to the server for a startable job, or opens the in-game menu AI screen (mobile has its own path), unless a guided tour is running. |
| `AIJobVehicle:getCanToggleAIVehicle() → boolean` | 468 | ✍ Returns getCanStopAIVehicle when the AI is active, else getCanStartAIVehicle. The stop-check body is not in the dump (UNVERIFIED). |
| `AIJobVehicle:getCanStartAIVehicle() → boolean` | 488 | ✍ True only if AI is not disabled, the owner farm is not EVERYONE, jobs are supported and start is allowed, a direction node exists, the AI limit is not reached, the AI is idle and the vehicle is not broken. |
| `AIJobVehicle:getIsAIJobSupported(aiJobName: any) → boolean` | 528 | ✍ Checks a job name against supportedJobTypes from the XML, case-insensitively. Returns true when no list is defined. |
| `AIJobVehicle:getDeactivateLightsOnLeave(superFunc: any) → boolean` | 570 | ✍ Override: lights are turned off on leave only if the parent allows it and the AI is not active. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onAIJobStarted` | 45 |
| registerEvent | `onAIJobFinished` | 46 |
| registerEvent | `onAIJobVehicleBlock` | 47 |
| registerEvent | `onAIJobVehicleContinue` | 48 |
| registerFunction | `getShowAIToggleActionEvent` | 53 |
| registerFunction | `stopCurrentAIJob` | 54 |
| registerFunction | `skipCurrentTask` | 55 |
| registerFunction | `aiJobStarted` | 56 |
| registerFunction | `aiJobFinished` | 57 |
| registerFunction | `toggleAIVehicle` | 58 |
| registerFunction | `getCanToggleAIVehicle` | 59 |
| registerFunction | `getCanStartAIVehicle` | 60 |
| registerFunction | `getCanStopAIVehicle` | 61 |
| registerFunction | `getIsAIJobSupported` | 62 |
| registerFunction | `setAIMapHotspotBlinking` | 63 |
| registerFunction | `getCurrentHelper` | 64 |
| registerFunction | `aiBlock` | 65 |
| registerFunction | `aiContinue` | 66 |
| registerFunction | `getAIDirectionNode` | 67 |
| registerFunction | `getAISteeringNode` | 68 |
| registerFunction | `getAIReverserNode` | 69 |
| registerFunction | `getAISteeringSpeed` | 70 |
| registerFunction | `getAIJobFarmId` | 71 |
| registerFunction | `getStartableAIJob` | 72 |
| registerFunction | `getHasStartableAIJob` | 73 |
| registerFunction | `getStartAIJobText` | 74 |
| registerFunction | `getJob` | 75 |
| registerFunction | `getLastJob` | 76 |
| registerFunction | `setIsAIStartAllowed` | 77 |
| registerFunction | `setIsAIStopAllowed` | 78 |
| registerOverwrittenFunction | `getIsVehicleControlledByPlayer` | 84 |
| registerOverwrittenFunction | `getIsActive` | 85 |
| registerOverwrittenFunction | `getIsAIActive` | 86 |
| registerOverwrittenFunction | `getAllowTireTracks` | 87 |
| registerOverwrittenFunction | `getDeactivateOnLeave` | 88 |
| registerOverwrittenFunction | `getStopMotorOnLeave` | 89 |
| registerOverwrittenFunction | `getDisableVehicleCharacterOnLeave` | 90 |
| registerOverwrittenFunction | `getFullName` | 91 |
| registerOverwrittenFunction | `getActiveFarm` | 92 |
| registerOverwrittenFunction | `getIsMapHotspotVisible` | 93 |
| registerOverwrittenFunction | `getMapHotspot` | 94 |
| registerOverwrittenFunction | `getDeactivateLightsOnLeave` | 95 |
| registerEventListener | `onLoad` | 101 |
| registerEventListener | `onDelete` | 102 |
| registerEventListener | `onUpdate` | 103 |
| registerEventListener | `onSetBroken` | 104 |
| registerEventListener | `onReadStream` | 105 |
| registerEventListener | `onWriteStream` | 106 |
| registerEventListener | `onAIModeChanged` | 107 |

## Messages

- publishes `MessageType.GUI_INGAME_OPEN_AI_SCREEN` (l.446)
- publishes `MessageType.GUI_INGAME_OPEN_AI_SCREEN` (l.461)
