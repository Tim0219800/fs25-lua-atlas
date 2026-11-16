---@meta
-- FS25 1.25.1.0 : forestry/ForestryPhysicsRope.lua (generated stub, FS25 Lua Atlas)

--- Plain class wrapping an engine physics rope used by forestry equipment (winch, cable). It builds the chain of transform nodes, creates the rope between two actors with addPhysicsRope, drives a skinned visual rope through shader parameters, supports dynamic length, savegame persistence and network streaming of node positions and length. The constants COLLISION_GROUP, COLLISION_MASK, NUM_NODE_BITS, NUM_POSITION_BITS, NUM_LENGTH_BITS and MAX_LENGTH are used but not defined in this file (UNVERIFIED where they are set). The rope engine functions themselves are not in the dump.
---@class ForestryPhysicsRope
ForestryPhysicsRope = {}

--- Constructor. Stores the vehicle, link actor and node and the server flag, and initialises empty node and visual-rope lists, no physics rope, hidden, fixed length mode, not yet initialised.
---@param vehicle any
---@param linkActor any
---@param linkNode any
---@param isServer any
---@param customMt any
function ForestryPhysicsRope.new(vehicle, linkActor, linkNode, isServer, customMt) end

--- Registers the rope XML attributes under a base key: i3d filename, rope node path, diameter, uv scale, emissive color, min and max length, segment length, node distance, mass per length, collision group and mask. Note: the declared default of #emissiveColor differs from the one used in loadFromXML.
---@param schema any
---@param baseKey any
function ForestryPhysicsRope.registerXMLPaths(schema, baseKey) end

--- Registers the savegame key ropeNode(?)#translation used to store each rope node position.
---@param schema any
---@param baseKey any
function ForestryPhysicsRope.registerSavegameXMLPaths(schema, baseKey) end

--- Reads the rope settings from XML (mass per length is converted from kg by a factor 0.001), warns if the segment count or length exceeds the network limits, then starts an asynchronous shared i3d load through the vehicle or g_i3DManager.
---@param xmlFile any
---@param key any
---@param minLength any
---@param maxLength any
---@param baseDirectory any
function ForestryPhysicsRope:loadFromXML(xmlFile, key, minLength, maxLength, baseDirectory) end

--- Creates a copy with the same settings, optionally with another link actor, link node or max length, reloading the cached i3d synchronously. Returns the clone, or nil if there is no i3d filename.
---@param linkActor integer?
---@param linkNode integer?
---@param maxLength number?
---@return ForestryPhysicsRope?
function ForestryPhysicsRope:clone(linkActor, linkNode, maxLength) end

--- If a physics rope exists, queries its active node count and writes the world translation of each active node as ropeNode entries (zero-based index) under the given key.
---@param xmlFile any
---@param key any
function ForestryPhysicsRope:saveToXMLFile(xmlFile, key) end

--- Static helper: reads all ropeNode translations under a key and returns them as a list of positions, ready for applySavegamePositions.
---@param xmlFile any
---@param key any
function ForestryPhysicsRope.loadPositionDataFromSavegame(xmlFile, key) end

--- Removes the rope from mission updateables, deletes all nodes and, if the reference frame was created, deletes it (when it still exists) and releases the shared i3d.
function ForestryPhysicsRope:delete() end

--- Network write of the initial state: the active segment count, then each node's local position quantised relative to MAX_LENGTH. Writes a count of 0 if no physics rope exists.
---@param streamId any
function ForestryPhysicsRope:writeStream(streamId) end

--- Static counterpart of writeStream. Reads the quantised positions and returns them as a list of {x, y, z}, in reverse order when invert is true.
---@param streamId any
---@param invert any
function ForestryPhysicsRope.readStream(streamId, invert) end

--- Network write of the current rope length, clamped to MAX_LENGTH and quantised, preceded by a bool telling whether a physics rope exists.
---@param streamId any
function ForestryPhysicsRope:writeUpdateStream(streamId) end

--- Network read of the length sent by writeUpdateStream; stores it and applies it as the physics rope max length if the rope exists.
---@param streamId any
function ForestryPhysicsRope:readUpdateStream(streamId) end

--- Per-frame update. In dynamic length mode it adjusts the rope length from target movement. It pins first and last nodes to custom nodes, refreshes visual rope shader data and bounding sphere when length or node count changes, and on first valid nodes marks the rope initialised, shows it, applies a pending length and fires the creation callback.
---@param dt any
function ForestryPhysicsRope:update(dt) end

--- Re-sets the two physics rope anchors (start on the current link actor, end, index 999999, on the current target actor) from the current node world positions.
function ForestryPhysicsRope:updateAnchorNodes() end

--- Enables or disables automatic length adjustment in update and resets its tracking data from the current target node position.
---@param useDynamicLength any
function ForestryPhysicsRope:setUseDynamicLength(useDynamicLength) end

--- Applies a list of saved positions as local translations to the rope nodes, in order, skipping missing nodes.
---@param savegamePositions any
function ForestryPhysicsRope:applySavegamePositions(savegamePositions) end

--- Copies world positions of another rope's nodes onto this rope's nodes, optionally in reverse order.
---@param otherRope any
---@param invert any
function ForestryPhysicsRope:copyNodePositions(otherRope, invert) end

--- Creates the engine physics rope between a link and a target (swapped when inverted), registers for updates, hides the rope until nodes are valid and stores an optional callback. Returns true if the rope was created.
---@param targetActor any
---@param targetNode any
---@param linkActor any
---@param linkNode any
---@param inverted any
---@param useNodePositions any
---@param callback any
---@param callbackTarget any
function ForestryPhysicsRope:create(targetActor, targetNode, linkActor, linkNode, inverted, useNodePositions, callback, callbackTarget) end

--- Sets optional nodes that the last and first rope nodes follow each frame in update, to align the visual ends with specific points.
---@param targetNode any
---@param linkNode any
function ForestryPhysicsRope:setCustomVisualNodes(targetNode, linkNode) end

--- Removes the engine physics rope and resets lengths, actors, nodes, flags and callback, unregisters from updates and hides the rope. The object can be reused with create.
function ForestryPhysicsRope:destroy() end

--- Sets the maximum length and logs warnings if it implies too many segments or exceeds the global maximum length. It does not resize existing nodes.
---@param maxLength any
function ForestryPhysicsRope:setMaxLength(maxLength) end

--- Deletes existing rope nodes and creates new transform groups under the link node, enough for the max length divided by segment length, plus one.
function ForestryPhysicsRope:generateNodes() end

--- Returns the straight distance between link and target nodes as a fraction of the min-to-max length range (optional reference max). Values above 1 mean the rope is taut beyond its max. Returns 0 without a physics rope.
---@param referenceMaxLength any
function ForestryPhysicsRope:getRopeDirectLengthPercentage(referenceMaxLength) end

--- Returns the current physics rope length from the engine, or 0 if there is no physics rope.
function ForestryPhysicsRope:getLength() end

--- Sets the rope max length now if initialised; otherwise stores it and applies it on the first valid update.
---@param length any
function ForestryPhysicsRope:setLength(length) end

--- Adds a delta to the rope length, clamped between min and max, optionally accumulating on a stored running length. Returns the sign of the change, or 0 if there is no rope or no segments.
---@param lengthDelta any
---@param sumUp any
function ForestryPhysicsRope:adjustLength(lengthDelta, sumUp) end

--- Stores the visibility flag and applies it to the visual reference frame if it still exists.
---@param visibility any
function ForestryPhysicsRope:setVisibility(visibility) end

--- Changes the rope emissive color and updates the ropeEmissiveColor shader parameter of every visual rope, only if the value differs from the current one.
---@param r any
---@param g any
---@param b any
---@param a any
function ForestryPhysicsRope:setEmissiveColor(r, g, b, a) end

--- Callback of the shared i3d load. Creates a reference frame under the link node, moves the visual rope shapes into it with their shader parameters, unlinks the joint nodes and stores them as rope nodes, then deletes the temporary root. Does nothing on failure.
---@param i3dNode any
---@param failedReason any
function ForestryPhysicsRope:onI3DLoaded(i3dNode, failedReason) end
