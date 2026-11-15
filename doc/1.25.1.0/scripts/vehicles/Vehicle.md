# vehicles/Vehicle.lua

Source: `dataS/scripts/vehicles/Vehicle.lua` — FS25 1.25.1.0

- **Vehicle** inherits from `Object` (l.14)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Vehicle.registerInteractionFlag(name: string)` | 66 |  |
| `Vehicle.registerEvents(vehicleType: any)` | 80 |  |
| `Vehicle.registerFunctions(vehicleType: any)` | 125 |  |
| `Vehicle.init()` | 269 |  |
| `Vehicle.postInit()` | 307 |  |
| `Vehicle.registers()` | 333 |  |
| `Vehicle.registerComponentXMLPaths(schema: any, basePath: any)` | 432 |  |
| `Vehicle.new(isServer: any, isClient: any, customMt: any)` | 487 |  |
| `Vehicle:setFilename(filename: any)` | 511 |  |
| `Vehicle:setConfigurations(configurations: any, boughtConfigurations: any, configurationData: any)` | 520 |  |
| `Vehicle:setType(typeDef: any)` | 540 |  |
| `Vehicle:setLoadCallback(loadCallbackFunction: any, loadCallbackFunctionTarget: any, loadCallbackFunctionArguments: any)` | 562 |  |
| `Vehicle:loadCallback()` | 570 |  |
| `Vehicle:load(vehicleLoadingData: any)` | 581 |  |
| `Vehicle:i3dFileLoaded(i3dNode: any, failedReason: any, arguments: any, i3dLoadingId: any)` | 701 |  |
| `Vehicle:loadFinished()` | 719 |  |
| `Vehicle:loadSubSharedI3DFile(filename: any, callOnCreate: any, addToPhysics: any, asyncCallbackFunction: any, asyncCallbackObject: any, asyncCallbackArguments: any)` | 1240 |  |
| `Vehicle:onFinishedLoading()` | 1284 |  |
| `Vehicle:createLoadingTask(target: any) → table` | 1336 |  |
| `Vehicle:finishLoadingTask(task: table)` | 1343 |  |
| `Vehicle:delete(immediate: any)` | 1353 |  |
| `Vehicle:reset(forceDelete: any, callback: any, resetPlayer: any)` | 1449 |  |
| `Vehicle:getNeedsSaving()` | 1509 |  |
| `Vehicle:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 1515 |  |
| `Vehicle:saveStatsToXMLFile(xmlFile: any, key: any) → string` | 1571 |  |
| `Vehicle:readStream(streamId: integer, connection: table, objectId: any)` | 1611 |  |
| `Vehicle:postReadStream(streamId: integer, connection: table)` | 1649 |  |
| `Vehicle:writeStream(streamId: integer, connection: table)` | 1702 |  |
| `Vehicle:postWriteStream(streamId: integer, connection: table)` | 1716 |  |
| `Vehicle:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 1756 |  |
| `Vehicle:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 1802 |  |
| `Vehicle:updateVehicleSpeed(dt: any)` | 1841 |  |
| `Vehicle:update(dt: any)` | 1927 |  |
| `Vehicle:updateTick(dt: number)` | 2075 |  |
| `Vehicle:updateEnd(dt: any)` | 2169 |  |
| `Vehicle:draw(subDraw: any)` | 2182 |  |
| `Vehicle:drawUIInfo()` | 2223 |  |
| `Vehicle:setLoadingState(loadingState: any)` | 2239 |  |
| `Vehicle:setLoadingStep(loadingStep: SpecializationLoadStep)` | 2251 |  |
| `Vehicle:addToPhysics() → boolean` | 2258 |  |
| `Vehicle:removeFromPhysics()` | 2299 |  |
| `Vehicle:setVisibility(state: boolean)` | 2318 |  |
| `Vehicle:setRelativePosition(positionX: number, offsetY: number, positionZ: number, yRot: number)` | 2330 |  |
| `Vehicle:setAbsolutePosition(positionX: any, positionY: any, positionZ: any, xRot: any, yRot: any, zRot: any, componentPositions: any)` | 2339 |  |
| `Vehicle:getLimitedVehicleYPosition(position: any)` | 2363 |  |
| `Vehicle:setWorldPosition(x: number, y: number, z: number, xRot: number, yRot: number, zRot: number, componentIndex: integer, changeInterp: boolean)` | 2383 |  |
| `Vehicle:setWorldPositionQuaternion(x: number, y: number, z: number, qx: number, qy: number, qz: number, qw: number, componentIndex: integer, changeInterp: boolean)` | 2407 |  |
| `Vehicle:setDefaultComponentPosition(componentIndex: integer)` | 2430 |  |
| `Vehicle:resetPositionToTerrainHeight()` | 2447 |  |
| `Vehicle:getIsNodeActive(node: integer)` | 2475 |  |
| `Vehicle:getPrice()` | 2515 |  |
| `Vehicle:getSellPrice() → number` | 2522 |  |
| `Vehicle.calculateSellPrice(storeItem: any, age: any, operatingTime: any, price: any, repairPrice: any, repaintPrice: any)` | 2529 |  |
| `Vehicle:getIsOnField() → boolean` | 2551 |  |
| `Vehicle:getParentComponent(node: integer) → integer` | 2573 |  |
| `Vehicle:getLastSpeed(useAttacherVehicleSpeed: boolean) → number` | 2587 |  |
| `Vehicle:getDeactivateOnLeave()` | 2600 |  |
| `Vehicle:getIsSynchronized()` | 2606 |  |
| `Vehicle:getIsVehicleNode(nodeId: integer) → boolean` | 2620 |  |
| `Vehicle:getIsOperating() → boolean` | 2627 |  |
| `Vehicle:getIsActive()` | 2633 |  |
| `Vehicle:getIsActiveForInput(ignoreSelection: any, activeForAI: any)` | 2647 |  |
| `Vehicle:getIsActiveForSound()` | 2689 |  |
| `Vehicle:getIsLowered(defaultIsLowered: any)` | 2696 |  |
| `Vehicle:updateWaterInfo()` | 2702 |  |
| `Vehicle:onWaterRaycastCallback(nodeId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 2721 |  |
| `Vehicle:setBroken()` | 2747 |  |
| `Vehicle:getVehicleDamage()` | 2764 |  |
| `Vehicle:getRepairPrice()` | 2770 |  |
| `Vehicle:getRepaintPrice()` | 2776 |  |
| `Vehicle:requestActionEventUpdate()` | 2782 |  |
| `Vehicle:removeActionEvents()` | 2797 |  |
| `Vehicle:updateActionEvents()` | 2803 |  |
| `Vehicle:registerActionEvents(excludedVehicle: any)` | 2810 |  |
| `Vehicle:removeActionEvent(actionEventsTable: any, inputAction: any)` | 2946 |  |
| `Vehicle:updateSelectableObjects()` | 2961 |  |
| `Vehicle:registerSelectableObjects(selectableObjects: any)` | 2970 |  |
| `Vehicle:addSubselection(subSelection: any)` | 2979 |  |
| `Vehicle:clearSubselections()` | 2986 |  |
| `Vehicle:getCanBeSelected()` | 2992 |  |
| `Vehicle:getBlockSelection()` | 2998 |  |
| `Vehicle:getCanToggleSelectable()` | 3004 |  |
| `Vehicle:getRootVehicle()` | 3010 |  |
| `Vehicle:findRootVehicle()` | 3016 |  |
| `Vehicle:getChildVehicles()` | 3022 |  |
| `Vehicle:getChildVehicleHash()` | 3028 |  |
| `Vehicle:addChildVehicles(vehicles: any, rootVehicle: any)` | 3034 |  |
| `Vehicle:updateVehicleChain(secondCall: any)` | 3041 |  |
| `Vehicle:unselectVehicle()` | 3072 |  |
| `Vehicle:selectVehicle(subSelectionIndex: any, ignoreActionEventUpdate: any)` | 3081 |  |
| `Vehicle:setSelectedVehicle(vehicle: any, subSelectionIndex: any, ignoreActionEventUpdate: any)` | 3092 |  |
| `Vehicle:setSelectedObject(object: any, subSelectionIndex: any, ignoreActionEventUpdate: any)` | 3115 |  |
| `Vehicle:getIsSelected()` | 3174 |  |
| `Vehicle:getSelectedObject()` | 3184 |  |
| `Vehicle:getSelectedVehicle()` | 3195 |  |
| `Vehicle:hasInputConflictWithSelection(inputs: any)` | 3205 |  |
| `Vehicle:setMassDirty()` | 3213 |  |
| `Vehicle:updateMass()` | 3219 |  |
| `Vehicle:getMaxComponentMassReached()` | 3274 |  |
| `Vehicle:getAvailableComponentMass()` | 3280 |  |
| `Vehicle:getAdditionalComponentMass(component: any)` | 3286 |  |
| `Vehicle:getTotalMass(onlyGivenVehicle: boolean) → number` | 3294 |  |
| `Vehicle:getComponentMass(component: table) → number` | 3308 |  |
| `Vehicle:getDefaultMass()` | 3318 |  |
| `Vehicle:getOverallCenterOfMass() → number, number, number` | 3333 |  |
| `Vehicle:getVehicleWorldXRot() → number` | 3351 |  |
| `Vehicle:getVehicleWorldDirection() → number, number, number` | 3366 |  |
| `Vehicle:getFillLevelInformation(display: table)` | 3373 |  |
| `Vehicle:getHasObjectMounted(object: table) → boolean` | 3380 |  |
| `Vehicle:activate()` | 3386 |  |
| `Vehicle:deactivate()` | 3396 |  |
| `Vehicle:setComponentJointFrame(jointDesc: table, anchorActor: integer)` | 3409 |  |
| `Vehicle:setComponentJointRotLimit(componentJoint: table, axis: integer, minLimit: number, maxLimit: number)` | 3437 |  |
| `Vehicle:setComponentJointTransLimit(componentJoint: table, axis: integer, minLimit: number, maxLimit: number)` | 3458 |  |
| `Vehicle:loadComponentFromXML(component: table, xmlFile: XMLFile, key: string, rootPosition: table, i: integer) → boolean` | 3481 |  |
| `Vehicle:loadComponentJointFromXML(jointDesc: table, xmlFile: XMLFile, key: string, componentJointI: integer, jointNode: integer, index1: integer, index2: integer) → boolean` | 3597 |  |
| `Vehicle:createComponentJoint(component1: table, component2: table, jointDesc: table) → boolean` | 3740 |  |
| `Vehicle:loadSchemaOverlay(xmlFile: XMLFile)` | 3814 |  |
| `Vehicle:getAdditionalSchemaText()` | 3860 |  |
| `Vehicle:getUseTurnedOnSchema()` | 3866 |  |
| `Vehicle:dayChanged()` | 3872 |  |
| `Vehicle:periodChanged()` | 3877 |  |
| `Vehicle:raiseStateChange(state: any, ...: any)` | 3883 |  |
| `Vehicle:doCheckSpeedLimit()` | 3890 |  |
| `Vehicle:getWorkLoad()` | 3897 |  |
| `Vehicle:interact(player: any)` | 3904 |  |
| `Vehicle:getInteractionHelp()` | 3909 |  |
| `Vehicle:getDistanceToNode(node: any)` | 3919 |  |
| `Vehicle:getIsAIActive()` | 3926 |  |
| `Vehicle:getIsPowered()` | 3939 |  |
| `Vehicle:getRequiresPower()` | 3945 |  |
| `Vehicle:getIsInShowroom()` | 3951 |  |
| `Vehicle:addVehicleToAIImplementList(list: any)` | 3957 |  |
| `Vehicle:setOperatingTime(operatingTime: any, isLoading: any)` | 3962 |  |
| `Vehicle:getOperatingTime()` | 3971 |  |
| `Vehicle:doCollisionMaskCheck(targetCollisionMask: any, path: any, node: any, str: any)` | 3977 |  |
| `Vehicle:getIsReadyForAutomatedTrainTravel()` | 4005 |  |
| `Vehicle:getIsAutomaticShiftingAllowed()` | 4011 |  |
| `Vehicle:getSpeedLimit(onlyIfWorking: boolean) → number, boolean` | 4020 |  |
| `Vehicle:getRawSpeedLimit() → number` | 4053 |  |
| `Vehicle:onVehicleWakeUpCallback(id: any)` | 4059 |  |
| `Vehicle:getCanBeMounted()` | 4065 |  |
| `Vehicle:getDailyUpkeep() → number` | 4072 |  |
| `Vehicle.calculateDailyUpkeep(storeItem: any, age: any, operatingTime: any, configurations: any)` | 4079 |  |
| `Vehicle:getUppercaseName() → string` | 4094 |  |
| `Vehicle:getName()` | 4102 |  |
| `Vehicle:getFullName()` | 4123 |  |
| `Vehicle:getBrand()` | 4138 |  |
| `Vehicle:getImageFilename()` | 4159 |  |
| `Vehicle:getCanBePickedUp(byPlayer: Player) → boolean` | 4184 |  |
| `Vehicle:getCanBeReset()` | 4190 |  |
| `Vehicle:getResetPlaces()` | 4196 |  |
| `Vehicle:getResetDialogTexts() → string, string, string` | 4206 |  |
| `Vehicle:getCanBeSold()` | 4216 |  |
| `Vehicle:getCanBeAddedToSales()` | 4227 |  |
| `Vehicle:getReloadXML() → string` | 4234 |  |
| `Vehicle:getIsInUse(connection: any)` | 4250 |  |
| `Vehicle:getPropertyState()` | 4256 |  |
| `Vehicle:getAreControlledActionsAvailable()` | 4262 |  |
| `Vehicle:getAreControlledActionsAccessible()` | 4276 |  |
| `Vehicle:getControlledActionIcons()` | 4290 |  |
| `Vehicle:getAreControlledActionsAllowed() → boolean, string` | 4305 |  |
| `Vehicle:playControlledActions()` | 4311 |  |
| `Vehicle:getActionControllerDirection()` | 4319 |  |
| `Vehicle:createMapHotspot()` | 4329 |  |
| `Vehicle:deleteMapHotspot()` | 4341 |  |
| `Vehicle:getMapHotspot()` | 4351 |  |
| `Vehicle:updateMapHotspot()` | 4357 |  |
| `Vehicle:getIsMapHotspotVisible()` | 4365 |  |
| `Vehicle:getShowInVehiclesOverview()` | 4380 |  |
| `Vehicle:showInfo(box: any)` | 4386 |  |
| `Vehicle:loadObjectChangeValuesFromXML(xmlFile: integer, key: string, node: integer, object: table)` | 4398 |  |
| `Vehicle:setObjectChangeValues(object: table, isActive: boolean)` | 4405 |  |
| `Vehicle:wakeUp()` | 4410 |  |
| `Vehicle:register(alreadySent: any)` | 4416 |  |
| `Vehicle:clearDirtyMask()` | 4424 |  |
| `Vehicle:setOwnerFarmId(farmId: any, noEventSend: any)` | 4431 |  |
| `Vehicle:getUniqueId() → string` | 4442 |  |
| `Vehicle:setUniqueId(uniqueId: string)` | 4449 |  |
| `Vehicle.actionEventToggleSelection(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 4457 |  |
| `Vehicle.actionEventToggleSelectionReverse(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 4490 |  |
| `Vehicle.getSpecValueDailyUpkeep(storeItem: any, realItem: any, _: any, saleItem: any)` | 4535 |  |
| `Vehicle.getSpecValueOperatingTime(storeItem: any, realItem: any, _: any, saleItem: any)` | 4553 |  |
| `Vehicle.loadSpecValueWorkingWidth(xmlFile: any, customEnvironment: any, baseDir: any)` | 4573 |  |
| `Vehicle.getSpecValueWorkingWidth(storeItem: any, realItem: any)` | 4585 |  |
| `Vehicle.loadSpecValueWorkingWidthConfig(xmlFile: any, customEnvironment: any, baseDir: any)` | 4600 |  |
| `Vehicle.getSpecValueWorkingWidthConfig(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 4619 |  |
| `Vehicle.loadSpecValueSpeedLimit(xmlFile: any, customEnvironment: any, baseDir: any)` | 4664 |  |
| `Vehicle.getSpecValueSpeedLimit(storeItem: any, realItem: any)` | 4670 |  |
| `Vehicle.loadSpecValueWeight(xmlFile: any, customEnvironment: any, baseDir: any)` | 4679 |  |
| `Vehicle.getSpecConfigValuesWeight(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 4738 |  |
| `Vehicle.getSpecValueWeight(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 4749 |  |
| `Vehicle.loadSpecValueAdditionalWeight(xmlFile: any, customEnvironment: any, baseDir: any)` | 4795 |  |
| `Vehicle.getSpecValueAdditionalWeight(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 4806 |  |
| `Vehicle.loadSpecValueCombinations(xmlFile: any, customEnvironment: any, baseDirectory: any)` | 4829 |  |
| `Vehicle.getSpecValueCombinations(storeItem: any, realItem: any)` | 4867 |  |
| `Vehicle.getSpecValueSlots(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 4873 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onPreLoad` | 81 |
| registerEvent | `onLoad` | 82 |
| registerEvent | `onPostLoad` | 83 |
| registerEvent | `onPreInitComponentPlacement` | 84 |
| registerEvent | `onPreLoadFinished` | 85 |
| registerEvent | `onLoadFinished` | 86 |
| registerEvent | `onLoadEnd` | 87 |
| registerEvent | `onRegistered` | 88 |
| registerEvent | `onDirtyMaskCleared` | 89 |
| registerEvent | `onPreDelete` | 90 |
| registerEvent | `onDelete` | 91 |
| registerEvent | `onSave` | 92 |
| registerEvent | `onReadStream` | 93 |
| registerEvent | `onWriteStream` | 94 |
| registerEvent | `onReadUpdateStream` | 95 |
| registerEvent | `onWriteUpdateStream` | 96 |
| registerEvent | `onReadPositionUpdateStream` | 97 |
| registerEvent | `onWritePositionUpdateStream` | 98 |
| registerEvent | `onHandToolTaken` | 99 |
| registerEvent | `onHandToolPlaced` | 100 |
| registerEvent | `onPreUpdate` | 101 |
| registerEvent | `onUpdate` | 102 |
| registerEvent | `onUpdateInterpolation` | 103 |
| registerEvent | `onUpdateDebug` | 104 |
| registerEvent | `onPostUpdate` | 105 |
| registerEvent | `onUpdateTick` | 106 |
| registerEvent | `onPostUpdateTick` | 107 |
| registerEvent | `onUpdateEnd` | 108 |
| registerEvent | `onDraw` | 109 |
| registerEvent | `onDrawUIInfo` | 110 |
| registerEvent | `onActivate` | 111 |
| registerEvent | `onDeactivate` | 112 |
| registerEvent | `onStateChange` | 113 |
| registerEvent | `onPreRegisterActionEvents` | 114 |
| registerEvent | `onRegisterActionEvents` | 115 |
| registerEvent | `onRootVehicleChanged` | 116 |
| registerEvent | `onSelect` | 117 |
| registerEvent | `onUnselect` | 118 |
| registerEvent | `onSetBroken` | 119 |
| registerEvent | `onSaleItemSet` | 120 |
| registerFunction | `register` | 126 |
| registerFunction | `setOwnerFarmId` | 127 |
| registerFunction | `loadSubSharedI3DFile` | 128 |
| registerFunction | `drawUIInfo` | 129 |
| registerFunction | `raiseActive` | 130 |
| registerFunction | `setLoadingState` | 131 |
| registerFunction | `setLoadingStep` | 132 |
| registerFunction | `addToPhysics` | 133 |
| registerFunction | `removeFromPhysics` | 134 |
| registerFunction | `setVisibility` | 135 |
| registerFunction | `setRelativePosition` | 136 |
| registerFunction | `setAbsolutePosition` | 137 |
| registerFunction | `getLimitedVehicleYPosition` | 138 |
| registerFunction | `setWorldPosition` | 139 |
| registerFunction | `setWorldPositionQuaternion` | 140 |
| registerFunction | `setDefaultComponentPosition` | 141 |
| registerFunction | `getIsNodeActive` | 142 |
| registerFunction | `updateVehicleSpeed` | 143 |
| registerFunction | `getUpdatePriority` | 144 |
| registerFunction | `getPrice` | 145 |
| registerFunction | `getSellPrice` | 146 |
| registerFunction | `getDailyUpkeep` | 147 |
| registerFunction | `getIsOnField` | 148 |
| registerFunction | `getParentComponent` | 149 |
| registerFunction | `getLastSpeed` | 150 |
| registerFunction | `getDeactivateOnLeave` | 151 |
| registerFunction | `getOwnerConnection` | 152 |
| registerFunction | `getIsVehicleNode` | 153 |
| registerFunction | `getIsOperating` | 154 |
| registerFunction | `getIsActive` | 155 |
| registerFunction | `getIsActiveForInput` | 156 |
| registerFunction | `getIsActiveForSound` | 157 |
| registerFunction | `getIsLowered` | 158 |
| registerFunction | `updateWaterInfo` | 159 |
| registerFunction | `onWaterRaycastCallback` | 160 |
| registerFunction | `setBroken` | 161 |
| registerFunction | `getVehicleDamage` | 162 |
| registerFunction | `getRepairPrice` | 163 |
| registerFunction | `getRepaintPrice` | 164 |
| registerFunction | `setMassDirty` | 165 |
| registerFunction | `updateMass` | 166 |
| registerFunction | `getMaxComponentMassReached` | 167 |
| registerFunction | `getAdditionalComponentMass` | 168 |
| registerFunction | `getTotalMass` | 169 |
| registerFunction | `getComponentMass` | 170 |
| registerFunction | `getDefaultMass` | 171 |
| registerFunction | `getOverallCenterOfMass` | 172 |
| registerFunction | `getVehicleWorldXRot` | 173 |
| registerFunction | `getVehicleWorldDirection` | 174 |
| registerFunction | `getFillLevelInformation` | 175 |
| registerFunction | `getHasObjectMounted` | 176 |
| registerFunction | `activate` | 177 |
| registerFunction | `deactivate` | 178 |
| registerFunction | `setComponentJointFrame` | 179 |
| registerFunction | `setComponentJointRotLimit` | 180 |
| registerFunction | `setComponentJointTransLimit` | 181 |
| registerFunction | `loadComponentFromXML` | 182 |
| registerFunction | `loadComponentJointFromXML` | 183 |
| registerFunction | `createComponentJoint` | 184 |
| registerFunction | `loadSchemaOverlay` | 185 |
| registerFunction | `getAdditionalSchemaText` | 186 |
| registerFunction | `getUseTurnedOnSchema` | 187 |
| registerFunction | `dayChanged` | 188 |
| registerFunction | `periodChanged` | 189 |
| registerFunction | `raiseStateChange` | 190 |
| registerFunction | `doCheckSpeedLimit` | 191 |
| registerFunction | `interact` | 192 |
| registerFunction | `getInteractionHelp` | 193 |
| registerFunction | `getIsInteractive` | 194 |
| registerFunction | `getDistanceToNode` | 195 |
| registerFunction | `getIsAIActive` | 196 |
| registerFunction | `getIsPowered` | 197 |
| registerFunction | `getRequiresPower` | 198 |
| registerFunction | `getIsInShowroom` | 199 |
| registerFunction | `addVehicleToAIImplementList` | 200 |
| registerFunction | `setOperatingTime` | 201 |
| registerFunction | `requestActionEventUpdate` | 203 |
| registerFunction | `removeActionEvents` | 204 |
| registerFunction | `updateActionEvents` | 205 |
| registerFunction | `registerActionEvents` | 206 |
| registerFunction | `addActionEvent` | 207 |
| registerFunction | `updateSelectableObjects` | 209 |
| registerFunction | `registerSelectableObjects` | 210 |
| registerFunction | `addSubselection` | 211 |
| registerFunction | `getRootVehicle` | 212 |
| registerFunction | `findRootVehicle` | 213 |
| registerFunction | `getChildVehicles` | 214 |
| registerFunction | `addChildVehicles` | 215 |
| registerFunction | `updateVehicleChain` | 216 |
| registerFunction | `getCanBeSelected` | 217 |
| registerFunction | `getBlockSelection` | 218 |
| registerFunction | `getCanToggleSelectable` | 219 |
| registerFunction | `unselectVehicle` | 220 |
| registerFunction | `selectVehicle` | 221 |
| registerFunction | `getIsSelected` | 222 |
| registerFunction | `getSelectedObject` | 223 |
| registerFunction | `getSelectedVehicle` | 224 |
| registerFunction | `setSelectedVehicle` | 225 |
| registerFunction | `setSelectedObject` | 226 |
| registerFunction | `getIsReadyForAutomatedTrainTravel` | 227 |
| registerFunction | `getIsAutomaticShiftingAllowed` | 228 |
| registerFunction | `getSpeedLimit` | 229 |
| registerFunction | `getRawSpeedLimit` | 230 |
| registerFunction | `getActiveFarm` | 231 |
| registerFunction | `onVehicleWakeUpCallback` | 232 |
| registerFunction | `getCanBeMounted` | 233 |
| registerFunction | `getName` | 234 |
| registerFunction | `getFullName` | 235 |
| registerFunction | `getBrand` | 236 |
| registerFunction | `getImageFilename` | 237 |
| registerFunction | `getCanBePickedUp` | 238 |
| registerFunction | `getCanBeReset` | 239 |
| registerFunction | `getResetPlaces` | 240 |
| registerFunction | `getResetDialogTexts` | 241 |
| registerFunction | `reset` | 242 |
| registerFunction | `getCanBeSold` | 243 |
| registerFunction | `getCanBeAddedToSales` | 244 |
| registerFunction | `getReloadXML` | 245 |
| registerFunction | `getIsInUse` | 246 |
| registerFunction | `getPropertyState` | 247 |
| registerFunction | `getAreControlledActionsAllowed` | 248 |
| registerFunction | `getAreControlledActionsAvailable` | 249 |
| registerFunction | `getAreControlledActionsAccessible` | 250 |
| registerFunction | `getControlledActionIcons` | 251 |
| registerFunction | `playControlledActions` | 252 |
| registerFunction | `getActionControllerDirection` | 253 |
| registerFunction | `createMapHotspot` | 254 |
| registerFunction | `getMapHotspot` | 255 |
| registerFunction | `updateMapHotspot` | 256 |
| registerFunction | `getIsMapHotspotVisible` | 257 |
| registerFunction | `getMapHotspotRotation` | 258 |
| registerFunction | `getMapHotspotPosition` | 259 |
| registerFunction | `getShowInVehiclesOverview` | 260 |
| registerFunction | `showInfo` | 261 |
| registerFunction | `loadObjectChangeValuesFromXML` | 262 |
| registerFunction | `setObjectChangeValues` | 263 |
| registerFunction | `getIsSynchronized` | 264 |

## Messages

- subscribes `MessageType.DAY_CHANGED` (l.1028)
- subscribes `MessageType.PERIOD_CHANGED` (l.1029)
- publishes `MessageType.VEHICLE_RESET` (l.1481)
