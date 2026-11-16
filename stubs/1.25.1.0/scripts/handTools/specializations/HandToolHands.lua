---@meta
-- FS25 1.25.1.0 : handTools/specializations/HandToolHands.lua (generated stub, FS25 Lua Atlas)

--- Hand tool specialization for the player's bare hands, which cannot be dropped. It lets the owning player pick up dynamic physics objects up to a maximum mass through a joint attached to a kinematic helper node, rotate, level and throw them with charged force, and kick or pass a Football. Throws and pickups are synchronised with events (HandsPickUpObjectEvent, HandsThrowObjectEvent, HandsPickUpFailedEvent); the helper pose is streamed to the server. Note: `getHeldItem` and `throwHeldItemWithForceVector` are registered or called but no body for them is in this dump (UNVERIFIED).
---@class HandToolHands
HandToolHands = {}

--- Opens and closes the specialization XML type without registering any key: the hands have no XML configuration here.
---@param xmlSchema any
function HandToolHands.registerXMLPaths(xmlSchema) end

--- Registers the held item, joint, pickup, drop, throw, rotate, level, football and super strength console functions on the hand tool type (including `getHeldItem` and `throwHeldItemWithForceVector`, whose bodies are not in this file).
---@param handToolType any
function HandToolHands.registerFunctions(handToolType) end

--- Overrides `getCanBeDropped`.
---@param vehicleType any
function HandToolHands.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, delete, update, draw, update stream read/write, action events, carrying player change, held start/end and debug draw.
---@param handToolType any
function HandToolHands.registerEventListeners(handToolType) end

--- Always returns true: no prerequisite.
---@param specializations any
function HandToolHands.prerequisitesPresent(specializations) end

--- Initialises pickup mass and distance, throw and football state, action texts and the dirty flag; starts an async load of the shared kinematic helper i3d; creates three crosshairs on clients.
---@param xmlFile any
---@param baseDirectory any
function HandToolHands:onLoad(xmlFile, baseDirectory) end

--- Async callback: takes the helper's first child as the kinematic node, links it to the root and adds it to physics, and creates a rotation helper under it. Logs an error if loading failed.
---@param kinematicNode any
---@param failedReason any
function HandToolHands:onKinematicHelperLoaded(kinematicNode, failedReason) end

--- Drops the held item without event, releases the helper i3d and node, removes the super strength console command for the owner and frees the crosshairs.
function HandToolHands:onDelete() end

--- Client to server, when the dirty flag is set: writes the compressed world position of the kinematic node, its horizontal direction and the rotation node angles.
---@param streamId any
---@param connection any
---@param dirtyMask any
function HandToolHands:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Server side: reads those values, sets the kinematic and rotation node transforms and, if a joint exists, updates its frame.
---@param streamId any
---@param timestamp any
---@param connection any
function HandToolHands:onReadUpdateStream(streamId, timestamp, connection) end

--- Creates the joint once the awaited physics frame is simulated (server), updates the kinematic node and, for the owner, detects pickable targets and footballs, switches the action texts, completes a charged throw when the input is released, and dribbles a nearby football.
---@param dt any
function HandToolHands:onUpdate(dt) end

--- In first person for the owner, draws the throw crosshair scaled by charge, the pickup crosshair when holding or aiming at a pickable object, or the default crosshair.
function HandToolHands:onDraw() end

--- Registers pick up/drop, throw, pitch, yaw and level input actions with texts and priority. Skipped if the tool is not active for input.
function HandToolHands:onRegisterActionEvents() end

--- For the owner, adds the pickup target type to the player's targeter with the current pickup distance.
function HandToolHands:onHeldStart() end

--- For the owner, removes the target type and drops any held item.
function HandToolHands:onHeldEnd() end

--- Adds the console command `gsPlayerSuperStrengthToggle` when the owning player gets the hands, and removes it when they are lost.
---@param player any
---@param lastPlayer any
function HandToolHands:onCarryingPlayerChanged(player, lastPlayer) end

--- Overwritten function: always returns false, the hands cannot be dropped.
---@param superFunc any
function HandToolHands:getCanBeDropped(superFunc) end

--- For the owner while held, places the kinematic node along the player's look ray at the hold distance, kept level, and flags a network update. Does nothing without a node or ray.
function HandToolHands:updateKinematicNode() end

--- Returns the kinematic node and its rotation node (nil until loaded).
---@return integer?
---@return integer?
function HandToolHands:getKinematicNode() end

--- Returns true if an item is held, even if no joint exists yet.
---@return boolean
function HandToolHands:getIsHoldingItem() end

--- Returns true while a throw is being charged.
---@return boolean
function HandToolHands:getIsThrowingItem() end

--- Returns true if an item was picked up and the joint is still awaiting a physics frame.
---@return boolean
function HandToolHands:getIsAwaitingJointCreation() end

--- Returns true if a joint links the kinematic node and the held item.
---@return boolean
function HandToolHands:getHasJoint() end

--- Tests whether a node can be picked up: it exists, is not already held, on the server is a dynamic body not heavier than the allowed mass, and its object is not mounted and allows pickup (unless super strength).
---@param node integer
---@return boolean
function HandToolHands:getCanPickUpNode(node) end

--- Owner input: passes a nearby football if one is targeted, otherwise drops the held item or picks up the targeted one.
---@param _ any
---@param inputValue any
function HandToolHands:onPickUpAction(_, inputValue) end

--- Owner input: shoots a football if present (angle 30 degrees). Otherwise, if holding an item, notes the update index and accumulates charge time with the frame delta.
---@param _ any
---@param inputValue any
function HandToolHands:onThrowAction(_, inputValue) end

--- Input callback: rotates the held item about the player-relative horizontal axis.
---@param _ any
---@param inputDelta any
function HandToolHands:onPitchAction(_, inputDelta) end

--- Input callback: rotates the held item about the vertical axis.
---@param _ any
---@param inputDelta any
function HandToolHands:onYawAction(_, inputDelta) end

--- Input callback: levels the held item.
---@param _ any
---@param inputValue any
function HandToolHands:onLevelAction(_, inputValue) end

--- Rotates the rotation node about a local axis by a quarter turn per second scaled by input and physics dt; on the server updates the joint frame.
---@param inputDelta number
---@param directionX number
---@param directionY number
---@param directionZ number
function HandToolHands:rotateHeldItem(inputDelta, directionX, directionY, directionZ) end

--- Resets pitch and roll of the rotation node while keeping the item's yaw, and updates the joint frame on the server. Intended for pallets and square bales.
function HandToolHands:levelHeldItem() end

--- If an item is held, sends a HandsThrowObjectEvent with zero force (unless `noEventSend`) and releases the item through `onHeldItemJointBroken`.
---@param noEventSend boolean?
function HandToolHands:dropHeldItem(noEventSend) end

--- Throws the held item along the player's last look ray with the given force scalar (0 to 1) by calling `throwHeldItemWithForceVector`. Logs an error without a targeter.
---@param throwForceScalar number
---@param noEventSend boolean
function HandToolHands:throwHeldItemWithForceScalar(throwForceScalar, noEventSend) end

--- Validates the target, sends HandsPickUpObjectEvent, stores the held node, disables capsule collision with it, sets the hold distance and enables the related actions. The server then waits one physics frame before the joint, clients orient the rotation node. Returns true on success.
---@param target table
---@param noEventSend boolean
---@return boolean
function HandToolHands:pickUpTarget(target, noEventSend) end

--- Cleans up after a failed pickup: disables held-only actions for the owner, restores the pick up text and capsule collision, and clears the held node.
function HandToolHands:pickupFailed() end

--- Places the rotation node at the item's centre of mass with the item's world rotation.
---@param targetItemNode any
function HandToolHands:orientRotationNodeToItem(targetItemNode) end

--- Server only. Aborts and drops if the item vanished or is no longer dynamic; otherwise builds a locked joint between the kinematic node and item with springs and dampers scaled by mass, breakable beyond a mass-based force unless super strength, and registers a break report.
function HandToolHands:createItemJoint() end

--- Called when the joint breaks or on a drop: resets owner actions, restores capsule collision and clears the held node. On the server it sends a throw event to clients (zero force), removes the joint or cancels the pending one.
---@param jointIndex integer?
---@param breakingImpulse number?
---@param noEventSend boolean?
function HandToolHands:onHeldItemJointBroken(jointIndex, breakingImpulse, noEventSend) end

--- Overlap callback: stores the first Football object found among shapes and stops the search.
---@param transformId any
function HandToolHands:findFootballCallback(transformId) end

--- Records the shot time, clears `canShoot` and calls `football:shoot` with direction, angle, velocity and shot type.
---@param football any
---@param dirX any
---@param dirZ any
---@param angleDeg any
---@param velocity any
---@param shotType any
function HandToolHands:shootBall(football, dirX, dirZ, angleDeg, velocity, shotType) end

--- Returns the object's total mass if it provides `getTotalMass`, otherwise the node mass; nil if the node does not exist.
---@param itemNode integer
---@return number?
function HandToolHands.calculateItemMass(itemNode) end

--- Returns the object's `getHandsJointBreakForceFactor` result to make the hold sturdier, or 1 if the object does not define it.
---@param itemNode integer
---@return number
function HandToolHands.calculateItemJointBreakForceFactor(itemNode) end

--- Draws debug markers for the kinematic and rotation nodes and, when holding, for the item with a line showing the distance in metres.
function HandToolHands:onDebugDraw() end

--- Console command: toggles super strength, which raises the maximum mass and pickup distance (10) and removes the joint break limit and `getCanBePickedUp` check. Refreshes the target type for the owner and returns a status text.
function HandToolHands:consoleCommandToggleSuperStrength() end
