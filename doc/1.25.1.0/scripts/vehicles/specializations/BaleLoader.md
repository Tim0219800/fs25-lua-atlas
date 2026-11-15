# vehicles/specializations/BaleLoader.lua

Source : `dataS/scripts/vehicles/specializations/BaleLoader.lua` — FS25 1.25.1.0

- **BaleLoader** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `BaleLoader.prerequisitesPresent(specializations: table) → boolean` | 18 |  |
| `BaleLoader.initSpecialization()` | 24 |  |
| `BaleLoader.registerAnimationXMLPaths(schema: any, basePath: any)` | 164 |  |
| `BaleLoader.registerFunctions(vehicleType: any)` | 277 |  |
| `BaleLoader.registerOverwrittenFunctions(vehicleType: any)` | 312 |  |
| `BaleLoader.registerEventListeners(vehicleType: any)` | 328 |  |
| `BaleLoader:onLoad(savegame: table)` | 353 |  |
| `BaleLoader:onPostLoad(savegame: table)` | 668 |  |
| `BaleLoader:onLoadFinished(savegame: table)` | 759 |  |
| `BaleLoader:onDelete()` | 787 |  |
| `BaleLoader:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 890 |  |
| `BaleLoader:onReadStream(streamId: integer, connection: Connection)` | 955 |  |
| `BaleLoader:onWriteStream(streamId: integer, connection: Connection)` | 1092 |  |
| `BaleLoader:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 1153 |  |
| `BaleLoader:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 1175 |  |
| `BaleLoader.updateBalePlacesAnimations(self: any)` | 1187 |  |
| `BaleLoader:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1223 |  |
| `BaleLoader:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1392 |  |
| `BaleLoader:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1669 |  |
| `BaleLoader.getBaleInRange(self: integer, refNode: integer, balesInTrigger: any) → table, integer` | 1681 |  |
| `BaleLoader:onActivate()` | 1778 |  |
| `BaleLoader:onDeactivate()` | 1789 |  |
| `BaleLoader:onRootVehicleChanged(rootVehicle: table)` | 1799 |  |
| `BaleLoader.actionControllerEvent(self: any, direction: any)` | 1824 |  |
| `BaleLoader:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 1837 |  |
| `BaleLoader:onFoldStateChanged(direction: any)` | 1846 |  |
| `BaleLoader:onBalerUnloadingStarted(balesToUnload: any)` | 1860 |  |
| `BaleLoader:onRegisterAnimationValueTypes()` | 1869 |  |
| `BaleLoader:loadBaleTypeFromXML(xmlFile: any, key: any, baleType: any)` | 1897 |  |
| `BaleLoader:loadBaleLoaderAnimationsFromXML(xmlFile: any, key: any, target: any, defaultTarget: any)` | 1947 |  |
| `BaleLoader:loadBalePlacesFromXML(xmlFile: any, key: any, target: any)` | 1999 |  |
| `BaleLoader:createBaleToBaleJoints(baleLines: any)` | 2050 |  |
| `BaleLoader:createBaleToBaleJoint(bale1: any, bale2: any, x: any, y: any, z: any, rx: any, ry: any, rz: any, balePlaceIndex: any)` | 2102 |  |
| `BaleLoader:doStateChange(id: integer, nearestBaleServerId: integer)` | 2138 |  |
| `BaleLoader.getAllowsStartUnloading(self: any) → boolean` | 2616 |  |
| `BaleLoader.rotatePlatform(self: any)` | 2644 |  |
| `BaleLoader.moveToWorkPosition(self: boolean, onLoad: boolean)` | 2661 |  |
| `BaleLoader.moveToTransportPosition(self: any)` | 2679 |  |
| `BaleLoader:getBaleGrabberDropBaleAnimName() → string` | 2689 |  |
| `BaleLoader:getIsBaleGrabbingAllowed() → string` | 2701 |  |
| `BaleLoader:pickupBale(nearestBale: table, nearestBaleType: table)` | 2743 |  |
| `BaleLoader:setBaleLoaderBaleType(baleTypeIndex: integer, forceUpdate: boolean)` | 2756 |  |
| `BaleLoader:getBaleTypeByBale(bale: any)` | 2801 |  |
| `BaleLoader:baleGrabberTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 2841 |  |
| `BaleLoader:baleLoaderMoveTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean, otherShapeId: integer)` | 2874 |  |
| `BaleLoader:mountDynamicBale(bale: any, node: any)` | 2901 |  |
| `BaleLoader:unmountDynamicBale(bale: any)` | 2956 |  |
| `BaleLoader:mountBale(bale: any, object: any, node: any, x: any, y: any, z: any, rx: any, ry: any, rz: any, noKinematicMounting: any)` | 2978 |  |
| `BaleLoader:unmountBale(bale: any)` | 3003 |  |
| `BaleLoader:setBalePairCollision(bale: any, state: any)` | 3019 |  |
| `BaleLoader:getLoadedBales()` | 3033 |  |
| `BaleLoader:startAutomaticBaleUnloading()` | 3060 |  |
| `BaleLoader:getIsAutomaticBaleUnloadingInProgress()` | 3073 |  |
| `BaleLoader:getIsAutomaticBaleUnloadingAllowed()` | 3079 |  |
| `BaleLoader:playBaleLoaderFoldingAnimation(speed: any)` | 3097 |  |
| `BaleLoader:getIsBaleLoaderFoldingPlaying()` | 3104 |  |
| `BaleLoader:getCurrentFoldingAnimation()` | 3110 |  |
| `BaleLoader:updateFoldingAnimation()` | 3122 |  |
| `BaleLoader:onBaleMoverBaleRemoved(bale: any)` | 3157 |  |
| `BaleLoader.onBaleUnloadTriggerDeleted(self: any, unloadTrigger: any)` | 3164 |  |
| `BaleLoader:addBaleUnloadTrigger(unloadTrigger: any)` | 3173 |  |
| `BaleLoader:removeBaleUnloadTrigger(unloadTrigger: any)` | 3182 |  |
| `BaleLoader:getCanBeSelected(superFunc: any)` | 3194 |  |
| `BaleLoader:getAllowDynamicMountFillLevelInfo(superFunc: any)` | 3200 |  |
| `BaleLoader:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 3213 |  |
| `BaleLoader:getIsAIReadyToDrive(superFunc: any)` | 3223 |  |
| `BaleLoader:getIsAIPreparingToDrive(superFunc: any)` | 3234 |  |
| `BaleLoader:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 3245 |  |
| `BaleLoader:getDoConsumePtoPower(superFunc: any) → boolean` | 3257 |  |
| `BaleLoader:getConsumingLoad(superFunc: any)` | 3268 |  |
| `BaleLoader:getIsPowerTakeOffActive(superFunc: any)` | 3282 |  |
| `BaleLoader:addToPhysics(superFunc: any) → boolean` | 3294 |  |
| `BaleLoader:removeFromPhysics(superFunc: any) → boolean` | 3341 |  |
| `BaleLoader:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 3382 |  |
| `BaleLoader.actionEventEmpty(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3408 |  |
| `BaleLoader.actionEventAbortEmpty(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3419 |  |
| `BaleLoader.actionEventWorkTransport(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3425 |  |
| `BaleLoader.loadSpecValueBaleSize(xmlFile: any, customEnvironment: any, baseDir: any, roundBaleLoader: any)` | 3431 |  |
| `BaleLoader.getSpecValueBaleSize(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any, roundBaleLoader: any)` | 3464 |  |
| `BaleLoader.loadSpecValueBaleSizeRound(xmlFile: any, customEnvironment: any, baseDir: any)` | 3500 |  |
| `BaleLoader.loadSpecValueBaleSizeSquare(xmlFile: any, customEnvironment: any, baseDir: any)` | 3506 |  |
| `BaleLoader.getSpecValueBaleSizeRound(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 3512 |  |
| `BaleLoader.getSpecValueBaleSizeSquare(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 3522 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadBaleTypeFromXML` | 278 |
| registerFunction | `loadBalePlacesFromXML` | 279 |
| registerFunction | `loadBaleLoaderAnimationsFromXML` | 280 |
| registerFunction | `createBaleToBaleJoints` | 282 |
| registerFunction | `createBaleToBaleJoint` | 283 |
| registerFunction | `doStateChange` | 284 |
| registerFunction | `getBaleGrabberDropBaleAnimName` | 285 |
| registerFunction | `getIsBaleGrabbingAllowed` | 286 |
| registerFunction | `pickupBale` | 287 |
| registerFunction | `setBaleLoaderBaleType` | 288 |
| registerFunction | `getBaleTypeByBale` | 289 |
| registerFunction | `baleGrabberTriggerCallback` | 290 |
| registerFunction | `baleLoaderMoveTriggerCallback` | 291 |
| registerFunction | `mountDynamicBale` | 292 |
| registerFunction | `unmountDynamicBale` | 293 |
| registerFunction | `mountBale` | 294 |
| registerFunction | `unmountBale` | 295 |
| registerFunction | `setBalePairCollision` | 296 |
| registerFunction | `getLoadedBales` | 297 |
| registerFunction | `startAutomaticBaleUnloading` | 298 |
| registerFunction | `getIsAutomaticBaleUnloadingInProgress` | 299 |
| registerFunction | `getIsAutomaticBaleUnloadingAllowed` | 300 |
| registerFunction | `playBaleLoaderFoldingAnimation` | 301 |
| registerFunction | `getIsBaleLoaderFoldingPlaying` | 302 |
| registerFunction | `getCurrentFoldingAnimation` | 303 |
| registerFunction | `updateFoldingAnimation` | 304 |
| registerFunction | `onBaleMoverBaleRemoved` | 305 |
| registerFunction | `addBaleUnloadTrigger` | 306 |
| registerFunction | `removeBaleUnloadTrigger` | 307 |
| registerOverwrittenFunction | `getCanBeSelected` | 313 |
| registerOverwrittenFunction | `getAllowDynamicMountFillLevelInfo` | 314 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 315 |
| registerOverwrittenFunction | `getIsAIReadyToDrive` | 316 |
| registerOverwrittenFunction | `getIsAIPreparingToDrive` | 317 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 318 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 319 |
| registerOverwrittenFunction | `getConsumingLoad` | 320 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 321 |
| registerOverwrittenFunction | `addToPhysics` | 322 |
| registerOverwrittenFunction | `removeFromPhysics` | 323 |
| registerEventListener | `onLoad` | 329 |
| registerEventListener | `onPostLoad` | 330 |
| registerEventListener | `onLoadFinished` | 331 |
| registerEventListener | `onDelete` | 332 |
| registerEventListener | `onReadUpdateStream` | 333 |
| registerEventListener | `onWriteUpdateStream` | 334 |
| registerEventListener | `onReadStream` | 335 |
| registerEventListener | `onWriteStream` | 336 |
| registerEventListener | `onUpdate` | 337 |
| registerEventListener | `onUpdateTick` | 338 |
| registerEventListener | `onDraw` | 339 |
| registerEventListener | `onRegisterActionEvents` | 340 |
| registerEventListener | `onActivate` | 341 |
| registerEventListener | `onDeactivate` | 342 |
| registerEventListener | `onRootVehicleChanged` | 343 |
| registerEventListener | `onFillUnitFillLevelChanged` | 344 |
| registerEventListener | `onFoldStateChanged` | 345 |
| registerEventListener | `onBalerUnloadingStarted` | 346 |
| registerEventListener | `onRegisterAnimationValueTypes` | 347 |
