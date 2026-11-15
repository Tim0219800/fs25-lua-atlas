# vehicles/specializations/AttacherJoints.lua

Source: `dataS/scripts/vehicles/specializations/AttacherJoints.lua` — FS25 1.25.1.0

- **AttacherJoints** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `AttacherJoints.getClosestLowerLinkCategoryIndex(width: any) → integer` | 40 |  |
| `AttacherJoints.initSpecialization()` | 55 |  |
| `AttacherJoints.registerAttacherJointXMLPaths(schema: any, baseName: any)` | 119 |  |
| `AttacherJoints.registerJointType(name: string)` | 261 |  |
| `AttacherJoints.prerequisitesPresent(specializations: any)` | 297 |  |
| `AttacherJoints.registerEvents(vehicleType: any)` | 303 |  |
| `AttacherJoints.registerFunctions(vehicleType: any)` | 313 |  |
| `AttacherJoints.registerOverwrittenFunctions(vehicleType: any)` | 381 |  |
| `AttacherJoints.registerEventListeners(vehicleType: any)` | 423 |  |
| `AttacherJoints:onPreLoad(savegame: table)` | 456 |  |
| `AttacherJoints:onLoad(savegame: table)` | 467 |  |
| `AttacherJoints:onPostLoad(savegame: table)` | 572 |  |
| `AttacherJoints:onLoadFinished(savegame: table)` | 687 |  |
| `AttacherJoints:onRegisterDashboardValueTypes()` | 730 |  |
| `AttacherJoints:onPreDelete()` | 823 |  |
| `AttacherJoints:onDelete()` | 839 |  |
| `AttacherJoints:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 867 |  |
| `AttacherJoints:onReadStream(streamId: integer, connection: Connection)` | 905 |  |
| `AttacherJoints:onWriteStream(streamId: integer, connection: Connection)` | 923 |  |
| `AttacherJoints:onUpdateInterpolation(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 946 |  |
| `AttacherJoints:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 976 |  |
| `AttacherJoints:onUpdateEnd(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 1001 |  |
| `AttacherJoints:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1019 |  |
| `AttacherJoints:loadAttachmentsFinished()` | 1214 |  |
| `AttacherJoints:handleLowerImplementEvent(vehicle: any, direction: any)` | 1231 |  |
| `AttacherJoints:handleLowerImplementByAttacherJointIndex(attacherJointIndex: any, direction: any)` | 1257 |  |
| `AttacherJoints:getAttachedImplements()` | 1280 |  |
| `AttacherJoints:getAttacherJoints()` | 1286 |  |
| `AttacherJoints:getAttacherJointByJointDescIndex(jointDescIndex: any)` | 1292 |  |
| `AttacherJoints:getAttacherJointIndexByNode(node: any)` | 1298 |  |
| `AttacherJoints:getAttacherJointByNode(node: any)` | 1312 |  |
| `AttacherJoints:getImplementFromAttacherJointIndex(attacherJointIndex: any)` | 1326 |  |
| `AttacherJoints:getAttacherJointIndexFromObject(object: any)` | 1339 |  |
| `AttacherJoints:getAttacherJointDescFromObject(object: any)` | 1352 |  |
| `AttacherJoints:getAttacherJointIndexFromImplementIndex(implementIndex: any)` | 1365 |  |
| `AttacherJoints:getObjectFromImplementIndex(implementIndex: any)` | 1376 |  |
| `AttacherJoints:updateAttacherJointGraphics(implement: table, dt: number, forceUpdate: any)` | 1389 |  |
| `AttacherJoints:calculateAttacherJointMoveUpperLowerAlpha(jointDesc: table, object: table, initial: boolean)` | 1527 |  |
| `AttacherJoints:doGroundHeightNodeCheck()` | 1629 |  |
| `AttacherJoints:finishGroundHeightNodeCheck()` | 1680 |  |
| `AttacherJoints:groundHeightNodeCheckCallback(hitObjectId: integer, x: number, y: number, z: number, distance: number, nx: number, ny: number, nz: number, subShapeIndex: integer, shapeId: integer, isLast: boolean) → boolean` | 1743 |  |
| `AttacherJoints:updateAttacherJointRotation(jointDesc: table, object: table)` | 1794 |  |
| `AttacherJoints:updateAttacherJointRotationNodes(jointDesc: any, alpha: any)` | 1808 |  |
| `AttacherJoints:updateAttacherJointSettingsByObject(vehicle: any, updateLimit: any, updateRotationOffset: any, updateDistanceToGround: any)` | 1819 |  |
| `AttacherJoints:setAttacherJointBottomArmWidth(jointDescIndex: any, width: any)` | 1857 |  |
| `AttacherJoints:attachImplementFromInfo(info: any)` | 1907 |  |
| `AttacherJoints:postAttachImplement(implement: any)` | 2214 |  |
| `AttacherJoints:createAttachmentJoint(implement: table, noSmoothAttach: boolean)` | 2276 |  |
| `AttacherJoints:hardAttachImplement(implement: table)` | 2448 |  |
| `AttacherJoints:hardDetachImplement(implement: table)` | 2547 |  |
| `AttacherJoints:detachImplement(implementIndex: integer, noEventSend: boolean) → boolean` | 2605 |  |
| `AttacherJoints:detachImplementByObject(object: table, noEventSend: boolean) → boolean` | 2820 |  |
| `AttacherJoints:setSelectedImplementByObject(object: any)` | 2835 |  |
| `AttacherJoints:getSelectedImplement()` | 2841 |  |
| `AttacherJoints:getCanToggleAttach()` | 2856 |  |
| `AttacherJoints:getShowAttachControlBarAction()` | 2866 |  |
| `AttacherJoints:detachAttachedImplement()` | 2894 |  |
| `AttacherJoints:startAttacherJointCombo(force: any)` | 2902 |  |
| `AttacherJoints:getIsAttachingAllowed(attacherJoint: any)` | 2921 |  |
| `AttacherJoints:getIsAttacherJointCompatible(vehicle: any, attacherJoint: any, inputAttacherVehicle: any, inputAttacherJoint: any)` | 2944 |  |
| `AttacherJoints:getCanSteerAttachable(attachable: table) → boolean` | 2952 |  |
| `AttacherJoints:onAttacherJointsVehicleLoaded(vehicle: table)` | 2966 |  |
| `AttacherJoints:registerSelfLoweringActionEvent(actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any, ignoreCollisions: any)` | 2993 |  |
| `AttacherJoints:playAttachSound(jointDesc: table) → boolean` | 3000 |  |
| `AttacherJoints:playDetachSound(jointDesc: table) → boolean` | 3018 |  |
| `AttacherJoints:detachingIsPossible() → boolean` | 3039 |  |
| `AttacherJoints:attachAdditionalAttachment(jointDesc: any, inputJointDesc: any, object: any)` | 3055 |  |
| `AttacherJoints:detachAdditionalAttachment(jointDesc: any, inputJointDesc: any)` | 3103 |  |
| `AttacherJoints:additionalAttachmentLoaded(vehicles: any, vehicleLoadState: any, asyncCallbackArguments: any)` | 3121 |  |
| `AttacherJoints:getImplementIndexByJointDescIndex(jointDescIndex: integer) → integer` | 3161 |  |
| `AttacherJoints:getImplementByJointDescIndex(jointDescIndex: integer) → table` | 3177 |  |
| `AttacherJoints:getImplementIndexByObject(object: table) → integer` | 3193 |  |
| `AttacherJoints:getImplementByObject(object: table) → table` | 3209 |  |
| `AttacherJoints:callFunctionOnAllImplements(functionName: any, ...: any)` | 3223 |  |
| `AttacherJoints:activateAttachments()` | 3236 |  |
| `AttacherJoints:deactivateAttachments()` | 3248 |  |
| `AttacherJoints:deactivateAttachmentsLights()` | 3260 |  |
| `AttacherJoints:setJointMoveDown(jointDescIndex: integer, moveDown: boolean, noEventSend: boolean) → boolean` | 3276 |  |
| `AttacherJoints:getJointMoveDown(jointDescIndex: integer) → boolean` | 3306 |  |
| `AttacherJoints:getIsHardAttachAllowed(jointDescIndex: integer) → boolean` | 3319 |  |
| `AttacherJoints:getIsSmoothAttachUpdateAllowed(implement: any)` | 3327 |  |
| `AttacherJoints:loadAttacherJointFromXML(attacherJoint: table, xmlFile: integer, baseName: string, index: integer)` | 3337 |  |
| `AttacherJoints:onBottomArmToolbarI3DLoaded(i3dNode: integer, failedReason: table, args: table)` | 3791 |  |
| `AttacherJoints:raiseActive(superFunc: any)` | 3819 |  |
| `AttacherJoints:registerActionEvents(superFunc: any, excludedVehicle: any)` | 3832 |  |
| `AttacherJoints:removeActionEvents(superFunc: any)` | 3855 |  |
| `AttacherJoints:addToPhysics(superFunc: any) → boolean` | 3870 |  |
| `AttacherJoints:removeFromPhysics(superFunc: any) → boolean` | 3891 |  |
| `AttacherJoints:getTotalMass(superFunc: boolean, onlyGivenVehicle: boolean) → number` | 3917 |  |
| `AttacherJoints:getAdditionalComponentMass(superFunc: any, component: any)` | 3935 |  |
| `AttacherJoints:addChildVehicles(superFunc: table, vehicles: table, rootVehicle: any)` | 3954 |  |
| `AttacherJoints:getAirConsumerUsage(superFunc: any) → number` | 3970 |  |
| `AttacherJoints:getRequiresPower(superFunc: any)` | 3986 |  |
| `AttacherJoints:addVehicleToAIImplementList(superFunc: any, list: any)` | 4001 |  |
| `AttacherJoints:collectAIAgentAttachments(superFunc: any, aiDrivableVehicle: any)` | 4014 |  |
| `AttacherJoints:setAIVehicleObstacleStateDirty(superFunc: any)` | 4028 |  |
| `AttacherJoints:getDirectionSnapAngle(superFunc: any)` | 4041 |  |
| `AttacherJoints:getFillLevelInformation(superFunc: any, display: any)` | 4057 |  |
| `AttacherJoints:getHasObjectMounted(superFunc: table, object: table) → boolean` | 4074 |  |
| `AttacherJoints:attachableAddToolCameras(superFunc: any)` | 4093 |  |
| `AttacherJoints:attachableRemoveToolCameras(superFunc: any)` | 4107 |  |
| `AttacherJoints:registerSelectableObjects(superFunc: any, selectableObjects: any)` | 4121 |  |
| `AttacherJoints:getIsReadyForAutomatedTrainTravel(superFunc: any)` | 4135 |  |
| `AttacherJoints:getIsAutomaticShiftingAllowed(superFunc: any)` | 4151 |  |
| `AttacherJoints:loadDashboardGroupFromXML(superFunc: any, xmlFile: any, key: any, group: any)` | 4180 |  |
| `AttacherJoints:getIsDashboardGroupActive(superFunc: any, group: any)` | 4208 |  |
| `AttacherJoints:loadAttacherJointHeightNode(superFunc: any, xmlFile: any, key: any, heightNode: any, attacherJointNode: any)` | 4246 |  |
| `AttacherJoints:getIsAttacherJointHeightNodeActive(superFunc: any, heightNode: any)` | 4254 |  |
| `AttacherJoints:loadTipSide(superFunc: any, xmlFile: any, key: any, entry: any)` | 4266 |  |
| `AttacherJoints:getIsTipSideAvailable(superFunc: any, sideIndex: any)` | 4281 |  |
| `AttacherJoints:loadFillUnitFromXML(superFunc: any, xmlFile: any, key: any, entry: any, index: any)` | 4317 |  |
| `AttacherJoints:getFillUnitSupportsToolType(superFunc: any, fillUnitIndex: any, toolType: any)` | 4333 |  |
| `AttacherJoints:isDetachAllowed(superFunc: any) → boolean` | 4370 |  |
| `AttacherJoints:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 4396 |  |
| `AttacherJoints:getIsWheelFoliageDestructionAllowed(superFunc: any, wheel: any) → boolean` | 4412 |  |
| `AttacherJoints:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 4436 |  |
| `AttacherJoints:getConnectionHoseConfigIndex(superFunc: any)` | 4464 |  |
| `AttacherJoints:getPowerTakeOffConfigIndex(superFunc: any)` | 4478 |  |
| `AttacherJoints:loadHoseTargetNode(superFunc: any, xmlFile: any, targetKey: any, entry: any)` | 4492 |  |
| `AttacherJoints:getIsConnectionTargetUsed(superFunc: any, desc: any)` | 4507 |  |
| `AttacherJoints:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 4529 |  |
| `AttacherJoints:onActivate()` | 4580 |  |
| `AttacherJoints:onDeactivate()` | 4586 |  |
| `AttacherJoints:onReverseDirectionChanged(direction: any)` | 4597 |  |
| `AttacherJoints:onStateChange(state: any, data: any)` | 4614 |  |
| `AttacherJoints:onLightsTypesMaskChanged(lightsTypesMask: any)` | 4632 |  |
| `AttacherJoints:onTurnLightStateChanged(state: any)` | 4648 |  |
| `AttacherJoints:onBrakeLightsVisibilityChanged(visibility: any)` | 4660 |  |
| `AttacherJoints:onReverseLightsVisibilityChanged(visibility: any)` | 4672 |  |
| `AttacherJoints:onBeaconLightsVisibilityChanged(visibility: any)` | 4684 |  |
| `AttacherJoints:onBrake(brakePedal: any)` | 4696 |  |
| `AttacherJoints:onTurnedOn()` | 4708 |  |
| `AttacherJoints:onTurnedOff()` | 4725 |  |
| `AttacherJoints:onLeaveVehicle()` | 4742 |  |
| `AttacherJoints.getAttacherJointCompatibility(vehicle: any, attacherJoint: any, inputAttacherVehicle: any, inputAttacherJoint: any)` | 4761 |  |
| `AttacherJoints.findVehicleInAttachRange()` | 4858 |  |
| `AttacherJoints.updateVehiclesInAttachRange(vehicle: any, maxDistanceSq: any, maxAngle: any, fullUpdate: any)` | 4864 |  |
| `AttacherJoints.actionEventAttach(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 4976 |  |
| `AttacherJoints.actionEventDetach(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 5009 |  |
| `AttacherJoints.actionEventLowerImplement(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 5024 |  |
| `AttacherJoints.actionEventLowerAllImplements(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 5033 |  |
| `AttacherJoints.updateActionEvents(self: any)` | 5041 |  |
| `AttacherJoints.updateAttacherJointLimits(implement: any, attacherJointDesc: any, inputAttacherJointDesc: any, axis: any)` | 5112 |  |
| `AttacherJoints.updateAttacherJointRotationLimit(implement: any, attacherJointDesc: any, axis: any, force: any, alpha: any)` | 5150 |  |
| `AttacherJoints.updateAttacherJointTranslationLimit(implement: any, attacherJointDesc: any, axis: any, force: any, alpha: any)` | 5179 |  |
| `AttacherJoints.updateRequiredTopLightsState(self: any)` | 5202 |  |
| `AttacherJoints.consoleCommandBottomArmWidth(_: any, category: any, width: any)` | 5219 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onPreAttachImplement` | 304 |
| registerEvent | `onPostAttachImplement` | 305 |
| registerEvent | `onPreDetachImplement` | 306 |
| registerEvent | `onPostDetachImplement` | 307 |
| registerEvent | `onRequiresTopLightsChanged` | 308 |
| registerFunction | `loadAttachmentsFinished` | 314 |
| registerFunction | `handleLowerImplementEvent` | 315 |
| registerFunction | `handleLowerImplementByAttacherJointIndex` | 316 |
| registerFunction | `getAttachedImplements` | 317 |
| registerFunction | `getAttacherJoints` | 318 |
| registerFunction | `getAttacherJointByJointDescIndex` | 319 |
| registerFunction | `getAttacherJointIndexByNode` | 320 |
| registerFunction | `getAttacherJointByNode` | 321 |
| registerFunction | `getImplementFromAttacherJointIndex` | 322 |
| registerFunction | `getAttacherJointIndexFromObject` | 323 |
| registerFunction | `getAttacherJointDescFromObject` | 324 |
| registerFunction | `getAttacherJointIndexFromImplementIndex` | 325 |
| registerFunction | `getObjectFromImplementIndex` | 326 |
| registerFunction | `updateAttacherJointGraphics` | 327 |
| registerFunction | `calculateAttacherJointMoveUpperLowerAlpha` | 328 |
| registerFunction | `doGroundHeightNodeCheck` | 329 |
| registerFunction | `finishGroundHeightNodeCheck` | 330 |
| registerFunction | `groundHeightNodeCheckCallback` | 331 |
| registerFunction | `updateAttacherJointRotation` | 332 |
| registerFunction | `updateAttacherJointRotationNodes` | 333 |
| registerFunction | `updateAttacherJointSettingsByObject` | 334 |
| registerFunction | `setAttacherJointBottomArmWidth` | 335 |
| registerFunction | `attachImplementFromInfo` | 336 |
| registerFunction | `attachImplement` | 337 |
| registerFunction | `postAttachImplement` | 338 |
| registerFunction | `createAttachmentJoint` | 339 |
| registerFunction | `hardAttachImplement` | 340 |
| registerFunction | `hardDetachImplement` | 341 |
| registerFunction | `detachImplement` | 342 |
| registerFunction | `detachImplementByObject` | 343 |
| registerFunction | `playAttachSound` | 344 |
| registerFunction | `playDetachSound` | 345 |
| registerFunction | `detachingIsPossible` | 346 |
| registerFunction | `attachAdditionalAttachment` | 347 |
| registerFunction | `detachAdditionalAttachment` | 348 |
| registerFunction | `getImplementIndexByJointDescIndex` | 349 |
| registerFunction | `getImplementByJointDescIndex` | 350 |
| registerFunction | `getImplementIndexByObject` | 351 |
| registerFunction | `getImplementByObject` | 352 |
| registerFunction | `callFunctionOnAllImplements` | 353 |
| registerFunction | `activateAttachments` | 354 |
| registerFunction | `deactivateAttachments` | 355 |
| registerFunction | `deactivateAttachmentsLights` | 356 |
| registerFunction | `setJointMoveDown` | 357 |
| registerFunction | `getJointMoveDown` | 358 |
| registerFunction | `getIsHardAttachAllowed` | 359 |
| registerFunction | `getIsSmoothAttachUpdateAllowed` | 360 |
| registerFunction | `loadAttacherJointFromXML` | 361 |
| registerFunction | `onBottomArmToolbarI3DLoaded` | 362 |
| registerFunction | `setSelectedImplementByObject` | 363 |
| registerFunction | `getSelectedImplement` | 364 |
| registerFunction | `getCanToggleAttach` | 365 |
| registerFunction | `getShowAttachControlBarAction` | 366 |
| registerFunction | `getAttachControlBarActionAccessible` | 367 |
| registerFunction | `detachAttachedImplement` | 368 |
| registerFunction | `startAttacherJointCombo` | 369 |
| registerFunction | `registerSelfLoweringActionEvent` | 370 |
| registerFunction | `getIsAttachingAllowed` | 371 |
| registerFunction | `getIsAttacherJointCompatible` | 372 |
| registerFunction | `getCanSteerAttachable` | 373 |
| registerFunction | `onAttacherJointsVehicleLoaded` | 374 |
| registerFunction | `getAttachableInfo` | 375 |
| registerFunction | `setAttacherJointBlocked` | 376 |
| registerOverwrittenFunction | `raiseActive` | 382 |
| registerOverwrittenFunction | `registerActionEvents` | 383 |
| registerOverwrittenFunction | `removeActionEvents` | 384 |
| registerOverwrittenFunction | `addToPhysics` | 385 |
| registerOverwrittenFunction | `removeFromPhysics` | 386 |
| registerOverwrittenFunction | `getTotalMass` | 387 |
| registerOverwrittenFunction | `getAdditionalComponentMass` | 388 |
| registerOverwrittenFunction | `addChildVehicles` | 389 |
| registerOverwrittenFunction | `getAirConsumerUsage` | 390 |
| registerOverwrittenFunction | `getRequiresPower` | 391 |
| registerOverwrittenFunction | `addVehicleToAIImplementList` | 392 |
| registerOverwrittenFunction | `collectAIAgentAttachments` | 393 |
| registerOverwrittenFunction | `setAIVehicleObstacleStateDirty` | 394 |
| registerOverwrittenFunction | `getDirectionSnapAngle` | 395 |
| registerOverwrittenFunction | `getFillLevelInformation` | 396 |
| registerOverwrittenFunction | `getHasObjectMounted` | 397 |
| registerOverwrittenFunction | `attachableAddToolCameras` | 398 |
| registerOverwrittenFunction | `attachableRemoveToolCameras` | 399 |
| registerOverwrittenFunction | `registerSelectableObjects` | 400 |
| registerOverwrittenFunction | `getIsReadyForAutomatedTrainTravel` | 401 |
| registerOverwrittenFunction | `getIsAutomaticShiftingAllowed` | 402 |
| registerOverwrittenFunction | `loadDashboardGroupFromXML` | 403 |
| registerOverwrittenFunction | `getIsDashboardGroupActive` | 404 |
| registerOverwrittenFunction | `loadAttacherJointHeightNode` | 405 |
| registerOverwrittenFunction | `getIsAttacherJointHeightNodeActive` | 406 |
| registerOverwrittenFunction | `loadTipSide` | 407 |
| registerOverwrittenFunction | `getIsTipSideAvailable` | 408 |
| registerOverwrittenFunction | `loadFillUnitFromXML` | 409 |
| registerOverwrittenFunction | `getFillUnitSupportsToolType` | 410 |
| registerOverwrittenFunction | `isDetachAllowed` | 411 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 412 |
| registerOverwrittenFunction | `getIsWheelFoliageDestructionAllowed` | 413 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 414 |
| registerOverwrittenFunction | `getConnectionHoseConfigIndex` | 415 |
| registerOverwrittenFunction | `getPowerTakeOffConfigIndex` | 416 |
| registerOverwrittenFunction | `loadHoseTargetNode` | 417 |
| registerOverwrittenFunction | `getIsConnectionTargetUsed` | 418 |
| registerEventListener | `onPreLoad` | 424 |
| registerEventListener | `onLoad` | 425 |
| registerEventListener | `onPostLoad` | 426 |
| registerEventListener | `onLoadFinished` | 427 |
| registerEventListener | `onRegisterDashboardValueTypes` | 428 |
| registerEventListener | `onPreDelete` | 429 |
| registerEventListener | `onDelete` | 430 |
| registerEventListener | `onReadStream` | 431 |
| registerEventListener | `onWriteStream` | 432 |
| registerEventListener | `onUpdateInterpolation` | 433 |
| registerEventListener | `onUpdate` | 434 |
| registerEventListener | `onUpdateEnd` | 435 |
| registerEventListener | `onUpdateTick` | 436 |
| registerEventListener | `onRegisterActionEvents` | 437 |
| registerEventListener | `onStateChange` | 438 |
| registerEventListener | `onLightsTypesMaskChanged` | 439 |
| registerEventListener | `onTurnLightStateChanged` | 440 |
| registerEventListener | `onBrakeLightsVisibilityChanged` | 441 |
| registerEventListener | `onReverseLightsVisibilityChanged` | 442 |
| registerEventListener | `onBeaconLightsVisibilityChanged` | 443 |
| registerEventListener | `onBrake` | 444 |
| registerEventListener | `onTurnedOn` | 445 |
| registerEventListener | `onTurnedOff` | 446 |
| registerEventListener | `onLeaveVehicle` | 447 |
| registerEventListener | `onActivate` | 448 |
| registerEventListener | `onDeactivate` | 449 |
| registerEventListener | `onReverseDirectionChanged` | 450 |

## Messages

- subscribes `MessageType.VEHICLE_LOADED` (l.723)
