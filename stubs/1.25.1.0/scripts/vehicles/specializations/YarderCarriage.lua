---@meta
-- FS25 1.25.1.0 : vehicles/specializations/YarderCarriage.lua (generated stub, FS25 Lua Atlas)

--- Always returns true: this specialization has no prerequisite.
---@param specializations table
---@return boolean
function YarderCarriage.prerequisitesPresent(specializations) end

--- Registers the `vehicle.yarderCarriage` XML schema: tree count and mass limits, carriage dimensions, lift speed and acceleration, rope target nodes, attach joint, main and additional ropes, tree hook, object changes and sounds. Note: the schema default for `joint#maxDistance` is 10 but onLoad actually uses 20.
function YarderCarriage.initSpecialization() end

--- Adds the carriage API to the vehicle type: dimensions, rope target nodes, tree attach/detach, mass and count queries, lift input, raycast callback, savegame helpers and the tree cut/mounted handlers.
---@param vehicleType any
function YarderCarriage.registerFunctions(vehicleType) end

--- Overrides getDirtMultiplier and getWearMultiplier.
---@param vehicleType any
function YarderCarriage.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, load-finished, delete, network streams (join and update) and post-update.
---@param vehicleType any
function YarderCarriage.registerEventListeners(vehicleType) end

--- Loads all carriage settings from XML, builds the rope, hook and attach-marker objects, creates the sounds on clients, allocates the dirty flag and subscribes to the TREE_SHAPE_CUT and TREE_SHAPE_MOUNTED messages. Lift speed is converted to meters per millisecond. Also sets `isVehicleSaved` to false.
---@param savegame any
function YarderCarriage:onLoad(savegame) end

--- Connects the main rope to its origin node and clones it as the short rope between the root hook and the tree, with the configured length.
---@param savegame any
function YarderCarriage:onLoadFinished(savegame) end

--- Clears the tower's reference to this carriage, detaches any attached trees, and deletes sounds, hook, marker and all ropes.
function YarderCarriage:onDelete() end

--- Client on join: reads the linked yarder tower vehicle and the attached trees (hook position and split-shape id). Trees whose shape cannot be resolved yet are queued in `splitShapesToAttach`.
---@param streamId integer
---@param connection Connection
function YarderCarriage:onReadStream(streamId, connection) end

--- Server on join: writes the linked tower vehicle, the number of attached trees, and for each one the hook position in tree space and the split-shape id.
---@param streamId integer
---@param connection Connection
function YarderCarriage:onWriteStream(streamId, connection) end

--- Client only: reads three flags sent by the server (lift, lift limit reached, lower) and plays or stops the matching sound samples.
---@param streamId any
---@param timestamp any
---@param connection any
function YarderCarriage:onReadUpdateStream(streamId, timestamp, connection) end

--- Server only: when the dirty flag is set, writes the three sound flags (lift, lift limit, lower) and resets them.
---@param streamId any
---@param connection any
---@param dirtyMask any
function YarderCarriage:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Server: shrinks the joint translation limits right after attachment, and detaches the trees if one disappeared or the rope is stretched beyond its limit. Client: resolves queued split shapes. Both: updates ropes, aim marker and visibility, stops lift sounds after a short delay, and keeps the vehicle active while trees are attached or aimed at.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function YarderCarriage:onPostUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Returns the carriage length and the roll spacing.
function YarderCarriage:getCarriageDimensions() end

--- Returns the node where the pull rope connects.
function YarderCarriage:getCarriagePullRopeTargetNode() end

--- Returns the node where the push rope connects.
function YarderCarriage:getCarriagePushRopeTargetNode() end

--- Stores the yarder tower vehicle this carriage belongs to.
---@param vehicle any
function YarderCarriage:setYarderTowerVehicle(vehicle) end

--- Moves each rope alignment node sideways and vertically along a sine curve so that nodes follow the sag of a rope between a rope node and a target point; `maxOffset` is the sag amplitude.
---@param ropeNode any
---@param tx any
---@param ty any
---@param tz any
---@param maxOffset any
function YarderCarriage:updateRopeAlignmentNodes(ropeNode, tx, ty, tz, maxOffset) end

--- Local player only: if the player is within range, has no hand tool and free tree slots, starts an asynchronous raycast from the camera against trees; otherwise clears the valid target tree.
function YarderCarriage:updateCarriageInRange() end

--- Resets the raycast state (valid tree and started flag) and keeps the vehicle active; called by the tower when the player's range update ends.
function YarderCarriage:onYarderCarriageUpdateEnd() end

--- Orients the main rope from its origin to the first tree hook, positions the root hook and sets the main rope length, then aligns hook nodes and target nodes of the additional ropes toward the other attached trees.
---@param dt any
function YarderCarriage:updateTreeAttachRopes(dt) end

--- Raycast callback: accepts a split tree within range (and within 2 m of the first hooked tree when one exists), computes the hook position and marker data, and stores it as the valid target tree. Resets the state if nothing valid is hit.
---@param hitObjectId any
---@param x any
---@param y any
---@param z any
---@param distance any
---@param nx any
---@param ny any
---@param nz any
---@param subShapeIndex any
---@param shapeId any
---@param isLast any
function YarderCarriage:onCarriageTreeRaycastCallback(hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, shapeId, isLast) end

--- Input handler for attaching the aimed tree. The server checks permission and attaches directly (showing a warning on failure); a client sends TreeAttachRequestEvent.
function YarderCarriage:onAttachTreeAction() end

--- Mounts a hook on the tree at the given world position and registers the tree. The server creates the physics joint; both sides update ropes, play the attach sound, apply the active component-joint limits, notify the tower (`onYarderCarriageTreeAttached`), publish TREE_SHAPE_MOUNTED and send TreeAttachEvent unless `noEventSend`. Returns early if the hook cannot be mounted.
---@param splitShapeId any
---@param x any
---@param y any
---@param z any
---@param ropeIndex any
---@param noEventSend any
function YarderCarriage:attachTreeToCarriage(splitShapeId, x, y, z, ropeIndex, noEventSend) end

--- Builds a spring-limited physics joint between the carriage component and the tree shape using the carriage joint node and the hook. Returns the joint index and the initial distance used as translation limit.
---@param shapeId any
---@param shapeJointId any
function YarderCarriage:createJoint(shapeId, shapeJointId) end

--- Input handler that detaches all trees from the carriage.
function YarderCarriage:onDetachTreeAction() end

--- Detaches every attached tree (the `ropeIndex` argument is not used): plays the detach sound, removes joints on the server, deletes hooks, hides additional ropes, restores inactive component-joint limits and sends TreeDetachEvent unless `noEventSend`.
---@param ropeIndex any
---@param noEventSend any
function YarderCarriage:detachTreeFromCarriage(ropeIndex, noEventSend) end

--- Returns how many trees are currently attached.
function YarderCarriage:getNumAttachedTrees() end

--- Returns the maximum number of trees allowed (`maxNumTrees`).
function YarderCarriage:getMaxNumAttachedTrees() end

--- Returns the summed mass of all attached trees, using the engine `getMass` (unit UNVERIFIED, presumably tonnes).
function YarderCarriage:getAttachedTreeMass() end

--- Checks whether a tree may be attached: it must exist, a slot must be free, total mass must stay under `maxTreeMass` and the tree must not be mounted on a tension belt. Returns a boolean and a failure reason (default or too heavy).
---@param splitShapeId any
function YarderCarriage:getIsCarriageTreeAttachAllowed(splitShapeId) end

--- Returns true if a valid aimed tree exists and still exists in the world and a tree slot is free.
function YarderCarriage:getIsTreeInMountRange() end

--- Shows a blinking warning with the mass limit when the failure reason is that the tree is too heavy; other reasons show nothing. `ropeIndex` is unused.
---@param ropeIndex any
---@param reason any
function YarderCarriage:showCarriageTreeMountFailedWarning(ropeIndex, reason) end

--- Server only: applies lift or lower input in a direction, with acceleration, by moving each tree's vertical translation limit within min and max distances. Triggers lift/lower sounds and raises the dirty flag so clients play them.
---@param direction any
function YarderCarriage:setCarriageLiftInput(direction) end

--- Registers the savegame attributes of each attached tree: hook translation and three split-shape id parts. Note: the translation attribute is described with unrelated text in the schema.
---@param schema any
---@param basePath any
function YarderCarriage.registerSavegameXMLPaths(schema, basePath) end

--- Writes each attached tree's hook world position and saveable split-shape id parts under the given key.
---@param xmlFile any
---@param key any
---@param usedModNames any
function YarderCarriage:saveAttachedTreesToXML(xmlFile, key, usedModNames) end

--- Static helper: reads the saved attached-tree entries (translation and split-shape parts) and returns them as a list; entries lacking data are skipped.
---@param xmlFile any
---@param key any
function YarderCarriage.loadAttachedTreesFromXML(xmlFile, key) end

--- Resolves loaded data into real tree shapes; if all can be resolved, attaches each without sending events and returns true, otherwise returns false and attaches nothing.
---@param data any
function YarderCarriage:resolveLoadedAttachedTrees(data) end

--- Message handler (server only): if a cut tree shape was attached, detaches all trees from the carriage.
---@param oldShape any
---@param shape any
function YarderCarriage:onYarderCarriageTreeShapeCut(oldShape, shape) end

--- Message handler (server only): if an attached tree is mounted by another vehicle, detaches all trees from this carriage.
---@param shape any
---@param mountVehicle any
function YarderCarriage:onYarderCarriageTreeShapeMounted(shape, mountVehicle) end

--- Returns the tower vehicle's dirt multiplier when a tower is linked, otherwise the parent value.
---@param superFunc any
---@return number
function YarderCarriage:getDirtMultiplier(superFunc) end

--- Returns the linked tower's value, otherwise the parent value. Note: it calls the tower's getDirtMultiplier, not getWearMultiplier, which looks like a copy-paste bug.
---@param superFunc any
---@return number
function YarderCarriage:getWearMultiplier(superFunc) end
