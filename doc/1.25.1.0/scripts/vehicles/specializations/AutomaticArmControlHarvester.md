# vehicles/specializations/AutomaticArmControlHarvester.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AutomaticArmControlHarvester.md)*

Source: `dataS/scripts/vehicles/specializations/AutomaticArmControlHarvester.lua` — FS25 1.25.1.0

✍ Specialization that lets the crane of a wood harvester align automatically on a standing tree for cutting. It requires Cylindered and moves its moving tools through a sequence of states (move back, X, Z, Y alignment, finished). Trees are found with an asynchronous sphere overlap, then scored by angle and distance. A tree marker shows the target, coloured by validity. The server runs the alignment and clients send input over the update stream. Child vehicles (the harvester head) can add support and overrides. The STATE_* and INVALID_REASON_* constants and NEXT_STATE table are defined outside the dumped code: UNVERIFIED.


## Functions

| Function | Line | Description |
|---|---|---|
| `AutomaticArmControlHarvester.prerequisitesPresent(specializations: table) → boolean` | 43 | ✍ Returns true only if the vehicle type has the Cylindered specialization. |
| `AutomaticArmControlHarvester.initSpecialization()` | 49 | ✍ Adds the `automaticArmControlHarvester` shop configuration type and registers the XML paths directly and inside each configuration entry. |
| `AutomaticArmControlHarvester.registerXMLPaths(schema: any, basePath: any)` | 63 | ✍ Registers one set of XML keys: easy-arm requirement, fold limits, return node, tree detection node (radii, angle, cut height), X, Y, Z alignment, extra alignment nodes and the tree marker colours and offset. |
| `AutomaticArmControlHarvester.registerFunctions(vehicleType: any)` | 106 | ✍ Registers the alignment API: support and allowed checks, tree validity and marker state, input, `doTreeArmAlignment`, active and target queries, invalid-tree reason, best-tree search, overlap callback and `getTreeAutomaticOverwrites`. |
| `AutomaticArmControlHarvester.registerOverwrittenFunctions(vehicleType: any)` | 123 | ✍ Empty: no vehicle function is overridden. |
| `AutomaticArmControlHarvester.registerEventListeners(vehicleType: any)` | 128 | ✍ Subscribes to onLoad, onPostLoad, onDelete, onReadUpdateStream, onWriteUpdateStream, onUpdate, onRegisterActionEvents and onRootVehicleChanged. |
| `AutomaticArmControlHarvester:onLoad(savegame: any)` | 141 | ✍ Picks the configuration, reads extra alignment nodes and, if a tree detection node exists, all detection, alignment, marker and fold settings. Without it, it keeps only the offsets and reference nodes (for use by a parent vehicle) and removes its update and action listeners. |
| `AutomaticArmControlHarvester:onPostLoad(savegame: any)` | 243 | ✍ Resolves the moving tool objects for X, Z, Y and each alignment node, dropping alignment nodes whose tool is not found. |
| `AutomaticArmControlHarvester:onDelete()` | 269 | ✍ Deletes the tree marker if one was created. |
| `AutomaticArmControlHarvester:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 278 | ✍ Network read. The server reads the client's control input and holds it for 250 ms; a client reads whether the server found a valid target. |
| `AutomaticArmControlHarvester:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 296 | ✍ Network write, mirror of the read, sent only when the dirty flag is set: control input from client to server, valid-target flag from server to client. |
| `AutomaticArmControlHarvester:onUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 313 | ✍ Each update picks the best tree, places and colours the marker (cut, target or too thick, with a reason when invalid), and starts an async sphere overlap to refresh the tree list. The server then drives the alignment automatically or by held input, and handles the return to the idle position. |
| `AutomaticArmControlHarvester:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 439 | ✍ On clients, registers the TREE_AUTOMATIC_ALIGN powered action with very high text priority, initially inactive. Only registered when automatic vehicle control is not available. |
| `AutomaticArmControlHarvester.actionEvent(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 454 | ✍ Input callback: forwards the input value to `setTreeArmAlignmentInput`. |
| `AutomaticArmControlHarvester.updateActionEvents(self: any, state: any)` | 460 | ✍ Enables or disables the TREE_AUTOMATIC_ALIGN action event according to the given state. |
| `AutomaticArmControlHarvester:onRootVehicleChanged(rootVehicle: table)` | 471 | ✍ Registers or moves the `automaticArmControlHarvester` action in the root vehicle's action controller, finished once no arm return is pending, or removes it when there is no controller. |
| `AutomaticArmControlHarvester.actionControllerEvent(self: any, direction: any)` | 496 | ✍ Action controller callback: a negative direction schedules the return of the arm to its return node; in all cases the alignment state is reset. Always returns true. |
| `AutomaticArmControlHarvester:getSupportsAutoTreeAlignment()` | 508 | ✍ Returns false by default; a harvester head child vehicle is expected to override it to enable automatic alignment on the parent crane. |
| `AutomaticArmControlHarvester:getIsAutoTreeAlignmentAllowed()` | 514 | ✍ Returns true only if the vehicle is controlled, easy arm control is on when required, the vehicle or a child supports auto alignment, and the fold time is within limits. |
| `AutomaticArmControlHarvester:getAutoAlignHasValidTree(radius: any)` | 551 | ✍ Default stub returning false, false (no split shape, radius not valid). Child vehicles override it to judge a tree radius. |
| `AutomaticArmControlHarvester:getAutoAlignTreeMarkerState(foundRadius: any, checkChildren: any)` | 557 | ✍ Asks this vehicle, then its child vehicles, whether a tree of the given radius can be cut. Returns a split-shape found flag and a valid-radius flag, merged across children. |
| `AutomaticArmControlHarvester:setTreeArmAlignmentInput(inputValue: any)` | 582 | ✍ Server: while input is positive, not finished and a target exists, runs the alignment; input 0 resets the state. Client: stores the input and flags the vehicle dirty to send it to the server. |
| `AutomaticArmControlHarvester:doTreeArmAlignment(tx: any, ty: any, tz: any, direction: any)` | 602 | ✍ Steps the alignment towards a target point (`direction` 1 to the tree, -1 to return): prepares the alignment nodes, then drives the X rotation, Z reach and Y height tools via `externalMove` and advances the state. Child overrides can replace reference nodes and add to the X offset. |
| `AutomaticArmControlHarvester.calculateMovingToolTargetMove(self: any, movingTool: any, targetRot: any)` | 721 | ✍ Predicts where a rotating moving tool would stop and returns -1, 0 or 1 (times the speed sign) so it reaches the target rotation without overshooting. |
| `AutomaticArmControlHarvester.prepareAlignment(self: any, direction: any)` | 776 | ✍ Before aligning towards a tree, turns the vehicle on if possible and untilts the wood harvester head. Then moves the configured alignment nodes to their target rotation; returns false while a prerequisite node is still moving. |
| `AutomaticArmControlHarvester:getIsAutomaticAlignmentActive()` | 812 | ✍ Returns true while the alignment is neither idle nor finished. |
| `AutomaticArmControlHarvester:getAutomaticAlignmentCurrentTarget()` | 819 | ✍ Returns the target x, y, z and tree radius when a valid target exists, otherwise four nil values. |
| `AutomaticArmControlHarvester:getAutomaticAlignmentInvalidTreeReason()` | 830 | ✍ Returns the reason code the nearest tree was refused this update (no access or wrong type), or the 'none' code. |
| `AutomaticArmControlHarvester:getBestTreeToAutoAlign(referenceNode: any, trees: any)` | 836 | ✍ From a list of tree ids, keeps static, unsplit mesh split shapes within the max angle, then returns the best by angle plus twice the distance among those the harvester may cut and reach. Also returns the last refused tree and why. |
| `AutomaticArmControlHarvester:onTreeAutoOverlapCallback(objectId: any, ...: any)` | 875 | ✍ Async overlap callback: collects shapes with a split type, excluding tree stumps, whose horizontal distance to the detection node is between the min and max radius. |
| `AutomaticArmControlHarvester:getTreeAutomaticOverwrites()` | 894 | ✍ Returns the Z and Y reference nodes and X offset so a parent crane can reuse them. |
| `AutomaticArmControlHarvester.drawDebugCircleRange(node: any, radius: any, steps: any, minRot: any, maxRot: any)` | 901 | ✍ Debug helper: draws a red arc of line segments around a node between two angles. Only referenced by commented debug lines. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getSupportsAutoTreeAlignment` | 107 |
| registerFunction | `getIsAutoTreeAlignmentAllowed` | 108 |
| registerFunction | `getAutoAlignHasValidTree` | 109 |
| registerFunction | `getAutoAlignTreeMarkerState` | 110 |
| registerFunction | `setTreeArmAlignmentInput` | 111 |
| registerFunction | `doTreeArmAlignment` | 112 |
| registerFunction | `getIsAutomaticAlignmentActive` | 113 |
| registerFunction | `getAutomaticAlignmentCurrentTarget` | 114 |
| registerFunction | `getAutomaticAlignmentInvalidTreeReason` | 115 |
| registerFunction | `getBestTreeToAutoAlign` | 116 |
| registerFunction | `onTreeAutoOverlapCallback` | 117 |
| registerFunction | `getTreeAutomaticOverwrites` | 118 |
| registerEventListener | `onLoad` | 129 |
| registerEventListener | `onPostLoad` | 130 |
| registerEventListener | `onDelete` | 131 |
| registerEventListener | `onReadUpdateStream` | 132 |
| registerEventListener | `onWriteUpdateStream` | 133 |
| registerEventListener | `onUpdate` | 134 |
| registerEventListener | `onRegisterActionEvents` | 135 |
| registerEventListener | `onRootVehicleChanged` | 136 |
