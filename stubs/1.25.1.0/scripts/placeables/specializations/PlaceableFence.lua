---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableFence.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization for player-built fences made of segments (start and end x, z) that are filled with pole and panel clones following the terrain height, with optional gates driven by AnimatedObject. It handles snapping rules, a preview segment, panel-by-panel deletion, an asynchronous one-segment-per-frame rebuild queue, a build lock, and savegame and network sync of segments. Several terrain-change hooks (registerTerrainHeightChangeCallbacks, onTerrainDeformationSyncerUpdate) have no body in the SDK dump: UNVERIFIED.
---@class PlaceableFence
PlaceableFence = {}

--- No prerequisite: always returns true.
---@param specializations table
---@return boolean
function PlaceableFence.prerequisitesPresent(specializations) end

--- Declares the onCreateSegmentPanel event, raised each time a panel is built between two poles (preview or final).
---@param placeableType any
function PlaceableFence.registerEvents(placeableType) end

--- Registers all fence methods on the placeable type: segments, poles, panels, gates, preview, picking nodes, snapping and build-lock getters, and terrain-change callbacks. detachSourceNodes, updatePanelVisuals, getSnapAngle, registerTerrainHeightChangeCallbacks and onTerrainDeformationSyncerUpdate have no body in the SDK dump (UNVERIFIED).
---@param placeableType any
function PlaceableFence.registerFunctions(placeableType) end

--- Overrides canBeSold, collectPickObjects, getDestructionMethod, performNodeDestruction, previewNodeDestructionNodes and setOwnerFarmId on the placeable type.
---@param placeableType any
function PlaceableFence.registerOverwrittenFunctions(placeableType) end

--- Subscribes to load, delete, stream read/write and update events.
---@param placeableType any
function PlaceableFence.registerEventListeners(placeableType) end

--- Declares the fence XML: pole and panel variant groups, panel length and fixed flag, vertical angle limits, bounding width, snap distance/angle/check distance, extending-only, max corner angle, parallel snapping, invisible poles, plus gate entries (node, length, trigger, texts, duration, doors) and the animated-object paths.
---@param schema any
---@param basePath any
function PlaceableFence.registerXMLPaths(schema, basePath) end

--- Declares the savegame data: for each segment start and end positions, first/last pole visibility, gate index and the animated object state.
---@param schema any
---@param basePath any
function PlaceableFence.registerSavegameXMLPaths(schema, basePath) end

--- Reads fence settings with defaults (max vertical angle 35 degrees, gate angle 5, bounding width 0.25), collects the pole and panel variants from the children of their group nodes and loads the gate definitions. Ends with detachSourceNodes (no body in the dump, UNVERIFIED).
---@param savegame table
function PlaceableFence:onLoad(savegame) end

--- Cleans up: deletes pending update timers, unregisters from the terrain deformation syncer cells, deletes the gate animated objects and the detached source nodes if they still exist.
function PlaceableFence:onDelete() end

--- Client join: reads every segment (start/end coordinates, gate index, first/last pole flags), rebuilds its poles synchronously, reads each gate's animated object and registers terrain height-change callbacks.
---@param streamId any
---@param connection any
function PlaceableFence:onReadStream(streamId, connection) end

--- Server side counterpart: writes the segment count and every segment's data, then each gate segment's animated object id and state, registering it in the stream.
---@param streamId any
---@param connection any
function PlaceableFence:onWriteStream(streamId, connection) end

--- Each update call processes the segment shape queue through updateSegmentUpdateQueue.
---@param dt any
function PlaceableFence:onUpdate(dt) end

--- Calls the parent, then propagates the new owner farm id to every gate animated object.
---@param superFunc any
---@param ownerFarmId any
---@param noEventSend any
function PlaceableFence:setOwnerFarmId(superFunc, ownerFarmId, noEventSend) end

--- Rebuilds the fence from the savegame: reads each segment, skips and logs an error for invalid positions, regenerates its poles synchronously and restores gate animated-object state.
---@param xmlFile any
---@param key any
function PlaceableFence:loadFromXMLFile(xmlFile, key) end

--- Writes all segments (start, end, gate index and animated object for gates). The first/last pole flags are only written when false, since true is the default.
---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableFence:saveToXMLFile(xmlFile, key, usedModNames) end

--- Searches for a fence pole within maxDistance of a point using a sphere overlap on static objects. Returns the pole's world x, y, z, its node and its segment, or nil. Gates are ignored.
---@param x any
---@param y any
---@param z any
---@param maxDistance any
---@return x
---@return z
---@return distance
function PlaceableFence:getPoleNear(x, y, z, maxDistance) end

--- Overlap callback for getPoleNear: keeps the closest hit whose group belongs to one of this fence's segments and that has fewer than three children (to skip gates). Returns true to continue the overlap query.
---@param hitObjectId any
function PlaceableFence:getPoleNearOverlapCallback(hitObjectId) end

--- Given a collision node, tells whether it belongs to a pole of this fence (or, with allowPanel, to one of its panels) and returns that pole's world x, y, z plus the segment, otherwise nil.
---@param node any
---@param allowPanel any
function PlaceableFence:getPolePosition(node, allowPanel) end

--- Returns a clone of the first pole variant for placement preview, or nil if poles are invisible, absent or empty. The caller must delete the returned clone.
function PlaceableFence:getPoleShapeForPreview() end

--- Runs getMaxVerticalAngleAndYForSegment on the current preview segment and returns its max angle, min height and max height.
function PlaceableFence:getMaxVerticalAngleAndYForPreview() end

--- Computes, from terrain heights at consecutive poles, the steepest slope angle in radians and the lowest and highest terrain height. Needs the segment's poles to be calculated but no shapes. Initial min/max are 1000 and -1000.
---@param segment table
---@return number
---@return number
---@return number
function PlaceableFence:getMaxVerticalAngleAndYForSegment(segment) end

--- Returns the horizontal distance between a segment's start and end points.
---@param segment any
function PlaceableFence:getSegmentLength(segment) end

--- Returns the configured panel length.
function PlaceableFence:getPanelLength() end

--- Returns whether the panel length is fixed in the XML.
function PlaceableFence:getIsPanelLengthFixed() end

--- Refuses the sale with the object-in-use message while a build lock is held, otherwise defers to the parent implementation and returns its result.
---@param superFunc function
---@return boolean
---@return string?
function PlaceableFence:canBeSold(superFunc) end

--- Returns true while the build-lock counter is above zero.
---@return boolean
function PlaceableFence:getIsBuildLocked() end

--- Increments the lock counter when true, decrements it (never below 0) when false, so overlapping build runs do not unlock each other.
---@param isLocked boolean
function PlaceableFence:setBuildLocked(isLocked) end

--- Returns a new segment table from start and end coordinates, the render-first flag and an optional gate index. The last pole is always rendered; nothing is registered yet (see addSegment).
---@param x1 any
---@param z1 any
---@param x2 any
---@param z2 any
---@param renderFirst any
---@param gateIndex any
function PlaceableFence:createSegment(x1, z1, x2, z2, renderFirst, gateIndex) end

--- Appends the segment to the fence and generates its poles; the sync flag chooses immediate or queued shape building.
---@param segment any
---@param sync any
function PlaceableFence:addSegment(segment, sync) end

--- Removes a segment: deletes its gate animated object, node group and pending timer, drops its terrain-change listeners, removes it from the list and flags the covered area dirty.
---@param segment any
function PlaceableFence:deleteSegment(segment) end

--- Marks the bounding box of the line as dirty in the density-map height collision map and in the AI navigation system.
---@param x1 any
---@param z1 any
---@param x2 any
---@param z2 any
function PlaceableFence:updateDirtyAreas(x1, z1, x2, z2) end

--- Replaces the preview segment: deletes the previous preview's node group and generates poles for the new one without synchronous shape building (queued).
---@param segment any
function PlaceableFence:setPreviewSegment(segment) end

--- Returns the current preview segment, or nil.
function PlaceableFence:getPreviewSegment() end

--- Returns the gate definition at the given 1-based index.
---@param index any
function PlaceableFence:getGate(index) end

--- Returns the segment at the given 1-based index.
---@param index any
function PlaceableFence:getSegment(index) end

--- Returns the number of segments (the name contains a typo for 'segments').
function PlaceableFence:getNumSequments() end

--- Returns the maximum allowed terrain angle for normal segments.
function PlaceableFence:getMaxVerticalAngle() end

--- Returns the maximum allowed terrain angle for gate segments.
function PlaceableFence:getMaxVerticalGateAngle() end

--- Returns the width of the box used for collision checks when placing.
function PlaceableFence:getBoundingCheckWidth() end

--- Returns the snap distance from the XML, or nil if not set.
function PlaceableFence:getSnapDistance() end

--- Returns the distance used to detect snap targets (default 0.25).
function PlaceableFence:getSnapCheckDistance() end

--- Returns whether new segments may only extend existing ones instead of attaching mid-segment.
function PlaceableFence:getAllowExtendingOnly() end

--- Returns the maximum allowed angle between two connected segments.
function PlaceableFence:getMaxCornerAngle() end

--- Always returns false in this specialization; overridable by other code.
function PlaceableFence:getHasParallelSnapping() end

--- Returns the XML flag saying whether parallel snapping is offered.
function PlaceableFence:getSupportsParallelSnapping() end

--- Removes the panel hit by a node. On the server it applies doDeletePanel and broadcasts PlaceableFenceRemoveSegmentEvent; on a client it clears the node's collision mask and sends the event to the server. Returns true if a panel was found.
---@param node any
function PlaceableFence:deletePanel(node) end

--- Applies a panel removal on the segment: shortens it, moves its start, deletes it, or splits it in two. Re-renders poles that neighbours need, regenerates shapes and marks the old area dirty. Called on the server and by the removal event on clients.
---@param segment any
---@param segmentIndex any
---@param poleIndex any
function PlaceableFence:doDeletePanel(segment, segmentIndex, poleIndex) end

--- From a raycast collision node, walks the node hierarchy to find the panel, its visuals, the segment, the pole and the pole index (2*child+1 into the poles list). Handles gate cases; if the node is a pole only, returns nil for panel. Returns nil if no segment matches.
---@param node any
function PlaceableFence:findRaycastInfo(node) end

--- For a destruction preview, returns the visual nodes that removing the panel would delete: the panel or the gate doors, plus an end pole that would be left alone. Returns nil if no panel is found.
---@param node any
function PlaceableFence:getNodesToDeleteForPanel(node) end

--- Finds another segment whose start or end coincides with the given x, z (within PlaceableFence.EPSILON). Returns the segment and two flags: matches start, matches end; nil if none. The ignored segment is skipped.
---@param x any
---@param z any
---@param ignoreSegment any
function PlaceableFence:isPoleInAnySegment(x, z, ignoreSegment) end

--- Deterministic pseudo-random value from x and z only: a fraction in [0,1), or with n an integer from 1 to n. Used so pole and panel variants stay identical on every client.
---@param x any
---@param y any
---@param z any
---@param n any
function PlaceableFence:fakeRandomValueForPosition(x, y, z, n) end

--- Recomputes the segment's poles, then rebuilds its shapes immediately (sync) or queues them, and updates picking nodes. Marks the area dirty unless it is the preview segment. Does nothing if the segment is too short.
---@param segment any
---@param sync any
function PlaceableFence:generateSegmentPoles(segment, sync) end

--- Fills the segment's pole coordinate list (x, z pairs) without touching shapes: whole panel lengths first, then one or two evenly sized end panels; gates only get two poles. Returns false if the segment is shorter than 0.01.
---@param segment table
---@return boolean
function PlaceableFence:calculateSegmentPoles(segment) end

--- Rebuilds a segment's scene nodes: deletes the old group, clones poles and panels on the terrain height, rotates and sizes them, adds physics unless it is the preview, and raises onCreateSegmentPanel. For gates, builds the gate and a synced AnimatedObject (broadcast by the server). Note: the AnimatedObject save id uses x2 twice, where the comment suggests z2 was meant.
---@param segment any
function PlaceableFence:updateSegmentShapes(segment) end

--- Queues a segment for shape rebuilding and wakes the placeable's update loop.
---@param segment any
function PlaceableFence:addSegmentShapesToUpdate(segment) end

--- Takes the first queued segment per call and rebuilds its shapes (picking nodes removed and re-added), then keeps the update loop active, so only one segment is rebuilt per frame.
function PlaceableFence:updateSegmentUpdateQueue() end

--- Registers every node of the segment group that has a rigid body with the mission's node-object table so it can be picked, and resets the overlay color cache. Skipped for the preview segment.
---@param segment any
function PlaceableFence:addPickingNodesForSegment(segment) end

--- Reverse of addPickingNodesForSegment: unregisters the segment's rigid-body nodes from the mission's node-object table. Skipped for the preview segment.
---@param segment any
function PlaceableFence:removePickingNodesForSegment(segment) end

--- Recursively appends to the given list every node under a node whose rigid body type is not NONE.
---@param objects any
---@param node any
function PlaceableFence:recursivelyAddPickingNodes(objects, node) end

--- Returns Placeable.DESTRUCTION.PER_NODE, so the fence is destroyed piece by piece.
---@param superFunc any
function PlaceableFence:getDestructionMethod(superFunc) end

--- Returns the nodes to highlight for a node-destruction preview, delegating to getNodesToDeleteForPanel.
---@param superFunc any
---@param node any
function PlaceableFence:previewNodeDestructionNodes(superFunc, node) end

--- Deletes the panel for a node through deletePanel and returns whether something was deleted plus whether the whole placeable should be destroyed (no segments left).
---@param superFunc any
---@param node any
function PlaceableFence:performNodeDestruction(superFunc, node) end

--- Empty override: the fence adds no default picking objects at placeable level, since segment nodes are registered separately. The parent implementation is not called.
---@param superFunc any
---@param node any
function PlaceableFence:collectPickObjects(superFunc, node) end
