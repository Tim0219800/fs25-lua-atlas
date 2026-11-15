# vehicles/specializations/FillUnit.lua

Source : `dataS/scripts/vehicles/specializations/FillUnit.lua` — FS25 1.25.1.0

- **FillUnit** (l.16)
- **FillActivatable** (l.3302)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `FillUnit.initSpecialization()` | 33 |  |
| `FillUnit.registerUnitDisplaySchema(schema: any, key: any)` | 181 |  |
| `FillUnit.prerequisitesPresent(specializations: any)` | 188 |  |
| `FillUnit.registerEvents(vehicleType: any)` | 194 |  |
| `FillUnit.registerFunctions(vehicleType: any)` | 208 |  |
| `FillUnit.registerOverwrittenFunctions(vehicleType: any)` | 281 |  |
| `FillUnit.registerEventListeners(vehicleType: any)` | 300 |  |
| `FillUnit:onLoad(savegame: any)` | 318 |  |
| `FillUnit:onPostLoad(savegame: any)` | 413 |  |
| `FillUnit:onDelete()` | 490 |  |
| `FillUnit:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 532 |  |
| `FillUnit:saveStatsToXMLFile(xmlFile: any, key: any)` | 549 |  |
| `FillUnit:onReadStream(streamId: any, connection: any)` | 571 |  |
| `FillUnit:onWriteStream(streamId: any, connection: any)` | 593 |  |
| `FillUnit:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 612 |  |
| `FillUnit:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 655 |  |
| `FillUnit:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 684 |  |
| `FillUnit:onPostUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 745 |  |
| `FillUnit:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 758 |  |
| `FillUnit:onDeactivate()` | 767 |  |
| `FillUnit:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 780 |  |
| `FillUnit:onDischargeTargetObjectChanged(dischargeObject: any)` | 809 |  |
| `FillUnit:getDrawFirstFillText()` | 816 |  |
| `FillUnit:getFillUnits()` | 822 |  |
| `FillUnit:getFillUnitByIndex(fillUnitIndex: any)` | 829 |  |
| `FillUnit:getFillUnitExists(fillUnitIndex: any)` | 839 |  |
| `FillUnit:getFillUnitCapacity(fillUnitIndex: any)` | 846 |  |
| `FillUnit:getFillUnitFreeCapacity(fillUnitIndex: integer, fillTypeIndex: integer, farmId: integer)` | 859 |  |
| `FillUnit:getIsFillAllowedFromFarm(farmId: any)` | 878 |  |
| `FillUnit:getFillUnitFillLevel(fillUnitIndex: any)` | 884 |  |
| `FillUnit:getFillUnitFillLevelPercentage(fillUnitIndex: any)` | 894 |  |
| `FillUnit:getFillUnitFillType(fillUnitIndex: any)` | 910 |  |
| `FillUnit:getFillUnitLastValidFillType(fillUnitIndex: any)` | 920 |  |
| `FillUnit:getFillUnitFirstSupportedFillType(fillUnitIndex: any)` | 930 |  |
| `FillUnit:getFillUnitExactFillRootNode(fillUnitIndex: any)` | 940 |  |
| `FillUnit:getFillUnitRootNode(fillUnitIndex: any)` | 950 |  |
| `FillUnit:getFillUnitAutoAimTargetNode(fillUnitIndex: any)` | 960 |  |
| `FillUnit:getFillUnitSupportsFillType(fillUnitIndex: any, fillType: any)` | 970 |  |
| `FillUnit:getFillUnitSupportsToolType(fillUnitIndex: any, toolType: any)` | 980 |  |
| `FillUnit:getFillUnitSupportsToolTypeAndFillType(fillUnitIndex: any, toolType: any, fillType: any)` | 990 |  |
| `FillUnit:getFillUnitSupportedFillTypes(fillUnitIndex: any)` | 997 |  |
| `FillUnit:getFillUnitSupportedToolTypes(fillUnitIndex: any)` | 1007 |  |
| `FillUnit:getFillUnitAllowsFillType(fillUnitIndex: any, fillType: any)` | 1017 |  |
| `FillUnit:getFillTypeChangeThreshold(fillUnitIndex: any)` | 1033 |  |
| `FillUnit:getFirstValidFillUnitToFill(fillType: any, ignoreCapacity: any)` | 1044 |  |
| `FillUnit:getFillUnitCanBeFilled(fillUnitIndex: any, fillType: any, ignoreCapacity: any)` | 1059 |  |
| `FillUnit:setFillUnitFillType(fillUnitIndex: any, fillTypeIndex: any)` | 1071 |  |
| `FillUnit:setFillUnitFillTypeToDisplay(fillUnitIndex: any, fillTypeIndex: any, isPersistent: any)` | 1082 |  |
| `FillUnit:setFillUnitFillLevelToDisplay(fillUnitIndex: any, fillLevel: any, isPersistent: any)` | 1092 |  |
| `FillUnit:setFillUnitCapacityToDisplay(fillUnitIndex: any, capacity: any)` | 1102 |  |
| `FillUnit:setFillUnitCapacity(fillUnitIndex: any, capacity: any, noEventSend: any)` | 1111 |  |
| `FillUnit:setFillUnitForcedMaterialFillType(fillUnitIndex: any, forcedMaterialFillType: any)` | 1124 |  |
| `FillUnit:getFillUnitForcedMaterialFillType(fillUnitIndex: any)` | 1139 |  |
| `FillUnit:setFillUnitInTriggerRange(fillUnitIndex: any, isInRange: any)` | 1150 |  |
| `FillUnit:updateAlarmTriggers(alarmTriggers: any, fillLevelDelta: any)` | 1155 |  |
| `FillUnit:getAlarmTriggerIsActive(alarmTrigger: any)` | 1178 |  |
| `FillUnit:setAlarmTriggerState(alarmTrigger: any, state: any)` | 1191 |  |
| `FillUnit:getFillUnitIndexFromNode(node: any)` | 1230 |  |
| `FillUnit:getFillUnitExtraDistanceFromNode(node: any)` | 1242 |  |
| `FillUnit:getFillUnitFromNode(node: any)` | 1249 |  |
| `FillUnit:emptyAllFillUnits(ignoreDeleteOnEmptyFlag: any)` | 1256 |  |
| `FillUnit:loadFillUnitUnloadingFromXML(xmlFile: any, key: any, entry: any, index: any)` | 1273 |  |
| `FillUnit:getFillUnitUnloadPalletFilename(fillUnitIndex: any)` | 1283 |  |
| `FillUnit:getFillUnitHasMountedPalletsToUnload()` | 1295 |  |
| `FillUnit:getFillUnitMountedPalletsToUnload()` | 1301 |  |
| `FillUnit:getFillUnitUnloadingTasks()` | 1307 |  |
| `FillUnit:getFillUnitEmptyOnReset()` | 1325 |  |
| `FillUnit:getAllowLoadTriggerActivation(rootVehicle: any)` | 1331 |  |
| `FillUnit:addExactFillRootAimToUpdate(vehicle: any, func: any)` | 1345 |  |
| `FillUnit:unloadFillUnits(ignoreWarning: any)` | 1352 |  |
| `FillUnit:addFillUnitFillLevel(farmId: any, fillUnitIndex: any, fillLevelDelta: any, fillTypeIndex: any, toolType: any, fillPositionData: any)` | 1485 |  |
| `FillUnit:setFillUnitLastValidFillType(fillUnitIndex: any, fillType: any, force: any)` | 1760 |  |
| `FillUnit:loadFillUnitFromXML(xmlFile: any, key: any, entry: any, index: any)` | 1772 |  |
| `FillUnit:loadAlarmTrigger(xmlFile: any, key: any, alarmTrigger: any, fillUnit: any)` | 2061 |  |
| `FillUnit:loadMeasurementNode(xmlFile: any, key: any, entry: any)` | 2095 |  |
| `FillUnit:updateMeasurementNodes(fillUnit: any, dt: any, setActive: any, forcedIntensity: any)` | 2112 |  |
| `FillUnit:loadFillPlane(xmlFile: any, key: any, fillPlane: any, fillUnit: any)` | 2137 |  |
| `FillUnit:setFillPlaneForcedFillType(fillUnitIndex: any, forcedFillType: any)` | 2241 |  |
| `FillUnit:updateFillUnitFillPlane(fillUnit: any)` | 2252 |  |
| `FillUnit:loadFillTypeMaterials(xmlFile: any, key: any)` | 2279 |  |
| `FillUnit:updateFillTypeMaterials(fillTypeMaterials: any, fillTypeIndex: any)` | 2332 |  |
| `FillUnit:updateFillUnitAutoAimTarget(fillUnit: any)` | 2352 |  |
| `FillUnit:addFillUnitTrigger(trigger: table, fillTypeIndex: integer, fillUnitIndex: any)` | 2371 |  |
| `FillUnit:removeFillUnitTrigger(trigger: table)` | 2391 |  |
| `FillUnit:updateFillUnitTriggers()` | 2415 |  |
| `FillUnit:setFillUnitIsFilling(isFilling: any, noEventSend: any)` | 2450 |  |
| `FillUnit:setFillSoundIsPlaying(isPlaying: any)` | 2495 |  |
| `FillUnit:getIsFillUnitActive(fillUnitIndex: any)` | 2510 |  |
| `FillUnit:getAdditionalComponentMass(superFunc: any, component: any)` | 2518 |  |
| `FillUnit:getFillLevelInformation(superFunc: function, display: table)` | 2537 |  |
| `FillUnit:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 2588 |  |
| `FillUnit:getIsReadyForAutomatedTrainTravel(superFunc: any)` | 2603 |  |
| `FillUnit:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 2616 |  |
| `FillUnit:getIsMovingToolActive(superFunc: any, movingTool: any)` | 2630 |  |
| `FillUnit:getDoConsumePtoPower(superFunc: any)` | 2643 |  |
| `FillUnit:getIsPowerTakeOffActive(superFunc: any)` | 2650 |  |
| `FillUnit:getCanBeTurnedOn(superFunc: any)` | 2657 |  |
| `FillUnit:showInfo(superFunc: any, box: any)` | 2671 |  |
| `FillUnit:loadLevelerNodeFromXML(superFunc: any, levelerNode: any, xmlFile: any, key: any)` | 2717 |  |
| `FillUnit:getIsLevelerPickupNodeActive(superFunc: any, levelerNode: any)` | 2727 |  |
| `FillUnit:loadAttacherJointFromXML(superFunc: table, attacherJoint: table, xmlFile: string, baseName: string, index: integer)` | 2742 |  |
| `FillUnit:getIsAttacherJointCompatible(superFunc: any, vehicle: any, attacherJoint: any, inputAttacherVehicle: any, inputAttacherJoint: any)` | 2755 |  |
| `FillUnit:debugGetSupportedFillTypesPerFillUnit()` | 2770 |  |
| `FillUnit.addFillTypeSources(sources: any, currentVehicle: any, excludeVehicle: any, fillTypes: any)` | 2780 |  |
| `FillUnit.loadSpecValueCapacity(xmlFile: any, customEnvironment: any, baseDir: any)` | 2809 |  |
| `FillUnit.getSpecValueCapacity(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 2874 |  |
| `FillUnit.getCapacityFromXml(xmlFile: any)` | 2965 |  |
| `FillUnit.loadSpecValueFillTypes(xmlFile: any, customEnvironment: any, baseDir: any)` | 2980 |  |
| `FillUnit.getFillTypeNamesFromXML(xmlFile: any)` | 3078 |  |
| `FillUnit.getSpecValueFillTypes(storeItem: any, realItem: any, configurations: any)` | 3113 |  |
| `FillUnit.loadSpecValueFillUnitMassData(xmlFile: any, customEnvironment: any, baseDir: any)` | 3155 |  |
| `FillUnit.getSpecValueStartFillUnitMassByMassData(fillUnitMassData: any)` | 3189 |  |
| `FillUnit.actionEventConsoleFillUnitNext(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3214 |  |
| `FillUnit.actionEventConsoleFillUnitInc(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3242 |  |
| `FillUnit.actionEventConsoleFillUnitDec(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3255 |  |
| `FillUnit.actionEventUnload(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3264 |  |
| `FillUnit.updateUnloadActionDisplay(self: any)` | 3270 |  |
| `FillActivatable.new(vehicle: any)` | 3306 |  |
| `FillActivatable:getIsActivatable()` | 3318 |  |
| `FillActivatable:run()` | 3344 |  |
| `FillActivatable:activate()` | 3352 |  |
| `FillActivatable:deactivate()` | 3358 |  |
| `FillActivatable:draw()` | 3364 |  |
| `FillActivatable:updateActivateText(isFilling: any)` | 3372 |  |
| `FillActivatable:setFillType(fillTypeIndex: any)` | 3383 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onFillUnitFillLevelChanged` | 195 |
| registerEvent | `onChangedFillType` | 196 |
| registerEvent | `onAlarmTriggerChanged` | 197 |
| registerEvent | `onAddedFillUnitTrigger` | 198 |
| registerEvent | `onFillUnitTriggerChanged` | 199 |
| registerEvent | `onRemovedFillUnitTrigger` | 200 |
| registerEvent | `onFillUnitIsFillingStateChanged` | 201 |
| registerEvent | `onFillUnitUnloadPallet` | 202 |
| registerEvent | `onFillUnitUnloaded` | 203 |
| registerFunction | `getDrawFirstFillText` | 209 |
| registerFunction | `getFillUnits` | 210 |
| registerFunction | `getFillUnitByIndex` | 211 |
| registerFunction | `getFillUnitExists` | 212 |
| registerFunction | `getFillUnitCapacity` | 213 |
| registerFunction | `getFillUnitFreeCapacity` | 214 |
| registerFunction | `getIsFillAllowedFromFarm` | 215 |
| registerFunction | `getFillUnitFillLevel` | 216 |
| registerFunction | `getFillUnitFillLevelPercentage` | 217 |
| registerFunction | `getFillUnitFillType` | 218 |
| registerFunction | `getFillUnitLastValidFillType` | 219 |
| registerFunction | `getFillUnitFirstSupportedFillType` | 220 |
| registerFunction | `getFillUnitExactFillRootNode` | 221 |
| registerFunction | `getFillUnitRootNode` | 222 |
| registerFunction | `getFillUnitAutoAimTargetNode` | 223 |
| registerFunction | `getFillUnitSupportsFillType` | 224 |
| registerFunction | `getFillUnitSupportsToolType` | 225 |
| registerFunction | `getFillUnitSupportsToolTypeAndFillType` | 226 |
| registerFunction | `getFillUnitSupportedFillTypes` | 227 |
| registerFunction | `getFillUnitSupportedToolTypes` | 228 |
| registerFunction | `getFillUnitAllowsFillType` | 229 |
| registerFunction | `getFillTypeChangeThreshold` | 230 |
| registerFunction | `getFirstValidFillUnitToFill` | 231 |
| registerFunction | `getFillUnitCanBeFilled` | 232 |
| registerFunction | `setFillUnitFillType` | 233 |
| registerFunction | `setFillUnitFillTypeToDisplay` | 234 |
| registerFunction | `setFillUnitFillLevelToDisplay` | 235 |
| registerFunction | `setFillUnitCapacityToDisplay` | 236 |
| registerFunction | `setFillUnitCapacity` | 237 |
| registerFunction | `setFillUnitForcedMaterialFillType` | 238 |
| registerFunction | `getFillUnitForcedMaterialFillType` | 239 |
| registerFunction | `setFillUnitInTriggerRange` | 240 |
| registerFunction | `updateAlarmTriggers` | 241 |
| registerFunction | `getAlarmTriggerIsActive` | 242 |
| registerFunction | `setAlarmTriggerState` | 243 |
| registerFunction | `getFillUnitIndexFromNode` | 244 |
| registerFunction | `getFillUnitExtraDistanceFromNode` | 245 |
| registerFunction | `getFillUnitFromNode` | 246 |
| registerFunction | `addFillUnitFillLevel` | 247 |
| registerFunction | `setFillUnitLastValidFillType` | 248 |
| registerFunction | `loadFillUnitFromXML` | 249 |
| registerFunction | `loadAlarmTrigger` | 250 |
| registerFunction | `loadMeasurementNode` | 251 |
| registerFunction | `updateMeasurementNodes` | 252 |
| registerFunction | `loadFillPlane` | 253 |
| registerFunction | `setFillPlaneForcedFillType` | 254 |
| registerFunction | `updateFillUnitFillPlane` | 255 |
| registerFunction | `loadFillTypeMaterials` | 256 |
| registerFunction | `updateFillTypeMaterials` | 257 |
| registerFunction | `updateFillUnitAutoAimTarget` | 258 |
| registerFunction | `addFillUnitTrigger` | 259 |
| registerFunction | `removeFillUnitTrigger` | 260 |
| registerFunction | `setFillUnitIsFilling` | 261 |
| registerFunction | `setFillSoundIsPlaying` | 262 |
| registerFunction | `getIsFillUnitActive` | 263 |
| registerFunction | `updateFillUnitTriggers` | 264 |
| registerFunction | `emptyAllFillUnits` | 265 |
| registerFunction | `unloadFillUnits` | 266 |
| registerFunction | `loadFillUnitUnloadingFromXML` | 267 |
| registerFunction | `getFillUnitUnloadPalletFilename` | 268 |
| registerFunction | `getFillUnitHasMountedPalletsToUnload` | 269 |
| registerFunction | `getFillUnitMountedPalletsToUnload` | 270 |
| registerFunction | `getFillUnitUnloadingTasks` | 271 |
| registerFunction | `getFillUnitEmptyOnReset` | 272 |
| registerFunction | `getAllowLoadTriggerActivation` | 273 |
| registerFunction | `addExactFillRootAimToUpdate` | 274 |
| registerFunction | `debugGetSupportedFillTypesPerFillUnit` | 275 |
| registerOverwrittenFunction | `getAdditionalComponentMass` | 282 |
| registerOverwrittenFunction | `getFillLevelInformation` | 283 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 284 |
| registerOverwrittenFunction | `getIsReadyForAutomatedTrainTravel` | 285 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 286 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 287 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 288 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 289 |
| registerOverwrittenFunction | `getCanBeTurnedOn` | 290 |
| registerOverwrittenFunction | `showInfo` | 291 |
| registerOverwrittenFunction | `loadLevelerNodeFromXML` | 292 |
| registerOverwrittenFunction | `getIsLevelerPickupNodeActive` | 293 |
| registerOverwrittenFunction | `loadAttacherJointFromXML` | 294 |
| registerOverwrittenFunction | `getIsAttacherJointCompatible` | 295 |
| registerEventListener | `onLoad` | 301 |
| registerEventListener | `onPostLoad` | 302 |
| registerEventListener | `onDelete` | 303 |
| registerEventListener | `onReadStream` | 304 |
| registerEventListener | `onWriteStream` | 305 |
| registerEventListener | `onReadUpdateStream` | 306 |
| registerEventListener | `onWriteUpdateStream` | 307 |
| registerEventListener | `onUpdateTick` | 308 |
| registerEventListener | `onPostUpdate` | 309 |
| registerEventListener | `onDraw` | 310 |
| registerEventListener | `onDeactivate` | 311 |
| registerEventListener | `onRegisterActionEvents` | 312 |
| registerEventListener | `onDischargeTargetObjectChanged` | 313 |
