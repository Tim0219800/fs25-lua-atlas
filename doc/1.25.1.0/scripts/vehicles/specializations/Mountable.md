# vehicles/specializations/Mountable.lua

Source : `dataS/scripts/vehicles/specializations/Mountable.lua` — FS25 1.25.1.0

- **Mountable** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Mountable.prerequisitesPresent(specializations: any)` | 20 |  |
| `Mountable.initSpecialization()` | 26 |  |
| `Mountable.registerEvents(vehicleType: any)` | 56 |  |
| `Mountable.registerFunctions(vehicleType: any)` | 62 |  |
| `Mountable.registerOverwrittenFunctions(vehicleType: any)` | 90 |  |
| `Mountable.registerEventListeners(vehicleType: any)` | 104 |  |
| `Mountable:onLoad(savegame: any)` | 115 |  |
| `Mountable:onDelete()` | 190 |  |
| `Mountable:onReadStream(streamId: any, connection: any)` | 212 |  |
| `Mountable:onWriteStream(streamId: any, connection: any)` | 218 |  |
| `Mountable:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 224 |  |
| `Mountable:getSupportsMountDynamic()` | 253 |  |
| `Mountable:getSupportsMountKinematic()` | 260 |  |
| `Mountable:onDynamicMountJointBreak(jointIndex: any, breakingImpulse: any)` | 266 |  |
| `Mountable:mountableTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 278 |  |
| `Mountable:mount(object: any, node: any, x: any, y: any, z: any, rx: any, ry: any, rz: any)` | 318 |  |
| `Mountable:unmount(noEventSend: any)` | 339 |  |
| `Mountable:mountKinematic(object: any, node: any, x: any, y: any, z: any, rx: any, ry: any, rz: any)` | 366 |  |
| `Mountable:unmountKinematic()` | 403 |  |
| `Mountable:mountDynamic(object: any, objectActorId: any, jointNode: any, mountType: any, forceAcceleration: any)` | 447 |  |
| `Mountable:unmountDynamic(isDelete: any)` | 530 |  |
| `Mountable:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 568 |  |
| `Mountable:getAdditionalMountingDistance()` | 578 |  |
| `Mountable:getAdditionalMountingMass()` | 584 |  |
| `Mountable:updateDynamicMountJointForceLimit(dt: any)` | 590 |  |
| `Mountable:additionalMountingMassRaycastCallback(hitObjectId: integer, x: number, y: number, z: number, distance: number, nx: number, ny: number, nz: number, subShapeIndex: integer, shapeId: integer, isLast: boolean) → boolean` | 623 |  |
| `Mountable:getIsActive(superFunc: any)` | 658 |  |
| `Mountable:getMountObject()` | 671 |  |
| `Mountable:getDynamicMountObject()` | 681 |  |
| `Mountable:setReducedComponentMass(state: any)` | 691 |  |
| `Mountable:getAllowComponentMassReduction()` | 707 |  |
| `Mountable:getDefaultAllowComponentMassReduction()` | 713 |  |
| `Mountable:getMountableLockPositions()` | 719 |  |
| `Mountable:setDynamicMountType(mountType: any, mountObject: any, noEventSend: any)` | 725 |  |
| `Mountable:addMountStateChangeListener(object: any, callbackFunc: any)` | 756 |  |
| `Mountable:removeMountStateChangeListener(object: any, callbackFunc: any)` | 773 |  |
| `Mountable:getOwnerConnection(superFunc: any)` | 793 |  |
| `Mountable:findRootVehicle(superFunc: any)` | 806 |  |
| `Mountable:getIsMapHotspotVisible(superFunc: any)` | 824 |  |
| `Mountable:getAdditionalComponentMass(superFunc: any, component: any)` | 838 |  |
| `Mountable:setWorldPositionQuaternion(superFunc: number, x: number, y: number, z: number, qx: number, qy: number, qz: number, qw: number, i: integer, changeInterp: boolean)` | 860 |  |
| `Mountable:onPreAttach(attacherVehicle: table, inputJointDescIndex: integer, jointDescIndex: integer)` | 878 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onDynamicMountTypeChanged` | 57 |
| registerFunction | `getSupportsMountDynamic` | 63 |
| registerFunction | `getSupportsMountKinematic` | 64 |
| registerFunction | `onDynamicMountJointBreak` | 65 |
| registerFunction | `mountableTriggerCallback` | 66 |
| registerFunction | `mount` | 67 |
| registerFunction | `unmount` | 68 |
| registerFunction | `mountKinematic` | 69 |
| registerFunction | `unmountKinematic` | 70 |
| registerFunction | `mountDynamic` | 71 |
| registerFunction | `unmountDynamic` | 72 |
| registerFunction | `getAdditionalMountingDistance` | 73 |
| registerFunction | `getAdditionalMountingMass` | 74 |
| registerFunction | `updateDynamicMountJointForceLimit` | 75 |
| registerFunction | `additionalMountingMassRaycastCallback` | 76 |
| registerFunction | `getMountObject` | 77 |
| registerFunction | `getDynamicMountObject` | 78 |
| registerFunction | `setReducedComponentMass` | 79 |
| registerFunction | `getAllowComponentMassReduction` | 80 |
| registerFunction | `getDefaultAllowComponentMassReduction` | 81 |
| registerFunction | `getMountableLockPositions` | 82 |
| registerFunction | `setDynamicMountType` | 83 |
| registerFunction | `addMountStateChangeListener` | 84 |
| registerFunction | `removeMountStateChangeListener` | 85 |
| registerOverwrittenFunction | `getIsActive` | 91 |
| registerOverwrittenFunction | `getOwnerConnection` | 92 |
| registerOverwrittenFunction | `findRootVehicle` | 93 |
| registerOverwrittenFunction | `getIsMapHotspotVisible` | 94 |
| registerOverwrittenFunction | `getAdditionalComponentMass` | 95 |
| registerOverwrittenFunction | `setWorldPositionQuaternion` | 96 |
| registerOverwrittenFunction | `addToPhysics` | 97 |
| registerOverwrittenFunction | `removeFromPhysics` | 98 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 99 |
| registerEventListener | `onLoad` | 105 |
| registerEventListener | `onDelete` | 106 |
| registerEventListener | `onReadStream` | 107 |
| registerEventListener | `onWriteStream` | 108 |
| registerEventListener | `onUpdate` | 109 |
| registerEventListener | `onPreAttach` | 110 |
