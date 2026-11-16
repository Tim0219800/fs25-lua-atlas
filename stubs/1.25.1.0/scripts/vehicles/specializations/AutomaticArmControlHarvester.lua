---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AutomaticArmControlHarvester.lua (generated stub, FS25 Lua Atlas)

--- Returns true only if the vehicle type has the Cylindered specialization.
---@param specializations table
---@return boolean
function AutomaticArmControlHarvester.prerequisitesPresent(specializations) end

--- Adds the `automaticArmControlHarvester` shop configuration type and registers the XML paths directly and inside each configuration entry.
function AutomaticArmControlHarvester.initSpecialization() end

--- Registers one set of XML keys: easy-arm requirement, fold limits, return node, tree detection node (radii, angle, cut height), X, Y, Z alignment, extra alignment nodes and the tree marker colours and offset.
---@param schema any
---@param basePath any
function AutomaticArmControlHarvester.registerXMLPaths(schema, basePath) end

--- Registers the alignment API: support and allowed checks, tree validity and marker state, input, `doTreeArmAlignment`, active and target queries, invalid-tree reason, best-tree search, overlap callback and `getTreeAutomaticOverwrites`.
---@param vehicleType any
function AutomaticArmControlHarvester.registerFunctions(vehicleType) end

--- Empty: no vehicle function is overridden.
---@param vehicleType any
function AutomaticArmControlHarvester.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onDelete, onReadUpdateStream, onWriteUpdateStream, onUpdate, onRegisterActionEvents and onRootVehicleChanged.
---@param vehicleType any
function AutomaticArmControlHarvester.registerEventListeners(vehicleType) end

--- Picks the configuration, reads extra alignment nodes and, if a tree detection node exists, all detection, alignment, marker and fold settings. Without it, it keeps only the offsets and reference nodes (for use by a parent vehicle) and removes its update and action listeners.
---@param savegame any
function AutomaticArmControlHarvester:onLoad(savegame) end

--- Resolves the moving tool objects for X, Z, Y and each alignment node, dropping alignment nodes whose tool is not found.
---@param savegame any
function AutomaticArmControlHarvester:onPostLoad(savegame) end

--- Deletes the tree marker if one was created.
function AutomaticArmControlHarvester:onDelete() end

--- Network read. The server reads the client's control input and holds it for 250 ms; a client reads whether the server found a valid target.
---@param streamId any
---@param timestamp any
---@param connection any
function AutomaticArmControlHarvester:onReadUpdateStream(streamId, timestamp, connection) end

--- Network write, mirror of the read, sent only when the dirty flag is set: control input from client to server, valid-target flag from server to client.
---@param streamId any
---@param connection any
---@param dirtyMask any
function AutomaticArmControlHarvester:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Each update picks the best tree, places and colours the marker (cut, target or too thick, with a reason when invalid), and starts an async sphere overlap to refresh the tree list. The server then drives the alignment automatically or by held input, and handles the return to the idle position.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function AutomaticArmControlHarvester:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- On clients, registers the TREE_AUTOMATIC_ALIGN powered action with very high text priority, initially inactive. Only registered when automatic vehicle control is not available.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function AutomaticArmControlHarvester:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback: forwards the input value to `setTreeArmAlignmentInput`.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function AutomaticArmControlHarvester.actionEvent(self, actionName, inputValue, callbackState, isAnalog) end

--- Enables or disables the TREE_AUTOMATIC_ALIGN action event according to the given state.
---@param self any
---@param state any
function AutomaticArmControlHarvester.updateActionEvents(self, state) end

--- Registers or moves the `automaticArmControlHarvester` action in the root vehicle's action controller, finished once no arm return is pending, or removes it when there is no controller.
---@param rootVehicle table
function AutomaticArmControlHarvester:onRootVehicleChanged(rootVehicle) end

--- Action controller callback: a negative direction schedules the return of the arm to its return node; in all cases the alignment state is reset. Always returns true.
---@param self any
---@param direction any
function AutomaticArmControlHarvester.actionControllerEvent(self, direction) end

--- Returns false by default; a harvester head child vehicle is expected to override it to enable automatic alignment on the parent crane.
function AutomaticArmControlHarvester:getSupportsAutoTreeAlignment() end

--- Returns true only if the vehicle is controlled, easy arm control is on when required, the vehicle or a child supports auto alignment, and the fold time is within limits.
function AutomaticArmControlHarvester:getIsAutoTreeAlignmentAllowed() end

--- Default stub returning false, false (no split shape, radius not valid). Child vehicles override it to judge a tree radius.
---@param radius any
function AutomaticArmControlHarvester:getAutoAlignHasValidTree(radius) end

--- Asks this vehicle, then its child vehicles, whether a tree of the given radius can be cut. Returns a split-shape found flag and a valid-radius flag, merged across children.
---@param foundRadius any
---@param checkChildren any
function AutomaticArmControlHarvester:getAutoAlignTreeMarkerState(foundRadius, checkChildren) end

--- Server: while input is positive, not finished and a target exists, runs the alignment; input 0 resets the state. Client: stores the input and flags the vehicle dirty to send it to the server.
---@param inputValue any
function AutomaticArmControlHarvester:setTreeArmAlignmentInput(inputValue) end

--- Steps the alignment towards a target point (`direction` 1 to the tree, -1 to return): prepares the alignment nodes, then drives the X rotation, Z reach and Y height tools via `externalMove` and advances the state. Child overrides can replace reference nodes and add to the X offset.
---@param tx any
---@param ty any
---@param tz any
---@param direction any
function AutomaticArmControlHarvester:doTreeArmAlignment(tx, ty, tz, direction) end

--- Predicts where a rotating moving tool would stop and returns -1, 0 or 1 (times the speed sign) so it reaches the target rotation without overshooting.
---@param self any
---@param movingTool any
---@param targetRot any
function AutomaticArmControlHarvester.calculateMovingToolTargetMove(self, movingTool, targetRot) end

--- Before aligning towards a tree, turns the vehicle on if possible and untilts the wood harvester head. Then moves the configured alignment nodes to their target rotation; returns false while a prerequisite node is still moving.
---@param self any
---@param direction any
function AutomaticArmControlHarvester.prepareAlignment(self, direction) end

--- Returns true while the alignment is neither idle nor finished.
function AutomaticArmControlHarvester:getIsAutomaticAlignmentActive() end

--- Returns the target x, y, z and tree radius when a valid target exists, otherwise four nil values.
function AutomaticArmControlHarvester:getAutomaticAlignmentCurrentTarget() end

--- Returns the reason code the nearest tree was refused this update (no access or wrong type), or the 'none' code.
function AutomaticArmControlHarvester:getAutomaticAlignmentInvalidTreeReason() end

--- From a list of tree ids, keeps static, unsplit mesh split shapes within the max angle, then returns the best by angle plus twice the distance among those the harvester may cut and reach. Also returns the last refused tree and why.
---@param referenceNode any
---@param trees any
function AutomaticArmControlHarvester:getBestTreeToAutoAlign(referenceNode, trees) end

--- Async overlap callback: collects shapes with a split type, excluding tree stumps, whose horizontal distance to the detection node is between the min and max radius.
---@param objectId any
function AutomaticArmControlHarvester:onTreeAutoOverlapCallback(objectId, ...) end

--- Returns the Z and Y reference nodes and X offset so a parent crane can reuse them.
function AutomaticArmControlHarvester:getTreeAutomaticOverwrites() end

--- Debug helper: draws a red arc of line segments around a node between two angles. Only referenced by commented debug lines.
---@param node any
---@param radius any
---@param steps any
---@param minRot any
---@param maxRot any
function AutomaticArmControlHarvester.drawDebugCircleRange(node, radius, steps, minRot, maxRot) end
