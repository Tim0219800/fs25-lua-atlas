# vehicles/specializations/PalletFiller.lua

Source: `dataS/scripts/vehicles/specializations/PalletFiller.lua` — FS25 1.25.1.0


## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `PalletFiller.prerequisitesPresent(specializations: table) → boolean` | 22 |  |
| `PalletFiller.initSpecialization()` | 28 |  |
| `PalletFiller.registerFunctions(vehicleType: any)` | 90 |  |
| `PalletFiller.registerOverwrittenFunctions(vehicleType: any)` | 104 |  |
| `PalletFiller.registerEventListeners(vehicleType: any)` | 117 |  |
| `PalletFiller:onLoad(savegame: any)` | 134 |  |
| `PalletFiller:onLoadFinished(savegame: any)` | 280 |  |
| `PalletFiller:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 332 |  |
| `PalletFiller:onDelete()` | 352 |  |
| `PalletFiller:onReadStream(streamId: integer, connection: Connection)` | 389 |  |
| `PalletFiller:onWriteStream(streamId: integer, connection: Connection)` | 413 |  |
| `PalletFiller:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 431 |  |
| `PalletFiller:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 472 |  |
| `PalletFiller:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 492 |  |
| `PalletFiller:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 679 |  |
| `PalletFiller:onFinishAnimation(name: any)` | 717 |  |
| `PalletFiller:onFoldTimeChanged(name: any)` | 726 |  |
| `PalletFiller:loadPalletFillerPallet(object: any, data: any)` | 732 |  |
| `PalletFiller:unloadPalletFillerPallet(object: any)` | 802 |  |
| `PalletFiller:buyPalletFillerPallets(noEventSend: any)` | 827 |  |
| `PalletFiller.onCreatePalletFinished(self: any, vehicles: any, vehicleLoadState: any, arguments: any)` | 871 |  |
| `PalletFiller:getCanChangePalletFillerState(newState: any)` | 905 |  |
| `PalletFiller:getCanBuyPalletFillerPallets()` | 959 |  |
| `PalletFiller:setPalletFillerState(state: any, updateAnimations: any, noEventSend: any)` | 971 |  |
| `PalletFiller.updatePalletFillerDeflectorState(self: any)` | 1000 |  |
| `PalletFiller:setPalletFillerDeflectorState(state: any, updateAnimations: any)` | 1016 |  |
| `PalletFiller:getPalletFillerFillStep()` | 1030 |  |
| `PalletFiller:getPalletFillerMovementDirection()` | 1057 |  |
| `PalletFiller:getCanToggleDischargeToObject(superFunc: any)` | 1070 |  |
| `PalletFiller:getCanToggleDischargeToGround(superFunc: any)` | 1076 |  |
| `PalletFiller:removeFromPhysics(superFunc: any)` | 1082 |  |
| `PalletFiller:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 1097 |  |
| `PalletFiller:getFillLevelInformation(superFunc: any, display: any)` | 1116 |  |
| `PalletFiller:getHasObjectMounted(superFunc: table, object: table) → boolean` | 1142 |  |
| `PalletFiller:getCanAIImplementContinueWork(superFunc: any, isTurning: any)` | 1167 |  |
| `PalletFiller:verifyCombine(superFunc: any, fruitType: any, outputFillType: any, ...: any)` | 1190 |  |
| `PalletFiller:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1217 |  |
| `PalletFiller.updateActionEventTexts(self: any)` | 1244 |  |
| `PalletFiller.actionEventLowerPlatformLoad(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1307 |  |
| `PalletFiller.actionEventLowerPlatformUnload(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1321 |  |
| `PalletFiller.actionEventBuyPallets(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1335 |  |
| `PalletFiller.onObjectDeleted(self: any, object: any)` | 1361 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadPalletFillerPallet` | 91 |
| registerFunction | `unloadPalletFillerPallet` | 92 |
| registerFunction | `buyPalletFillerPallets` | 93 |
| registerFunction | `getCanChangePalletFillerState` | 94 |
| registerFunction | `getCanBuyPalletFillerPallets` | 95 |
| registerFunction | `setPalletFillerState` | 96 |
| registerFunction | `setPalletFillerDeflectorState` | 97 |
| registerFunction | `getPalletFillerFillStep` | 98 |
| registerFunction | `getPalletFillerMovementDirection` | 99 |
| registerOverwrittenFunction | `getCanToggleDischargeToObject` | 105 |
| registerOverwrittenFunction | `getCanToggleDischargeToGround` | 106 |
| registerOverwrittenFunction | `removeFromPhysics` | 107 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 108 |
| registerOverwrittenFunction | `getFillLevelInformation` | 109 |
| registerOverwrittenFunction | `getHasObjectMounted` | 110 |
| registerOverwrittenFunction | `getCanAIImplementContinueWork` | 111 |
| registerOverwrittenFunction | `verifyCombine` | 112 |
| registerEventListener | `onLoad` | 118 |
| registerEventListener | `onLoadFinished` | 119 |
| registerEventListener | `onDelete` | 120 |
| registerEventListener | `onReadStream` | 121 |
| registerEventListener | `onWriteStream` | 122 |
| registerEventListener | `onReadUpdateStream` | 123 |
| registerEventListener | `onWriteUpdateStream` | 124 |
| registerEventListener | `onUpdate` | 125 |
| registerEventListener | `onUpdateTick` | 126 |
| registerEventListener | `onFinishAnimation` | 127 |
| registerEventListener | `onFoldTimeChanged` | 128 |
| registerEventListener | `onRegisterActionEvents` | 129 |
