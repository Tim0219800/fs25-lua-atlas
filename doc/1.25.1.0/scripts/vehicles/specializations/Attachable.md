# vehicles/specializations/Attachable.lua

Source: `dataS/scripts/vehicles/specializations/Attachable.lua` — FS25 1.25.1.0

- **Attachable** (l.11)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Attachable.prerequisitesPresent(specializations: table) → boolean` | 26 |  |
| `Attachable.registerEvents(vehicleType: any)` | 32 |  |
| `Attachable.registerFunctions(vehicleType: any)` | 44 |  |
| `Attachable.registerOverwrittenFunctions(vehicleType: any)` | 96 |  |
| `Attachable.registerEventListeners(vehicleType: any)` | 130 |  |
| `Attachable.initSpecialization()` | 153 |  |
| `Attachable.registerInputAttacherJointXMLPaths(schema: any, baseName: any)` | 258 |  |
| `Attachable.registerSupportXMLPaths(schema: any, key: any)` | 350 |  |
| `Attachable:onLoad(savegame: table)` | 363 |  |
| `Attachable:onPostLoad(savegame: table)` | 511 |  |
| `Attachable:onLoadFinished(savegame: table)` | 541 |  |
| `Attachable:onPreInitComponentPlacement(savegame: table)` | 551 |  |
| `Attachable:onPreDelete()` | 599 |  |
| `Attachable:onDelete()` | 619 |  |
| `Attachable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 644 |  |
| `Attachable:onReadStream(streamId: integer, connection: Connection)` | 658 |  |
| `Attachable:onWriteStream(streamId: integer, connection: Connection)` | 676 |  |
| `Attachable:onUpdateInterpolation(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 701 |  |
| `Attachable:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 721 |  |
| `Attachable:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 829 |  |
| `Attachable:loadInputAttacherJoint(xmlFile: table, key: any, inputAttacherJoint: any, index: any)` | 856 |  |
| `Attachable:loadAttacherJointHeightNode(xmlFile: table, key: string, heightNode: table, attacherJointNode: any)` | 1173 |  |
| `Attachable:getIsAttacherJointHeightNodeActive(heightNode: table) → boolean` | 1184 |  |
| `Attachable:getInputAttacherJointByJointDescIndex(index: any)` | 1190 |  |
| `Attachable:getInputAttacherJointIndexByNode(node: any)` | 1196 |  |
| `Attachable:getAttacherVehicle()` | 1211 |  |
| `Attachable:getShowAttachableMapHotspot()` | 1216 |  |
| `Attachable:getInputAttacherJoints()` | 1222 |  |
| `Attachable:getIsAttachedTo(vehicle: any)` | 1228 |  |
| `Attachable:getActiveInputAttacherJointDescIndex()` | 1247 |  |
| `Attachable:getActiveInputAttacherJoint()` | 1253 |  |
| `Attachable:getAllowsLowering() → boolean, string` | 1261 |  |
| `Attachable:loadSupportAnimationFromXML(supportAnimation: table, xmlFile: XMLFile, key: string)` | 1284 |  |
| `Attachable:getIsSupportAnimationAllowed(supportAnimation: any)` | 1296 |  |
| `Attachable:getIsReadyToFinishDetachProcess()` | 1302 |  |
| `Attachable:startDetachProcess(noEventSend: any)` | 1325 |  |
| `Attachable:getIsImplementChainLowered(defaultIsLowered: boolean) → boolean` | 1361 |  |
| `Attachable:getIsInWorkPosition() → boolean` | 1383 |  |
| `Attachable:getAttachbleAirConsumerUsage() → number` | 1390 |  |
| `Attachable:isDetachAllowed() → boolean, string` | 1398 |  |
| `Attachable:isAttachAllowed(farmId: integer, attacherVehicle: table) → boolean, string` | 1442 |  |
| `Attachable:getIsInputAttacherActive(inputAttacherJoint: table) → boolean` | 1458 |  |
| `Attachable:getSteeringAxleBaseVehicle()` | 1464 |  |
| `Attachable:loadSteeringAxleFromXML(spec: any, xmlFile: any, key: any)` | 1486 |  |
| `Attachable:getIsSteeringAxleAllowed()` | 1512 |  |
| `Attachable:loadSteeringAngleNodeFromXML(entry: any, xmlFile: any, key: any)` | 1518 |  |
| `Attachable:updateSteeringAngleNode(steeringAngleNode: any, angle: any, dt: any)` | 1532 |  |
| `Attachable:attachableAddToolCameras()` | 1551 |  |
| `Attachable:attachableRemoveToolCameras()` | 1566 |  |
| `Attachable:preAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: boolean, loadFromSavegame: boolean)` | 1584 |  |
| `Attachable:postAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer, loadFromSavegame: boolean)` | 1646 |  |
| `Attachable:preDetach(attacherVehicle: any, implement: any)` | 1736 |  |
| `Attachable:postDetach(implementIndex: any)` | 1748 |  |
| `Attachable:setLowered(lowered: boolean)` | 1806 |  |
| `Attachable:setLoweredAll(doLowering: boolean, jointDescIndex: any)` | 1840 |  |
| `Attachable:setToolBottomArmWidthByIndex(inputAttacherJointIndex: integer, widthIndex: integer)` | 1850 |  |
| `Attachable:updateInputAttacherJointGraphics(implement: any, dt: any)` | 1867 |  |
| `Attachable:setIsAdditionalAttachment(needsLowering: any, vehicleLoaded: any)` | 1887 |  |
| `Attachable:getIsAdditionalAttachment()` | 1905 |  |
| `Attachable:setIsSupportVehicle(state: any)` | 1911 |  |
| `Attachable:getIsSupportVehicle()` | 1922 |  |
| `Attachable:registerLoweringActionEvent(actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any)` | 1928 |  |
| `Attachable:getLoweringActionEventState()` | 1935 |  |
| `Attachable:getAllowMultipleAttachments()` | 1958 |  |
| `Attachable:resolveMultipleAttachments()` | 1964 |  |
| `Attachable:getBlockFoliageDestruction()` | 1969 |  |
| `Attachable:onDeactivate()` | 1980 |  |
| `Attachable:onSelect(subSelectionIndex: any)` | 1999 |  |
| `Attachable:onUnselect()` | 2008 |  |
| `Attachable:findRootVehicle(superFunc: any)` | 2017 |  |
| `Attachable:getIsActive(superFunc: any)` | 2028 |  |
| `Attachable:getIsOperating(superFunc: any) → boolean` | 2042 |  |
| `Attachable:getBrakeForce(superFunc: any)` | 2056 |  |
| `Attachable:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 2078 |  |
| `Attachable:getCanToggleTurnedOn(superFunc: any)` | 2102 |  |
| `Attachable:getDeactivateOnLeave(superFunc: any)` | 2138 |  |
| `Attachable:getCanAIImplementContinueWork(superFunc: any, isTurning: any) → boolean` | 2152 |  |
| `Attachable:getAreControlledActionsAllowed(superFunc: any) → boolean, string` | 2183 |  |
| `Attachable:getActiveFarm(superFunc: any)` | 2196 |  |
| `Attachable:getCanBeSelected(superFunc: any)` | 2213 |  |
| `Attachable:getIsLowered(superFunc: any, defaultIsLowered: any)` | 2219 |  |
| `Attachable:mountDynamic(superFunc: any, object: any, objectActorId: any, jointNode: any, mountType: any, forceAcceleration: any)` | 2237 |  |
| `Attachable:getOwnerConnection(superFunc: any)` | 2249 |  |
| `Attachable:getIsInUse(superFunc: any, connection: any)` | 2261 |  |
| `Attachable:getUpdatePriority(superFunc: any, skipCount: any, x: any, y: any, z: any, coeff: any, connection: any, isGuiVisible: any)` | 2272 |  |
| `Attachable:getCanBeReset(superFunc: any)` | 2283 |  |
| `Attachable:loadAdditionalLightAttributesFromXML(superFunc: any, xmlFile: any, key: any, light: any)` | 2297 |  |
| `Attachable:getIsLightActive(superFunc: any, light: any)` | 2309 |  |
| `Attachable:getIsPowered(superFunc: any)` | 2321 |  |
| `Attachable:getConnectionHoseConfigIndex(superFunc: any)` | 2342 |  |
| `Attachable:getIsMapHotspotVisible(superFunc: any)` | 2356 |  |
| `Attachable:getPowerTakeOffConfigIndex(superFunc: any)` | 2374 |  |
| `Attachable:loadDashboardGroupFromXML(superFunc: any, xmlFile: any, key: any, group: any)` | 2388 |  |
| `Attachable:getIsDashboardGroupActive(superFunc: any, group: any)` | 2400 |  |
| `Attachable:setWorldPositionQuaternion(superFunc: number, x: number, y: number, z: number, qx: number, qy: number, qz: number, qw: number, i: integer, changeInterp: boolean)` | 2421 |  |
| `Attachable:addToPhysics(superFunc: any) → boolean` | 2438 |  |
| `Attachable:removeFromPhysics(superFunc: any) → boolean` | 2472 |  |
| `Attachable:actionControllerLowerImplementEvent(direction: any)` | 2493 |  |
| `Attachable:onStateChange(state: any, data: any)` | 2515 |  |
| `Attachable:onRootVehicleChanged(rootVehicle: table)` | 2530 |  |
| `Attachable:onFoldStateChanged(direction: any, moveToMiddle: any)` | 2542 |  |
| `Attachable:onRegisterAnimationValueTypes()` | 2555 |  |
| `Attachable:onBottomArmBallsI3DLoaded(i3dNode: integer, failedReason: table, inputAttacherJoint: any)` | 2778 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onPreAttach` | 33 |
| registerEvent | `onPostAttach` | 34 |
| registerEvent | `onPreDetach` | 35 |
| registerEvent | `onPostDetach` | 36 |
| registerEvent | `onSetLowered` | 37 |
| registerEvent | `onSetLoweredAll` | 38 |
| registerEvent | `onLeaveRootVehicle` | 39 |
| registerFunction | `loadInputAttacherJoint` | 45 |
| registerFunction | `loadAttacherJointHeightNode` | 46 |
| registerFunction | `getIsAttacherJointHeightNodeActive` | 47 |
| registerFunction | `getInputAttacherJointByJointDescIndex` | 48 |
| registerFunction | `getInputAttacherJointIndexByNode` | 49 |
| registerFunction | `getAttacherVehicle` | 50 |
| registerFunction | `getShowAttachableMapHotspot` | 51 |
| registerFunction | `getInputAttacherJoints` | 52 |
| registerFunction | `getIsAttachedTo` | 53 |
| registerFunction | `getActiveInputAttacherJointDescIndex` | 54 |
| registerFunction | `getActiveInputAttacherJoint` | 55 |
| registerFunction | `getAllowsLowering` | 56 |
| registerFunction | `loadSupportAnimationFromXML` | 57 |
| registerFunction | `getIsSupportAnimationAllowed` | 58 |
| registerFunction | `getIsReadyToFinishDetachProcess` | 59 |
| registerFunction | `startDetachProcess` | 60 |
| registerFunction | `getIsImplementChainLowered` | 61 |
| registerFunction | `getIsInWorkPosition` | 62 |
| registerFunction | `getAttachbleAirConsumerUsage` | 63 |
| registerFunction | `isDetachAllowed` | 64 |
| registerFunction | `isAttachAllowed` | 65 |
| registerFunction | `getIsInputAttacherActive` | 66 |
| registerFunction | `getSteeringAxleBaseVehicle` | 67 |
| registerFunction | `loadSteeringAxleFromXML` | 68 |
| registerFunction | `getIsSteeringAxleAllowed` | 69 |
| registerFunction | `loadSteeringAngleNodeFromXML` | 70 |
| registerFunction | `updateSteeringAngleNode` | 71 |
| registerFunction | `attachableAddToolCameras` | 72 |
| registerFunction | `attachableRemoveToolCameras` | 73 |
| registerFunction | `preAttach` | 74 |
| registerFunction | `postAttach` | 75 |
| registerFunction | `preDetach` | 76 |
| registerFunction | `postDetach` | 77 |
| registerFunction | `setLowered` | 78 |
| registerFunction | `setLoweredAll` | 79 |
| registerFunction | `setToolBottomArmWidthByIndex` | 80 |
| registerFunction | `updateInputAttacherJointGraphics` | 81 |
| registerFunction | `setIsAdditionalAttachment` | 82 |
| registerFunction | `getIsAdditionalAttachment` | 83 |
| registerFunction | `setIsSupportVehicle` | 84 |
| registerFunction | `getIsSupportVehicle` | 85 |
| registerFunction | `registerLoweringActionEvent` | 86 |
| registerFunction | `getLoweringActionEventState` | 87 |
| registerFunction | `getAllowMultipleAttachments` | 88 |
| registerFunction | `resolveMultipleAttachments` | 89 |
| registerFunction | `getBlockFoliageDestruction` | 90 |
| registerFunction | `setIsDetachingBlocked` | 91 |
| registerOverwrittenFunction | `findRootVehicle` | 97 |
| registerOverwrittenFunction | `getIsActive` | 98 |
| registerOverwrittenFunction | `getIsOperating` | 99 |
| registerOverwrittenFunction | `getBrakeForce` | 100 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 101 |
| registerOverwrittenFunction | `getCanToggleTurnedOn` | 102 |
| registerOverwrittenFunction | `getCanImplementBeUsedForAI` | 103 |
| registerOverwrittenFunction | `getCanAIImplementContinueWork` | 104 |
| registerOverwrittenFunction | `getAreControlledActionsAllowed` | 105 |
| registerOverwrittenFunction | `getDeactivateOnLeave` | 106 |
| registerOverwrittenFunction | `getActiveFarm` | 107 |
| registerOverwrittenFunction | `getCanBeSelected` | 108 |
| registerOverwrittenFunction | `getIsLowered` | 109 |
| registerOverwrittenFunction | `mountDynamic` | 110 |
| registerOverwrittenFunction | `getOwnerConnection` | 111 |
| registerOverwrittenFunction | `getIsInUse` | 112 |
| registerOverwrittenFunction | `getUpdatePriority` | 113 |
| registerOverwrittenFunction | `getCanBeReset` | 114 |
| registerOverwrittenFunction | `loadAdditionalLightAttributesFromXML` | 115 |
| registerOverwrittenFunction | `getIsLightActive` | 116 |
| registerOverwrittenFunction | `getIsPowered` | 117 |
| registerOverwrittenFunction | `getConnectionHoseConfigIndex` | 118 |
| registerOverwrittenFunction | `getIsMapHotspotVisible` | 119 |
| registerOverwrittenFunction | `getPowerTakeOffConfigIndex` | 120 |
| registerOverwrittenFunction | `loadDashboardGroupFromXML` | 121 |
| registerOverwrittenFunction | `getIsDashboardGroupActive` | 122 |
| registerOverwrittenFunction | `setWorldPositionQuaternion` | 123 |
| registerOverwrittenFunction | `addToPhysics` | 124 |
| registerOverwrittenFunction | `removeFromPhysics` | 125 |
| registerEventListener | `onLoad` | 131 |
| registerEventListener | `onPostLoad` | 132 |
| registerEventListener | `onLoadFinished` | 133 |
| registerEventListener | `onPreInitComponentPlacement` | 134 |
| registerEventListener | `onPreDelete` | 135 |
| registerEventListener | `onDelete` | 136 |
| registerEventListener | `onReadStream` | 137 |
| registerEventListener | `onWriteStream` | 138 |
| registerEventListener | `onUpdateInterpolation` | 139 |
| registerEventListener | `onUpdate` | 140 |
| registerEventListener | `onUpdateTick` | 141 |
| registerEventListener | `onDeactivate` | 142 |
| registerEventListener | `onSelect` | 143 |
| registerEventListener | `onUnselect` | 144 |
| registerEventListener | `onStateChange` | 145 |
| registerEventListener | `onRootVehicleChanged` | 146 |
| registerEventListener | `onFoldStateChanged` | 147 |
| registerEventListener | `onRegisterAnimationValueTypes` | 148 |
