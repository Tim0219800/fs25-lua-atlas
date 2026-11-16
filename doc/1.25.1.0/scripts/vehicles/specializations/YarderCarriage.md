# vehicles/specializations/YarderCarriage.lua

*[Version française](../../../fr/scripts/vehicles/specializations/YarderCarriage.md)*

Source: `dataS/scripts/vehicles/specializations/YarderCarriage.lua` — FS25 1.25.1.0

✍ Specialization for the carriage of a forestry yarder (cable crane): a vehicle that runs on the cable, hooks one or more trees with ropes, lifts them and carries them. It has no prerequisites. The server creates physics joints between the carriage and each attached tree, handles lift/lower input and detaches trees that are cut, mounted elsewhere, deleted or stretched too far. Clients see ropes and hooks, play sounds and aim at trees with an asynchronous raycast. It cooperates with YarderTower through `setYarderTowerVehicle`; attachments are synchronized by TreeAttachEvent/TreeDetachEvent and saved through split-shape ids.


## Functions

| Function | Line | Description |
|---|---|---|
| `YarderCarriage.prerequisitesPresent(specializations: table) → boolean` | 28 | ✍ Always returns true: this specialization has no prerequisite. |
| `YarderCarriage.initSpecialization()` | 34 | ✍ Registers the `vehicle.yarderCarriage` XML schema: tree count and mass limits, carriage dimensions, lift speed and acceleration, rope target nodes, attach joint, main and additional ropes, tree hook, object changes and sounds. Note: the schema default for `joint#maxDistance` is 10 but onLoad actually uses 20. |
| `YarderCarriage.registerFunctions(vehicleType: any)` | 100 | ✍ Adds the carriage API to the vehicle type: dimensions, rope target nodes, tree attach/detach, mass and count queries, lift input, raycast callback, savegame helpers and the tree cut/mounted handlers. |
| `YarderCarriage.registerOverwrittenFunctions(vehicleType: any)` | 130 | ✍ Overrides getDirtMultiplier and getWearMultiplier. |
| `YarderCarriage.registerEventListeners(vehicleType: any)` | 137 | ✍ Subscribes to load, load-finished, delete, network streams (join and update) and post-update. |
| `YarderCarriage:onLoad(savegame: any)` | 150 | ✍ Loads all carriage settings from XML, builds the rope, hook and attach-marker objects, creates the sounds on clients, allocates the dirty flag and subscribes to the TREE_SHAPE_CUT and TREE_SHAPE_MOUNTED messages. Lift speed is converted to meters per millisecond. Also sets `isVehicleSaved` to false. |
| `YarderCarriage:onLoadFinished(savegame: any)` | 303 | ✍ Connects the main rope to its origin node and clones it as the short rope between the root hook and the tree, with the configured length. |
| `YarderCarriage:onDelete()` | 312 | ✍ Clears the tower's reference to this carriage, detaches any attached trees, and deletes sounds, hook, marker and all ropes. |
| `YarderCarriage:onReadStream(streamId: integer, connection: Connection)` | 366 | ✍ Client on join: reads the linked yarder tower vehicle and the attached trees (hook position and split-shape id). Trees whose shape cannot be resolved yet are queued in `splitShapesToAttach`. |
| `YarderCarriage:onWriteStream(streamId: integer, connection: Connection)` | 391 | ✍ Server on join: writes the linked tower vehicle, the number of attached trees, and for each one the hook position in tree space and the split-shape id. |
| `YarderCarriage:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 413 | ✍ Client only: reads three flags sent by the server (lift, lift limit reached, lower) and plays or stops the matching sound samples. |
| `YarderCarriage:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 442 | ✍ Server only: when the dirty flag is set, writes the three sound flags (lift, lift limit, lower) and resets them. |
| `YarderCarriage:onPostUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 460 | ✍ Server: shrinks the joint translation limits right after attachment, and detaches the trees if one disappeared or the rope is stretched beyond its limit. Client: resolves queued split shapes. Both: updates ropes, aim marker and visibility, stops lift sounds after a short delay, and keeps the vehicle active while trees are attached or aimed at. |
| `YarderCarriage:getCarriageDimensions()` | 541 | ✍ Returns the carriage length and the roll spacing. |
| `YarderCarriage:getCarriagePullRopeTargetNode()` | 548 | ✍ Returns the node where the pull rope connects. |
| `YarderCarriage:getCarriagePushRopeTargetNode()` | 554 | ✍ Returns the node where the push rope connects. |
| `YarderCarriage:setYarderTowerVehicle(vehicle: any)` | 560 | ✍ Stores the yarder tower vehicle this carriage belongs to. |
| `YarderCarriage:updateRopeAlignmentNodes(ropeNode: any, tx: any, ty: any, tz: any, maxOffset: any)` | 566 | ✍ Moves each rope alignment node sideways and vertically along a sine curve so that nodes follow the sag of a rope between a rope node and a target point; `maxOffset` is the sag amplitude. |
| `YarderCarriage:updateCarriageInRange()` | 585 | ✍ Local player only: if the player is within range, has no hand tool and free tree slots, starts an asynchronous raycast from the camera against trees; otherwise clears the valid target tree. |
| `YarderCarriage:onYarderCarriageUpdateEnd()` | 619 | ✍ Resets the raycast state (valid tree and started flag) and keeps the vehicle active; called by the tower when the player's range update ends. |
| `YarderCarriage:updateTreeAttachRopes(dt: any)` | 628 | ✍ Orients the main rope from its origin to the first tree hook, positions the root hook and sets the main rope length, then aligns hook nodes and target nodes of the additional ropes toward the other attached trees. |
| `YarderCarriage:onCarriageTreeRaycastCallback(hitObjectId: any, x: any, y: any, z: any, distance: any, nx: any, ny: any, nz: any, subShapeIndex: any, shapeId: any, isLast: any)` | 681 | ✍ Raycast callback: accepts a split tree within range (and within 2 m of the first hooked tree when one exists), computes the hook position and marker data, and stores it as the valid target tree. Resets the state if nothing valid is hit. |
| `YarderCarriage:onAttachTreeAction()` | 750 | ✍ Input handler for attaching the aimed tree. The server checks permission and attaches directly (showing a warning on failure); a client sends TreeAttachRequestEvent. |
| `YarderCarriage:attachTreeToCarriage(splitShapeId: any, x: any, y: any, z: any, ropeIndex: any, noEventSend: any)` | 770 | ✍ Mounts a hook on the tree at the given world position and registers the tree. The server creates the physics joint; both sides update ropes, play the attach sound, apply the active component-joint limits, notify the tower (`onYarderCarriageTreeAttached`), publish TREE_SHAPE_MOUNTED and send TreeAttachEvent unless `noEventSend`. Returns early if the hook cannot be mounted. |
| `YarderCarriage:createJoint(shapeId: any, shapeJointId: any)` | 845 | ✍ Builds a spring-limited physics joint between the carriage component and the tree shape using the carriage joint node and the hook. Returns the joint index and the initial distance used as translation limit. |
| `YarderCarriage:onDetachTreeAction()` | 872 | ✍ Input handler that detaches all trees from the carriage. |
| `YarderCarriage:detachTreeFromCarriage(ropeIndex: any, noEventSend: any)` | 878 | ✍ Detaches every attached tree (the `ropeIndex` argument is not used): plays the detach sound, removes joints on the server, deletes hooks, hides additional ropes, restores inactive component-joint limits and sends TreeDetachEvent unless `noEventSend`. |
| `YarderCarriage:getNumAttachedTrees()` | 924 | ✍ Returns how many trees are currently attached. |
| `YarderCarriage:getMaxNumAttachedTrees()` | 930 | ✍ Returns the maximum number of trees allowed (`maxNumTrees`). |
| `YarderCarriage:getAttachedTreeMass()` | 936 | ✍ Returns the summed mass of all attached trees, using the engine `getMass` (unit UNVERIFIED, presumably tonnes). |
| `YarderCarriage:getIsCarriageTreeAttachAllowed(splitShapeId: any)` | 948 | ✍ Checks whether a tree may be attached: it must exist, a slot must be free, total mass must stay under `maxTreeMass` and the tree must not be mounted on a tension belt. Returns a boolean and a failure reason (default or too heavy). |
| `YarderCarriage:getIsTreeInMountRange()` | 971 | ✍ Returns true if a valid aimed tree exists and still exists in the world and a tree slot is free. |
| `YarderCarriage:showCarriageTreeMountFailedWarning(ropeIndex: any, reason: any)` | 990 | ✍ Shows a blinking warning with the mass limit when the failure reason is that the tree is too heavy; other reasons show nothing. `ropeIndex` is unused. |
| `YarderCarriage:setCarriageLiftInput(direction: any)` | 999 | ✍ Server only: applies lift or lower input in a direction, with acceleration, by moving each tree's vertical translation limit within min and max distances. Triggers lift/lower sounds and raises the dirty flag so clients play them. |
| `YarderCarriage.registerSavegameXMLPaths(schema: any, basePath: any)` | 1057 | ✍ Registers the savegame attributes of each attached tree: hook translation and three split-shape id parts. Note: the translation attribute is described with unrelated text in the schema. |
| `YarderCarriage:saveAttachedTreesToXML(xmlFile: any, key: any, usedModNames: any)` | 1066 | ✍ Writes each attached tree's hook world position and saveable split-shape id parts under the given key. |
| `YarderCarriage.loadAttachedTreesFromXML(xmlFile: any, key: any)` | 1086 | ✍ Static helper: reads the saved attached-tree entries (translation and split-shape parts) and returns them as a list; entries lacking data are skipped. |
| `YarderCarriage:resolveLoadedAttachedTrees(data: any)` | 1105 | ✍ Resolves loaded data into real tree shapes; if all can be resolved, attaches each without sending events and returns true, otherwise returns false and attaches nothing. |
| `YarderCarriage:onYarderCarriageTreeShapeCut(oldShape: any, shape: any)` | 1125 | ✍ Message handler (server only): if a cut tree shape was attached, detaches all trees from the carriage. |
| `YarderCarriage:onYarderCarriageTreeShapeMounted(shape: any, mountVehicle: any)` | 1139 | ✍ Message handler (server only): if an attached tree is mounted by another vehicle, detaches all trees from this carriage. |
| `YarderCarriage:getDirtMultiplier(superFunc: any) → number` | 1154 | ✍ Returns the tower vehicle's dirt multiplier when a tower is linked, otherwise the parent value. |
| `YarderCarriage:getWearMultiplier(superFunc: any) → number` | 1168 | ✍ Returns the linked tower's value, otherwise the parent value. Note: it calls the tower's getDirtMultiplier, not getWearMultiplier, which looks like a copy-paste bug. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getCarriageDimensions` | 101 |
| registerFunction | `getCarriagePullRopeTargetNode` | 102 |
| registerFunction | `getCarriagePushRopeTargetNode` | 103 |
| registerFunction | `setYarderTowerVehicle` | 104 |
| registerFunction | `updateRopeAlignmentNodes` | 105 |
| registerFunction | `updateCarriageInRange` | 106 |
| registerFunction | `onYarderCarriageUpdateEnd` | 107 |
| registerFunction | `updateTreeAttachRopes` | 108 |
| registerFunction | `onCarriageTreeRaycastCallback` | 109 |
| registerFunction | `onAttachTreeAction` | 110 |
| registerFunction | `attachTreeToCarriage` | 111 |
| registerFunction | `createJoint` | 112 |
| registerFunction | `onDetachTreeAction` | 113 |
| registerFunction | `detachTreeFromCarriage` | 114 |
| registerFunction | `getNumAttachedTrees` | 115 |
| registerFunction | `getMaxNumAttachedTrees` | 116 |
| registerFunction | `getAttachedTreeMass` | 117 |
| registerFunction | `getIsCarriageTreeAttachAllowed` | 118 |
| registerFunction | `getIsTreeInMountRange` | 119 |
| registerFunction | `showCarriageTreeMountFailedWarning` | 120 |
| registerFunction | `setCarriageLiftInput` | 121 |
| registerFunction | `saveAttachedTreesToXML` | 122 |
| registerFunction | `resolveLoadedAttachedTrees` | 123 |
| registerFunction | `onYarderCarriageTreeShapeCut` | 124 |
| registerFunction | `onYarderCarriageTreeShapeMounted` | 125 |
| registerOverwrittenFunction | `getDirtMultiplier` | 131 |
| registerOverwrittenFunction | `getWearMultiplier` | 132 |
| registerEventListener | `onLoad` | 138 |
| registerEventListener | `onLoadFinished` | 139 |
| registerEventListener | `onDelete` | 140 |
| registerEventListener | `onReadStream` | 141 |
| registerEventListener | `onWriteStream` | 142 |
| registerEventListener | `onReadUpdateStream` | 143 |
| registerEventListener | `onWriteUpdateStream` | 144 |
| registerEventListener | `onPostUpdate` | 145 |

## Messages

- subscribes `MessageType.TREE_SHAPE_CUT` (l.297)
- subscribes `MessageType.TREE_SHAPE_MOUNTED` (l.298)
- publishes `MessageType.TREE_SHAPE_MOUNTED` (l.836)
