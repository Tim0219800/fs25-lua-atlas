# vehicles/specializations/DynamicMountAttacher.lua

Source : `dataS/scripts/vehicles/specializations/DynamicMountAttacher.lua` — FS25 1.25.1.0

- **DynamicMountAttacher** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `DynamicMountAttacher.prerequisitesPresent(specializations: any)` | 17 |  |
| `DynamicMountAttacher.initSpecialization()` | 23 |  |
| `DynamicMountAttacher.registerFunctions(vehicleType: any)` | 81 |  |
| `DynamicMountAttacher.registerOverwrittenFunctions(vehicleType: any)` | 106 |  |
| `DynamicMountAttacher.registerEventListeners(vehicleType: any)` | 119 |  |
| `DynamicMountAttacher:onLoad(savegame: any)` | 130 |  |
| `DynamicMountAttacher:onDelete()` | 235 |  |
| `DynamicMountAttacher:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 252 |  |
| `DynamicMountAttacher:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 267 |  |
| `DynamicMountAttacher:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 280 |  |
| `DynamicMountAttacher:lockDynamicMountedObject(object: any, x: any, y: any, z: any, rx: any, ry: any, rz: any)` | 406 |  |
| `DynamicMountAttacher:addDynamicMountedObject(object: any)` | 430 |  |
| `DynamicMountAttacher:removeDynamicMountedObject(object: any, isDeleting: any)` | 535 |  |
| `DynamicMountAttacher:onUnmountObject(object: any)` | 576 |  |
| `DynamicMountAttacher:setDynamicMountAnimationState(state: any)` | 585 |  |
| `DynamicMountAttacher:loadDynamicLockPositionFromXML(xmlFile: any, key: any, lockPosition: any)` | 597 |  |
| `DynamicMountAttacher:getIsDynamicLockPositionActive(lockPosition: any)` | 635 |  |
| `DynamicMountAttacher:writeDynamicMountObjectsToStream(streamId: any, objects: any)` | 641 |  |
| `DynamicMountAttacher:readDynamicMountObjectsFromStream(streamId: any, objects: any)` | 659 |  |
| `DynamicMountAttacher:getAllowDynamicMountObjects()` | 679 |  |
| `DynamicMountAttacher:dynamicMountTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 685 |  |
| `DynamicMountAttacher:getAllowDynamicMountFillLevelInfo()` | 774 |  |
| `DynamicMountAttacher:loadDynamicMountGrabFromXML(xmlFile: any, key: any, entry: any)` | 780 |  |
| `DynamicMountAttacher:getIsDynamicMountGrabOpened(grab: any)` | 794 |  |
| `DynamicMountAttacher:getDynamicMountTimeToMount()` | 800 |  |
| `DynamicMountAttacher:getHasDynamicMountedObjects()` | 806 |  |
| `DynamicMountAttacher:forceDynamicMountPendingObjects(onlyBales: any)` | 812 |  |
| `DynamicMountAttacher:forceUnmountDynamicMountedObjects()` | 831 |  |
| `DynamicMountAttacher:getDynamicMountAttacherSettingsByNode(node: any)` | 846 |  |
| `DynamicMountAttacher:dynamicMountLockPositionOverlapCallback(transformId: any)` | 859 |  |
| `DynamicMountAttacher:getFillLevelInformation(superFunc: any, display: any)` | 870 |  |
| `DynamicMountAttacher:getHasObjectMounted(superFunc: table, object: table) → boolean` | 898 |  |
| `DynamicMountAttacher:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 921 |  |
| `DynamicMountAttacher:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 933 |  |
| `DynamicMountAttacher:getIsAttachedTo(superFunc: any, vehicle: any)` | 948 |  |
| `DynamicMountAttacher:getAdditionalComponentMass(superFunc: any, component: any)` | 972 |  |
| `DynamicMountAttacher:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any) → boolean` | 992 |  |
| `DynamicMountAttacher:loadMovingToolFromXML(superFunc: any, xmlFile: any, key: any, entry: any)` | 1004 |  |
| `DynamicMountAttacher:getIsMovingToolActive(superFunc: any, movingTool: any)` | 1016 |  |
| `DynamicMountAttacher:onPreAttachImplement(object: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 1028 |  |
| `DynamicMountAttacher:updateDebugValues(values: any)` | 1046 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerFunction | `loadDynamicLockPositionFromXML` | 82 |
| registerFunction | `getIsDynamicLockPositionActive` | 83 |
| registerFunction | `writeDynamicMountObjectsToStream` | 84 |
| registerFunction | `readDynamicMountObjectsFromStream` | 85 |
| registerFunction | `getAllowDynamicMountObjects` | 86 |
| registerFunction | `dynamicMountTriggerCallback` | 87 |
| registerFunction | `lockDynamicMountedObject` | 88 |
| registerFunction | `addDynamicMountedObject` | 89 |
| registerFunction | `removeDynamicMountedObject` | 90 |
| registerFunction | `onUnmountObject` | 91 |
| registerFunction | `setDynamicMountAnimationState` | 92 |
| registerFunction | `getAllowDynamicMountFillLevelInfo` | 93 |
| registerFunction | `loadDynamicMountGrabFromXML` | 94 |
| registerFunction | `getIsDynamicMountGrabOpened` | 95 |
| registerFunction | `getDynamicMountTimeToMount` | 96 |
| registerFunction | `getHasDynamicMountedObjects` | 97 |
| registerFunction | `forceDynamicMountPendingObjects` | 98 |
| registerFunction | `forceUnmountDynamicMountedObjects` | 99 |
| registerFunction | `getDynamicMountAttacherSettingsByNode` | 100 |
| registerFunction | `dynamicMountLockPositionOverlapCallback` | 101 |
| registerOverwrittenFunction | `getFillLevelInformation` | 107 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 108 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 109 |
| registerOverwrittenFunction | `getIsAttachedTo` | 110 |
| registerOverwrittenFunction | `getAdditionalComponentMass` | 111 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 112 |
| registerOverwrittenFunction | `loadMovingToolFromXML` | 113 |
| registerOverwrittenFunction | `getIsMovingToolActive` | 114 |
| registerEventListener | `onLoad` | 120 |
| registerEventListener | `onDelete` | 121 |
| registerEventListener | `onReadUpdateStream` | 122 |
| registerEventListener | `onWriteUpdateStream` | 123 |
| registerEventListener | `onUpdateTick` | 124 |
| registerEventListener | `onPreAttachImplement` | 125 |
