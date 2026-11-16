---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AutomaticArmControlForwarder.lua (generated stub, FS25 Lua Atlas)

--- Returns true only if the vehicle type has the Cylindered specialization.
---@param specializations table
---@return boolean
function AutomaticArmControlForwarder.prerequisitesPresent(specializations) end

--- Adds the `automaticArmControlForwarder` shop configuration type and registers the XML paths both directly under `vehicle.automaticArmControlForwarder` and inside each configuration entry.
function AutomaticArmControlForwarder.initSpecialization() end

--- Registers one set of XML keys: easy-arm requirement, fold limits, root node, tree triggers, X, Y, Z and X-tool alignment settings, and the tree marker with its target and too-thick colours.
---@param schema any
---@param basePath any
function AutomaticArmControlForwarder.registerXMLPaths(schema, basePath) end

--- Registers the alignment API (allowed check, input, `doTreeArmAlignment`, reset, active/finished queries, target tree getters, best-tree search) and the tree trigger callback.
---@param vehicleType any
function AutomaticArmControlForwarder.registerFunctions(vehicleType) end

--- Empty: no vehicle function is overridden.
---@param vehicleType any
function AutomaticArmControlForwarder.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onDelete, onReadUpdateStream, onWriteUpdateStream, onUpdate, `onAutoLoadForwaderMountedTree` and onRegisterActionEvents.
---@param vehicleType any
function AutomaticArmControlForwarder.registerEventListeners(vehicleType) end

--- Picks the configuration, reads nodes, alignment settings, fold limits and the tree marker, and adds the tree triggers. Without a root node it removes its onDelete, onUpdate and action listeners. Also drops the action listener if automatic vehicle control is on.
---@param savegame any
function AutomaticArmControlForwarder:onLoad(savegame) end

--- Resolves the moving tool objects of the X, Z, Y and X-tool alignment from their nodes.
---@param savegame any
function AutomaticArmControlForwarder:onPostLoad(savegame) end

--- Deletes the tree marker and removes all tree triggers.
function AutomaticArmControlForwarder:onDelete() end

--- Network read. The server reads the client's control input and holds it for 250 ms; a client reads whether the server found a valid target.
---@param streamId any
---@param timestamp any
---@param connection any
function AutomaticArmControlForwarder:onReadUpdateStream(streamId, timestamp, connection) end

--- Network write, mirror of the read: a client sends its control input, the server sends the valid-target flag, both only when the dirty flag is set.
---@param streamId any
---@param connection any
---@param dirtyMask any
function AutomaticArmControlForwarder:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Each update finds the best tree target when allowed, caching its position, direction and radius. Clients show the marker and toggle the input. The server raises the dirty flag and resets the state when target validity changes, and replays held input.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function AutomaticArmControlForwarder:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Event handler: removes the just-mounted tree from the list of trees found in the triggers.
---@param treeNodeId any
function AutomaticArmControlForwarder:onAutoLoadForwaderMountedTree(treeNodeId) end

--- On clients, registers the TREE_AUTOMATIC_ALIGN powered action with very high text priority, initially inactive. Only registered when automatic vehicle control is not available.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function AutomaticArmControlForwarder:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback: forwards the input value to `setTreeArmAlignmentInput`.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AutomaticArmControlForwarder.actionEvent(self, actionName, inputValue, callbackState, isAnalog) end

--- Enables or disables the TREE_AUTOMATIC_ALIGN action event according to the given state.
---@param self any
---@param state any
function AutomaticArmControlForwarder.updateActionEvents(self, state) end

--- Returns false if the vehicle is not controlled, if easy arm control is required but off, or if the fold animation time is outside the configured limits; true otherwise.
function AutomaticArmControlForwarder:getIsAutoTreeAlignmentAllowed() end

--- Server: while input is positive, not finished and a target exists, runs the alignment towards it; input 0 resets the state. Client: stores the input and flags the vehicle dirty to send it to the server.
---@param inputValue any
function AutomaticArmControlForwarder:setTreeArmAlignmentInput(inputValue) end

--- Steps the alignment state machine towards a target point and direction: move up, then X (and X tool), Z, Y, driving each moving tool through `externalMove`. `direction` is 1 or -1 and `forceMoveUp` forces the move-up step.
---@param tx any
---@param ty any
---@param tz any
---@param dx any
---@param dy any
---@param dz any
---@param direction any
---@param forceMoveUp any
function AutomaticArmControlForwarder:doTreeArmAlignment(tx, ty, tz, dx, dy, dz, direction, forceMoveUp) end

--- Rotates a moving tool about its axis towards a target world point. Returns the move command and true once the angle is under the threshold; `allowInversion` lets it aim the opposite way when that is shorter.
---@param self any
---@param movingTool any
---@param tx any
---@param ty any
---@param tz any
---@param referenceNode any
---@param threshold any
---@param speedScale any
---@param offset any
---@param allowInversion any
function AutomaticArmControlForwarder.movingToolXAlignment(self, movingTool, tx, ty, tz, referenceNode, threshold, speedScale, offset, allowInversion) end

--- Predicts where the tool would stop given its speed and acceleration, and returns -1, 0 or 1 (times the speed sign) so it does not overshoot the target rotation. Uses `g_currentDt`.
---@param self any
---@param movingTool any
---@param targetRot any
function AutomaticArmControlForwarder.calculateMovingToolTargetMove(self, movingTool, targetRot) end

--- Resets the alignment state machine to its initial state.
function AutomaticArmControlForwarder:resetAutomaticAlignment() end

--- Returns true while the alignment is neither idle nor finished.
function AutomaticArmControlForwarder:getIsAutomaticAlignmentActive() end

--- Returns true when the alignment state is the finished state.
function AutomaticArmControlForwarder:getIsAutomaticAlignmentFinished() end

--- Returns the node id of the tree currently targeted, or nil.
function AutomaticArmControlForwarder:getAutomaticAlignmentTargetTree() end

--- Recomputes and returns the best tree in range without using the cached target, or nil if none.
function AutomaticArmControlForwarder:getAutomaticAlignmentAvailableTargetTree() end

--- Returns the target position (x, y, z) and direction (dx, dy, dz) when a valid target exists, otherwise six nil values.
function AutomaticArmControlForwarder:getAutomaticAlignmentCurrentTarget() end

--- Scores unmounted trees by angle, distance and height relative to a reference node and returns the id with the lowest score, or nil. Mounted logs are skipped.
---@param referenceNode any
---@param trees any
function AutomaticArmControlForwarder:getBestTreeToAutoAlign(referenceNode, trees) end

--- Trigger callback: for mesh split shapes, adds the tree to the found list on enter and removes it on leave.
---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function AutomaticArmControlForwarder:onTreeAutoTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

--- Debug helper: draws a red arc of line segments around a node between two angles. Not called anywhere in this file.
---@param node any
---@param radius any
---@param steps any
---@param minRot any
---@param maxRot any
function AutomaticArmControlForwarder.drawDebugCircleRange(node, radius, steps, minRot, maxRot) end
