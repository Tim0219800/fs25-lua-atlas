# vehicles/specializations/TensionBelts.lua

Source: `dataS/scripts/vehicles/specializations/TensionBelts.lua` — FS25 1.25.1.0

- **TensionBelts** (l.14)
- **TensionBeltsActivatable** (l.1585)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `TensionBelts.prerequisitesPresent(specializations: any)` | 21 |  |
| `TensionBelts.initSpecialization()` | 27 |  |
| `TensionBelts.registerFunctions(vehicleType: any)` | 85 |  |
| `TensionBelts.registerOverwrittenFunctions(vehicleType: any)` | 106 |  |
| `TensionBelts.registerEventListeners(vehicleType: any)` | 121 |  |
| `TensionBelts:onLoad(savegame: table)` | 137 |  |
| `TensionBelts:onPostLoad(savegame: table)` | 363 |  |
| `TensionBelts:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 384 |  |
| `TensionBelts:onPreDelete()` | 397 |  |
| `TensionBelts:onDelete()` | 410 |  |
| `TensionBelts:onReadStream(streamId: integer, connection: Connection)` | 429 |  |
| `TensionBelts:onWriteStream(streamId: integer, connection: Connection)` | 447 |  |
| `TensionBelts:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 462 |  |
| `TensionBelts:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 602 |  |
| `TensionBelts:onDraw(isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 634 |  |
| `TensionBelts:refreshTensionBelts()` | 657 |  |
| `TensionBelts:freeTensionBeltObject(objectId: any, objectsToJointTable: any, isDynamic: any, object: any)` | 674 |  |
| `TensionBelts:lockTensionBeltObject(objectId: any, objectsToJointTable: any, isDynamic: any, jointNode: any, object: any)` | 746 |  |
| `TensionBelts:setTensionBeltsActive(isActive: boolean, beltId: integer, noEventSend: boolean, playSound: boolean)` | 850 |  |
| `TensionBelts:setAllTensionBeltsActive(isActive: any, noEventSend: any)` | 911 |  |
| `TensionBelts:updateFastenState()` | 924 |  |
| `TensionBelts:createTensionBelt(belt: table, isDummy: boolean, objects: table, playSound: boolean)` | 944 |  |
| `TensionBelts:removeTensionBelt(belt: table, playSound: boolean)` | 1074 |  |
| `TensionBelts:getObjectToMount(belt: table) → table, integer` | 1099 |  |
| `TensionBelts:getObjectsToUnmount(belt: table) → table, integer` | 1200 |  |
| `TensionBelts:objectOverlapCallback(transformId: integer)` | 1231 |  |
| `TensionBelts:getTensionBeltObjectCanBeMounted(object: any)` | 1262 |  |
| `TensionBelts:getIsPlayerInTensionBeltsRange() → boolean, table` | 1315 |  |
| `TensionBelts:getIsDynamicallyMountedNode(node: any)` | 1358 |  |
| `TensionBelts:getIsReadyForAutomatedTrainTravel(superFunc: any)` | 1374 |  |
| `TensionBelts:getCanBeSelected(superFunc: any)` | 1385 |  |
| `TensionBelts:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 1391 |  |
| `TensionBelts:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1404 |  |
| `TensionBelts:getIsMovingToolActive(superFunc: any, movingTool: any)` | 1416 |  |
| `TensionBelts:getCanDischargeToGround(superFunc: any, dischargeNode: any)` | 1429 |  |
| `TensionBelts:getCanDischargeToObject(superFunc: any, dischargeNode: any)` | 1442 |  |
| `TensionBelts:getFillLevelInformation(superFunc: any, display: any)` | 1455 |  |
| `TensionBelts:getHasObjectMounted(superFunc: table, object: table) → boolean` | 1486 |  |
| `TensionBelts:getAdditionalComponentMass(superFunc: any, component: any)` | 1513 |  |
| `TensionBelts:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1540 |  |
| `TensionBelts:tensionBeltActivationTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1555 |  |
| `TensionBelts:onTensionBeltTreeShapeCut(oldShape: any, shape: any)` | 1573 |  |
| `TensionBeltsActivatable.new(object: any)` | 1589 |  |
| `TensionBeltsActivatable:getIsActivatable()` | 1602 |  |
| `TensionBeltsActivatable:getDistance(posX: any, posY: any, posZ: any)` | 1608 |  |
| `TensionBeltsActivatable:run()` | 1619 |  |
| `TensionBeltsActivatable:updateActivateText()` | 1633 |  |
| `TensionBelts.actionEventToggleTensionBelts(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1643 |  |
| `TensionBelts.consoleCommandToggleTensionBeltDebugRendering(unusedSelf: any)` | 1652 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `createTensionBelt` | 86 |
| registerFunction | `removeTensionBelt` | 87 |
| registerFunction | `setTensionBeltsActive` | 88 |
| registerFunction | `setAllTensionBeltsActive` | 89 |
| registerFunction | `objectOverlapCallback` | 90 |
| registerFunction | `getTensionBeltObjectCanBeMounted` | 91 |
| registerFunction | `getObjectToMount` | 92 |
| registerFunction | `getObjectsToUnmount` | 93 |
| registerFunction | `updateFastenState` | 94 |
| registerFunction | `refreshTensionBelts` | 95 |
| registerFunction | `freeTensionBeltObject` | 96 |
| registerFunction | `lockTensionBeltObject` | 97 |
| registerFunction | `getIsPlayerInTensionBeltsRange` | 98 |
| registerFunction | `getIsDynamicallyMountedNode` | 99 |
| registerFunction | `tensionBeltActivationTriggerCallback` | 100 |
| registerFunction | `onTensionBeltTreeShapeCut` | 101 |
| registerOverwrittenFunction | `getIsReadyForAutomatedTrainTravel` | 107 |
| registerOverwrittenFunction | `getCanBeSelected` | 108 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 109 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 110 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 111 |
| registerOverwrittenFunction | `getCanDischargeToGround` | 112 |
| registerOverwrittenFunction | `getCanDischargeToObject` | 113 |
| registerOverwrittenFunction | `getFillLevelInformation` | 114 |
| registerOverwrittenFunction | `getHasObjectMounted` | 115 |
| registerOverwrittenFunction | `getAdditionalComponentMass` | 116 |
| registerEventListener | `onLoad` | 122 |
| registerEventListener | `onPostLoad` | 123 |
| registerEventListener | `onDelete` | 124 |
| registerEventListener | `onPreDelete` | 125 |
| registerEventListener | `onReadStream` | 126 |
| registerEventListener | `onWriteStream` | 127 |
| registerEventListener | `onUpdate` | 128 |
| registerEventListener | `onUpdateTick` | 129 |
| registerEventListener | `onDraw` | 130 |
| registerEventListener | `onRegisterActionEvents` | 131 |

## Messages

- subscribes `MessageType.TREE_SHAPE_CUT` (l.356)
- publishes `MessageType.TREE_SHAPE_MOUNTED` (l.840)
