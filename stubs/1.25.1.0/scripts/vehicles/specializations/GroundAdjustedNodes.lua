---@meta
-- FS25 1.25.1.0 : vehicles/specializations/GroundAdjustedNodes.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization that moves nodes vertically so they follow the ground, for example the hoses of a slurry spreader. Raycasts from configured nodes measure the distance to the terrain (or water), and the adjust nodes are translated toward the result at a limited speed. It runs on the client and the server alike, only updates when the vehicle is near the player, and adds a small wobble while over a field. Configurable through the vehicle XML and a shop configuration.
---@class GroundAdjustedNodes
GroundAdjustedNodes = {}

--- Always returns true: the specialization has no prerequisite on other specializations.
---@param specializations any
function GroundAdjustedNodes.prerequisitesPresent(specializations) end

--- Registers the shop configuration type "groundAdjustedNode" and the XML schema paths under vehicle.groundAdjustedNodes (update distances, water adjustment, collision mask, attach-only flag). Also adds start/end ground adjust scale attributes to animation parts.
function GroundAdjustedNodes.initSpecialization() end

--- Registers the XML attributes of one groundAdjustedNode entry: activation time, Y offset and up to several raycast nodes. Also registers the adjust-node attributes, both directly on the entry (old style) and on its adjustNode children.
---@param schema any
---@param basePath any
function GroundAdjustedNodes.registerNodeXMLPaths(schema, basePath) end

--- Registers the XML attributes of an adjust node: node, minY and maxY limits, move speeds, reset-when-inactive, update threshold, inactive position and the averaged inactive height option.
---@param schema any
---@param basePath any
function GroundAdjustedNodes.registerAdjustNodeXMLPaths(schema, basePath) end

--- Registers the specialization's vehicle functions (XML loaders, init, activity check and the raycast and node update functions) on the vehicle type.
---@param vehicleType any
function GroundAdjustedNodes.registerFunctions(vehicleType) end

--- Subscribes the specialization to onLoad, onLoadFinished, onUpdate and onRegisterAnimationValueTypes.
---@param vehicleType any
function GroundAdjustedNodes.registerEventListeners(vehicleType) end

--- Reads the global settings and loads every groundAdjustedNode, both the base ones and those of the selected configuration. If none is valid, it removes the update, load-finished and animation listeners to save work.
---@param savegame any
function GroundAdjustedNodes:onLoad(savegame) end

--- Computes the initial active state of each node and, if active, applies the current adjusted height to nodes that differ noticeably from their i3d position. Flags moving tools as dirty when available.
---@param savegame any
function GroundAdjustedNodes:onLoadFinished(savegame) end

--- Each frame, if the vehicle is closer than maxUpdateDistance, runs the raycasts and then updates every ground adjusted node. Nothing happens when the vehicle is farther away.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function GroundAdjustedNodes:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads one groundAdjustedNode: activation time, adjust nodes (including the legacy single-node form) and raycast nodes, with a limit of two raycast nodes. Returns true only if at least one raycast node and one adjust node exist, otherwise logs a warning.
---@param xmlFile any
---@param key any
---@param groundAdjustedNode any
function GroundAdjustedNodes:loadGroundAdjustedNodeFromXML(xmlFile, key, groundAdjustedNode) end

--- Loads a raycast node (node, distance, Y offset) and builds its raycast callback, which ignores triggers and stores the hit distance. Reuses an existing entry when the same node has identical settings, and rejects conflicting duplicates. Returns nil on error.
---@param xmlFile any
---@param key any
---@param groundAdjustedNode any
---@param raycastNode any
function GroundAdjustedNodes:loadGroundAdjustedRaycastNodeFromXML(xmlFile, key, groundAdjustedNode, raycastNode) end

--- Loads one adjust node: stores its current translation, Y limits, move speeds (converted to per millisecond) and inactive height. Returns false if the node is missing, with a warning only when it is required.
---@param xmlFile any
---@param key any
---@param groundAdjustedNode any
---@param adjustNode any
---@param required any
function GroundAdjustedNodes:loadGroundAdjustedAdjustNodeFromXML(xmlFile, key, groundAdjustedNode, adjustNode, required) end

--- When two raycast nodes are used, computes the adjust node's relative position between them (alpha) so the two measured heights can be interpolated. Does nothing with a single raycast node.
---@param groundAdjustedNode any
---@param adjustNode any
function GroundAdjustedNodes:initGroundAdjustedAdjustNode(groundAdjustedNode, adjustNode) end

--- For each active raycast node, checks whether the spot is on a field via the terrain detail density map. Off a field (or with water adjustment) it raycasts downward, otherwise it uses the terrain height. Stores the resulting distance to the ground.
---@param dt any
function GroundAdjustedNodes:updateGroundAdjustedRaycasts(dt) end

--- Updates the active state and each adjust node's target height: from the measured ground distance, plus a noise wobble on fields, clamped to minY and maxY and blended with the inactive position by the active scale. Then moves the node toward it at the configured speed.
---@param groundAdjustedNode any
---@param dt any
function GroundAdjustedNodes:updateGroundAdjustedNode(groundAdjustedNode, dt) end

--- Returns whether ground adjustment is allowed: always when the onlyActiveWhileAttached option is off, or when the vehicle is attached to another vehicle, or when the attach check is ignored.
---@param groundAdjustedNode any
---@param ignoreAttachState any
function GroundAdjustedNodes:getIsGroundAdjustedNodeActive(groundAdjustedNode, ignoreAttachState) end

--- Registers the animation value type "groundAdjustScale", which lets an animation drive the active scale of the ground adjusted node owning a given node. Warns and returns 0 if no matching groundAdjustedNode is found.
function GroundAdjustedNodes:onRegisterAnimationValueTypes() end
