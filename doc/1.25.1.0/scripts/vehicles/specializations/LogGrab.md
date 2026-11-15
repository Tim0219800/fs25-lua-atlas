# vehicles/specializations/LogGrab.lua

Source: `dataS/scripts/vehicles/specializations/LogGrab.lua` — FS25 1.25.1.0


## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `LogGrab.prerequisitesPresent(specializations: table) → boolean` | 23 |  |
| `LogGrab.initSpecialization()` | 29 |  |
| `LogGrab.registerLogGrabXMLPaths(schema: any, basePath: any)` | 47 |  |
| `LogGrab.registerEvents(vehicleType: table)` | 104 |  |
| `LogGrab.registerFunctions(vehicleType: table)` | 111 |  |
| `LogGrab.registerOverwrittenFunctions(vehicleType: table)` | 125 |  |
| `LogGrab.registerEventListeners(vehicleType: table)` | 134 |  |
| `LogGrab:onLoad(savegame: table)` | 152 |  |
| `LogGrab:onPostLoad(savegame: table)` | 204 |  |
| `LogGrab:onDelete()` | 238 |  |
| `LogGrab:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 252 |  |
| `LogGrab:onReadStream(streamId: integer, connection: Connection)` | 268 |  |
| `LogGrab:onWriteStream(streamId: integer, connection: Connection)` | 283 |  |
| `LogGrab:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 298 |  |
| `LogGrab:loadLogGrabFromXML(xmlFile: any, key: any, logGrab: any)` | 454 |  |
| `LogGrab:updateLogGrabClawState(claw: any, dt: any, ignoreTiming: any, forceDirty: any)` | 615 |  |
| `LogGrab:onCutTree(radius: any, isNewTree: any)` | 685 |  |
| `LogGrab:onTurnedOn()` | 700 |  |
| `LogGrab:onTurnedOff()` | 713 |  |
| `LogGrab:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 726 |  |
| `LogGrab.actionEventClawAnimation(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 748 |  |
| `LogGrab.updateActionEvents(self: any)` | 756 |  |
| `LogGrab:setComponentJointFrame(superFunc: any, jointDesc: any, anchorActor: any)` | 772 |  |
| `LogGrab:getMovingToolMoveValue(superFunc: any, movingTool: any)` | 790 |  |
| `LogGrab:onDelimbTree(superFunc: any, state: any, ...: any)` | 817 |  |
| `LogGrab:getGrabCanMountSplitShape(grab: any, shapeId: any)` | 830 |  |
| `LogGrab:mountSplitShape(grab: any, shapeId: any)` | 843 |  |
| `LogGrab:unmountSplitShape(grab: any, shapeId: any, jointIndex: any, jointTransform: any, isDeleting: any)` | 897 |  |
| `LogGrab:onLogGrabMountedTreesChanged(grab: any)` | 915 |  |
| `LogGrab:onFoldStateChanged(direction: any, moveToMiddle: any)` | 942 |  |
| `LogGrab:onFoldTimeChanged(time: any)` | 961 |  |
| `LogGrab:getIsLogGrabClawStateChangeAllowed(grabIndex: any)` | 967 |  |
| `LogGrab:setLogGrabClawState(grabIndex: any, state: any, noEventSend: any)` | 984 |  |
| `LogGrab:logGrabTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1002 |  |
| `LogGrab:addNodeObjectMapping(superFunc: any, list: any)` | 1029 |  |
| `LogGrab:removeNodeObjectMapping(superFunc: any, list: any)` | 1043 |  |
| `LogGrab:updateDebugValues(values: any)` | 1057 |  |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onLogGrabMountedTreesChanged` | 105 |
| registerFunction | `loadLogGrabFromXML` | 112 |
| registerFunction | `updateLogGrabClawState` | 113 |
| registerFunction | `getGrabCanMountSplitShape` | 114 |
| registerFunction | `mountSplitShape` | 115 |
| registerFunction | `unmountSplitShape` | 116 |
| registerFunction | `getIsLogGrabClawStateChangeAllowed` | 118 |
| registerFunction | `setLogGrabClawState` | 119 |
| registerOverwrittenFunction | `setComponentJointFrame` | 126 |
| registerOverwrittenFunction | `getMovingToolMoveValue` | 127 |
| registerOverwrittenFunction | `onDelimbTree` | 128 |
| registerEventListener | `onLoad` | 135 |
| registerEventListener | `onPostLoad` | 136 |
| registerEventListener | `onDelete` | 137 |
| registerEventListener | `onReadStream` | 138 |
| registerEventListener | `onWriteStream` | 139 |
| registerEventListener | `onUpdateTick` | 140 |
| registerEventListener | `onCutTree` | 141 |
| registerEventListener | `onTurnedOn` | 142 |
| registerEventListener | `onRegisterActionEvents` | 143 |
| registerEventListener | `onLogGrabMountedTreesChanged` | 144 |
| registerEventListener | `onFoldStateChanged` | 145 |
| registerEventListener | `onFoldTimeChanged` | 146 |

## Messages

- publishes `MessageType.TREE_SHAPE_MOUNTED` (l.889)
