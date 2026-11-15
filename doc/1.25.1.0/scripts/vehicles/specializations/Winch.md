# vehicles/specializations/Winch.lua

Source: `dataS/scripts/vehicles/specializations/Winch.lua` — FS25 1.25.1.0


## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Winch.prerequisitesPresent(specializations: table) → boolean` | 30 |  |
| `Winch.initSpecialization()` | 36 |  |
| `Winch.registerXMLPaths(schema: any, baseKey: any)` | 56 |  |
| `Winch.registerFunctions(vehicleType: any)` | 114 |  |
| `Winch.registerOverwrittenFunctions(vehicleType: any)` | 135 |  |
| `Winch.registerEventListeners(vehicleType: any)` | 147 |  |
| `Winch:onLoad(savegame: any)` | 161 |  |
| `Winch:onLoadFinished(savegame: any)` | 235 |  |
| `Winch:onDelete()` | 264 |  |
| `Winch:onReadStream(streamId: integer, connection: Connection)` | 295 |  |
| `Winch:onWriteStream(streamId: integer, connection: Connection)` | 320 |  |
| `Winch:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 344 |  |
| `Winch:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 387 |  |
| `Winch:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 414 |  |
| `Winch:onPostUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 446 |  |
| `Winch:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 574 |  |
| `Winch.actionEventControl(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 604 |  |
| `Winch.actionEventDetach(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 613 |  |
| `Winch.updateActionEvents(self: any)` | 619 |  |
| `Winch:loadWinchRopeFromXML(xmlFile: any, key: any, rope: any)` | 645 |  |
| `Winch:setWinchTreeAttachMode(rope: any, state: any)` | 729 |  |
| `Winch:getIsWinchAttachModeActive(rope: any)` | 760 |  |
| `Winch:getCanAttachWinchTree(rope: any)` | 766 |  |
| `Winch:onAttachTreeInputEvent(rope: any)` | 777 |  |
| `Winch:getWinchRopeSpeedFactor(param: any)` | 800 |  |
| `Winch:getIsWinchTreeAttachAllowed(ropeIndex: any, splitShapeId: any)` | 813 |  |
| `Winch:showWinchTreeMountFailedWarning(ropeIndex: any, reason: any)` | 836 |  |
| `Winch:attachTreeToWinch(splitShapeId: any, x: any, y: any, z: any, ropeIndex: any, setupRopeData: any, noEventSend: any)` | 850 |  |
| `Winch:detachTreeFromWinch(ropeIndex: any, noEventSend: any)` | 919 |  |
| `Winch:setWinchControlInput(ropeIndex: any, direction: any)` | 981 |  |
| `Winch:onWinchPlayerTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 1034 |  |
| `Winch:onWinchTreeRaycastCallback(hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 1063 |  |
| `Winch:onWinchTreeShapeCut(oldShape: any, shape: any)` | 1127 |  |
| `Winch:onWinchTreeShapeMounted(shape: any, mountVehicle: any)` | 1145 |  |
| `Winch:onPlayerPreTeleport(player: Player)` | 1164 |  |
| `Winch:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 1176 |  |
| `Winch:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 1188 |  |
| `Winch:getDoConsumePtoPower(superFunc: any) → boolean` | 1205 |  |
| `Winch:getConsumingLoad(superFunc: any)` | 1220 |  |
| `Winch:getIsPowerTakeOffActive(superFunc: any)` | 1238 |  |
| `Winch:addToPhysics(superFunc: any)` | 1253 |  |
| `Winch:removeFromPhysics(superFunc: any)` | 1270 |  |
| `Winch.loadSpecValueMaxMass(xmlFile: any, customEnvironment: any, baseDir: any)` | 1282 |  |
| `Winch.getSpecValueMaxMass(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 1302 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `loadWinchRopeFromXML` | 115 |
| registerFunction | `setWinchTreeAttachMode` | 116 |
| registerFunction | `getIsWinchAttachModeActive` | 117 |
| registerFunction | `getCanAttachWinchTree` | 118 |
| registerFunction | `onAttachTreeInputEvent` | 119 |
| registerFunction | `getWinchRopeSpeedFactor` | 120 |
| registerFunction | `getIsWinchTreeAttachAllowed` | 121 |
| registerFunction | `showWinchTreeMountFailedWarning` | 122 |
| registerFunction | `attachTreeToWinch` | 123 |
| registerFunction | `detachTreeFromWinch` | 124 |
| registerFunction | `setWinchControlInput` | 125 |
| registerFunction | `onWinchPlayerTriggerCallback` | 126 |
| registerFunction | `onWinchTreeRaycastCallback` | 127 |
| registerFunction | `onWinchTreeShapeCut` | 128 |
| registerFunction | `onWinchTreeShapeMounted` | 129 |
| registerFunction | `onPlayerPreTeleport` | 130 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 136 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 137 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 138 |
| registerOverwrittenFunction | `getConsumingLoad` | 139 |
| registerOverwrittenFunction | `getIsPowerTakeOffActive` | 140 |
| registerOverwrittenFunction | `addToPhysics` | 141 |
| registerOverwrittenFunction | `removeFromPhysics` | 142 |
| registerEventListener | `onLoad` | 148 |
| registerEventListener | `onLoadFinished` | 149 |
| registerEventListener | `onDelete` | 150 |
| registerEventListener | `onReadStream` | 151 |
| registerEventListener | `onWriteStream` | 152 |
| registerEventListener | `onReadUpdateStream` | 153 |
| registerEventListener | `onWriteUpdateStream` | 154 |
| registerEventListener | `onPostUpdate` | 155 |
| registerEventListener | `onRegisterActionEvents` | 156 |

## Messages

- subscribes `MessageType.TREE_SHAPE_CUT` (l.215)
- subscribes `MessageType.TREE_SHAPE_MOUNTED` (l.216)
- subscribes `MessageType.PLAYER_PRE_TELEPORT` (l.217)
- publishes `MessageType.TREE_SHAPE_MOUNTED` (l.910)
