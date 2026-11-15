# vehicles/specializations/InlineWrapper.lua

Source: `dataS/scripts/vehicles/specializations/InlineWrapper.lua` — FS25 1.25.1.0

- **InlineWrapper** (l.11)
- **InlineWrapperActivatable** (l.1347)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `InlineWrapper.prerequisitesPresent(specializations: table) → boolean` | 22 |  |
| `InlineWrapper.initSpecialization()` | 28 |  |
| `InlineWrapper.registerFunctions(vehicleType: any)` | 84 |  |
| `InlineWrapper.registerOverwrittenFunctions(vehicleType: any)` | 106 |  |
| `InlineWrapper.registerEventListeners(vehicleType: any)` | 115 |  |
| `InlineWrapper:onLoad(savegame: table)` | 135 |  |
| `InlineWrapper:onPostLoad(savegame: table)` | 257 |  |
| `InlineWrapper:onDelete()` | 266 |  |
| `InlineWrapper:onReadStream(streamId: any, connection: any)` | 290 |  |
| `InlineWrapper:onWriteStream(streamId: any, connection: any)` | 310 |  |
| `InlineWrapper:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 325 |  |
| `InlineWrapper:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 350 |  |
| `InlineWrapper:readInlineBales(name: any, streamId: any, connection: any)` | 371 |  |
| `InlineWrapper:writeInlineBales(name: any, streamId: any, connection: any)` | 384 |  |
| `InlineWrapper:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 405 |  |
| `InlineWrapper:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 417 |  |
| `InlineWrapper:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 693 |  |
| `InlineWrapper:updateWrappingNodes()` | 711 |  |
| `InlineWrapper:updateRoundBaleWrappingNode(bale: any, wrappingNode: any, x: any, y: any, z: any)` | 785 |  |
| `InlineWrapper:updateSquareBaleWrappingNode(bale: any, wrappingNode: any, x: any, y: any, z: any)` | 824 |  |
| `InlineWrapper:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 876 |  |
| `InlineWrapper:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 893 |  |
| `InlineWrapper:getIsActive(superFunc: any)` | 904 |  |
| `InlineWrapper:getBrakeForce(superFunc: any)` | 915 |  |
| `InlineWrapper:getShowConsumableEmptyWarning(superFunc: any, typeName: any)` | 927 |  |
| `InlineWrapper:getIsInlineBalingAllowed()` | 947 |  |
| `InlineWrapper:inlineBaleTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 968 |  |
| `InlineWrapper:inlineWrapTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1027 |  |
| `InlineWrapper:getWrapperBaleType(bale: any)` | 1047 |  |
| `InlineWrapper:getAllowBalePushing(bale: any)` | 1076 |  |
| `InlineWrapper:updateWrapperRailings(targetPosition: any, dt: any)` | 1086 |  |
| `InlineWrapper:updateInlineSteeringWheels(dirX: any, dirZ: any)` | 1104 |  |
| `InlineWrapper:onLeaveVehicle()` | 1127 |  |
| `InlineWrapper:onEnterVehicle()` | 1133 |  |
| `InlineWrapper:onConsumableVariationChanged(variationIndex: any, metaData: any)` | 1146 |  |
| `InlineWrapper:getCanInteract()` | 1157 |  |
| `InlineWrapper:getCanPushOff()` | 1178 |  |
| `InlineWrapper:setCurrentInlineBale(inlineBale: any, isClient: any)` | 1203 |  |
| `InlineWrapper:getCurrentInlineBale()` | 1220 |  |
| `InlineWrapper.pushOffInlineBaleEvent(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1226 |  |
| `InlineWrapper:pushOffInlineBale()` | 1238 |  |
| `InlineWrapper.loadSpecValueBaleSize(xmlFile: any, customEnvironment: any, baseDir: any, roundBaleWrapper: any)` | 1248 |  |
| `InlineWrapper.getSpecValueBaleSize(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any, roundBaleWrapper: any)` | 1277 |  |
| `InlineWrapper.loadSpecValueBaleSizeRound(xmlFile: any, customEnvironment: any, baseDir: any)` | 1313 |  |
| `InlineWrapper.loadSpecValueBaleSizeSquare(xmlFile: any, customEnvironment: any, baseDir: any)` | 1319 |  |
| `InlineWrapper.getSpecValueBaleSizeRound(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 1325 |  |
| `InlineWrapper.getSpecValueBaleSizeSquare(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 1335 |  |
| `InlineWrapperActivatable.new(inlineWrapper: any)` | 1351 |  |
| `InlineWrapperActivatable:getIsActivatable()` | 1362 |  |
| `InlineWrapperActivatable:run()` | 1374 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `readInlineBales` | 85 |
| registerFunction | `writeInlineBales` | 86 |
| registerFunction | `getIsInlineBalingAllowed` | 87 |
| registerFunction | `inlineBaleTriggerCallback` | 88 |
| registerFunction | `inlineWrapTriggerCallback` | 89 |
| registerFunction | `updateWrappingNodes` | 90 |
| registerFunction | `updateRoundBaleWrappingNode` | 91 |
| registerFunction | `updateSquareBaleWrappingNode` | 92 |
| registerFunction | `getWrapperBaleType` | 93 |
| registerFunction | `getAllowBalePushing` | 94 |
| registerFunction | `updateWrapperRailings` | 95 |
| registerFunction | `updateInlineSteeringWheels` | 96 |
| registerFunction | `getCanInteract` | 97 |
| registerFunction | `getCanPushOff` | 98 |
| registerFunction | `setCurrentInlineBale` | 99 |
| registerFunction | `getCurrentInlineBale` | 100 |
| registerFunction | `pushOffInlineBale` | 101 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 107 |
| registerOverwrittenFunction | `getIsActive` | 108 |
| registerOverwrittenFunction | `getBrakeForce` | 109 |
| registerOverwrittenFunction | `getShowConsumableEmptyWarning` | 110 |
| registerEventListener | `onLoad` | 116 |
| registerEventListener | `onPostLoad` | 117 |
| registerEventListener | `onDelete` | 118 |
| registerEventListener | `onReadStream` | 119 |
| registerEventListener | `onWriteStream` | 120 |
| registerEventListener | `onReadUpdateStream` | 121 |
| registerEventListener | `onWriteUpdateStream` | 122 |
| registerEventListener | `onUpdate` | 123 |
| registerEventListener | `onUpdateTick` | 124 |
| registerEventListener | `onDraw` | 125 |
| registerEventListener | `onRegisterActionEvents` | 126 |
| registerEventListener | `onLeaveVehicle` | 127 |
| registerEventListener | `onEnterVehicle` | 128 |
| registerEventListener | `onConsumableVariationChanged` | 129 |
