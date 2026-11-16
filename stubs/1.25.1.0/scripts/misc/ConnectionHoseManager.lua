---@meta
-- FS25 1.25.1.0 : misc/ConnectionHoseManager.lua (generated stub, FS25 Lua Atlas)

--- Map-bound manager (extends AbstractManager) for the visual hoses, adapters and sockets that join vehicles to implements. It loads ConnectionHoseManager.DEFAULT_HOSES_FILENAME (defined outside this file, UNVERIFIED) plus mod hose xmls, loads their i3d files asynchronously, and keeps basic hoses, per-type adapters and materials, and sockets, all keyed by upper-cased names. It hands out cloned nodes for vehicles. It also assigns the global ConnectionHoseType to its type table.
---@class ConnectionHoseManager : AbstractManager
ConnectionHoseManager = {}

--- Creates the manager, calls initDataStructures and builds the connectionHoses XML schema, stored on the class table.
---@param customMt any
---@return table
function ConnectionHoseManager.new(customMt) end

--- Resets xml files, types by name, basic hoses, sockets, shared load request ids and pending mod hoses. Also assigns the typeByName table to the global ConnectionHoseType.
function ConnectionHoseManager:initDataStructures() end

--- Calls the parent, stores the base directory, loads the default hoses xml and then each queued mod hose xml with its custom environment, emptying the queue.
---@param xmlFile any
---@param missionInfo any
---@param baseDirectory any
---@return boolean
function ConnectionHoseManager:loadMapData(xmlFile, missionInfo, baseDirectory) end

--- Deletes every basic hose, adapter, detached adapter, hose material and socket node, releases the shared i3d requests, deletes the remaining xml files, then calls the parent.
---@return boolean
function ConnectionHoseManager:unloadMapData() end

--- Queues a mod's connection hose xml (filename, custom environment, base directory) to be loaded in loadMapData.
---@param xmlFilename string
---@param customEnvironment string
---@param baseDirectory string
function ConnectionHoseManager:addModConnectionHoses(xmlFilename, customEnvironment, baseDirectory) end

--- Loads one hose xml: starts async shared i3d loads for each basic hose, for each adapter and material of every hose type, and for each socket. Names of mod types, adapters, materials and sockets are prefixed with the custom environment. The xml file is reference-counted and deleted after the last callback.
---@param xmlFilename string
---@param customEnvironment string
---@param baseDirectory string
function ConnectionHoseManager:loadConnectionHosesFromXML(xmlFilename, customEnvironment, baseDirectory) end

--- Async callback for a basic hose i3d: unlinks the node, reads straightening values and minCenterPointAngle, and stores it only if length, realLength and diameter are all defined (warns otherwise). Deletes the i3d root and releases the xml reference.
---@param i3dNode string
---@param failedReason any
---@param args any
function ConnectionHoseManager:basicHoseI3DFileLoaded(i3dNode, failedReason, args) end

--- Async callback for an adapter i3d: unlinks the adapter node and optional detached node, and registers the adapter under its upper-cased name in the hose type if its first child (the hose reference node) exists; warns otherwise.
---@param i3dNode string
---@param failedReason any
---@param args any
function ConnectionHoseManager:adapterI3DFileLoaded(i3dNode, failedReason, args) end

--- Async callback for a hose material i3d: unlinks the material node and stores it with uvMinMax, uvLengthScale, uvRandomOffset and optional materialTemplateName in the hose type's hoses table.
---@param i3dNode string
---@param failedReason any
---@param args any
function ConnectionHoseManager:materialI3DFileLoaded(i3dNode, failedReason, args) end

--- Async callback for a socket i3d: unlinks the socket node, reads its reference node and cap definitions (opened and closed rotation and visibility), and stores it by upper-cased name; an already existing name logs an xml error.
---@param i3dNode string
---@param failedReason any
---@param args any
function ConnectionHoseManager:socketI3DFileLoaded(i3dNode, failedReason, args) end

--- Returns the hose type for a name, trying the custom-environment-prefixed name first, then the plain name, case-insensitive. Nil if the name is nil or unknown.
---@param typeName any
---@param customEnvironment any
function ConnectionHoseManager:getHoseTypeByName(typeName, customEnvironment) end

--- Returns an adapter entry of a hose type by name, preferring the custom-environment-prefixed name; nil when the type or name is nil or unknown.
---@param hoseType any
---@param adapterName any
---@param customEnvironment any
function ConnectionHoseManager:getHoseAdapterByName(hoseType, adapterName, customEnvironment) end

--- Returns a hose material entry of a hose type by name, preferring the custom-environment-prefixed name; nil when not found.
---@param hoseType any
---@param materialName any
---@param customEnvironment any
function ConnectionHoseManager:getHoseMaterialByName(hoseType, materialName, customEnvironment) end

--- Returns a socket entry by name, preferring the custom-environment-prefixed name; nil when the name is nil or unknown.
---@param socketName any
---@param customEnvironment any
function ConnectionHoseManager:getSocketByName(socketName, customEnvironment) end

--- Clones an adapter node (or its detached node when detached is true) with position and rotation reset to zero. Returns the clone and its hose reference node, or only the detached clone; nil if the type, adapter or detached node is missing.
---@param typeName any
---@param adapterName any
---@param customEnvironment any
---@param detached any
function ConnectionHoseManager:getClonedAdapterNode(typeName, adapterName, customEnvironment, detached) end

--- Clones the closest basic hose for a length and diameter and applies the hose material, optional template and optional vehicle material, then sets length, diameter and UV shader parameters (with random UV offset). Returns the node plus start straightening, end straightening and minimum centre angle; four nils on failure.
---@param typeName any
---@param hoseName any
---@param length any
---@param diameter any
---@param vehicleMaterial any
---@param customEnvironment any
function ConnectionHoseManager:getClonedHoseNode(typeName, hoseName, length, diameter, vehicleMaterial, customEnvironment) end

--- Picks the basic hose with the closest diameter and, among those, the closest length, and returns a clone with realLength, straightening values, minimum centre angle and the chosen diameter. Nil if there are no basic hoses.
---@param length any
---@param diameter any
function ConnectionHoseManager:getClonedBasicHose(length, diameter) end

--- Clones a socket (with its caps), optionally applies a socket material to the material named connector_color_mat, links it to the given node at zero offset and closes it. Returns the linked socket table, or nil if the socket or node is missing.
---@param socketName any
---@param node any
---@param customEnvironment any
---@param socketMaterial any
function ConnectionHoseManager:linkSocketToNode(socketName, node, customEnvironment, socketMaterial) end

--- Returns the socket's reference node if it has one, otherwise the given default target.
---@param socket any
---@param defaultTarget any
function ConnectionHoseManager:getSocketTarget(socket, defaultTarget) end

--- Applies the opened rotation (if defined) and opened visibility to each cap of the socket; does nothing for a nil socket or one without caps.
---@param socket any
function ConnectionHoseManager:openSocket(socket) end

--- Applies the closed rotation and closed visibility to each cap. Note: the rotation is only applied when openedRotation is defined, yet closedRotation is the value used, which looks like a mismatch.
---@param socket any
function ConnectionHoseManager:closeSocket(socket) end

--- Registers the schema paths for connectionHoses: basic hoses (node, straightening, lengths, diameter), hose types with adapters and materials (UV settings, material template) and sockets with caps.
---@param schema any
function ConnectionHoseManager:registerXMLPaths(schema) end
