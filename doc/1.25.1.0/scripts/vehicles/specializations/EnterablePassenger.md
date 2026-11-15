# vehicles/specializations/EnterablePassenger.lua

Source: `dataS/scripts/vehicles/specializations/EnterablePassenger.lua` — FS25 1.25.1.0


## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `EnterablePassenger.prerequisitesPresent(specializations: table) → boolean` | 26 |  |
| `EnterablePassenger.initSpecialization()` | 32 |  |
| `EnterablePassenger.registerXMLPaths(basePath: any, schema: any)` | 48 |  |
| `EnterablePassenger.registerFunctions(vehicleType: any)` | 64 |  |
| `EnterablePassenger.registerOverwrittenFunctions(vehicleType: any)` | 85 |  |
| `EnterablePassenger.registerEventListeners(vehicleType: any)` | 100 |  |
| `EnterablePassenger:onLoad(savegame: any)` | 116 |  |
| `EnterablePassenger:onDelete()` | 197 |  |
| `EnterablePassenger:onReadStream(streamId: integer, connection: Connection)` | 233 |  |
| `EnterablePassenger:onWriteStream(streamId: integer, connection: Connection)` | 250 |  |
| `EnterablePassenger:onPostUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 262 |  |
| `EnterablePassenger:onDrawUIInfo()` | 284 |  |
| `EnterablePassenger:onSetBroken()` | 307 |  |
| `EnterablePassenger:onEnterVehicle()` | 316 |  |
| `EnterablePassenger:onLeaveVehicle()` | 334 |  |
| `EnterablePassenger:getInteractionHelp(superFunc: any) → string` | 346 |  |
| `EnterablePassenger:interact(superFunc: any, player: any)` | 359 |  |
| `EnterablePassenger:getIsEnteredForInput(superFunc: any)` | 382 |  |
| `EnterablePassenger:getRequiresPower(superFunc: any)` | 401 |  |
| `EnterablePassenger:getDistanceToNode(superFunc: integer, node: any) → number` | 425 |  |
| `EnterablePassenger:getIsEnterable(superFunc: any)` | 442 |  |
| `EnterablePassenger:getExitNode(superFunc: any, player: any)` | 453 |  |
| `EnterablePassenger:getIsInUse(superFunc: any, connection: any)` | 469 |  |
| `EnterablePassenger:getDeactivateOnLeave(superFunc: any, connection: any)` | 485 |  |
| `EnterablePassenger:onPreRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 501 |  |
| `EnterablePassenger:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 511 |  |
| `EnterablePassenger.actionEventLeave(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 552 |  |
| `EnterablePassenger.actionEventCameraSwitch(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 561 |  |
| `EnterablePassenger.actionEventSwitchSeat(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 570 |  |
| `EnterablePassenger.updateActionEvents(self: any)` | 598 |  |
| `EnterablePassenger:getClosestSeatIndex(playerNode: any)` | 632 |  |
| `EnterablePassenger:getIsPassengerSeatAvailable(passengerSeat: any)` | 654 |  |
| `EnterablePassenger:getIsPassengerSeatIndexAvailable(seatIndex: any)` | 660 |  |
| `EnterablePassenger:getFirstAvailablePassengerSeat(startIndex: any)` | 672 |  |
| `EnterablePassenger:getPlayerNameBySeatIndex(seatIndex: any)` | 686 |  |
| `EnterablePassenger:getCanUsePassengerSeats()` | 701 |  |
| `EnterablePassenger:enterVehiclePassengerSeat(isOwner: any, seatIndex: any, playerStyle: any, userId: any)` | 721 |  |
| `EnterablePassenger:leaveLocalPassengerSeat(noEventSend: any)` | 787 |  |
| `EnterablePassenger:leavePassengerSeat(isOwner: any, seatIndex: any)` | 800 |  |
| `EnterablePassenger:getPassengerSeatIndexByPlayer(userId: any)` | 861 |  |
| `EnterablePassenger:copyEnterableActiveCameraIndex(seatIndex: any)` | 874 |  |
| `EnterablePassenger:setPassengerActiveCameraIndex(cameraIndex: any, seatIndex: any)` | 933 |  |
| `EnterablePassenger:enablePassengerActiveCamera()` | 948 |  |
| `EnterablePassenger:setPassengerSeatCharacter(seatIndex: any, playerStyle: any)` | 974 |  |
| `EnterablePassenger:updatePassengerSeatCharacter(dt: any)` | 990 |  |
| `EnterablePassenger:onPassengerPlayerStyleChanged(style: any, userId: any)` | 1002 |  |
| `EnterablePassenger.vehiclePassengerCharacterLoaded(self: any, loadingState: any, arguments: any)` | 1014 |  |
| `EnterablePassenger.consoleCommandDebugPassengerSeat()` | 1030 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getClosestSeatIndex` | 65 |
| registerFunction | `getIsPassengerSeatAvailable` | 66 |
| registerFunction | `getIsPassengerSeatIndexAvailable` | 67 |
| registerFunction | `getFirstAvailablePassengerSeat` | 68 |
| registerFunction | `getPlayerNameBySeatIndex` | 69 |
| registerFunction | `getCanUsePassengerSeats` | 70 |
| registerFunction | `enterVehiclePassengerSeat` | 71 |
| registerFunction | `leaveLocalPassengerSeat` | 72 |
| registerFunction | `leavePassengerSeat` | 73 |
| registerFunction | `getPassengerSeatIndexByPlayer` | 74 |
| registerFunction | `copyEnterableActiveCameraIndex` | 75 |
| registerFunction | `setPassengerActiveCameraIndex` | 76 |
| registerFunction | `enablePassengerActiveCamera` | 77 |
| registerFunction | `setPassengerSeatCharacter` | 78 |
| registerFunction | `updatePassengerSeatCharacter` | 79 |
| registerFunction | `onPassengerPlayerStyleChanged` | 80 |
| registerOverwrittenFunction | `getInteractionHelp` | 86 |
| registerOverwrittenFunction | `interact` | 87 |
| registerOverwrittenFunction | `getDistanceToNode` | 88 |
| registerOverwrittenFunction | `getIsEnterable` | 89 |
| registerOverwrittenFunction | `getExitNode` | 90 |
| registerOverwrittenFunction | `getIsInUse` | 91 |
| registerOverwrittenFunction | `getDeactivateOnLeave` | 92 |
| registerOverwrittenFunction | `getIsInteractive` | 93 |
| registerOverwrittenFunction | `getIsEnteredForInput` | 94 |
| registerOverwrittenFunction | `getRequiresPower` | 95 |
| registerEventListener | `onLoad` | 101 |
| registerEventListener | `onDelete` | 102 |
| registerEventListener | `onReadStream` | 103 |
| registerEventListener | `onWriteStream` | 104 |
| registerEventListener | `onPostUpdate` | 105 |
| registerEventListener | `onDrawUIInfo` | 106 |
| registerEventListener | `onSetBroken` | 107 |
| registerEventListener | `onEnterVehicle` | 108 |
| registerEventListener | `onLeaveVehicle` | 109 |
| registerEventListener | `onPreRegisterActionEvents` | 110 |
| registerEventListener | `onRegisterActionEvents` | 111 |

## Messages

- subscribes `MessageType.PLAYER_STYLE_CHANGED` (l.191)
- subscribes `MessageType.INPUT_BINDINGS_CHANGED` (l.742)
