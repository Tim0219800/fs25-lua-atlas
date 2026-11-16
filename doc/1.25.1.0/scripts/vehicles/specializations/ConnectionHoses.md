# vehicles/specializations/ConnectionHoses.lua

*[Version française](../../../fr/scripts/vehicles/specializations/ConnectionHoses.md)*

Source: `dataS/scripts/vehicles/specializations/ConnectionHoses.lua` — FS25 1.25.1.0

✍ Vehicle specialization (no prerequisites) that draws flexible connection hoses between a tractor and an attached tool, using a shader-driven spline on a hose mesh from `g_connectionHoseManager`. It handles hose and target nodes, skip nodes that bridge a hose across an intermediate tool, tool-to-tool connector hoses with delayed mounting, and custom hoses that just move a node onto a target. Hoses connect on attach and disconnect on detach, are updated only within `maxUpdateDistance`, and play connect and disconnect sounds. Purely visual and local: no network stream here. Some referenced items (`ConnectionHoses.DEFAULT_MAX_UPDATE_DISTANCE`, `registerAdditionalToolConnectionHoses`, the manager class) are not in the dump and are UNVERIFIED.

- **ConnectionHoses** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `ConnectionHoses.prerequisitesPresent(specializations: any)` | 19 | ✍ Always returns true: the specialization has no prerequisites. |
| `ConnectionHoses.initSpecialization()` | 25 | ✍ Registers the XML schema: `vehicle.connectionHoses#maxUpdateDistance`, hose paths (also per configuration), connect and disconnect sounds, and extra moving tool and moving part attributes listing which hoses to update. |
| `ConnectionHoses.registerConnectionHoseXMLPaths(schema: any, basePath: any)` | 57 | ✍ Registers all hose-related XML paths under a base path: skip nodes, targets, tool connector hoses, hoses, local hoses, custom hoses and custom targets. |
| `ConnectionHoses.registerHoseTargetNodesXMLPaths(schema: XMLSchema, basePath: string)` | 90 | ✍ Registers the XML attributes of a hose target node: node, attacher joint indices or nodes, type, straightening, socket and adapter type, plus object changes. |
| `ConnectionHoses.registerHoseNodesXMLPaths(schema: any, basePath: any)` | 111 | ✍ Registers the XML attributes of a hose: input joints, type, length, diameter, damping, sag and center point limits, materials, adapters and socket, plus object changes. |
| `ConnectionHoses.registerCustomHoseNodesXMLPaths(schema: any, basePath: any)` | 149 | ✍ Registers the XML attributes of a custom hose: node, free-form type, input and attacher joint indices or nodes, the permanent-update flag and object changes. |
| `ConnectionHoses.registerCustomHoseTargetNodesXMLPaths(schema: any, basePath: any)` | 163 | ✍ Registers the XML attributes of a custom hose target: node, type, input and attacher joint indices or nodes, plus object changes. |
| `ConnectionHoses.registerFunctions(vehicleType: any)` | 176 | ✍ Registers about thirty vehicle functions covering loading, target lookup, connect and disconnect, tool connections, skip nodes, custom hoses and `setConnectionHosesActive`. |
| `ConnectionHoses.registerOverwrittenFunctions(vehicleType: any)` | 212 | ✍ Overrides `loadExtraDependentParts` and `updateExtraDependentParts` so moving parts can refresh custom hoses, targets and local hoses. |
| `ConnectionHoses.registerEventListeners(vehicleType: any)` | 219 | ✍ Subscribes to onPreLoad, onPostLoad, onLoadFinished, onDelete, onUpdateInterpolation, onUpdateEnd, onPostAttach and onPreDetach. |
| `ConnectionHoses:onPreLoad(savegame: any)` | 232 | ✍ Initialises the spec tables for hoses, targets, skip nodes, custom hoses and tool connections, reads the configuration index and `maxUpdateDistance`. |
| `ConnectionHoses:onPostLoad(savegame: any)` | 272 | ✍ Loads hoses from the base key and the selected configuration, then calls `registerAdditionalToolConnectionHoses` (UNVERIFIED, not in dump). Loads connect and disconnect sounds on clients and removes the interpolation listener if there is nothing to update. |
| `ConnectionHoses:onLoadFinished(savegame: any)` | 341 | ✍ Connects every local hose (hose and target on the same vehicle) without tool-connection checks. |
| `ConnectionHoses:onDelete()` | 352 | ✍ Releases additional shared i3d files, deletes tool connection hose mounts and deletes the connect and disconnect sound samples. |
| `ConnectionHoses:onUpdateInterpolation(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 380 | ✍ Within `maxUpdateDistance`, updates active hoses and permanently-updated custom hoses whose partner is in the same update loop, then asks attached implements to update their hoses toward this vehicle. |
| `ConnectionHoses:onUpdateEnd(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 412 | ✍ Runs one last hose update through `onUpdateInterpolation` before physics goes to sleep, when the update distance is 0. |
| `ConnectionHoses:getConnectionHoseConfigIndex()` | 419 | ✍ Returns the connection hose configuration index; the default here is 1. Meant to be overridden by other specializations. |
| `ConnectionHoses:updateAttachedConnectionHoses(attacherVehicle: any)` | 425 | ✍ Called by the attacher vehicle. Updates this vehicle's hoses and permanent custom hoses that are connected to that attacher vehicle. |
| `ConnectionHoses:updateConnectionHose(hose: any, index: any)` | 449 | ✍ Computes spline control points for a hose (sag from slack length, angle limits, offset clamps, smoothed velocity damping) and writes them to the shader parameters cv2, cv3 and cv4. Also draws debug lines in the attacher joints debug mode. |
| `ConnectionHoses:getCenterPointAngle(node: any, cX: any, cY: any, cZ: any, eX: any, eY: any, eZ: any, useWorldSpace: any)` | 635 | ✍ Returns the two angles, in radians, at the hose's center point between the vertical and each half of the hose. The sum is compared with the minimum angle. |
| `ConnectionHoses:getCenterPointAngleRegulation(node: any, cX: any, cY: any, cZ: any, eX: any, eY: any, eZ: any, angle1: any, angle2: any, targetAngle: any, useWorldSpace: any)` | 658 | ✍ Returns a corrected center point (in node-local coordinates) lowered so that the hose reaches the minimum center angle, splitting the angle in proportion to the two measured angles. |
| `ConnectionHoses:loadConnectionHosesFromXML(xmlFile: any, key: any)` | 688 | ✍ Loads skip nodes, targets, tool connector hoses, hoses, local hoses, custom hoses and custom targets from a key and stores them in the spec tables, indexed by type and input joint. |
| `ConnectionHoses:loadHoseSkipNode(xmlFile: any, targetKey: any, entry: any)` | 750 | ✍ Loads a skip node into `entry` (node, joint indices, type, length, object changes). Returns false with a warning if the node or type is missing. |
| `ConnectionHoses:loadToolConnectorHoseNode(xmlFile: any, targetKey: any, entry: any)` | 784 | ✍ Loads a tool connector hose with its start and end targets, optionally re-aims the two target nodes at each other, hides the mounting node and counts connections by type. Returns false if a target is missing. |
| `ConnectionHoses:addHoseTargetNodes(xmlFile: any, key: any)` | 853 | ✍ Loads all target nodes under a key into the spec and indexes them by type. Returns the index of the last added target, or nil if none was added. |
| `ConnectionHoses:loadCustomHosesFromXML(isHose: any, targetTable: any, attacherJointMapping: any, inputAttacherJointMapping: any, xmlFile: any, key: any)` | 882 | ✍ Loads custom hoses or custom targets, resolving joint indices from indices and nodes, and registers them per attacher and input attacher joint. Entries lacking node, type or joints are rejected with a warning. |
| `ConnectionHoses:loadHoseTargetNode(xmlFile: any, targetKey: any, entry: any)` | 983 | ✍ Loads one hose target into `entry` (node, joints, type, straightening, optional socket, adapter name, object changes). Returns false if node or type is missing. |
| `ConnectionHoses:loadHoseNode(xmlFile: any, hoseKey: any, entry: any, isBaseHose: any)` | 1047 | ✍ Loads one hose into `entry`: joints, type, geometry, damping and limits, materials and adapters. It clones the hose mesh from the manager and hides it. Returns false if the type, node or hose mesh cannot be found. |
| `ConnectionHoses:getClonedSkipHoseNode(sourceHose: any, skipNode: any)` | 1221 | ✍ Builds a copy of a source hose placed on a skip node, using the skip node's length if given. Returns the new hose table, or false (with a warning) if no matching mesh exists. |
| `ConnectionHoses:getConnectionTarget(attacherJointIndex: any, type: any, specType: any, excludeToolConnections: any)` | 1275 | ✍ Finds the first free target for an attacher joint, type and spec type, then falls back to an available skip node. Returns the node and a bool telling whether it is a skip node, or nil. |
| `ConnectionHoses:iterateConnectionTargets(func: any, attacherJointIndex: any, type: any, specType: any, excludeToolConnections: any)` | 1317 | ✍ Same search as `getConnectionTarget`, but calls a callback for each free target and skip node until the callback returns false. Note: it returns early with nil if a tool connection target is excluded. |
| `ConnectionHoses:getIsConnectionTargetUsed(desc: any)` | 1363 | ✍ Returns true if the target already has a connected object. |
| `ConnectionHoses:getIsConnectionHoseUsed(desc: any)` | 1369 | ✍ Returns true if the hose already has a connected object. |
| `ConnectionHoses:getIsSkipNodeAvailable(skipNode: any)` | 1375 | ✍ Returns true if the vehicle is attached on the skip node's input joint, the attacher vehicle has a free matching target, and the skip node has no parent hose yet. |
| `ConnectionHoses:getConnectionHosesByInputAttacherJoint(inputJointDescIndex: any)` | 1395 | ✍ Returns the list of hoses linked to an input attacher joint index, or an empty table. |
| `ConnectionHoses:connectHose(sourceHose: any, targetObject: any, targetHose: any, updateToolConnections: any)` | 1407 | ✍ Connects a source hose to a target hose or node: sets links, clones the adapter, shows the hose, applies straightening and object changes, opens sockets, updates the spline and plays the connect sound. Tool connections may postpone the mounting. Returns true on connection. |
| `ConnectionHoses:disconnectHose(hose: any)` | 1498 | ✍ Disconnects a hose, recursively through skip node chains, removes its adapter, hides it, reverts object changes, closes sockets, drops it from the update list and plays the disconnect sound. |
| `ConnectionHoses:updateToolConnectionHose(sourceObject: any, sourceHose: any, targetObject: any, targetHose: any, visibility: any)` | 1558 | ✍ Manages the hose between two tool targets. With visibility true and a delayed mounting waiting, it builds the linking hose meshes, shows the mounting node and connects the delayed hose. With false it tears them down. Returns true when a connection was made or no tool connector exists. |
| `ConnectionHoses:addHoseToDelayedMountings(sourceObject: any, sourceHose: any, targetObject: any, targetHose: any)` | 1752 | ✍ Stores a hose as the delayed mounting of a tool connector, to be connected when the other end gets attached. If it was the first, asks the root vehicle to retry skip node connections. |
| `ConnectionHoses:connectHoseToSkipNode(sourceHose: any, targetObject: any, skipNode: any, childHose: any, childVehicle: any)` | 1768 | ✍ Connects a hose to a skip node and, if the attacher is itself attached further up, creates the cloned skip hose to the next vehicle (parent and child links, wash nodes). Adds the hose to the update list and returns true. |
| `ConnectionHoses:connectHosesToAttacherVehicle(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any, updateToolConnections: any, excludeVehicle: any)` | 1843 | ✍ For each hose of the input joint, finds a matching free target or skip node on the attacher vehicle and connects it, then retries connections of other attached implements. |
| `ConnectionHoses:retryHoseSkipNodeConnections(updateToolConnections: any, excludeVehicle: any)` | 1874 | ✍ Asks all attached implements (except one excluded vehicle) to try to connect their hoses again, since a new skip node may now make a connection valid. |
| `ConnectionHoses:connectCustomHosesToAttacherVehicle(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 1890 | ✍ Pairs inactive custom hoses with inactive custom targets of the attacher vehicle (both directions) when type and spec type match, and connects each pair. |
| `ConnectionHoses:connectCustomHoseNode(customHose: any, customTarget: any, targetObject: any)` | 1941 | ✍ Moves the custom hose node onto its target, marks both active and linked, applies object changes and flags the moving tool as dirty. |
| `ConnectionHoses:updateCustomHoseNode(customHose: any, customTarget: any)` | 1962 | ✍ Copies the target node's position and rotation, expressed in the hose node's parent space, onto the custom hose node and flags the moving tool as dirty. |
| `ConnectionHoses:disconnectCustomHoseNode(customHose: any, customTarget: any)` | 1973 | ✍ Restores the custom hose node's initial translation and rotation, clears the links on both sides and reverts the object changes. |
| `ConnectionHoses:setConnectionHosesActive(connectionHosesActive: any)` | 1995 | ✍ Enables or disables the hoses. When the flag changes on an attached implement, it connects the hoses (normal and custom) or runs the detach logic to disconnect them. |
| `ConnectionHoses:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 2018 | ✍ Override. After the parent succeeds, reads the optional lists of custom hose, custom target and local hose indices that a moving part must update. |
| `ConnectionHoses:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 2043 | ✍ Override. After the parent, refreshes the active custom hoses, custom targets and local hoses listed for the moving part. |
| `ConnectionHoses:onPostAttach(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 2082 | ✍ After attaching, connects the hoses and custom hoses to the attacher vehicle if hoses are active. |
| `ConnectionHoses:onPreDetach(attacherVehicle: any, implement: any)` | 2091 | ✍ Before detaching, disconnects all hoses of the active input joint and of the attacher vehicle, clears pending delayed mountings on its tool connectors and disconnects custom hoses and targets. |
| `ConnectionHoses.consoleCommandTestSockets(vehicle: any, attacherJointIndex: any)` | 2279 | ✍ Debug console helper. Shows sockets, adapters, colored lines and labels for every target of the given attacher joint and applies its object changes, after clearing earlier debug elements. |
| `ConnectionHoses.consoleCommandTestToolConnection(vehicle: any, toolConnectionIndex: any)` | 2369 | ✍ Debug console helper. Clears earlier debug elements, then for the chosen tool connector hose shows colored lines and labels for start and end targets, makes the mounting node visible and applies its object changes. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getConnectionHoseConfigIndex` | 177 |
| registerFunction | `updateAttachedConnectionHoses` | 178 |
| registerFunction | `updateConnectionHose` | 179 |
| registerFunction | `getCenterPointAngle` | 180 |
| registerFunction | `getCenterPointAngleRegulation` | 181 |
| registerFunction | `loadConnectionHosesFromXML` | 182 |
| registerFunction | `loadHoseSkipNode` | 183 |
| registerFunction | `loadToolConnectorHoseNode` | 184 |
| registerFunction | `addHoseTargetNodes` | 185 |
| registerFunction | `loadCustomHosesFromXML` | 186 |
| registerFunction | `loadHoseTargetNode` | 187 |
| registerFunction | `loadHoseNode` | 188 |
| registerFunction | `getClonedSkipHoseNode` | 189 |
| registerFunction | `getConnectionTarget` | 190 |
| registerFunction | `iterateConnectionTargets` | 191 |
| registerFunction | `getIsConnectionTargetUsed` | 192 |
| registerFunction | `getIsConnectionHoseUsed` | 193 |
| registerFunction | `getIsSkipNodeAvailable` | 194 |
| registerFunction | `getConnectionHosesByInputAttacherJoint` | 195 |
| registerFunction | `connectHose` | 196 |
| registerFunction | `disconnectHose` | 197 |
| registerFunction | `updateToolConnectionHose` | 198 |
| registerFunction | `addHoseToDelayedMountings` | 199 |
| registerFunction | `connectHoseToSkipNode` | 200 |
| registerFunction | `connectHosesToAttacherVehicle` | 201 |
| registerFunction | `retryHoseSkipNodeConnections` | 202 |
| registerFunction | `connectCustomHosesToAttacherVehicle` | 203 |
| registerFunction | `connectCustomHoseNode` | 204 |
| registerFunction | `updateCustomHoseNode` | 205 |
| registerFunction | `disconnectCustomHoseNode` | 206 |
| registerFunction | `setConnectionHosesActive` | 207 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 213 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 214 |
| registerEventListener | `onPreLoad` | 220 |
| registerEventListener | `onPostLoad` | 221 |
| registerEventListener | `onLoadFinished` | 222 |
| registerEventListener | `onDelete` | 223 |
| registerEventListener | `onUpdateInterpolation` | 224 |
| registerEventListener | `onUpdateEnd` | 225 |
| registerEventListener | `onPostAttach` | 226 |
| registerEventListener | `onPreDetach` | 227 |
