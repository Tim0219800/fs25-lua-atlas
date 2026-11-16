---@meta
-- FS25 1.25.1.0 : forestry/ForestryRope.lua (generated stub, FS25 Lua Atlas)

--- Plain class for a purely visual forestry rope: a single shape stretched between a reference frame and a target point through shader parameters, with no physics. It loads a rope i3d (shared), keeps the rope pointed at a target node or position, and lets the owner change length, link node, visibility and emissive color (valid versus invalid). Sibling of ForestryPhysicsRope and ForestryHook.
---@class ForestryRope
ForestryRope = {}

--- Constructor. Stores the vehicle (may be nil) and link node and initialises local position and rotation, visibility, target data and bounding radius.
---@param vehicle any
---@param linkNode any
---@param customMt any
function ForestryRope.new(vehicle, linkNode, customMt) end

--- Registers the rope XML attributes: i3d filename, rope node path, diameter, uv scale, and emissive colors for the valid and invalid states. Note: declared default colors differ from the ones used in loadFromXML.
---@param schema any
---@param baseKey any
function ForestryRope.registerXMLPaths(schema, baseKey) end

--- Reads rope settings from XML and starts an asynchronous shared i3d load, through the vehicle if present, otherwise g_i3DManager. onI3DLoaded completes the setup.
---@param xmlFile any
---@param key any
---@param baseDirectory any
function ForestryRope:loadFromXML(xmlFile, key, baseDirectory) end

--- Empty hook, nothing is loaded here.
---@param xmlFile any
function ForestryRope:loadFromConfigXML(xmlFile) end

--- Creates a copy with the same settings, optionally on another link node, reloading the cached i3d synchronously. Returns the clone, or nothing if there is no i3d filename.
---@param linkNode any
function ForestryRope:clone(linkNode) end

--- Removes the rope from mission updateables, deletes the reference frame if it still exists and releases the shared i3d.
function ForestryRope:delete() end

--- If a target is set, converts it to the reference frame's local space, points the rope at it and sets the rope length to the distance. Refreshes the target position first when a target node is used.
---@param dt any
function ForestryRope:update(dt) end

--- Writes the length into the rope shader parameter (with diameter and uv scale) and resizes the shape bounding sphere when the radius changes. Does nothing until the reference frame exists.
---@param length any
function ForestryRope:setLength(length) end

--- Sets a node as rope target and updates immediately. With isActiveDirty true the rope is registered for per-frame updates (to follow a moving node), otherwise it is removed from them. The node must not be nil.
---@param nodeId any
---@param isActiveDirty any
function ForestryRope:setTargetNode(nodeId, isActiveDirty) end

--- Sets a fixed world position as target and updates immediately.
---@param x any
---@param y any
---@param z any
function ForestryRope:setTargetPosition(x, y, z) end

--- Changes the link node and optionally the local position and rotation (nil keeps the old values), then re-links and repositions the reference frame if it exists.
---@param node any
---@param x any
---@param y any
---@param z any
---@param rx any
---@param ry any
---@param rz any
function ForestryRope:link(node, x, y, z, rx, ry, rz) end

--- Sets the rope start from a world position and, if both dx and dz are given, a horizontal direction, converted to the link node's local space; applies it to the reference frame if it exists.
---@param x any
---@param y any
---@param z any
---@param dx any
---@param dz any
function ForestryRope:setPositionAndDirection(x, y, z, dx, dz) end

--- Stores the visibility flag and applies it to the reference frame if it exists.
---@param visibility any
function ForestryRope:setVisibility(visibility) end

--- Sets the rope emissive shader color to the valid color when valid is true, otherwise the invalid color. Does nothing if the rope shape is not loaded.
---@param valid any
function ForestryRope:setEmissiveColor(valid) end

--- Callback of the shared i3d load. Finds the rope shape by path, wraps it in a new reference frame linked under the link node, applies the emissive color, updates, then deletes the temporary i3d root.
---@param i3dNode any
---@param failedReason any
function ForestryRope:onI3DLoaded(i3dNode, failedReason) end
