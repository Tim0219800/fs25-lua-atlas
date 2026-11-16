# handTools/specializations/HandToolHands.lua

*[Version française](../../../fr/scripts/handTools/specializations/HandToolHands.md)*

Source: `dataS/scripts/handTools/specializations/HandToolHands.lua` — FS25 1.25.1.0

✍ Hand tool specialization for the player's bare hands, which cannot be dropped. It lets the owning player pick up dynamic physics objects up to a maximum mass through a joint attached to a kinematic helper node, rotate, level and throw them with charged force, and kick or pass a Football. Throws and pickups are synchronised with events (HandsPickUpObjectEvent, HandsThrowObjectEvent, HandsPickUpFailedEvent); the helper pose is streamed to the server. Note: `getHeldItem` and `throwHeldItemWithForceVector` are registered or called but no body for them is in this dump (UNVERIFIED).

- **HandToolHands** (l.16)

## Functions

| Function | Line | Description |
|---|---|---|
| `HandToolHands.registerXMLPaths(xmlSchema: any)` | 49 | ✍ Opens and closes the specialization XML type without registering any key: the hands have no XML configuration here. |
| `HandToolHands.registerFunctions(handToolType: any)` | 56 | ✍ Registers the held item, joint, pickup, drop, throw, rotate, level, football and super strength console functions on the hand tool type (including `getHeldItem` and `throwHeldItemWithForceVector`, whose bodies are not in this file). |
| `HandToolHands.registerOverwrittenFunctions(vehicleType: any)` | 89 | ✍ Overrides `getCanBeDropped`. |
| `HandToolHands.registerEventListeners(handToolType: any)` | 95 | ✍ Subscribes to load, delete, update, draw, update stream read/write, action events, carrying player change, held start/end and debug draw. |
| `HandToolHands.prerequisitesPresent(specializations: any)` | 111 | ✍ Always returns true: no prerequisite. |
| `HandToolHands:onLoad(xmlFile: any, baseDirectory: any)` | 117 | ✍ Initialises pickup mass and distance, throw and football state, action texts and the dirty flag; starts an async load of the shared kinematic helper i3d; creates three crosshairs on clients. |
| `HandToolHands:onKinematicHelperLoaded(kinematicNode: any, failedReason: any)` | 178 | ✍ Async callback: takes the helper's first child as the kinematic node, links it to the root and adds it to physics, and creates a rotation helper under it. Logs an error if loading failed. |
| `HandToolHands:onDelete()` | 202 | ✍ Drops the held item without event, releases the helper i3d and node, removes the super strength console command for the owner and frees the crosshairs. |
| `HandToolHands:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 241 | ✍ Client to server, when the dirty flag is set: writes the compressed world position of the kinematic node, its horizontal direction and the rotation node angles. |
| `HandToolHands:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 271 | ✍ Server side: reads those values, sets the kinematic and rotation node transforms and, if a joint exists, updates its frame. |
| `HandToolHands:onUpdate(dt: any)` | 304 | ✍ Creates the joint once the awaited physics frame is simulated (server), updates the kinematic node and, for the owner, detects pickable targets and footballs, switches the action texts, completes a charged throw when the input is released, and dribbles a nearby football. |
| `HandToolHands:onDraw()` | 398 | ✍ In first person for the owner, draws the throw crosshair scaled by charge, the pickup crosshair when holding or aiming at a pickable object, or the default crosshair. |
| `HandToolHands:onRegisterActionEvents()` | 424 | ✍ Registers pick up/drop, throw, pitch, yaw and level input actions with texts and priority. Skipped if the tool is not active for input. |
| `HandToolHands:onHeldStart()` | 459 | ✍ For the owner, adds the pickup target type to the player's targeter with the current pickup distance. |
| `HandToolHands:onHeldEnd()` | 473 | ✍ For the owner, removes the target type and drops any held item. |
| `HandToolHands:onCarryingPlayerChanged(player: any, lastPlayer: any)` | 488 | ✍ Adds the console command `gsPlayerSuperStrengthToggle` when the owning player gets the hands, and removes it when they are lost. |
| `HandToolHands:getCanBeDropped(superFunc: any)` | 500 | ✍ Overwritten function: always returns false, the hands cannot be dropped. |
| `HandToolHands:updateKinematicNode()` | 506 | ✍ For the owner while held, places the kinematic node along the player's look ray at the hold distance, kept level, and flags a network update. Does nothing without a node or ray. |
| `HandToolHands:getKinematicNode() → integer?, integer?` | 545 | ✍ Returns the kinematic node and its rotation node (nil until loaded). |
| `HandToolHands:getIsHoldingItem() → boolean` | 552 | ✍ Returns true if an item is held, even if no joint exists yet. |
| `HandToolHands:getIsThrowingItem() → boolean` | 559 | ✍ Returns true while a throw is being charged. |
| `HandToolHands:getIsAwaitingJointCreation() → boolean` | 566 | ✍ Returns true if an item was picked up and the joint is still awaiting a physics frame. |
| `HandToolHands:getHasJoint() → boolean` | 573 | ✍ Returns true if a joint links the kinematic node and the held item. |
| `HandToolHands:getCanPickUpNode(node: integer) → boolean` | 587 | ✍ Tests whether a node can be picked up: it exists, is not already held, on the server is a dynamic body not heavier than the allowed mass, and its object is not mounted and allows pickup (unless super strength). |
| `HandToolHands:onPickUpAction(_: any, inputValue: any)` | 633 | ✍ Owner input: passes a nearby football if one is targeted, otherwise drops the held item or picks up the targeted one. |
| `HandToolHands:onThrowAction(_: any, inputValue: any)` | 663 | ✍ Owner input: shoots a football if present (angle 30 degrees). Otherwise, if holding an item, notes the update index and accumulates charge time with the frame delta. |
| `HandToolHands:onPitchAction(_: any, inputDelta: any)` | 698 | ✍ Input callback: rotates the held item about the player-relative horizontal axis. |
| `HandToolHands:onYawAction(_: any, inputDelta: any)` | 710 | ✍ Input callback: rotates the held item about the vertical axis. |
| `HandToolHands:onLevelAction(_: any, inputValue: any)` | 721 | ✍ Input callback: levels the held item. |
| `HandToolHands:rotateHeldItem(inputDelta: number, directionX: number, directionY: number, directionZ: number)` | 731 | ✍ Rotates the rotation node about a local axis by a quarter turn per second scaled by input and physics dt; on the server updates the joint frame. |
| `HandToolHands:levelHeldItem()` | 749 | ✍ Resets pitch and roll of the rotation node while keeping the item's yaw, and updates the joint frame on the server. Intended for pallets and square bales. |
| `HandToolHands:dropHeldItem(noEventSend: boolean?)` | 774 | ✍ If an item is held, sends a HandsThrowObjectEvent with zero force (unless `noEventSend`) and releases the item through `onHeldItemJointBroken`. |
| `HandToolHands:throwHeldItemWithForceScalar(throwForceScalar: number, noEventSend: boolean)` | 788 | ✍ Throws the held item along the player's last look ray with the given force scalar (0 to 1) by calling `throwHeldItemWithForceVector`. Logs an error without a targeter. |
| `HandToolHands:pickUpTarget(target: table, noEventSend: boolean) → boolean` | 881 | ✍ Validates the target, sends HandsPickUpObjectEvent, stores the held node, disables capsule collision with it, sets the hold distance and enables the related actions. The server then waits one physics frame before the joint, clients orient the rotation node. Returns true on success. |
| `HandToolHands:pickupFailed()` | 952 | ✍ Cleans up after a failed pickup: disables held-only actions for the owner, restores the pick up text and capsule collision, and clears the held node. |
| `HandToolHands:orientRotationNodeToItem(targetItemNode: any)` | 991 | ✍ Places the rotation node at the item's centre of mass with the item's world rotation. |
| `HandToolHands:createItemJoint()` | 1005 | ✍ Server only. Aborts and drops if the item vanished or is no longer dynamic; otherwise builds a locked joint between the kinematic node and item with springs and dampers scaled by mass, breakable beyond a mass-based force unless super strength, and registers a break report. |
| `HandToolHands:onHeldItemJointBroken(jointIndex: integer?, breakingImpulse: number?, noEventSend: boolean?)` | 1106 | ✍ Called when the joint breaks or on a drop: resets owner actions, restores capsule collision and clears the held node. On the server it sends a throw event to clients (zero force), removes the joint or cancels the pending one. |
| `HandToolHands:findFootballCallback(transformId: any)` | 1167 | ✍ Overlap callback: stores the first Football object found among shapes and stops the search. |
| `HandToolHands:shootBall(football: any, dirX: any, dirZ: any, angleDeg: any, velocity: any, shotType: any)` | 1184 | ✍ Records the shot time, clears `canShoot` and calls `football:shoot` with direction, angle, velocity and shot type. |
| `HandToolHands.calculateItemMass(itemNode: integer) → number?` | 1195 | ✍ Returns the object's total mass if it provides `getTotalMass`, otherwise the node mass; nil if the node does not exist. |
| `HandToolHands.calculateItemJointBreakForceFactor(itemNode: integer) → number` | 1219 | ✍ Returns the object's `getHandsJointBreakForceFactor` result to make the hold sturdier, or 1 if the object does not define it. |
| `HandToolHands:onDebugDraw()` | 1231 | ✍ Draws debug markers for the kinematic and rotation nodes and, when holding, for the item with a line showing the distance in metres. |
| `HandToolHands:consoleCommandToggleSuperStrength()` | 1254 | ✍ Console command: toggles super strength, which raises the maximum mass and pickup distance (10) and removes the joint break limit and `getCanBePickedUp` check. Refreshes the target type for the owner and returns a status text. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `updateKinematicNode` | 57 |
| registerFunction | `getKinematicNode` | 59 |
| registerFunction | `getIsHoldingItem` | 60 |
| registerFunction | `getIsThrowingItem` | 61 |
| registerFunction | `getIsAwaitingJointCreation` | 62 |
| registerFunction | `getHasJoint` | 63 |
| registerFunction | `getHeldItem` | 64 |
| registerFunction | `getCanPickUpNode` | 65 |
| registerFunction | `orientRotationNodeToItem` | 67 |
| registerFunction | `createItemJoint` | 68 |
| registerFunction | `pickUpTarget` | 70 |
| registerFunction | `pickupFailed` | 71 |
| registerFunction | `dropHeldItem` | 72 |
| registerFunction | `throwHeldItemWithForceScalar` | 73 |
| registerFunction | `throwHeldItemWithForceVector` | 74 |
| registerFunction | `rotateHeldItem` | 76 |
| registerFunction | `levelHeldItem` | 77 |
| registerFunction | `onHeldItemJointBroken` | 79 |
| registerFunction | `findFootballCallback` | 81 |
| registerFunction | `shootBall` | 82 |
| registerFunction | `consoleCommandToggleSuperStrength` | 84 |
| registerOverwrittenFunction | `getCanBeDropped` | 90 |
| registerEventListener | `onLoad` | 96 |
| registerEventListener | `onDelete` | 97 |
| registerEventListener | `onUpdate` | 98 |
| registerEventListener | `onDraw` | 99 |
| registerEventListener | `onWriteUpdateStream` | 100 |
| registerEventListener | `onReadUpdateStream` | 101 |
| registerEventListener | `onRegisterActionEvents` | 102 |
| registerEventListener | `onCarryingPlayerChanged` | 103 |
| registerEventListener | `onHeldStart` | 104 |
| registerEventListener | `onHeldEnd` | 105 |
| registerEventListener | `onDebugDraw` | 106 |
