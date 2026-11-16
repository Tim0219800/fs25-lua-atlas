---@meta
-- FS25 1.25.1.0 : forestry/ForestryHook.lua (generated stub, FS25 Lua Atlas)

--- Plain class (not a specialization) representing a tree hook, the grapple-like piece that a forestry rope drags and fastens around a tree. It loads a hook XML and shared i3d, links the hook node under a vehicle or other node, rotates configured joints toward a target, and can mount itself on a tree by creating a tension-belt shape. Used with the forestry rope classes; the methods getBeltSpacing and updateDynamicSpacingNodes are called here but are not defined in this file (UNVERIFIED where they come from).
---@class ForestryHook
ForestryHook = {}

--- Constructor. Stores the owning vehicle (may be nil) and the link node, and initialises position, rotation, visibility, target state and empty tables of sub-target and rotation nodes.
---@param vehicle any
---@param linkNode any
---@param customMt any
function ForestryHook.new(vehicle, linkNode, customMt) end

--- Registers the #filename XML key (path to the hook XML, default treeHook01.xml in the shared forestry data) under the given base key.
---@param schema any
---@param baseKey any
function ForestryHook.registerXMLPaths(schema, baseKey) end

--- Returns true once an i3d filename has been resolved from the hook XML, i.e. the hook definition was found.
function ForestryHook:isValid() end

--- Reads the hook XML filename, loads that XML and its i3d path, then starts an asynchronous shared i3d load through the vehicle if present, otherwise through g_i3DManager. onI3DLoaded finishes the setup.
---@param xmlFile any
---@param key any
---@param baseDirectory any
function ForestryHook:loadFromXML(xmlFile, key, baseDirectory) end

--- Parses the hook XML: rotation nodes with axis limits and alignment flags, rope target nodes (the first becomes the main rope target), tree belt parameters (offset, max height delta, spacing, belt type from g_tensionBeltManager) and optional dynamic belt spacing with adjustment nodes.
---@param xmlFile any
function ForestryHook:loadFromConfigXML(xmlFile) end

--- Creates a new hook with the same vehicle, link node and filenames, reloading the cached shared i3d synchronously. Returns the clone, or nothing if the hook has no i3d filename.
function ForestryHook:clone() end

--- Removes the hook from the mission updateables, deletes the hook node (if it still exists) and releases the shared i3d, deletes the belt shape, and re-enables wind sway on a still-static tree it was mounted on.
function ForestryHook:delete() end

--- Refreshes the target position and, if the target is valid, turns each rotation node toward the target (or the average of its sub-targets), either by clamped Y/X angles or a full direction. Unregisters itself from updateables if the hook node no longer exists.
---@param dt any
function ForestryHook:update(dt) end

--- Sets the node the hook should aim at and does an immediate update. If isActiveDirty is true and the node is valid, the hook is registered for continuous updates, otherwise it is removed from them.
---@param nodeId any
---@param isActiveDirty any
function ForestryHook:setTargetNode(nodeId, isActiveDirty) end

--- Sets a fixed world position as target, marks the target valid and applies it with an immediate update.
---@param x any
---@param y any
---@param z any
function ForestryHook:setTargetPosition(x, y, z) end

--- Stores a sub-target node at the given index; rotation nodes with targetIndices aim at the average of the sub-targets they reference.
---@param nodeId any
---@param index any
function ForestryHook:setSubTargetNode(nodeId, index) end

--- Clears all stored sub-target nodes.
function ForestryHook:resetSubTargetNodes() end

--- Changes the link node and optionally the local position and rotation (nil values keep the previous ones). If the hook node is loaded, it is re-linked, shown or hidden according to visibility, and repositioned.
---@param node any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
function ForestryHook:link(node, x, y, z, rx, ry, rz) end

--- Converts a world position and a horizontal direction (dx, dz) to the link node's local space, stores them, and applies them to the hook node if it is loaded.
---@param x any
---@param y any
---@param z any
---@param dx any
---@param dz any
function ForestryHook:setPositionAndDirection(x, y, z, dx, dz) end

--- Fastens the hook around a tree shape near the given point. It computes the tree offset position (returns nil if none), builds a tension-belt shape linked to the tree, links the hook to it and replaces any previous belt. Returns the centre x, y, z. On unsplit static trees it also turns off wind sway.
---@param splitShapeId any
---@param x any
---@param y any
---@param z any
---@param maxRadius any
---@param tx any
---@param ty any
---@param tz any
function ForestryHook:mountToTree(splitShapeId, x, y, z, maxRadius, tx, ty, tz) end

--- Stores the visibility flag and applies it to the hook node if it is loaded.
---@param visibility any
function ForestryHook:setVisibility(visibility) end

--- Returns the world position of the main rope target node, or 0, 0, 0 if there is none or it no longer exists.
function ForestryHook:getRopeTargetPosition() end

--- Returns the node a rope should attach to: the main rope target, else the hook node, else the link node.
function ForestryHook:getRopeTarget() end

--- Returns the list of all rope target nodes read from the hook XML (entries can be nil if a node was not found).
function ForestryHook:getRopeTargets() end

--- Callback of the shared i3d load. On success it takes the first child as hook node, links and positions it, parses the config XML, frees that XML, runs an update and deletes the temporary i3d root. Does nothing if loading failed.
---@param i3dNode any
---@param failedReason any
function ForestryHook:onI3DLoaded(i3dNode, failedReason) end
