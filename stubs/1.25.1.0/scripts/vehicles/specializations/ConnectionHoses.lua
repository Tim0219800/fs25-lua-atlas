---@meta
-- FS25 1.25.1.0 : vehicles/specializations/ConnectionHoses.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization (no prerequisites) that draws flexible connection hoses between a tractor and an attached tool, using a shader-driven spline on a hose mesh from `g_connectionHoseManager`. It handles hose and target nodes, skip nodes that bridge a hose across an intermediate tool, tool-to-tool connector hoses with delayed mounting, and custom hoses that just move a node onto a target. Hoses connect on attach and disconnect on detach, are updated only within `maxUpdateDistance`, and play connect and disconnect sounds. Purely visual and local: no network stream here. Some referenced items (`ConnectionHoses.DEFAULT_MAX_UPDATE_DISTANCE`, `registerAdditionalToolConnectionHoses`, the manager class) are not in the dump and are UNVERIFIED.
---@class ConnectionHoses
ConnectionHoses = {}

--- Always returns true: the specialization has no prerequisites.
---@param specializations any
function ConnectionHoses.prerequisitesPresent(specializations) end

--- Registers the XML schema: `vehicle.connectionHoses#maxUpdateDistance`, hose paths (also per configuration), connect and disconnect sounds, and extra moving tool and moving part attributes listing which hoses to update.
function ConnectionHoses.initSpecialization() end

--- Registers all hose-related XML paths under a base path: skip nodes, targets, tool connector hoses, hoses, local hoses, custom hoses and custom targets.
---@param schema any
---@param basePath any
function ConnectionHoses.registerConnectionHoseXMLPaths(schema, basePath) end

--- Registers the XML attributes of a hose target node: node, attacher joint indices or nodes, type, straightening, socket and adapter type, plus object changes.
---@param schema XMLSchema
---@param basePath string
function ConnectionHoses.registerHoseTargetNodesXMLPaths(schema, basePath) end

--- Registers the XML attributes of a hose: input joints, type, length, diameter, damping, sag and center point limits, materials, adapters and socket, plus object changes.
---@param schema any
---@param basePath any
function ConnectionHoses.registerHoseNodesXMLPaths(schema, basePath) end

--- Registers the XML attributes of a custom hose: node, free-form type, input and attacher joint indices or nodes, the permanent-update flag and object changes.
---@param schema any
---@param basePath any
function ConnectionHoses.registerCustomHoseNodesXMLPaths(schema, basePath) end

--- Registers the XML attributes of a custom hose target: node, type, input and attacher joint indices or nodes, plus object changes.
---@param schema any
---@param basePath any
function ConnectionHoses.registerCustomHoseTargetNodesXMLPaths(schema, basePath) end

--- Registers about thirty vehicle functions covering loading, target lookup, connect and disconnect, tool connections, skip nodes, custom hoses and `setConnectionHosesActive`.
---@param vehicleType any
function ConnectionHoses.registerFunctions(vehicleType) end

--- Overrides `loadExtraDependentParts` and `updateExtraDependentParts` so moving parts can refresh custom hoses, targets and local hoses.
---@param vehicleType any
function ConnectionHoses.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onPreLoad, onPostLoad, onLoadFinished, onDelete, onUpdateInterpolation, onUpdateEnd, onPostAttach and onPreDetach.
---@param vehicleType any
function ConnectionHoses.registerEventListeners(vehicleType) end

--- Initialises the spec tables for hoses, targets, skip nodes, custom hoses and tool connections, reads the configuration index and `maxUpdateDistance`.
---@param savegame any
function ConnectionHoses:onPreLoad(savegame) end

--- Loads hoses from the base key and the selected configuration, then calls `registerAdditionalToolConnectionHoses` (UNVERIFIED, not in dump). Loads connect and disconnect sounds on clients and removes the interpolation listener if there is nothing to update.
---@param savegame any
function ConnectionHoses:onPostLoad(savegame) end

--- Connects every local hose (hose and target on the same vehicle) without tool-connection checks.
---@param savegame any
function ConnectionHoses:onLoadFinished(savegame) end

--- Releases additional shared i3d files, deletes tool connection hose mounts and deletes the connect and disconnect sound samples.
function ConnectionHoses:onDelete() end

--- Within `maxUpdateDistance`, updates active hoses and permanently-updated custom hoses whose partner is in the same update loop, then asks attached implements to update their hoses toward this vehicle.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function ConnectionHoses:onUpdateInterpolation(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Runs one last hose update through `onUpdateInterpolation` before physics goes to sleep, when the update distance is 0.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function ConnectionHoses:onUpdateEnd(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Returns the connection hose configuration index; the default here is 1. Meant to be overridden by other specializations.
function ConnectionHoses:getConnectionHoseConfigIndex() end

--- Called by the attacher vehicle. Updates this vehicle's hoses and permanent custom hoses that are connected to that attacher vehicle.
---@param attacherVehicle any
function ConnectionHoses:updateAttachedConnectionHoses(attacherVehicle) end

--- Computes spline control points for a hose (sag from slack length, angle limits, offset clamps, smoothed velocity damping) and writes them to the shader parameters cv2, cv3 and cv4. Also draws debug lines in the attacher joints debug mode.
---@param hose any
---@param index any
function ConnectionHoses:updateConnectionHose(hose, index) end

--- Returns the two angles, in radians, at the hose's center point between the vertical and each half of the hose. The sum is compared with the minimum angle.
---@param node any
---@param cX any
---@param cY any
---@param cZ any
---@param eX any
---@param eY any
---@param eZ any
---@param useWorldSpace any
function ConnectionHoses:getCenterPointAngle(node, cX, cY, cZ, eX, eY, eZ, useWorldSpace) end

--- Returns a corrected center point (in node-local coordinates) lowered so that the hose reaches the minimum center angle, splitting the angle in proportion to the two measured angles.
---@param node any
---@param cX any
---@param cY any
---@param cZ any
---@param eX any
---@param eY any
---@param eZ any
---@param angle1 any
---@param angle2 any
---@param targetAngle any
---@param useWorldSpace any
function ConnectionHoses:getCenterPointAngleRegulation(node, cX, cY, cZ, eX, eY, eZ, angle1, angle2, targetAngle, useWorldSpace) end

--- Loads skip nodes, targets, tool connector hoses, hoses, local hoses, custom hoses and custom targets from a key and stores them in the spec tables, indexed by type and input joint.
---@param xmlFile any
---@param key any
function ConnectionHoses:loadConnectionHosesFromXML(xmlFile, key) end

--- Loads a skip node into `entry` (node, joint indices, type, length, object changes). Returns false with a warning if the node or type is missing.
---@param xmlFile any
---@param targetKey any
---@param entry any
function ConnectionHoses:loadHoseSkipNode(xmlFile, targetKey, entry) end

--- Loads a tool connector hose with its start and end targets, optionally re-aims the two target nodes at each other, hides the mounting node and counts connections by type. Returns false if a target is missing.
---@param xmlFile any
---@param targetKey any
---@param entry any
function ConnectionHoses:loadToolConnectorHoseNode(xmlFile, targetKey, entry) end

--- Loads all target nodes under a key into the spec and indexes them by type. Returns the index of the last added target, or nil if none was added.
---@param xmlFile any
---@param key any
function ConnectionHoses:addHoseTargetNodes(xmlFile, key) end

--- Loads custom hoses or custom targets, resolving joint indices from indices and nodes, and registers them per attacher and input attacher joint. Entries lacking node, type or joints are rejected with a warning.
---@param isHose any
---@param targetTable any
---@param attacherJointMapping any
---@param inputAttacherJointMapping any
---@param xmlFile any
---@param key any
function ConnectionHoses:loadCustomHosesFromXML(isHose, targetTable, attacherJointMapping, inputAttacherJointMapping, xmlFile, key) end

--- Loads one hose target into `entry` (node, joints, type, straightening, optional socket, adapter name, object changes). Returns false if node or type is missing.
---@param xmlFile any
---@param targetKey any
---@param entry any
function ConnectionHoses:loadHoseTargetNode(xmlFile, targetKey, entry) end

--- Loads one hose into `entry`: joints, type, geometry, damping and limits, materials and adapters. It clones the hose mesh from the manager and hides it. Returns false if the type, node or hose mesh cannot be found.
---@param xmlFile any
---@param hoseKey any
---@param entry any
---@param isBaseHose any
function ConnectionHoses:loadHoseNode(xmlFile, hoseKey, entry, isBaseHose) end

--- Builds a copy of a source hose placed on a skip node, using the skip node's length if given. Returns the new hose table, or false (with a warning) if no matching mesh exists.
---@param sourceHose any
---@param skipNode any
function ConnectionHoses:getClonedSkipHoseNode(sourceHose, skipNode) end

--- Finds the first free target for an attacher joint, type and spec type, then falls back to an available skip node. Returns the node and a bool telling whether it is a skip node, or nil.
---@param attacherJointIndex any
---@param type any
---@param specType any
---@param excludeToolConnections any
function ConnectionHoses:getConnectionTarget(attacherJointIndex, type, specType, excludeToolConnections) end

--- Same search as `getConnectionTarget`, but calls a callback for each free target and skip node until the callback returns false. Note: it returns early with nil if a tool connection target is excluded.
---@param func any
---@param attacherJointIndex any
---@param type any
---@param specType any
---@param excludeToolConnections any
function ConnectionHoses:iterateConnectionTargets(func, attacherJointIndex, type, specType, excludeToolConnections) end

--- Returns true if the target already has a connected object.
---@param desc any
function ConnectionHoses:getIsConnectionTargetUsed(desc) end

--- Returns true if the hose already has a connected object.
---@param desc any
function ConnectionHoses:getIsConnectionHoseUsed(desc) end

--- Returns true if the vehicle is attached on the skip node's input joint, the attacher vehicle has a free matching target, and the skip node has no parent hose yet.
---@param skipNode any
function ConnectionHoses:getIsSkipNodeAvailable(skipNode) end

--- Returns the list of hoses linked to an input attacher joint index, or an empty table.
---@param inputJointDescIndex any
function ConnectionHoses:getConnectionHosesByInputAttacherJoint(inputJointDescIndex) end

--- Connects a source hose to a target hose or node: sets links, clones the adapter, shows the hose, applies straightening and object changes, opens sockets, updates the spline and plays the connect sound. Tool connections may postpone the mounting. Returns true on connection.
---@param sourceHose any
---@param targetObject any
---@param targetHose any
---@param updateToolConnections any
function ConnectionHoses:connectHose(sourceHose, targetObject, targetHose, updateToolConnections) end

--- Disconnects a hose, recursively through skip node chains, removes its adapter, hides it, reverts object changes, closes sockets, drops it from the update list and plays the disconnect sound.
---@param hose any
function ConnectionHoses:disconnectHose(hose) end

--- Manages the hose between two tool targets. With visibility true and a delayed mounting waiting, it builds the linking hose meshes, shows the mounting node and connects the delayed hose. With false it tears them down. Returns true when a connection was made or no tool connector exists.
---@param sourceObject any
---@param sourceHose any
---@param targetObject any
---@param targetHose any
---@param visibility any
function ConnectionHoses:updateToolConnectionHose(sourceObject, sourceHose, targetObject, targetHose, visibility) end

--- Stores a hose as the delayed mounting of a tool connector, to be connected when the other end gets attached. If it was the first, asks the root vehicle to retry skip node connections.
---@param sourceObject any
---@param sourceHose any
---@param targetObject any
---@param targetHose any
function ConnectionHoses:addHoseToDelayedMountings(sourceObject, sourceHose, targetObject, targetHose) end

--- Connects a hose to a skip node and, if the attacher is itself attached further up, creates the cloned skip hose to the next vehicle (parent and child links, wash nodes). Adds the hose to the update list and returns true.
---@param sourceHose any
---@param targetObject any
---@param skipNode any
---@param childHose any
---@param childVehicle any
function ConnectionHoses:connectHoseToSkipNode(sourceHose, targetObject, skipNode, childHose, childVehicle) end

--- For each hose of the input joint, finds a matching free target or skip node on the attacher vehicle and connects it, then retries connections of other attached implements.
---@param attacherVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
---@param updateToolConnections any
---@param excludeVehicle any
function ConnectionHoses:connectHosesToAttacherVehicle(attacherVehicle, inputJointDescIndex, jointDescIndex, updateToolConnections, excludeVehicle) end

--- Asks all attached implements (except one excluded vehicle) to try to connect their hoses again, since a new skip node may now make a connection valid.
---@param updateToolConnections any
---@param excludeVehicle any
function ConnectionHoses:retryHoseSkipNodeConnections(updateToolConnections, excludeVehicle) end

--- Pairs inactive custom hoses with inactive custom targets of the attacher vehicle (both directions) when type and spec type match, and connects each pair.
---@param attacherVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
function ConnectionHoses:connectCustomHosesToAttacherVehicle(attacherVehicle, inputJointDescIndex, jointDescIndex) end

--- Moves the custom hose node onto its target, marks both active and linked, applies object changes and flags the moving tool as dirty.
---@param customHose any
---@param customTarget any
---@param targetObject any
function ConnectionHoses:connectCustomHoseNode(customHose, customTarget, targetObject) end

--- Copies the target node's position and rotation, expressed in the hose node's parent space, onto the custom hose node and flags the moving tool as dirty.
---@param customHose any
---@param customTarget any
function ConnectionHoses:updateCustomHoseNode(customHose, customTarget) end

--- Restores the custom hose node's initial translation and rotation, clears the links on both sides and reverts the object changes.
---@param customHose any
---@param customTarget any
function ConnectionHoses:disconnectCustomHoseNode(customHose, customTarget) end

--- Enables or disables the hoses. When the flag changes on an attached implement, it connects the hoses (normal and custom) or runs the detach logic to disconnect them.
---@param connectionHosesActive any
function ConnectionHoses:setConnectionHosesActive(connectionHosesActive) end

--- Override. After the parent succeeds, reads the optional lists of custom hose, custom target and local hose indices that a moving part must update.
---@param superFunc any
---@param xmlFile any
---@param baseName any
---@param entry any
function ConnectionHoses:loadExtraDependentParts(superFunc, xmlFile, baseName, entry) end

--- Override. After the parent, refreshes the active custom hoses, custom targets and local hoses listed for the moving part.
---@param superFunc any
---@param part any
---@param dt any
function ConnectionHoses:updateExtraDependentParts(superFunc, part, dt) end

--- After attaching, connects the hoses and custom hoses to the attacher vehicle if hoses are active.
---@param attacherVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
function ConnectionHoses:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

--- Before detaching, disconnects all hoses of the active input joint and of the attacher vehicle, clears pending delayed mountings on its tool connectors and disconnects custom hoses and targets.
---@param attacherVehicle any
---@param implement any
function ConnectionHoses:onPreDetach(attacherVehicle, implement) end

--- Debug console helper. Shows sockets, adapters, colored lines and labels for every target of the given attacher joint and applies its object changes, after clearing earlier debug elements.
---@param vehicle any
---@param attacherJointIndex any
function ConnectionHoses.consoleCommandTestSockets(vehicle, attacherJointIndex) end

--- Debug console helper. Clears earlier debug elements, then for the chosen tool connector hose shows colored lines and labels for start and end targets, makes the mounting node visible and applies its object changes.
---@param vehicle any
---@param toolConnectionIndex any
function ConnectionHoses.consoleCommandTestToolConnection(vehicle, toolConnectionIndex) end
