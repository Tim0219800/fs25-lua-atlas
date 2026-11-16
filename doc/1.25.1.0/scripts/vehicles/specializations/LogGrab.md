# vehicles/specializations/LogGrab.lua

*[Version française](../../../fr/scripts/vehicles/specializations/LogGrab.md)*

Source: `dataS/scripts/vehicles/specializations/LogGrab.lua` — FS25 1.25.1.0

✍ Specialization for log grabs and grapples that hold trees or logs. Each `vehicle.logGrab.grab` (optionally per `logGrab` configuration) has a tree trigger, claws tied to component joints, an optional claw animation and lock animation, and a tree detection box. When the claws close, tree shapes in the trigger are fixed with a physics joint (server only), and joint limits and drive forces adapt to the mounted mass. It cooperates with Cylindered moving tools, Foldable and WoodHarvester when present, and raises `onLogGrabMountedTreesChanged`. No prerequisites.


## Functions

| Function | Line | Description |
|---|---|---|
| `LogGrab.prerequisitesPresent(specializations: table) → boolean` | 23 | ✍ Always returns true: no other specialization is required. |
| `LogGrab.initSpecialization()` | 29 | ✍ Registers the `logGrab` vehicle configuration type, the grab XML paths (base and per configuration) and the savegame attribute for each grab's claw state. |
| `LogGrab.registerLogGrabXMLPaths(schema: any, basePath: any)` | 47 | ✍ Registers all XML paths of one grab: joint nodes, limits, claws and their moving tools, claw and lock animations, tree detection, component joint limits and mass-based drive force settings. Note: `clawAnimation#foldMaxLimit` has default 1 in the schema but 0 in the loader. |
| `LogGrab.registerEvents(vehicleType: table)` | 104 | ✍ Registers the specialization event `onLogGrabMountedTreesChanged`. |
| `LogGrab.registerFunctions(vehicleType: table)` | 111 | ✍ Registers the grab loading, claw state, mounting and unmounting functions on the vehicle type. |
| `LogGrab.registerOverwrittenFunctions(vehicleType: table)` | 125 | ✍ Overrides `setComponentJointFrame`, `getMovingToolMoveValue` and `onDelimbTree`. Note: `addNodeObjectMapping`, `removeNodeObjectMapping` and `updateDebugValues` are defined below but not registered here (UNVERIFIED whether registered elsewhere). |
| `LogGrab.registerEventListeners(vehicleType: table)` | 134 | ✍ Subscribes to onLoad, onPostLoad, onDelete, onReadStream, onWriteStream, onUpdateTick, onCutTree, onTurnedOn, onRegisterActionEvents, onLogGrabMountedTreesChanged, onFoldStateChanged and onFoldTimeChanged. Note: onTurnedOff is not subscribed here. |
| `LogGrab:onLoad(savegame: table)` | 152 | ✍ Loads the grabs of the selected configuration and of the base `vehicle.logGrab` block. If none loads, removes all other event listeners of the specialization. |
| `LogGrab:onPostLoad(savegame: table)` | 204 | ✍ Restores the saved claw state (or initial state) and plays the closed animation instantly if closed; resolves the moving tool references and drops entries that cannot be found. |
| `LogGrab:onDelete()` | 238 | ✍ Removes the tree trigger callbacks of all grabs. |
| `LogGrab:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 252 | ✍ Saves the claw animation state of each grab that has a claw animation. |
| `LogGrab:onReadStream(streamId: integer, connection: Connection)` | 268 | ✍ Client join: reads the claw state of each animated grab and applies it without sending an event. |
| `LogGrab:onWriteStream(streamId: integer, connection: Connection)` | 283 | ✍ Server join: writes the claw state of each animated grab. |
| `LogGrab:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 298 | ✍ Server only. Decides per grab whether it is closed (from claw joint angles or the claw animation), mounts pending tree shapes with joints when closed, unmounts them when open, adjusts joint spring damping, lock animation and component joint limits. |
| `LogGrab:loadLogGrabFromXML(xmlFile: any, key: any, logGrab: any)` | 454 | ✍ Loads one grab into the given table: claws, animations, joint nodes, tree trigger (must have only the Tree collision bit), detection node, joint limits and mass settings. Returns false if the trigger or detection node is missing; a wrong trigger mask returns nil. |
| `LogGrab:updateLogGrabClawState(claw: any, dt: any, ignoreTiming: any, forceDirty: any)` | 615 | ✍ Measures the claw joint rotation on its axis and returns true when the claw counts as closed (past the threshold, or fully closed moving tool) for long enough, or after a joint change timeout; otherwise false. `ignoreTiming` skips the timers. |
| `LogGrab:onCutTree(radius: any, isNewTree: any)` | 685 | ✍ Server only: when a new tree is cut with a positive radius, closes every grab whose state change is allowed. |
| `LogGrab:onTurnedOn()` | 700 | ✍ Server only: opens every grab whose state change is allowed. |
| `LogGrab:onTurnedOff()` | 713 | ✍ Server only: closes every grab whose state change is allowed. Note: not registered as a listener in `registerEventListeners`, so it may never be called by this specialization (UNVERIFIED). |
| `LogGrab:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 726 | ✍ Client: registers one input action per grab with a claw animation (respecting the control group) and refreshes the labels. |
| `LogGrab.actionEventClawAnimation(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 748 | ✍ Input callback: toggles the claw state of the grab whose index is passed as callback state, if allowed. |
| `LogGrab.updateActionEvents(self: any)` | 756 | ✍ Updates each grab's input hint text (open or close) and enables it only when the state change is allowed. |
| `LogGrab:setComponentJointFrame(superFunc: any, jointDesc: any, anchorActor: any)` | 772 | ✍ Override: after the parent, records the time when a claw component joint was reframed, used to ignore claw state changes for a short time. |
| `LogGrab:getMovingToolMoveValue(superFunc: any, movingTool: any)` | 790 | ✍ Override: stores the last move value of claw moving tools and blocks movement in the closing direction once the claw is past its closing threshold. |
| `LogGrab:onDelimbTree(superFunc: any, state: any, ...: any)` | 817 | ✍ Override: opens any closed claw animation grab before delegating to the parent delimbing behaviour. |
| `LogGrab:getGrabCanMountSplitShape(grab: any, shapeId: any)` | 830 | ✍ Returns false if the vehicle's fold time is outside the grab's mounting limits, true otherwise. |
| `LogGrab:mountSplitShape(grab: any, shapeId: any)` | 843 | ✍ Creates a physics joint between the grab root and the tree shape, placed at the detected tree area (or at the joint node, locked, if the test fails). Publishes `TREE_SHAPE_MOUNTED`, raises `onLogGrabMountedTreesChanged` and returns the joint index and transform. |
| `LogGrab:unmountSplitShape(grab: any, shapeId: any, jointIndex: any, jointTransform: any, isDeleting: any)` | 897 | ✍ Removes the joint and its transform for a tree shape. The shape returns to the pending list unless `isDeleting` is true. Raises `onLogGrabMountedTreesChanged`. |
| `LogGrab:onLogGrabMountedTreesChanged(grab: any)` | 915 | ✍ Server only: sums the mass of mounted trees and adjusts the angular drive max force of configured component joints by interpolation. Note: the code assigns index 1 twice and never index 2 of the force array, which looks like a bug. |
| `LogGrab:onFoldStateChanged(direction: any, moveToMiddle: any)` | 942 | ✍ Opens or closes grabs configured with open/close during folding when folding goes against the turn-on direction. |
| `LogGrab:onFoldTimeChanged(time: any)` | 961 | ✍ Refreshes the input hints when the fold time changes. |
| `LogGrab:getIsLogGrabClawStateChangeAllowed(grabIndex: any)` | 967 | ✍ Returns false if the fold time is outside the claw animation fold limits of that grab, otherwise true. |
| `LogGrab:setLogGrabClawState(grabIndex: any, state: any, noEventSend: any)` | 984 | ✍ Sets the claw state of a grab (nil toggles) and plays the claw animation forward or backward, refreshes the hints and calls `LogGrabClawStateEvent.sendEvent` for network sync. |
| `LogGrab:logGrabTriggerCallback(triggerId: any, otherActorId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 1002 | ✍ Trigger callback: adds dynamic or kinematic split shapes entering the grab trigger to the pending list; on leave, removes them from pending or unmounts them if mounted. |
| `LogGrab:addNodeObjectMapping(superFunc: any, list: any)` | 1029 | ✍ Override-style function: after the parent, maps each grab trigger node to this vehicle in the given list. |
| `LogGrab:removeNodeObjectMapping(superFunc: any, list: any)` | 1043 | ✍ Override-style function: after the parent, removes the grab trigger node entries from the given list. |
| `LogGrab:updateDebugValues(values: any)` | 1057 | ✍ Server only: appends debug rows (claw offsets and thresholds, moving tool closing state, mounted and pending shapes) to the given values list. |

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
