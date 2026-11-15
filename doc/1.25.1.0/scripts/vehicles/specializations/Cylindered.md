# vehicles/specializations/Cylindered.lua

Source : `dataS/scripts/vehicles/specializations/Cylindered.lua` — FS25 1.25.1.0

- **Cylindered** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Cylindered.prerequisitesPresent(specializations: table) → boolean` | 57 |  |
| `Cylindered.initSpecialization()` | 63 |  |
| `Cylindered.registerSoundXMLPaths(schema: any, baseKey: any)` | 153 |  |
| `Cylindered.registerEasyArmControlXMLPaths(schema: any, key: any)` | 165 |  |
| `Cylindered.registerMovingToolXMLPaths(schema: any, toolKey: any)` | 186 |  |
| `Cylindered.registerMovingPartXMLPaths(schema: any, partKey: any)` | 269 |  |
| `Cylindered.registerDependentComponentJointXMLPaths(schema: any, basePath: any)` | 343 |  |
| `Cylindered.registerCopyLocalDirectionXMLPaths(schema: any, basePath: any)` | 351 |  |
| `Cylindered.registerDependentAnimationXMLPaths(schema: any, basePath: any)` | 361 |  |
| `Cylindered.registerDependentMovingToolXMLPaths(schema: any, basePath: any)` | 373 |  |
| `Cylindered.registerEvents(vehicleType: any)` | 391 |  |
| `Cylindered.registerFunctions(vehicleType: any)` | 397 |  |
| `Cylindered.registerOverwrittenFunctions(vehicleType: any)` | 443 |  |
| `Cylindered.registerEventListeners(vehicleType: any)` | 462 |  |
| `Cylindered:onLoad(savegame: table)` | 492 |  |
| `Cylindered:onPostLoad(savegame: table)` | 703 |  |
| `Cylindered:onLoadFinished(savegame: table)` | 876 |  |
| `Cylindered:onRegisterDashboardValueTypes()` | 890 |  |
| `Cylindered:onDelete()` | 901 |  |
| `Cylindered:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 919 |  |
| `Cylindered:onReadStream(streamId: integer, connection: Connection)` | 946 |  |
| `Cylindered:onWriteStream(streamId: integer, connection: Connection)` | 989 |  |
| `Cylindered:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 1018 |  |
| `Cylindered:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 1091 |  |
| `Cylindered:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1149 |  |
| `Cylindered:setDelayedData(tool: any, immediate: any)` | 1375 |  |
| `Cylindered:updateDelayedTool(tool: any, forceLastPosition: any)` | 1391 |  |
| `Cylindered:loadEasyArmControlFromXML(xmlFile: any, key: any, easyArmControl: any)` | 1425 |  |
| `Cylindered:updateEasyControl(dt: any, updateDelayedNodes: any)` | 1570 |  |
| `Cylindered:setIsEasyControlActive(state: any)` | 1756 |  |
| `Cylindered:setEasyControlForcedTransMove(value: any)` | 1802 |  |
| `Cylindered:updateExtraDependentParts(part: any, dt: any)` | 1812 |  |
| `Cylindered:updateDependentAnimations(part: any, dt: any)` | 1817 |  |
| `Cylindered:updateDependentToolLimits(tool: any, dependentTool: any)` | 1844 |  |
| `Cylindered:onMovingPartSoundEvent(part: any, action: any, type: any)` | 1879 |  |
| `Cylindered:updateMovingToolSoundEvents(tool: any, direction: any, hitLimit: any, wasAtLimit: any)` | 1940 |  |
| `Cylindered:updateControlGroups()` | 1975 |  |
| `Cylindered:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 2009 |  |
| `Cylindered:onUpdateEnd(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 2086 |  |
| `Cylindered:onPostUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 2099 |  |
| `Cylindered:onPostUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 2112 |  |
| `Cylindered:updateDirtyMovingParts(dt: any, updateSound: any)` | 2119 |  |
| `Cylindered:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 2182 |  |
| `Cylindered:loadMovingPartsFromXML(xmlFile: any, key: any)` | 2195 |  |
| `Cylindered:loadMovingPartFromXML(xmlFile: any, key: any, entry: any)` | 2230 |  |
| `Cylindered:loadMovingToolsFromXML(xmlFile: any, key: any)` | 2425 |  |
| `Cylindered:loadMovingToolFromXML(xmlFile: any, key: any, entry: any)` | 2457 |  |
| `Cylindered:loadDependentMovingTools(xmlFile: XMLFile, baseName: string, entry: table)` | 2703 |  |
| `Cylindered:loadDependentParts(xmlFile: XMLFile, baseName: string, entry: table)` | 2768 |  |
| `Cylindered:resolveDependentPartData(dependentPartData: table, referenceNodes: table)` | 2795 |  |
| `Cylindered:loadDependentComponentJoints(xmlFile: XMLFile, baseName: string, entry: table)` | 2831 |  |
| `Cylindered:loadDependentAttacherJoints(xmlFile: XMLFile, baseName: string, entry: table)` | 2882 |  |
| `Cylindered:loadDependentWheels(xmlFile: XMLFile, baseName: string, entry: table)` | 2916 |  |
| `Cylindered:loadDependentTranslatingParts(xmlFile: XMLFile, baseName: string, entry: table)` | 2952 |  |
| `Cylindered:loadExtraDependentParts(xmlFile: any, baseName: any, entry: any)` | 3011 |  |
| `Cylindered:loadDependentAnimations(xmlFile: any, baseName: any, entry: any)` | 3017 |  |
| `Cylindered:loadCopyLocalDirectionParts(xmlFile: XMLFile, baseName: string, entry: table)` | 3065 |  |
| `Cylindered:loadRotationBasedLimits(xmlFile: any, key: any, tool: any)` | 3097 |  |
| `Cylindered:loadActionSoundsFromXML(xmlFile: any, key: any)` | 3119 |  |
| `Cylindered:checkMovingPartDirtyUpdateNode(node: any, movingPart: any)` | 3189 |  |
| `Cylindered:setMovingToolDirty(node: integer, forceUpdate: boolean, dt: number)` | 3197 |  |
| `Cylindered:setMovingPartReferenceNode(movingPartNode: integer, referenceNode: integer, isActiveDirty: any)` | 3242 |  |
| `Cylindered:updateMovingPartByNode(movingPartNode: any, dt: any)` | 3303 |  |
| `Cylindered:updateCylinderedInitial(placeComponents: boolean, keepDirty: any)` | 3316 |  |
| `Cylindered:allowLoadMovingToolStates(superFunc: any) → boolean` | 3362 |  |
| `Cylindered:getMovingToolByNode(node: any)` | 3368 |  |
| `Cylindered:getMovingPartByNode(node: any)` | 3374 |  |
| `Cylindered:getTranslatingPartByNode(node: any)` | 3380 |  |
| `Cylindered:getIsMovingToolActive(movingTool: any)` | 3398 |  |
| `Cylindered:getIsMovingPartActive(movingPart: any)` | 3404 |  |
| `Cylindered:getMovingToolMoveValue(movingTool: any)` | 3410 |  |
| `Cylindered:isDetachAllowed(superFunc: function) → boolean, string?` | 3419 |  |
| `Cylindered:loadObjectChangeValuesFromXML(superFunc: XMLFile, xmlFile: XMLFile, key: string, node: integer, object: table)` | 3452 |  |
| `Cylindered:setObjectChangeValues(superFunc: table, object: table, isActive: boolean)` | 3491 |  |
| `Cylindered:loadDischargeNode(superFunc: any, xmlFile: any, key: any, entry: any)` | 3520 |  |
| `Cylindered:getDischargeNodeEmptyFactor(superFunc: any, dischargeNode: any)` | 3541 |  |
| `Cylindered:loadShovelNode(superFunc: any, xmlFile: any, key: any, entry: any)` | 3565 |  |
| `Cylindered:getShovelNodeIsActive(superFunc: any, shovelNode: any)` | 3585 |  |
| `Cylindered:loadDynamicMountGrabFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 3605 |  |
| `Cylindered:getIsDynamicMountGrabOpened(superFunc: any, grab: any)` | 3625 |  |
| `Cylindered:setComponentJointFrame(superFunc: any, jointDesc: any, anchorActor: any)` | 3645 |  |
| `Cylindered:getAdditionalSchemaText(superFunc: any)` | 3669 |  |
| `Cylindered:getWearMultiplier(superFunc: any) → number` | 3686 |  |
| `Cylindered:getDoConsumePtoPower(superFunc: any) → boolean` | 3700 |  |
| `Cylindered:getConsumingLoad(superFunc: any)` | 3706 |  |
| `Cylindered:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 3716 |  |
| `Cylindered:onPostAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 3749 |  |
| `Cylindered:onSelect(subSelectionIndex: any)` | 3796 |  |
| `Cylindered:onUnselect()` | 3808 |  |
| `Cylindered:onDeactivate()` | 3815 |  |
| `Cylindered:onAnimationPartChanged(node: any)` | 3831 |  |
| `Cylindered:onAIImplementStart()` | 3837 |  |
| `Cylindered:onVehicleSettingChanged(gameSettingId: any, state: any)` | 3849 |  |
| `Cylindered:onRegisterAnimationValueTypes()` | 3857 |  |
| `Cylindered.setToolTranslation(self: table, tool: table, transSpeed: number, dt: number, delta: any) → boolean` | 3919 |  |
| `Cylindered.setAbsoluteToolTranslation(self: table, tool: table, translation: number)` | 3960 |  |
| `Cylindered.setToolRotation(self: table, tool: table, rotSpeed: number, dt: number, delta: number) → boolean` | 3978 |  |
| `Cylindered.setAbsoluteToolRotation(self: table, tool: table, rotation: number, updateDelayedNodes: boolean)` | 4032 |  |
| `Cylindered.setToolAnimation(self: table, tool: table, animSpeed: number, dt: number) → boolean` | 4053 |  |
| `Cylindered.getMovingToolState(self: table, tool: table) → number` | 4091 |  |
| `Cylindered.setDirty(self: table, part: table)` | 4111 |  |
| `Cylindered.updateWheels(self: table, part: table)` | 4138 |  |
| `Cylindered.updateMovingPart(self: table, part: table, placeComponents: boolean?, updateDependentParts: boolean?, isActive: boolean?, updateSounds: any)` | 4156 |  |
| `Cylindered.updateComponentJoints(self: table, entry: table, placeComponents: boolean)` | 4675 |  |
| `Cylindered.updateAttacherJoints(self: table, entry: table)` | 4704 |  |
| `Cylindered.limitInterpolator(first: any, second: any, alpha: any)` | 4758 |  |
| `Cylindered.updateRotationBasedLimits(self: any, tool: any, dependentTool: any)` | 4784 |  |
| `Cylindered.actionEventInput(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 4836 |  |
| `Cylindered.getMovingToolDashboardState(self: any, dashboard: any)` | 4915 |  |
| `Cylindered.movingToolDashboardAttributes(self: any, xmlFile: any, key: any, dashboard: any, components: any, i3dMappings: any)` | 4971 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onMovingToolChanged` | 392 |
| registerFunction | `loadMovingPartsFromXML` | 398 |
| registerFunction | `loadMovingPartFromXML` | 399 |
| registerFunction | `loadMovingToolsFromXML` | 400 |
| registerFunction | `loadMovingToolFromXML` | 401 |
| registerFunction | `loadDependentMovingTools` | 402 |
| registerFunction | `loadEasyArmControlFromXML` | 403 |
| registerFunction | `loadDependentParts` | 404 |
| registerFunction | `resolveDependentPartData` | 405 |
| registerFunction | `loadDependentComponentJoints` | 406 |
| registerFunction | `loadDependentAttacherJoints` | 407 |
| registerFunction | `loadDependentWheels` | 408 |
| registerFunction | `loadDependentTranslatingParts` | 409 |
| registerFunction | `loadExtraDependentParts` | 410 |
| registerFunction | `loadDependentAnimations` | 411 |
| registerFunction | `loadCopyLocalDirectionParts` | 412 |
| registerFunction | `loadRotationBasedLimits` | 413 |
| registerFunction | `loadActionSoundsFromXML` | 414 |
| registerFunction | `checkMovingPartDirtyUpdateNode` | 415 |
| registerFunction | `updateDirtyMovingParts` | 416 |
| registerFunction | `setMovingToolDirty` | 417 |
| registerFunction | `setMovingPartReferenceNode` | 418 |
| registerFunction | `updateMovingPartByNode` | 419 |
| registerFunction | `updateCylinderedInitial` | 420 |
| registerFunction | `allowLoadMovingToolStates` | 421 |
| registerFunction | `getMovingToolByNode` | 422 |
| registerFunction | `getMovingPartByNode` | 423 |
| registerFunction | `getTranslatingPartByNode` | 424 |
| registerFunction | `getIsMovingToolActive` | 425 |
| registerFunction | `getIsMovingPartActive` | 426 |
| registerFunction | `getMovingToolMoveValue` | 427 |
| registerFunction | `setDelayedData` | 428 |
| registerFunction | `updateDelayedTool` | 429 |
| registerFunction | `updateEasyControl` | 430 |
| registerFunction | `setIsEasyControlActive` | 431 |
| registerFunction | `setEasyControlForcedTransMove` | 432 |
| registerFunction | `updateExtraDependentParts` | 433 |
| registerFunction | `updateDependentAnimations` | 434 |
| registerFunction | `updateDependentToolLimits` | 435 |
| registerFunction | `onMovingPartSoundEvent` | 436 |
| registerFunction | `updateMovingToolSoundEvents` | 437 |
| registerFunction | `updateControlGroups` | 438 |
| registerOverwrittenFunction | `isDetachAllowed` | 444 |
| registerOverwrittenFunction | `loadObjectChangeValuesFromXML` | 445 |
| registerOverwrittenFunction | `setObjectChangeValues` | 446 |
| registerOverwrittenFunction | `loadDischargeNode` | 447 |
| registerOverwrittenFunction | `getDischargeNodeEmptyFactor` | 448 |
| registerOverwrittenFunction | `loadShovelNode` | 449 |
| registerOverwrittenFunction | `getShovelNodeIsActive` | 450 |
| registerOverwrittenFunction | `loadDynamicMountGrabFromXML` | 451 |
| registerOverwrittenFunction | `getIsDynamicMountGrabOpened` | 452 |
| registerOverwrittenFunction | `setComponentJointFrame` | 453 |
| registerOverwrittenFunction | `getAdditionalSchemaText` | 454 |
| registerOverwrittenFunction | `getWearMultiplier` | 455 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 456 |
| registerOverwrittenFunction | `getConsumingLoad` | 457 |
| registerEventListener | `onLoad` | 463 |
| registerEventListener | `onPostLoad` | 464 |
| registerEventListener | `onLoadFinished` | 465 |
| registerEventListener | `onRegisterDashboardValueTypes` | 466 |
| registerEventListener | `onDelete` | 467 |
| registerEventListener | `onReadStream` | 468 |
| registerEventListener | `onWriteStream` | 469 |
| registerEventListener | `onReadUpdateStream` | 470 |
| registerEventListener | `onWriteUpdateStream` | 471 |
| registerEventListener | `onUpdate` | 472 |
| registerEventListener | `onUpdateTick` | 473 |
| registerEventListener | `onUpdateEnd` | 474 |
| registerEventListener | `onPostUpdate` | 475 |
| registerEventListener | `onPostUpdateTick` | 476 |
| registerEventListener | `onDraw` | 477 |
| registerEventListener | `onRegisterActionEvents` | 478 |
| registerEventListener | `onPostAttach` | 479 |
| registerEventListener | `onSelect` | 480 |
| registerEventListener | `onUnselect` | 481 |
| registerEventListener | `onDeactivate` | 482 |
| registerEventListener | `onAnimationPartChanged` | 483 |
| registerEventListener | `onAIImplementStart` | 484 |
| registerEventListener | `onVehicleSettingChanged` | 485 |
| registerEventListener | `onRegisterAnimationValueTypes` | 486 |
