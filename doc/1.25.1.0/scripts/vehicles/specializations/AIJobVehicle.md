# vehicles/specializations/AIJobVehicle.lua

Source: `dataS/scripts/vehicles/specializations/AIJobVehicle.lua` — FS25 1.25.1.0

- **AIJobVehicle** (l.12)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AIJobVehicle.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `AIJobVehicle.initSpecialization()` | 25 |  |
| `AIJobVehicle.registerEvents(vehicleType: any)` | 44 |  |
| `AIJobVehicle.registerFunctions(vehicleType: any)` | 52 |  |
| `AIJobVehicle.registerOverwrittenFunctions(vehicleType: any)` | 83 |  |
| `AIJobVehicle.registerEventListeners(vehicleType: any)` | 100 |  |
| `AIJobVehicle:onLoad(savegame: table)` | 113 |  |
| `AIJobVehicle:onReadStream(streamId: integer, connection: Connection)` | 171 |  |
| `AIJobVehicle:onWriteStream(streamId: integer, connection: Connection)` | 198 |  |
| `AIJobVehicle:onAIModeChanged(aiMode: any)` | 217 |  |
| `AIJobVehicle:getShowAIToggleActionEvent() → boolean` | 235 |  |
| `AIJobVehicle:getIsInUse(superFunc: any, connection: any)` | 372 |  |
| `AIJobVehicle:getIsActive(superFunc: any)` | 382 |  |
| `AIJobVehicle:getIsAIActive(superFunc: any)` | 396 |  |
| `AIJobVehicle:toggleAIVehicle()` | 429 |  |
| `AIJobVehicle:getCanToggleAIVehicle() → boolean` | 468 |  |
| `AIJobVehicle:getCanStartAIVehicle() → boolean` | 488 |  |
| `AIJobVehicle:getIsAIJobSupported(aiJobName: any) → boolean` | 528 |  |
| `AIJobVehicle:getDeactivateLightsOnLeave(superFunc: any) → boolean` | 570 |  |

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
