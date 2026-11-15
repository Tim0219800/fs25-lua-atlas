# vehicles/specializations/PushHandTool.lua

Source: `dataS/scripts/vehicles/specializations/PushHandTool.lua` — FS25 1.25.1.0


## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PushHandTool.initSpecialization()` | 19 |  |
| `PushHandTool.prerequisitesPresent(specializations: table) → boolean` | 82 |  |
| `PushHandTool.registerFunctions(vehicleType: any)` | 88 |  |
| `PushHandTool.registerOverwrittenFunctions(vehicleType: any)` | 98 |  |
| `PushHandTool.registerEventListeners(vehicleType: any)` | 108 |  |
| `PushHandTool:onLoad(savegame: any)` | 125 |  |
| `PushHandTool:onPostLoad(savegame: any)` | 256 |  |
| `PushHandTool:onDelete()` | 268 |  |
| `PushHandTool:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 277 |  |
| `PushHandTool:onReadStream(streamId: integer, connection: Connection)` | 288 |  |
| `PushHandTool:onWriteStream(streamId: integer, connection: Connection)` | 298 |  |
| `PushHandTool:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 309 |  |
| `PushHandTool:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 334 |  |
| `PushHandTool:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 349 |  |
| `PushHandTool:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 603 |  |
| `PushHandTool.actionEventToggleDriveMode(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 620 |  |
| `PushHandTool:setVehicleCharacter(superFunc: any, playerStyle: any)` | 626 |  |
| `PushHandTool:deleteVehicleCharacter(superFunc: any)` | 643 |  |
| `PushHandTool:customVehicleCharacterLoaded(loadingState: any, arguments: any)` | 654 |  |
| `PushHandTool.driveModeVehicleCharacterLoaded(self: any, loadingState: any, arguments: any)` | 749 |  |
| `PushHandTool:setPushHandToolDriveMode(driveModeState: any, noEventSend: any)` | 765 |  |
| `PushHandTool:getAllowCharacterVisibilityUpdate(superFunc: any)` | 798 |  |
| `PushHandTool:setActiveCameraIndex(superFunc: any, index: any)` | 830 |  |
| `PushHandTool:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 854 |  |
| `PushHandTool:onEnterVehicle(isControlling: any)` | 865 |  |
| `PushHandTool:onCameraChanged(activeCamera: any, camIndex: any)` | 891 |  |
| `PushHandTool:onVehicleCharacterChanged(character: any)` | 910 |  |
| `PushHandTool:postAnimationUpdate(dt: any)` | 930 |  |
| `PushHandTool:getRaycastPosition(node: any)` | 1006 |  |
| `PushHandTool:playerRaycastCallback(hitObjectId: any, x: any, y: any, z: any, distance: any)` | 1023 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getRaycastPosition` | 89 |
| registerFunction | `playerRaycastCallback` | 90 |
| registerFunction | `postAnimationUpdate` | 91 |
| registerFunction | `customVehicleCharacterLoaded` | 92 |
| registerFunction | `setPushHandToolDriveMode` | 93 |
| registerOverwrittenFunction | `setVehicleCharacter` | 99 |
| registerOverwrittenFunction | `deleteVehicleCharacter` | 100 |
| registerOverwrittenFunction | `getAllowCharacterVisibilityUpdate` | 101 |
| registerOverwrittenFunction | `setActiveCameraIndex` | 102 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 103 |
| registerEventListener | `onLoad` | 109 |
| registerEventListener | `onPostLoad` | 110 |
| registerEventListener | `onDelete` | 111 |
| registerEventListener | `onReadStream` | 112 |
| registerEventListener | `onWriteStream` | 113 |
| registerEventListener | `onReadUpdateStream` | 114 |
| registerEventListener | `onWriteUpdateStream` | 115 |
| registerEventListener | `onUpdate` | 116 |
| registerEventListener | `onRegisterActionEvents` | 117 |
| registerEventListener | `onEnterVehicle` | 118 |
| registerEventListener | `onCameraChanged` | 119 |
| registerEventListener | `onVehicleCharacterChanged` | 120 |
