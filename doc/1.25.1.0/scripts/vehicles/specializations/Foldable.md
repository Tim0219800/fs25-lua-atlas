# vehicles/specializations/Foldable.lua

Source: `dataS/scripts/vehicles/specializations/Foldable.lua` — FS25 1.25.1.0

- **Foldable** (l.13)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Foldable.prerequisitesPresent(specializations: any)` | 17 |  |
| `Foldable.initSpecialization()` | 23 |  |
| `Foldable.registerFoldingXMLPaths(schema: any, basePath: any)` | 157 |  |
| `Foldable.registerEvents(vehicleType: any)` | 227 |  |
| `Foldable.registerFunctions(vehicleType: any)` | 234 |  |
| `Foldable.registerOverwrittenFunctions(vehicleType: any)` | 251 |  |
| `Foldable.registerEventListeners(vehicleType: any)` | 330 |  |
| `Foldable:onLoad(savegame: any)` | 352 |  |
| `Foldable:onPostLoad(savegame: any)` | 488 |  |
| `Foldable:onRegistered()` | 509 |  |
| `Foldable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 520 |  |
| `Foldable:onReadStream(streamId: any, connection: any)` | 530 |  |
| `Foldable:onWriteStream(streamId: any, connection: any)` | 540 |  |
| `Foldable:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 551 |  |
| `Foldable:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 675 |  |
| `Foldable:loadFoldingPartFromXML(xmlFile: table, baseKey: string, foldingPart: table) → boolean` | 710 |  |
| `Foldable:setFoldDirection(direction: any, noEventSend: any)` | 810 |  |
| `Foldable:setFoldState(direction: any, moveToMiddle: any, noEventSend: any)` | 816 |  |
| `Foldable:setFoldMiddleState(doLowering: any)` | 921 |  |
| `Foldable:getIsUnfolded()` | 936 |  |
| `Foldable:getFoldAnimTime()` | 962 |  |
| `Foldable:setIsFoldActionAllowed(isAllowed: boolean)` | 970 |  |
| `Foldable:getIsFoldActionAllowed() → boolean` | 977 |  |
| `Foldable:getIsFoldAllowed(direction: integer, onAiTurnOn: boolean) → boolean, string` | 987 |  |
| `Foldable:getIsFoldMiddleAllowed()` | 1014 |  |
| `Foldable:getToggledFoldDirection()` | 1026 |  |
| `Foldable:getToggledFoldMiddleDirection()` | 1071 |  |
| `Foldable.getIsVehicleControlAllowed(self: any)` | 1098 |  |
| `Foldable:allowLoadMovingToolStates(superFunc: any)` | 1109 |  |
| `Foldable:loadSpeedRotatingPartFromXML(superFunc: any, speedRotatingPart: any, xmlFile: any, key: any)` | 1121 |  |
| `Foldable:getIsSpeedRotatingPartActive(superFunc: any, speedRotatingPart: any)` | 1141 |  |
| `Foldable:loadSlopeCompensationNodeFromXML(superFunc: any, compensationNode: any, xmlFile: any, key: any)` | 1159 |  |
| `Foldable:getSlopeCompensationAngleScale(superFunc: any, compensationNode: any)` | 1168 |  |
| `Foldable:loadWheelFromXML(superFunc: any, wheel: any)` | 1190 |  |
| `Foldable:getIsVersatileYRotActive(superFunc: any, wheel: any)` | 1199 |  |
| `Foldable:loadWorkAreaFromXML(superFunc: any, workArea: any, xmlFile: any, key: any)` | 1211 |  |
| `Foldable:getIsWorkAreaActive(superFunc: any, workArea: any)` | 1231 |  |
| `Foldable:loadGroundReferenceNode(superFunc: any, xmlFile: any, key: any, groundReferenceNode: any)` | 1249 |  |
| `Foldable:updateGroundReferenceNode(superFunc: any, groundReferenceNode: any)` | 1262 |  |
| `Foldable:loadLevelerNodeFromXML(superFunc: any, levelerNode: any, xmlFile: any, key: any)` | 1273 |  |
| `Foldable:getIsLevelerPickupNodeActive(superFunc: any, levelerNode: any)` | 1289 |  |
| `Foldable:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1307 |  |
| `Foldable:getIsMovingToolActive(superFunc: any, movingTool: any)` | 1340 |  |
| `Foldable:loadMovingPartFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1355 |  |
| `Foldable:getIsMovingPartActive(superFunc: any, movingPart: any)` | 1368 |  |
| `Foldable:getCanBeTurnedOn(superFunc: any)` | 1381 |  |
| `Foldable:getIsNextCoverStateAllowed(superFunc: any, nextState: any)` | 1392 |  |
| `Foldable:getIsNextCoverStateAllowedWarning(superFunc: any, nextState: any)` | 1407 |  |
| `Foldable:getIsInWorkPosition(superFunc: any)` | 1418 |  |
| `Foldable:getTurnedOnNotAllowedWarning(superFunc: any)` | 1430 |  |
| `Foldable:isDetachAllowed(superFunc: any) → boolean, string` | 1444 |  |
| `Foldable:isAttachAllowed(superFunc: integer, farmId: integer, attacherVehicle: table) → boolean, string` | 1466 |  |
| `Foldable:getAllowsLowering(superFunc: any) → boolean, string` | 1480 |  |
| `Foldable:getIsLowered(superFunc: any, default: any)` | 1492 |  |
| `Foldable:registerLoweringActionEvent(superFunc: any, actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any, ignoreCollisions: any)` | 1535 |  |
| `Foldable:registerSelfLoweringActionEvent(superFunc: any, actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any, ignoreCollisions: any)` | 1563 |  |
| `Foldable:loadGroundAdjustedNodeFromXML(superFunc: any, xmlFile: any, key: any, adjustedNode: any)` | 1569 |  |
| `Foldable:getIsGroundAdjustedNodeActive(superFunc: any, adjustedNode: any, ignoreAttachState: any)` | 1585 |  |
| `Foldable:loadSprayTypeFromXML(superFunc: any, xmlFile: any, key: any, sprayType: any)` | 1598 |  |
| `Foldable:getIsSprayTypeActive(superFunc: any, sprayType: any)` | 1627 |  |
| `Foldable:getCanBeSelected(superFunc: any)` | 1646 |  |
| `Foldable:loadInputAttacherJoint(superFunc: any, xmlFile: any, key: any, inputAttacherJoint: any, index: any)` | 1652 |  |
| `Foldable:getIsInputAttacherActive(superFunc: table, inputAttacherJoint: table) → boolean` | 1663 |  |
| `Foldable:loadAdditionalCharacterFromXML(superFunc: any, xmlFile: any)` | 1676 |  |
| `Foldable:getIsAdditionalCharacterActive(superFunc: any)` | 1687 |  |
| `Foldable:getAllowDynamicMountObjects(superFunc: any)` | 1701 |  |
| `Foldable:loadSupportAnimationFromXML(superFunc: table, supportAnimation: integer, xmlFile: integer, key: string)` | 1716 |  |
| `Foldable:getIsSupportAnimationAllowed(superFunc: any, supportAnimation: any)` | 1728 |  |
| `Foldable:loadSteeringAxleFromXML(superFunc: any, spec: any, xmlFile: any, key: any)` | 1739 |  |
| `Foldable:getIsSteeringAxleAllowed(superFunc: any)` | 1751 |  |
| `Foldable:loadFillUnitFromXML(superFunc: any, xmlFile: any, key: any, entry: any, index: any)` | 1763 |  |
| `Foldable:getFillUnitSupportsToolType(superFunc: any, fillUnitIndex: any, toolType: any)` | 1772 |  |
| `Foldable:loadTurnedOnAnimationFromXML(superFunc: any, xmlFile: any, key: any, turnedOnAnimation: any)` | 1791 |  |
| `Foldable:getIsTurnedOnAnimationActive(superFunc: any, turnedOnAnimation: any)` | 1801 |  |
| `Foldable:loadAttacherJointHeightNode(superFunc: any, xmlFile: any, key: any, heightNode: any, attacherJointNode: any)` | 1812 |  |
| `Foldable:getIsAttacherJointHeightNodeActive(superFunc: any, heightNode: any)` | 1821 |  |
| `Foldable:loadPickupFromXML(superFunc: any, xmlFile: any, key: any, spec: any)` | 1832 |  |
| `Foldable:getCanChangePickupState(superFunc: any, spec: any, newState: any)` | 1841 |  |
| `Foldable:loadCutterTiltFromXML(superFunc: table, xmlFile: table, key: string, target: any) → boolean` | 1855 |  |
| `Foldable:getCutterTiltIsActive(superFunc: any, automaticTilt: any) → boolean, boolean` | 1870 |  |
| `Foldable:loadPreprunerNodeFromXML(superFunc: any, xmlFile: any, key: any, prunerNode: any)` | 1886 |  |
| `Foldable:getIsPreprunerNodeActive(superFunc: any, prunerNode: any)` | 1899 |  |
| `Foldable:loadShovelNode(superFunc: any, xmlFile: any, key: any, shovelNode: any)` | 1910 |  |
| `Foldable:getShovelNodeIsActive(superFunc: any, shovelNode: any)` | 1921 |  |
| `Foldable:loadSteeringAngleNodeFromXML(superFunc: any, entry: any, xmlFile: any, key: any)` | 1933 |  |
| `Foldable:updateSteeringAngleNode(superFunc: any, steeringAngleNode: any, angle: any, dt: any)` | 1946 |  |
| `Foldable:loadWoodHarvesterHeaderTiltFromXML(superFunc: any, headerTilt: any, xmlFile: any, key: any)` | 1957 |  |
| `Foldable:getIsWoodHarvesterTiltStateAllowed(superFunc: any, headerTilt: any)` | 1970 |  |
| `Foldable:loadSuspensionNodeFromXML(superFunc: any, xmlFile: any, key: any, suspensionNode: any)` | 1981 |  |
| `Foldable:getIsSuspensionNodeActive(superFunc: any, suspensionNode: any)` | 1994 |  |
| `Foldable:loadCrabSteeringModeFromXML(superFunc: any, xmlFile: any, key: any, mode: any)` | 2005 |  |
| `Foldable:getCrabSteeringModeAvailable(superFunc: any, mode: any)` | 2018 |  |
| `Foldable:getCanToggleCrabSteering(superFunc: any)` | 2029 |  |
| `Foldable:onLoadWheelChockFromXML(superFunc: any, wheelChock: any, xmlObject: any, key: any)` | 2041 |  |
| `Foldable:getIsWheelChockAllowed(superFunc: any, wheelChock: any)` | 2050 |  |
| `Foldable:loadCraneShovelFromXML(superFunc: any, spec: any, xmlFile: any, key: any)` | 2061 |  |
| `Foldable:getCraneShovelStateChangedAllowed(superFunc: any, spec: any)` | 2074 |  |
| `Foldable:getBrakeForce(superFunc: any)` | 2085 |  |
| `Foldable:getRequiresPower(superFunc: any)` | 2098 |  |
| `Foldable:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 2104 |  |
| `Foldable:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 2131 |  |
| `Foldable:getCanAIImplementContinueWork(superFunc: any, isTurning: any)` | 2142 |  |
| `Foldable:getIsAIReadyToDrive(superFunc: any)` | 2174 |  |
| `Foldable:getIsAIPreparingToDrive(superFunc: any)` | 2194 |  |
| `Foldable:onDeactivate()` | 2208 |  |
| `Foldable:onSetLoweredAll(doLowering: any, jointDescIndex: any)` | 2218 |  |
| `Foldable:onPostAttach(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 2224 |  |
| `Foldable:onRootVehicleChanged(rootVehicle: table)` | 2241 |  |
| `Foldable:actionControllerFoldEvent(direction: any)` | 2317 |  |
| `Foldable:actionControllerLowerEvent(direction: any)` | 2348 |  |
| `Foldable:actionControllerLowerEventAIStart(direction: any)` | 2381 |  |
| `Foldable:onPreDetach(attacherVehicle: table, implement: table)` | 2414 |  |
| `Foldable:onPreAttachImplement(object: table, inputJointDescIndex: table, jointDescIndex: any, loadFromSavegame: any)` | 2430 |  |
| `Foldable:onPreDetachImplement(implement: table)` | 2444 |  |
| `Foldable:onDynamicMountTypeChanged(dynamicMountType: any, mountObject: any)` | 2455 |  |
| `Foldable.setAnimTime(self: any, animTime: any, placeComponents: any, playSounds: any)` | 2463 |  |
| `Foldable.updateActionEventFold(self: any)` | 2520 |  |
| `Foldable.updateActionEventFoldMiddle(self: any)` | 2538 |  |
| `Foldable.actionEventFold(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2565 |  |
| `Foldable.actionEventFoldMiddle(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2601 |  |
| `Foldable.actionEventFoldAll(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2649 |  |
| `Foldable.externalActionEventRegister(data: any, vehicle: any)` | 2700 |  |
| `Foldable.externalActionEventUpdate(data: any, vehicle: any)` | 2727 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onFoldStateChanged` | 228 |
| registerEvent | `onFoldTimeChanged` | 229 |
| registerFunction | `loadFoldingPartFromXML` | 235 |
| registerFunction | `setFoldDirection` | 236 |
| registerFunction | `setFoldState` | 237 |
| registerFunction | `setFoldMiddleState` | 238 |
| registerFunction | `getIsUnfolded` | 239 |
| registerFunction | `getFoldAnimTime` | 240 |
| registerFunction | `setIsFoldActionAllowed` | 241 |
| registerFunction | `getIsFoldActionAllowed` | 242 |
| registerFunction | `getIsFoldAllowed` | 243 |
| registerFunction | `getIsFoldMiddleAllowed` | 244 |
| registerFunction | `getToggledFoldDirection` | 245 |
| registerFunction | `getToggledFoldMiddleDirection` | 246 |
| registerOverwrittenFunction | `allowLoadMovingToolStates` | 252 |
| registerOverwrittenFunction | `loadSpeedRotatingPartFromXML` | 253 |
| registerOverwrittenFunction | `getIsSpeedRotatingPartActive` | 254 |
| registerOverwrittenFunction | `loadSlopeCompensationNodeFromXML` | 255 |
| registerOverwrittenFunction | `getSlopeCompensationAngleScale` | 256 |
| registerOverwrittenFunction | `loadWheelFromXML` | 257 |
| registerOverwrittenFunction | `getIsVersatileYRotActive` | 258 |
| registerOverwrittenFunction | `loadWorkAreaFromXML` | 259 |
| registerOverwrittenFunction | `getIsWorkAreaActive` | 260 |
| registerOverwrittenFunction | `loadGroundReferenceNode` | 261 |
| registerOverwrittenFunction | `updateGroundReferenceNode` | 262 |
| registerOverwrittenFunction | `loadLevelerNodeFromXML` | 263 |
| registerOverwrittenFunction | `getIsLevelerPickupNodeActive` | 264 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 265 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 266 |
| registerOverwrittenFunction | `loadMovingPartFromXML` | 267 |
| registerOverwrittenFunction | `getIsMovingPartActive` | 268 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 269 |
| registerOverwrittenFunction | `getIsNextCoverStateAllowed` | 270 |
| registerOverwrittenFunction | `getIsNextCoverStateAllowedWarning` | 271 |
| registerOverwrittenFunction | `getIsInWorkPosition` | 272 |
| registerOverwrittenFunction | `getTurnedOnNotAllowedWarning` | 273 |
| registerOverwrittenFunction | `isDetachAllowed` | 274 |
| registerOverwrittenFunction | `isAttachAllowed` | 275 |
| registerOverwrittenFunction | `getAllowsLowering` | 276 |
| registerOverwrittenFunction | `getIsLowered` | 277 |
| registerOverwrittenFunction | `getCanAIImplementContinueWork` | 278 |
| registerOverwrittenFunction | `getIsAIReadyToDrive` | 279 |
| registerOverwrittenFunction | `getIsAIPreparingToDrive` | 280 |
| registerOverwrittenFunction | `registerLoweringActionEvent` | 281 |
| registerOverwrittenFunction | `registerSelfLoweringActionEvent` | 282 |
| registerOverwrittenFunction | `loadGroundAdjustedNodeFromXML` | 283 |
| registerOverwrittenFunction | `getIsGroundAdjustedNodeActive` | 284 |
| registerOverwrittenFunction | `loadSprayTypeFromXML` | 285 |
| registerOverwrittenFunction | `getIsSprayTypeActive` | 286 |
| registerOverwrittenFunction | `getCanBeSelected` | 287 |
| registerOverwrittenFunction | `loadInputAttacherJoint` | 288 |
| registerOverwrittenFunction | `getIsInputAttacherActive` | 289 |
| registerOverwrittenFunction | `loadAdditionalCharacterFromXML` | 290 |
| registerOverwrittenFunction | `getIsAdditionalCharacterActive` | 291 |
| registerOverwrittenFunction | `getAllowDynamicMountObjects` | 292 |
| registerOverwrittenFunction | `loadSupportAnimationFromXML` | 293 |
| registerOverwrittenFunction | `getIsSupportAnimationAllowed` | 294 |
| registerOverwrittenFunction | `loadSteeringAxleFromXML` | 295 |
| registerOverwrittenFunction | `getIsSteeringAxleAllowed` | 296 |
| registerOverwrittenFunction | `loadFillUnitFromXML` | 297 |
| registerOverwrittenFunction | `getFillUnitSupportsToolType` | 298 |
| registerOverwrittenFunction | `loadTurnedOnAnimationFromXML` | 299 |
| registerOverwrittenFunction | `getIsTurnedOnAnimationActive` | 300 |
| registerOverwrittenFunction | `loadAttacherJointHeightNode` | 301 |
| registerOverwrittenFunction | `getIsAttacherJointHeightNodeActive` | 302 |
| registerOverwrittenFunction | `loadPickupFromXML` | 303 |
| registerOverwrittenFunction | `getCanChangePickupState` | 304 |
| registerOverwrittenFunction | `loadCutterTiltFromXML` | 305 |
| registerOverwrittenFunction | `getCutterTiltIsActive` | 306 |
| registerOverwrittenFunction | `loadPreprunerNodeFromXML` | 307 |
| registerOverwrittenFunction | `getIsPreprunerNodeActive` | 308 |
| registerOverwrittenFunction | `loadShovelNode` | 309 |
| registerOverwrittenFunction | `getShovelNodeIsActive` | 310 |
| registerOverwrittenFunction | `loadSteeringAngleNodeFromXML` | 311 |
| registerOverwrittenFunction | `updateSteeringAngleNode` | 312 |
| registerOverwrittenFunction | `loadWoodHarvesterHeaderTiltFromXML` | 313 |
| registerOverwrittenFunction | `getIsWoodHarvesterTiltStateAllowed` | 314 |
| registerOverwrittenFunction | `loadSuspensionNodeFromXML` | 315 |
| registerOverwrittenFunction | `getIsSuspensionNodeActive` | 316 |
| registerOverwrittenFunction | `loadCrabSteeringModeFromXML` | 317 |
| registerOverwrittenFunction | `getCrabSteeringModeAvailable` | 318 |
| registerOverwrittenFunction | `getCanToggleCrabSteering` | 319 |
| registerOverwrittenFunction | `onLoadWheelChockFromXML` | 320 |
| registerOverwrittenFunction | `getIsWheelChockAllowed` | 321 |
| registerOverwrittenFunction | `loadCraneShovelFromXML` | 322 |
| registerOverwrittenFunction | `getCraneShovelStateChangedAllowed` | 323 |
| registerOverwrittenFunction | `getBrakeForce` | 324 |
| registerOverwrittenFunction | `getRequiresPower` | 325 |
| registerEventListener | `onLoad` | 331 |
| registerEventListener | `onPostLoad` | 332 |
| registerEventListener | `onRegistered` | 333 |
| registerEventListener | `onReadStream` | 334 |
| registerEventListener | `onWriteStream` | 335 |
| registerEventListener | `onUpdate` | 336 |
| registerEventListener | `onUpdateTick` | 337 |
| registerEventListener | `onRegisterActionEvents` | 338 |
| registerEventListener | `onRegisterExternalActionEvents` | 339 |
| registerEventListener | `onDeactivate` | 340 |
| registerEventListener | `onSetLoweredAll` | 341 |
| registerEventListener | `onPostAttach` | 342 |
| registerEventListener | `onPreDetach` | 343 |
| registerEventListener | `onRootVehicleChanged` | 344 |
| registerEventListener | `onPreAttachImplement` | 345 |
| registerEventListener | `onPreDetachImplement` | 346 |
| registerEventListener | `onDynamicMountTypeChanged` | 347 |
