# forestry/ForestryPhysicsRope.lua

*[Version française](../../fr/scripts/forestry/ForestryPhysicsRope.md)*

Source: `dataS/scripts/forestry/ForestryPhysicsRope.lua` — FS25 1.25.1.0

✍ Plain class wrapping an engine physics rope used by forestry equipment (winch, cable). It builds the chain of transform nodes, creates the rope between two actors with addPhysicsRope, drives a skinned visual rope through shader parameters, supports dynamic length, savegame persistence and network streaming of node positions and length. The constants COLLISION_GROUP, COLLISION_MASK, NUM_NODE_BITS, NUM_POSITION_BITS, NUM_LENGTH_BITS and MAX_LENGTH are used but not defined in this file (UNVERIFIED where they are set). The rope engine functions themselves are not in the dump.

- **ForestryPhysicsRope** (l.33)

## Functions

| Function | Line | Description |
|---|---|---|
| `ForestryPhysicsRope.new(vehicle: any, linkActor: any, linkNode: any, isServer: any, customMt: any)` | 37 | ✍ Constructor. Stores the vehicle, link actor and node and the server flag, and initialises empty node and visual-rope lists, no physics rope, hidden, fixed length mode, not yet initialised. |
| `ForestryPhysicsRope.registerXMLPaths(schema: any, baseKey: any)` | 66 | ✍ Registers the rope XML attributes under a base key: i3d filename, rope node path, diameter, uv scale, emissive color, min and max length, segment length, node distance, mass per length, collision group and mask. Note: the declared default of #emissiveColor differs from the one used in loadFromXML. |
| `ForestryPhysicsRope.registerSavegameXMLPaths(schema: any, baseKey: any)` | 85 | ✍ Registers the savegame key ropeNode(?)#translation used to store each rope node position. |
| `ForestryPhysicsRope:loadFromXML(xmlFile: any, key: any, minLength: any, maxLength: any, baseDirectory: any)` | 91 | ✍ Reads the rope settings from XML (mass per length is converted from kg by a factor 0.001), warns if the segment count or length exceeds the network limits, then starts an asynchronous shared i3d load through the vehicle or g_i3DManager. |
| `ForestryPhysicsRope:clone(linkActor: integer?, linkNode: integer?, maxLength: number?) → ForestryPhysicsRope?` | 131 | ✍ Creates a copy with the same settings, optionally with another link actor, link node or max length, reloading the cached i3d synchronously. Returns the clone, or nil if there is no i3d filename. |
| `ForestryPhysicsRope:saveToXMLFile(xmlFile: any, key: any)` | 160 | ✍ If a physics rope exists, queries its active node count and writes the world translation of each active node as ropeNode entries (zero-based index) under the given key. |
| `ForestryPhysicsRope.loadPositionDataFromSavegame(xmlFile: any, key: any)` | 174 | ✍ Static helper: reads all ropeNode translations under a key and returns them as a list of positions, ready for applySavegamePositions. |
| `ForestryPhysicsRope:delete()` | 187 | ✍ Removes the rope from mission updateables, deletes all nodes and, if the reference frame was created, deletes it (when it still exists) and releases the shared i3d. |
| `ForestryPhysicsRope:writeStream(streamId: any)` | 206 | ✍ Network write of the initial state: the active segment count, then each node's local position quantised relative to MAX_LENGTH. Writes a count of 0 if no physics rope exists. |
| `ForestryPhysicsRope.readStream(streamId: any, invert: any)` | 227 | ✍ Static counterpart of writeStream. Reads the quantised positions and returns them as a list of {x, y, z}, in reverse order when invert is true. |
| `ForestryPhysicsRope:writeUpdateStream(streamId: any)` | 249 | ✍ Network write of the current rope length, clamped to MAX_LENGTH and quantised, preceded by a bool telling whether a physics rope exists. |
| `ForestryPhysicsRope:readUpdateStream(streamId: any)` | 259 | ✍ Network read of the length sent by writeUpdateStream; stores it and applies it as the physics rope max length if the rope exists. |
| `ForestryPhysicsRope:update(dt: any)` | 273 | ✍ Per-frame update. In dynamic length mode it adjusts the rope length from target movement. It pins first and last nodes to custom nodes, refreshes visual rope shader data and bounding sphere when length or node count changes, and on first valid nodes marks the rope initialised, shows it, applies a pending length and fires the creation callback. |
| `ForestryPhysicsRope:updateAnchorNodes()` | 412 | ✍ Re-sets the two physics rope anchors (start on the current link actor, end, index 999999, on the current target actor) from the current node world positions. |
| `ForestryPhysicsRope:setUseDynamicLength(useDynamicLength: any)` | 424 | ✍ Enables or disables automatic length adjustment in update and resets its tracking data from the current target node position. |
| `ForestryPhysicsRope:applySavegamePositions(savegamePositions: any)` | 432 | ✍ Applies a list of saved positions as local translations to the rope nodes, in order, skipping missing nodes. |
| `ForestryPhysicsRope:copyNodePositions(otherRope: any, invert: any)` | 443 | ✍ Copies world positions of another rope's nodes onto this rope's nodes, optionally in reverse order. |
| `ForestryPhysicsRope:create(targetActor: any, targetNode: any, linkActor: any, linkNode: any, inverted: any, useNodePositions: any, callback: any, callbackTarget: any)` | 460 | ✍ Creates the engine physics rope between a link and a target (swapped when inverted), registers for updates, hides the rope until nodes are valid and stores an optional callback. Returns true if the rope was created. |
| `ForestryPhysicsRope:setCustomVisualNodes(targetNode: any, linkNode: any)` | 494 | ✍ Sets optional nodes that the last and first rope nodes follow each frame in update, to align the visual ends with specific points. |
| `ForestryPhysicsRope:destroy()` | 501 | ✍ Removes the engine physics rope and resets lengths, actors, nodes, flags and callback, unregisters from updates and hides the rope. The object can be reused with create. |
| `ForestryPhysicsRope:setMaxLength(maxLength: any)` | 529 | ✍ Sets the maximum length and logs warnings if it implies too many segments or exceeds the global maximum length. It does not resize existing nodes. |
| `ForestryPhysicsRope:generateNodes()` | 544 | ✍ Deletes existing rope nodes and creates new transform groups under the link node, enough for the max length divided by segment length, plus one. |
| `ForestryPhysicsRope:getRopeDirectLengthPercentage(referenceMaxLength: any)` | 559 | ✍ Returns the straight distance between link and target nodes as a fraction of the min-to-max length range (optional reference max). Values above 1 mean the rope is taut beyond its max. Returns 0 without a physics rope. |
| `ForestryPhysicsRope:getLength()` | 570 | ✍ Returns the current physics rope length from the engine, or 0 if there is no physics rope. |
| `ForestryPhysicsRope:setLength(length: any)` | 580 | ✍ Sets the rope max length now if initialised; otherwise stores it and applies it on the first valid update. |
| `ForestryPhysicsRope:adjustLength(lengthDelta: any, sumUp: any)` | 590 | ✍ Adds a delta to the rope length, clamped between min and max, optionally accumulating on a stored running length. Returns the sign of the change, or 0 if there is no rope or no segments. |
| `ForestryPhysicsRope:setVisibility(visibility: any)` | 611 | ✍ Stores the visibility flag and applies it to the visual reference frame if it still exists. |
| `ForestryPhysicsRope:setEmissiveColor(r: any, g: any, b: any, a: any)` | 620 | ✍ Changes the rope emissive color and updates the ropeEmissiveColor shader parameter of every visual rope, only if the value differs from the current one. |
| `ForestryPhysicsRope:onI3DLoaded(i3dNode: any, failedReason: any)` | 635 | ✍ Callback of the shared i3d load. Creates a reference frame under the link node, moves the visual rope shapes into it with their shader parameters, unlinks the joint nodes and stores them as rope nodes, then deletes the temporary root. Does nothing on failure. |
