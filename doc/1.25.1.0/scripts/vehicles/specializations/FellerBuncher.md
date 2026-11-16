# vehicles/specializations/FellerBuncher.lua

*[Version française](../../../fr/scripts/vehicles/specializations/FellerBuncher.md)*

Source: `dataS/scripts/vehicles/specializations/FellerBuncher.lua` — FS25 1.25.1.0

✍ Vehicle specialization for feller-buncher heads that cut standing trees, grab them with a main arm and extra tree slots, and release them later. Requires FillUnit (the fill level counts the loaded trees). The server runs detection, cutting (splitShape), mounting through physics joints and release; clients get the effect and grab states through streams, and FellerBuncherCutEvent and FellerBuncherReleaseEvent carry the actions (defined elsewhere, UNVERIFIED). It reuses WoodHarvester for the tree access check and is configured under vehicle.fellerBuncher in the XML.


## Functions

| Function | Line | Description |
|---|---|---|
| `FellerBuncher.prerequisitesPresent(specializations: table) → boolean` | 21 | ✍ Returns true only if the FillUnit specialization is present. |
| `FellerBuncher.initSpecialization()` | 27 | ✍ Adds the shop spec 'fellerBuncherMaxTreeSize' and registers the XML keys: fill unit, max radius, input actions, cut node and collision, mount node, tree move direction, main grab, cut animation, unmount, tree slots, sounds, animation nodes and effects. |
| `FellerBuncher.registerFunctions(vehicleType: any)` | 83 | ✍ Registers the vehicle-level functions for grab state, cut checks, cutting, mounting, releasing, tree counting and the tree cut/mounted message handlers. |
| `FellerBuncher.registerOverwrittenFunctions(vehicleType: any)` | 102 | ✍ Overrides getCanToggleTurnedOn, registerLoweringActionEvent, getSupportsAutoTreeAlignment and getAutoAlignHasValidTree. |
| `FellerBuncher.registerEventListeners(vehicleType: any)` | 111 | ✍ Subscribes to load/delete, stream and update-stream, update tick, turned on/off, animation finish and action-event registration events. |
| `FellerBuncher:onLoad(savegame: any)` | 127 | ✍ Reads every XML setting into the spec (radius, input actions, cut and mount nodes, grab and slot animations, unmount timing), builds the tree slots, loads client animations, effects and sounds, subscribes to TREE_SHAPE_CUT and TREE_SHAPE_MOUNTED messages and creates the dirty flag. |
| `FellerBuncher:onDelete()` | 226 | ✍ Releases the main arm tree and all tree slots, then deletes effects, sounds and animations. |
| `FellerBuncher:onReadStream(streamId: integer, connection: Connection)` | 244 | ✍ Client on join: reads the effect state, the main grab usage and each tree slot usage. |
| `FellerBuncher:onWriteStream(streamId: integer, connection: Connection)` | 257 | ✍ Server on join: writes the effect state, the main grab usage and each tree slot usage. |
| `FellerBuncher:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 268 | ✍ Client: when the dirty bit is set, reads effect state and grab/slot usage, then refreshes the action events. |
| `FellerBuncher:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 285 | ✍ Server: when the dirty flag is set, writes effect state and grab/slot usage. |
| `FellerBuncher:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 300 | ✍ Server: looks for a cuttable tree in the cut node, runs the automatic cut timer (when no cut input is set), pushes a freshly cut tree toward the mount node, handles the staggered unmount process and releases trees that were deleted. Clients only detect the tree for UI. Also drives cut effect and sound (wood chips) from the effect state. |
| `FellerBuncher:onTurnedOn()` | 488 | ✍ Closes/opens the grabs via setFellerBuncherGrabState(true) if no tree is loaded; on clients starts the animation nodes and the saw sound. |
| `FellerBuncher:onTurnedOff()` | 503 | ✍ Reverses the grab state if no tree is loaded; on clients stops animation nodes, effects and sounds. |
| `FellerBuncher:onFinishAnimation(name: any)` | 519 | ✍ Drives the mounting sequence: when the main grab animation or a slot animation ends during a mount, tries to mount the tree into the first free slot or main arm via mountTreeInRange and updates states, joint damping and animations; on failure it reopens the grab. |
| `FellerBuncher:setFellerBuncherGrabState(state: any)` | 580 | ✍ Plays the main grab, all tree slot grab and cut animations forward (true) or in reverse (false). |
| `FellerBuncher:getIsFellerBuncherReadyForCut()` | 601 | ✍ Returns true only when no mount or unmount is running, the main grab is not animating, the machine is turned on and a free tree slot still exists. |
| `FellerBuncher:getFellerBuncherCanCutSplitShape(splitShapeId: any, cx: any, cy: any, cz: any, nx: any, ny: any, nz: any, yx: any, yy: any, yz: any, minY: any, maxY: any, minZ: any, maxZ: any)` | 629 | ✍ Checks whether a found tree can be cut: access via WoodHarvester, radius against maxRadius, not already held, and both sides of the cut plane longer than 0.15. Returns a boolean and, when refused, a warning text (too thick, no access, no permission). |
| `FellerBuncher:cutTree(noEventSend: any)` | 664 | ✍ Cuts the tree found in the cut node: on the server updates cut statistics and achievements, records the tree type and splits the shape; then plays the cut animation, the cut sound (manual mode on client) and sends FellerBuncherCutEvent. |
| `FellerBuncher:fellerBuncherSplitShapeCallback(shape: any, isBelow: any, isAbove: any, minY: any, maxY: any, minZ: any, maxZ: any)` | 704 | ✍ Split callback: registers the new shape as a known split shape with the tree plant manager and, for the part above the cut, starts the mount process. |
| `FellerBuncher:doMountProcess(shape: any, noEventSend: any)` | 717 | ✍ Starts mounting a cut shape: reverses the main grab animation, flags the mount in progress and shifts the shape slightly along the tree move direction (plus a small lift). The noEventSend parameter is unused here. |
| `FellerBuncher:mountTreeInRange()` | 730 | ✍ Tests the pending shape against the mount node and, if it fits, creates a stiff spring joint between the mount component and the shape and publishes TREE_SHAPE_MOUNTED. Returns joint index, joint node and shape, or 0 and nil. |
| `FellerBuncher:releaseMountedTrees(noEventSend: any)` | 768 | ✍ On the server starts the staggered release of all trees (main arm first, then slots); on every side sends FellerBuncherReleaseEvent unless noEventSend is true. |
| `FellerBuncher:releaseMainArmTree()` | 786 | ✍ Opens the main grab, removes its joint and joint node, restores component joint damping on the server and updates the tree count. Returns whether the main arm held a tree. |
| `FellerBuncher:releaseNextTreeSlot()` | 828 | ✍ Releases the first used tree slot (animation, joint, node) and updates the tree count. Returns true if a slot was released, false if none was in use. |
| `FellerBuncher:onFellerBuncherTreesChanged()` | 859 | ✍ Sets the fill unit level to the number of loaded trees (empties it, then adds the count), refreshes the action events and flags a network update. |
| `FellerBuncher:getNumLoadedTrees()` | 873 | ✍ Returns how many trees are held: the main arm (0 or 1) plus the used tree slots. |
| `FellerBuncher:onFellerBuncherTreeShapeCut(oldShape: any, shape: any)` | 891 | ✍ Message handler (server): if the cut shape was held in the main arm or a slot, releases all mounted trees. |
| `FellerBuncher:onFellerBuncherTreeShapeMounted(shape: any, mountVehicle: any)` | 910 | ✍ Message handler (server): if a held shape gets mounted by another vehicle, releases all mounted trees. |
| `FellerBuncher:getCanToggleTurnedOn(superFunc: any)` | 929 | ✍ Override: refuses toggling while mounting, unmounting or while the main grab is animating; otherwise defers to the parent. |
| `FellerBuncher:registerLoweringActionEvent(superFunc: any, actionEventsTable: any, inputAction: any, target: any, callback: any, triggerUp: any, triggerDown: any, triggerAlways: any, startActive: any, callbackState: any, customIconName: any, ignoreCollisions: any)` | 949 | ✍ Override with an empty body: no lowering action event is registered for this machine. |
| `FellerBuncher:getSupportsAutoTreeAlignment(superFunc: any)` | 954 | ✍ Override: always returns true, declaring support for automatic tree alignment. |
| `FellerBuncher:getAutoAlignHasValidTree(superFunc: any, radius: any)` | 960 | ✍ Override: returns whether a cuttable tree was found and whether the given radius is within maxRadius. |
| `FellerBuncher:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 967 | ✍ Client: registers the powered release action and, if a cut input action is set, the cut action (high priority, with texts) for the active vehicle, then updates their state. |
| `FellerBuncher.actionEventReleaseTrees(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 990 | ✍ Input callback: releases the mounted trees. |
| `FellerBuncher.actionEventCutTree(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 996 | ✍ Input callback: cuts the detected tree. |
| `FellerBuncher.updateActionEvents(self: any)` | 1002 | ✍ Client: enables the release action only when a tree is held and the cut action only when a cuttable tree was found. |
| `FellerBuncher.loadSpecValueMaxTreeSize(xmlFile: any, customEnvironment: any, baseDir: any)` | 1029 | ✍ Shop spec loader: returns the vehicle.fellerBuncher#maxRadius value from the XML. |
| `FellerBuncher.getSpecValueMaxTreeSize(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 1035 | ✍ Shop spec getter: converts the radius to a diameter in centimetres and returns it as text, or as value(s) plus text depending on the flags. Returns nothing without the spec. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `setFellerBuncherGrabState` | 84 |
| registerFunction | `getIsFellerBuncherReadyForCut` | 85 |
| registerFunction | `getFellerBuncherCanCutSplitShape` | 86 |
| registerFunction | `cutTree` | 87 |
| registerFunction | `fellerBuncherSplitShapeCallback` | 88 |
| registerFunction | `doMountProcess` | 89 |
| registerFunction | `mountTreeInRange` | 90 |
| registerFunction | `releaseMountedTrees` | 91 |
| registerFunction | `releaseMainArmTree` | 92 |
| registerFunction | `releaseNextTreeSlot` | 93 |
| registerFunction | `onFellerBuncherTreesChanged` | 94 |
| registerFunction | `getNumLoadedTrees` | 95 |
| registerFunction | `onFellerBuncherTreeShapeCut` | 96 |
| registerFunction | `onFellerBuncherTreeShapeMounted` | 97 |
| registerOverwrittenFunction | `getCanToggleTurnedOn` | 103 |
| registerOverwrittenFunction | `registerLoweringActionEvent` | 104 |
| registerOverwrittenFunction | `getSupportsAutoTreeAlignment` | 105 |
| registerOverwrittenFunction | `getAutoAlignHasValidTree` | 106 |
| registerEventListener | `onLoad` | 112 |
| registerEventListener | `onDelete` | 113 |
| registerEventListener | `onReadStream` | 114 |
| registerEventListener | `onWriteStream` | 115 |
| registerEventListener | `onReadUpdateStream` | 116 |
| registerEventListener | `onWriteUpdateStream` | 117 |
| registerEventListener | `onUpdateTick` | 118 |
| registerEventListener | `onTurnedOn` | 119 |
| registerEventListener | `onTurnedOff` | 120 |
| registerEventListener | `onFinishAnimation` | 121 |
| registerEventListener | `onRegisterActionEvents` | 122 |

## Messages

- subscribes `MessageType.TREE_SHAPE_CUT` (l.218)
- subscribes `MessageType.TREE_SHAPE_MOUNTED` (l.219)
- publishes `MessageType.TREE_SHAPE_MOUNTED` (l.757)
