# vehicles/specializations/AutomaticArmControlForwarder.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AutomaticArmControlForwarder.md)*

Source: `dataS/scripts/vehicles/specializations/AutomaticArmControlForwarder.lua` — FS25 1.25.1.0

✍ Specialization that lets the crane of a forwarder align itself automatically on the best tree (log) found in tree triggers. It requires Cylindered and drives its moving tools through an X, Y and Z alignment sequence, with an optional easy-arm-control requirement and fold-time limits. The server runs the alignment; clients send the input and show a tree marker, with a dirty flag for synchronisation. It is configurable per vehicle configuration. The state constants and NEXT_STATE table are defined outside the dumped code: UNVERIFIED.


## Functions

| Function | Line | Description |
|---|---|---|
| `AutomaticArmControlForwarder.prerequisitesPresent(specializations: table) → boolean` | 32 | ✍ Returns true only if the vehicle type has the Cylindered specialization. |
| `AutomaticArmControlForwarder.initSpecialization()` | 38 | ✍ Adds the `automaticArmControlForwarder` shop configuration type and registers the XML paths both directly under `vehicle.automaticArmControlForwarder` and inside each configuration entry. |
| `AutomaticArmControlForwarder.registerXMLPaths(schema: any, basePath: any)` | 52 | ✍ Registers one set of XML keys: easy-arm requirement, fold limits, root node, tree triggers, X, Y, Z and X-tool alignment settings, and the tree marker with its target and too-thick colours. |
| `AutomaticArmControlForwarder.registerFunctions(vehicleType: any)` | 90 | ✍ Registers the alignment API (allowed check, input, `doTreeArmAlignment`, reset, active/finished queries, target tree getters, best-tree search) and the tree trigger callback. |
| `AutomaticArmControlForwarder.registerOverwrittenFunctions(vehicleType: any)` | 106 | ✍ Empty: no vehicle function is overridden. |
| `AutomaticArmControlForwarder.registerEventListeners(vehicleType: any)` | 111 | ✍ Subscribes to onLoad, onPostLoad, onDelete, onReadUpdateStream, onWriteUpdateStream, onUpdate, `onAutoLoadForwaderMountedTree` and onRegisterActionEvents. |
| `AutomaticArmControlForwarder:onLoad(savegame: any)` | 125 | ✍ Picks the configuration, reads nodes, alignment settings, fold limits and the tree marker, and adds the tree triggers. Without a root node it removes its onDelete, onUpdate and action listeners. Also drops the action listener if automatic vehicle control is on. |
| `AutomaticArmControlForwarder:onPostLoad(savegame: any)` | 217 | ✍ Resolves the moving tool objects of the X, Z, Y and X-tool alignment from their nodes. |
| `AutomaticArmControlForwarder:onDelete()` | 239 | ✍ Deletes the tree marker and removes all tree triggers. |
| `AutomaticArmControlForwarder:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 255 | ✍ Network read. The server reads the client's control input and holds it for 250 ms; a client reads whether the server found a valid target. |
| `AutomaticArmControlForwarder:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 273 | ✍ Network write, mirror of the read: a client sends its control input, the server sends the valid-target flag, both only when the dirty flag is set. |
| `AutomaticArmControlForwarder:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 290 | ✍ Each update finds the best tree target when allowed, caching its position, direction and radius. Clients show the marker and toggle the input. The server raises the dirty flag and resets the state when target validity changes, and replays held input. |
| `AutomaticArmControlForwarder:onAutoLoadForwaderMountedTree(treeNodeId: any)` | 367 | ✍ Event handler: removes the just-mounted tree from the list of trees found in the triggers. |
| `AutomaticArmControlForwarder:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 374 | ✍ On clients, registers the TREE_AUTOMATIC_ALIGN powered action with very high text priority, initially inactive. Only registered when automatic vehicle control is not available. |
| `AutomaticArmControlForwarder.actionEvent(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 389 | ✍ Input callback: forwards the input value to `setTreeArmAlignmentInput`. |
| `AutomaticArmControlForwarder.updateActionEvents(self: any, state: any)` | 395 | ✍ Enables or disables the TREE_AUTOMATIC_ALIGN action event according to the given state. |
| `AutomaticArmControlForwarder:getIsAutoTreeAlignmentAllowed()` | 405 | ✍ Returns false if the vehicle is not controlled, if easy arm control is required but off, or if the fold animation time is outside the configured limits; true otherwise. |
| `AutomaticArmControlForwarder:setTreeArmAlignmentInput(inputValue: any)` | 427 | ✍ Server: while input is positive, not finished and a target exists, runs the alignment towards it; input 0 resets the state. Client: stores the input and flags the vehicle dirty to send it to the server. |
| `AutomaticArmControlForwarder:doTreeArmAlignment(tx: any, ty: any, tz: any, dx: any, dy: any, dz: any, direction: any, forceMoveUp: any)` | 447 | ✍ Steps the alignment state machine towards a target point and direction: move up, then X (and X tool), Z, Y, driving each moving tool through `externalMove`. `direction` is 1 or -1 and `forceMoveUp` forces the move-up step. |
| `AutomaticArmControlForwarder.movingToolXAlignment(self: any, movingTool: any, tx: any, ty: any, tz: any, referenceNode: any, threshold: any, speedScale: any, offset: any, allowInversion: any)` | 533 | ✍ Rotates a moving tool about its axis towards a target world point. Returns the move command and true once the angle is under the threshold; `allowInversion` lets it aim the opposite way when that is shorter. |
| `AutomaticArmControlForwarder.calculateMovingToolTargetMove(self: any, movingTool: any, targetRot: any)` | 563 | ✍ Predicts where the tool would stop given its speed and acceleration, and returns -1, 0 or 1 (times the speed sign) so it does not overshoot the target rotation. Uses `g_currentDt`. |
| `AutomaticArmControlForwarder:resetAutomaticAlignment()` | 619 | ✍ Resets the alignment state machine to its initial state. |
| `AutomaticArmControlForwarder:getIsAutomaticAlignmentActive()` | 625 | ✍ Returns true while the alignment is neither idle nor finished. |
| `AutomaticArmControlForwarder:getIsAutomaticAlignmentFinished()` | 632 | ✍ Returns true when the alignment state is the finished state. |
| `AutomaticArmControlForwarder:getAutomaticAlignmentTargetTree()` | 638 | ✍ Returns the node id of the tree currently targeted, or nil. |
| `AutomaticArmControlForwarder:getAutomaticAlignmentAvailableTargetTree()` | 644 | ✍ Recomputes and returns the best tree in range without using the cached target, or nil if none. |
| `AutomaticArmControlForwarder:getAutomaticAlignmentCurrentTarget()` | 651 | ✍ Returns the target position (x, y, z) and direction (dx, dy, dz) when a valid target exists, otherwise six nil values. |
| `AutomaticArmControlForwarder:getBestTreeToAutoAlign(referenceNode: any, trees: any)` | 662 | ✍ Scores unmounted trees by angle, distance and height relative to a reference node and returns the id with the lowest score, or nil. Mounted logs are skipped. |
| `AutomaticArmControlForwarder:onTreeAutoTriggerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any, otherShapeId: any)` | 690 | ✍ Trigger callback: for mesh split shapes, adds the tree to the found list on enter and removes it on leave. |
| `AutomaticArmControlForwarder.drawDebugCircleRange(node: any, radius: any, steps: any, minRot: any, maxRot: any)` | 703 | ✍ Debug helper: draws a red arc of line segments around a node between two angles. Not called anywhere in this file. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getIsAutoTreeAlignmentAllowed` | 91 |
| registerFunction | `setTreeArmAlignmentInput` | 92 |
| registerFunction | `doTreeArmAlignment` | 93 |
| registerFunction | `resetAutomaticAlignment` | 94 |
| registerFunction | `getIsAutomaticAlignmentActive` | 95 |
| registerFunction | `getIsAutomaticAlignmentFinished` | 96 |
| registerFunction | `getAutomaticAlignmentTargetTree` | 97 |
| registerFunction | `getAutomaticAlignmentAvailableTargetTree` | 98 |
| registerFunction | `getAutomaticAlignmentCurrentTarget` | 99 |
| registerFunction | `getBestTreeToAutoAlign` | 100 |
| registerFunction | `onTreeAutoTriggerCallback` | 101 |
| registerEventListener | `onLoad` | 112 |
| registerEventListener | `onPostLoad` | 113 |
| registerEventListener | `onDelete` | 114 |
| registerEventListener | `onReadUpdateStream` | 115 |
| registerEventListener | `onWriteUpdateStream` | 116 |
| registerEventListener | `onUpdate` | 117 |
| registerEventListener | `onAutoLoadForwaderMountedTree` | 118 |
| registerEventListener | `onRegisterActionEvents` | 119 |
