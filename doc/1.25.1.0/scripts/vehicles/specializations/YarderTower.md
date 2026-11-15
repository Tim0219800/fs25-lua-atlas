# vehicles/specializations/YarderTower.lua

Source : `dataS/scripts/vehicles/specializations/YarderTower.lua` — FS25 1.25.1.0


## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `YarderTower.prerequisitesPresent(specializations: table) → boolean` | 49 |  |
| `YarderTower.initSpecialization()` | 55 |  |
| `YarderTower.registerRopeXMLPaths(schema: any, baseKey: any)` | 148 |  |
| `YarderTower.registerEvents(vehicleType: any)` | 176 |  |
| `YarderTower.registerFunctions(vehicleType: any)` | 182 |  |
| `YarderTower.registerOverwrittenFunctions(vehicleType: any)` | 218 |  |
| `YarderTower.registerEventListeners(vehicleType: any)` | 234 |  |
| `YarderTower:onLoad(savegame: any)` | 250 |  |
| `YarderTower:onLoadEnd(savegame: table)` | 560 |  |
| `YarderTower:onPreDelete()` | 582 |  |
| `YarderTower:onDelete()` | 591 |  |
| `YarderTower:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 644 |  |
| `YarderTower:onReadStream(streamId: integer, connection: Connection)` | 663 |  |
| `YarderTower:onWriteStream(streamId: integer, connection: Connection)` | 681 |  |
| `YarderTower:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 693 |  |
| `YarderTower:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 704 |  |
| `YarderTower:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 717 |  |
| `YarderTower:onYarderCarriageTreeAttached(treeId: any)` | 1099 |  |
| `YarderTower:onPostAttach(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any, loadFromSavegame: any)` | 1107 |  |
| `YarderTower:onHookI3DLoaded(i3dNode: any, failedReason: any, hookData: any)` | 1116 |  |
| `YarderTower:onRopeI3DLoaded(i3dNode: any, failedReason: any, ropeData: any)` | 1131 |  |
| `YarderTower:getIsSetupModeChangeAllowed()` | 1147 |  |
| `YarderTower:setYarderSetupModeState(state: any, canceled: any)` | 1171 |  |
| `YarderTower:setYarderTargetActive(state: any, noEventSend: any)` | 1199 |  |
| `YarderTower:setYarderCarriageFollowMode(state: any, connection: any, noEventSend: any)` | 1333 |  |
| `YarderTower:setYarderCarriageMoveInput(direction: any)` | 1375 |  |
| `YarderTower:setYarderCarriageLiftInput(direction: any)` | 1392 |  |
| `YarderTower:onYarderCarriageAttach()` | 1405 |  |
| `YarderTower:onYarderCarriageDetach()` | 1411 |  |
| `YarderTower:setupSupportRopes()` | 1417 |  |
| `YarderTower:onCreateCarriageFinished(vehicles: any, vehicleLoadState: any, arguments: any)` | 1546 |  |
| `YarderTower:onCarriageVehicleDeleted(rope: any, state: any)` | 1563 |  |
| `YarderTower:setYarderRopeState(rope: any, state: any)` | 1571 |  |
| `YarderTower:updateYarderRope(rope: any, tx: any, ty: any, tz: any, dt: any, isSupportRope: any, emissiveColor: any)` | 1600 |  |
| `YarderTower:updateYarderRopeLengthNodes(rope: any, length: any)` | 1643 |  |
| `YarderTower:getTreeAtPosition(x: any, y: any, z: any, maxRadius: any)` | 1676 |  |
| `YarderTower:getIsPlayerInYarderRange()` | 1686 |  |
| `YarderTower:getIsPlayerInYarderControlRange(x: any, y: any, z: any)` | 1698 |  |
| `YarderTower:getYarderIsSetUp()` | 1728 |  |
| `YarderTower:getYarderStatusInfo()` | 1734 |  |
| `YarderTower:getYarderMainRopeLength()` | 1762 |  |
| `YarderTower:getYarderCarriageLastSpeed()` | 1776 |  |
| `YarderTower:getIsTreeShapeUsedForYarderSetup(shape: any)` | 1783 |  |
| `YarderTower:onYarderControlTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 1806 |  |
| `YarderTower:onYarderTreeRaycastCallback(hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 1825 |  |
| `YarderTower:doRopePlacementValidation(ropeNode: any, treeId: any, ex: any, ey: any, ez: any, maxAngle: any, maxLength: any, clearance: any, minTreeDiameter: any, callbackData: any)` | 1845 |  |
| `YarderTower.onYarderMainTreeRaycastCallback(callbackData: any, hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 1884 |  |
| `YarderTower:onMainRopePlacementValidated(isValid: any, x: any, y: any, z: any, reason: any)` | 1898 |  |
| `YarderTower.onYarderSupportTerrainRaycastCallback(supportRope: any, hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 1928 |  |
| `YarderTower:onSupportRopeTreeOverlapCallback(objectId: any, ...: any)` | 1957 |  |
| `YarderTower:onYarderTowerPlayerDeleted()` | 1966 |  |
| `YarderTower:isDetachAllowed(superFunc: any) → boolean` | 1974 |  |
| `YarderTower:getIsFoldAllowed(superFunc: any, direction: any, onAiTurnOn: any)` | 1990 |  |
| `YarderTower:getAllowsLowering(superFunc: any)` | 2001 |  |
| `YarderTower:getDoConsumePtoPower(superFunc: any) → boolean` | 2013 |  |
| `YarderTower:getConsumingLoad(superFunc: any)` | 2024 |  |
| `YarderTower:getIsPowerTakeOffActive(superFunc: any)` | 2038 |  |
| `YarderTower:getDirtMultiplier(superFunc: any) → number` | 2056 |  |
| `YarderTower:getWearMultiplier(superFunc: any) → number` | 2070 |  |
| `YarderTower:getUsageCausesDamage(superFunc: any)` | 2083 |  |
| `YarderTower:addToPhysics(superFunc: any)` | 2094 |  |
| `YarderTower:removeFromPhysics(superFunc: any)` | 2114 |  |
| `YarderTower.getIsVehicleControlAllowed(self: any)` | 2135 |  |
| `YarderTower.loadSpecValueMaxLength(xmlFile: any, customEnvironment: any, baseDir: any)` | 2146 |  |
| `YarderTower.getSpecValueMaxLength(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 2152 |  |
| `YarderTower.loadSpecValueMaxMass(xmlFile: any, customEnvironment: any, baseDir: any)` | 2168 |  |
| `YarderTower.getSpecValueMaxMass(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 2174 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onYarderCarriageTreeAttached` | 177 |
| registerFunction | `onHookI3DLoaded` | 183 |
| registerFunction | `onRopeI3DLoaded` | 184 |
| registerFunction | `getIsSetupModeChangeAllowed` | 185 |
| registerFunction | `setYarderSetupModeState` | 186 |
| registerFunction | `setYarderTargetActive` | 187 |
| registerFunction | `setYarderCarriageFollowMode` | 188 |
| registerFunction | `setYarderCarriageMoveInput` | 189 |
| registerFunction | `setYarderCarriageLiftInput` | 190 |
| registerFunction | `onYarderCarriageAttach` | 191 |
| registerFunction | `onYarderCarriageDetach` | 192 |
| registerFunction | `setupSupportRopes` | 193 |
| registerFunction | `onCreateCarriageFinished` | 194 |
| registerFunction | `onCarriageVehicleDeleted` | 195 |
| registerFunction | `setYarderRopeState` | 196 |
| registerFunction | `updateYarderRope` | 197 |
| registerFunction | `updateYarderRopeLengthNodes` | 198 |
| registerFunction | `getTreeAtPosition` | 199 |
| registerFunction | `getIsPlayerInYarderRange` | 200 |
| registerFunction | `getIsPlayerInYarderControlRange` | 201 |
| registerFunction | `getYarderIsSetUp` | 202 |
| registerFunction | `getYarderStatusInfo` | 203 |
| registerFunction | `getYarderMainRopeLength` | 204 |
| registerFunction | `getYarderCarriageLastSpeed` | 205 |
| registerFunction | `getIsTreeShapeUsedForYarderSetup` | 206 |
| registerFunction | `onYarderControlTriggerCallback` | 207 |
| registerFunction | `onYarderTreeRaycastCallback` | 208 |
| registerFunction | `doRopePlacementValidation` | 209 |
| registerFunction | `onMainRopePlacementValidated` | 210 |
| registerFunction | `onYarderSupportTerrainRaycastCallback` | 211 |
| registerFunction | `onSupportRopeTreeOverlapCallback` | 212 |
| registerFunction | `onYarderTowerPlayerDeleted` | 213 |
| registerOverwrittenFunction | `isDetachAllowed` | 219 |
| registerOverwrittenFunction | `getIsFoldAllowed` | 220 |
| registerOverwrittenFunction | `getAllowsLowering` | 221 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 222 |
| registerOverwrittenFunction | `getConsumingLoad` | 223 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 224 |
| registerOverwrittenFunction | `getDirtMultiplier` | 225 |
| registerOverwrittenFunction | `getWearMultiplier` | 226 |
| registerOverwrittenFunction | `getUsageCausesDamage` | 227 |
| registerOverwrittenFunction | `addToPhysics` | 228 |
| registerOverwrittenFunction | `removeFromPhysics` | 229 |
| registerEventListener | `onLoad` | 235 |
| registerEventListener | `onLoadEnd` | 236 |
| registerEventListener | `onPreDelete` | 237 |
| registerEventListener | `onDelete` | 238 |
| registerEventListener | `onReadStream` | 239 |
| registerEventListener | `onWriteStream` | 240 |
| registerEventListener | `onReadUpdateStream` | 241 |
| registerEventListener | `onWriteUpdateStream` | 242 |
| registerEventListener | `onUpdate` | 243 |
| registerEventListener | `onYarderCarriageTreeAttached` | 244 |
| registerEventListener | `onPostAttach` | 245 |
