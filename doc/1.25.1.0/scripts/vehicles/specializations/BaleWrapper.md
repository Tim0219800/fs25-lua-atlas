# vehicles/specializations/BaleWrapper.lua

Source: `dataS/scripts/vehicles/specializations/BaleWrapper.lua` — FS25 1.25.1.0

- **BaleWrapper** (l.15)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `BaleWrapper.prerequisitesPresent(specializations: table) → boolean` | 50 |  |
| `BaleWrapper.initSpecialization()` | 56 |  |
| `BaleWrapper.registerWrapperXMLPaths(schema: any, basePath: any)` | 97 |  |
| `BaleWrapper.registerWrapperAnimationXMLPaths(schema: any, basePath: any, name: any)` | 193 |  |
| `BaleWrapper.registerWrapperFoilAnimationXMLPaths(schema: any, basePath: any)` | 202 |  |
| `BaleWrapper.registerFunctions(vehicleType: any)` | 213 |  |
| `BaleWrapper.registerOverwrittenFunctions(vehicleType: any)` | 243 |  |
| `BaleWrapper.registerEventListeners(vehicleType: any)` | 256 |  |
| `BaleWrapper:onLoad(savegame: table)` | 276 |  |
| `BaleWrapper:onPostLoad(savegame: any)` | 352 |  |
| `BaleWrapper:loadWrapperFromXML(wrapper: any, xmlFile: any, baseKey: any, wrapperName: any)` | 373 |  |
| `BaleWrapper:loadWrapperAnimationsFromXML(target: any, xmlFile: any, baseKey: any, configKey: any, animationsKey: any, parentAnimations: any)` | 511 |  |
| `BaleWrapper:loadWrapperAnimCurveFromXML(target: any, xmlFile: any, baseKey: any)` | 544 |  |
| `BaleWrapper:loadWrapperAnimNodesFromXML(target: any, xmlFile: any, baseKey: any)` | 562 |  |
| `BaleWrapper:loadWrapperWrapNodesFromXML(target: any, xmlFile: any, baseKey: any)` | 608 |  |
| `BaleWrapper:loadWrapperStateCurveFromXML(target: any, xmlFile: any, baseKey: any)` | 626 |  |
| `BaleWrapper:loadWrapperAnimationNodesFromXML(target: any, xmlFile: any, baseKey: any, animTime: any)` | 642 |  |
| `BaleWrapper:loadWrapperFoilAnimationFromXML(target: any, xmlFile: any, baseKey: any, isDefault: any)` | 704 |  |
| `BaleWrapper:onLoadFinished(savegame: table)` | 753 |  |
| `BaleWrapper:onDelete()` | 798 |  |
| `BaleWrapper:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 848 |  |
| `BaleWrapper:onReadStream(streamId: integer, connection: Connection)` | 870 |  |
| `BaleWrapper:onWriteStream(streamId: integer, connection: Connection)` | 949 |  |
| `BaleWrapper:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 977 |  |
| `BaleWrapper:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1041 |  |
| `BaleWrapper:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 1121 |  |
| `BaleWrapper:baleGrabberTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 1140 |  |
| `BaleWrapper:allowsGrabbingBale() → boolean` | 1164 |  |
| `BaleWrapper:updateWrapNodes(isWrapping: boolean, isEmpty: boolean, t: number, wrapperRot: number)` | 1186 |  |
| `BaleWrapper:updateWrappingState(wrappingTime: number, noEventSend: boolean)` | 1244 |  |
| `BaleWrapper:playMoveToWrapper(bale: table)` | 1364 |  |
| `BaleWrapper:setBaleWrapperType(isRoundBaleWrapper: boolean, baleTypeIndex: integer)` | 1379 |  |
| `BaleWrapper:getMatchingBaleTypeIndex(baleTypes: table, bale: table)` | 1409 |  |
| `BaleWrapper:doStateChange(id: integer, nearestBaleServerId: integer)` | 1423 |  |
| `BaleWrapper:getIsBaleWrappable(bale: table) → table` | 1625 |  |
| `BaleWrapper:getIsBaleDropAllowed() → boolean, string` | 1650 |  |
| `BaleWrapper:onBaleWrapperDropOverlapCallback(nodeId: any)` | 1671 |  |
| `BaleWrapper:getIsBaleWrappingAllowed() → boolean` | 1690 |  |
| `BaleWrapper:onBaleWrapperBlockOverlapCallback(nodeId: any)` | 1711 |  |
| `BaleWrapper:pickupWrapperBale(bale: table, baleTypeIndex: integer)` | 1730 |  |
| `BaleWrapper.getBaleInRange(self: integer, refNode: integer, distance: number) → table, integer` | 1758 |  |
| `BaleWrapper:setBaleWrapperAutomaticDrop(state: any, noEventSend: any)` | 1786 |  |
| `BaleWrapper:setBaleWrapperDropAnimation(dropAnimationIndex: any)` | 1802 |  |
| `BaleWrapper:getIsFoldAllowed(superFunc: boolean, direction: any, onAiTurnOn: boolean) → boolean` | 1811 |  |
| `BaleWrapper:getCanBeSelected(superFunc: any)` | 1822 |  |
| `BaleWrapper:getShowConsumableEmptyWarning(superFunc: any, typeName: any)` | 1828 |  |
| `BaleWrapper:getRequiresPower(superFunc: any)` | 1838 |  |
| `BaleWrapper:getStandaloneMotorTargetRpm(superFunc: any)` | 1849 |  |
| `BaleWrapper:getStandaloneMotorLoad(superFunc: any)` | 1865 |  |
| `BaleWrapper:addToPhysics(superFunc: any) → boolean` | 1887 |  |
| `BaleWrapper:removeFromPhysics(superFunc: any) → boolean` | 1914 |  |
| `BaleWrapper:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1934 |  |
| `BaleWrapper:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 1969 |  |
| `BaleWrapper:onDeactivate()` | 1984 |  |
| `BaleWrapper:onFoldStateChanged(direction: any, moveToMiddle: any)` | 1996 |  |
| `BaleWrapper:onConsumableVariationChanged(variationIndex: any, metaData: any)` | 2007 |  |
| `BaleWrapper.actionEventEmpty(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2018 |  |
| `BaleWrapper.actionEventToggleAutomaticDrop(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2032 |  |
| `BaleWrapper.actionEventDrop(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2038 |  |
| `BaleWrapper.updateActionEvents(self: any)` | 2047 |  |
| `BaleWrapper.externalActionEventUnloadRegister(data: any, vehicle: any)` | 2076 |  |
| `BaleWrapper.externalActionEventUnloadUpdate(data: any, vehicle: any)` | 2093 |  |
| `BaleWrapper.externalActionEventAutomaticUnloadRegister(data: any, vehicle: any)` | 2100 |  |
| `BaleWrapper.externalActionEventAutomaticUnloadUpdate(data: any, vehicle: any)` | 2112 |  |
| `BaleWrapper.externalActionEventWarningsRegister(data: any, vehicle: any)` | 2119 |  |
| `BaleWrapper.externalActionEventWarningsUpdate(data: any, vehicle: any)` | 2124 |  |
| `BaleWrapper.loadSpecValueBaleSize(xmlFile: any, customEnvironment: any, baseDir: any, roundBaleWrapper: any)` | 2137 |  |
| `BaleWrapper.getSpecValueBaleSize(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any, roundBaleWrapper: any)` | 2166 |  |
| `BaleWrapper.loadSpecValueBaleSizeRound(xmlFile: any, customEnvironment: any, baseDir: any)` | 2202 |  |
| `BaleWrapper.loadSpecValueBaleSizeSquare(xmlFile: any, customEnvironment: any, baseDir: any)` | 2208 |  |
| `BaleWrapper.getSpecValueBaleSizeRound(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 2214 |  |
| `BaleWrapper.getSpecValueBaleSizeSquare(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 2224 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadWrapperFromXML` | 214 |
| registerFunction | `loadWrapperAnimationsFromXML` | 215 |
| registerFunction | `loadWrapperAnimCurveFromXML` | 216 |
| registerFunction | `loadWrapperAnimNodesFromXML` | 217 |
| registerFunction | `loadWrapperWrapNodesFromXML` | 218 |
| registerFunction | `loadWrapperStateCurveFromXML` | 219 |
| registerFunction | `loadWrapperAnimationNodesFromXML` | 220 |
| registerFunction | `loadWrapperFoilAnimationFromXML` | 221 |
| registerFunction | `baleGrabberTriggerCallback` | 223 |
| registerFunction | `allowsGrabbingBale` | 224 |
| registerFunction | `pickupWrapperBale` | 225 |
| registerFunction | `getIsBaleWrappable` | 226 |
| registerFunction | `getIsBaleDropAllowed` | 227 |
| registerFunction | `onBaleWrapperDropOverlapCallback` | 228 |
| registerFunction | `getIsBaleWrappingAllowed` | 229 |
| registerFunction | `onBaleWrapperBlockOverlapCallback` | 230 |
| registerFunction | `updateWrappingState` | 231 |
| registerFunction | `doStateChange` | 232 |
| registerFunction | `updateWrapNodes` | 233 |
| registerFunction | `playMoveToWrapper` | 234 |
| registerFunction | `setBaleWrapperType` | 235 |
| registerFunction | `getMatchingBaleTypeIndex` | 236 |
| registerFunction | `setBaleWrapperAutomaticDrop` | 237 |
| registerFunction | `setBaleWrapperDropAnimation` | 238 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 244 |
| registerOverwrittenFunction | `getCanBeSelected` | 245 |
| registerOverwrittenFunction | `getShowConsumableEmptyWarning` | 246 |
| registerOverwrittenFunction | `getRequiresPower` | 247 |
| registerOverwrittenFunction | `getStandaloneMotorTargetRpm` | 248 |
| registerOverwrittenFunction | `getStandaloneMotorLoad` | 249 |
| registerOverwrittenFunction | `addToPhysics` | 250 |
| registerOverwrittenFunction | `removeFromPhysics` | 251 |
| registerEventListener | `onLoad` | 257 |
| registerEventListener | `onPostLoad` | 258 |
| registerEventListener | `onLoadFinished` | 259 |
| registerEventListener | `onDelete` | 260 |
| registerEventListener | `onReadStream` | 261 |
| registerEventListener | `onWriteStream` | 262 |
| registerEventListener | `onUpdate` | 263 |
| registerEventListener | `onUpdateTick` | 264 |
| registerEventListener | `onDraw` | 265 |
| registerEventListener | `onRegisterActionEvents` | 266 |
| registerEventListener | `onRegisterExternalActionEvents` | 267 |
| registerEventListener | `onDeactivate` | 268 |
| registerEventListener | `onFoldStateChanged` | 269 |
| registerEventListener | `onConsumableVariationChanged` | 270 |
