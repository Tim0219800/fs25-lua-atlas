# misc/ConnectionHoseManager.lua

*[Version française](../../fr/scripts/misc/ConnectionHoseManager.md)*

Source: `dataS/scripts/misc/ConnectionHoseManager.lua` — FS25 1.25.1.0

✍ Map-bound manager (extends AbstractManager) for the visual hoses, adapters and sockets that join vehicles to implements. It loads ConnectionHoseManager.DEFAULT_HOSES_FILENAME (defined outside this file, UNVERIFIED) plus mod hose xmls, loads their i3d files asynchronously, and keeps basic hoses, per-type adapters and materials, and sockets, all keyed by upper-cased names. It hands out cloned nodes for vehicles. It also assigns the global ConnectionHoseType to its type table.

- **ConnectionHoseManager** inherits from `AbstractManager` (l.17)

## Functions

| Function | Line | Description |
|---|---|---|
| `ConnectionHoseManager.new(customMt: any) → table` | 22 | ✍ Creates the manager, calls initDataStructures and builds the connectionHoses XML schema, stored on the class table. |
| `ConnectionHoseManager:initDataStructures()` | 35 | ✍ Resets xml files, types by name, basic hoses, sockets, shared load request ids and pending mod hoses. Also assigns the typeByName table to the global ConnectionHoseType. |
| `ConnectionHoseManager:loadMapData(xmlFile: any, missionInfo: any, baseDirectory: any) → boolean` | 48 | ✍ Calls the parent, stores the base directory, loads the default hoses xml and then each queued mod hose xml with its custom environment, emptying the queue. |
| `ConnectionHoseManager:unloadMapData() → boolean` | 63 | ✍ Deletes every basic hose, adapter, detached adapter, hose material and socket node, releases the shared i3d requests, deletes the remaining xml files, then calls the parent. |
| `ConnectionHoseManager:addModConnectionHoses(xmlFilename: string, customEnvironment: string, baseDirectory: string)` | 100 | ✍ Queues a mod's connection hose xml (filename, custom environment, base directory) to be loaded in loadMapData. |
| `ConnectionHoseManager:loadConnectionHosesFromXML(xmlFilename: string, customEnvironment: string, baseDirectory: string)` | 111 | ✍ Loads one hose xml: starts async shared i3d loads for each basic hose, for each adapter and material of every hose type, and for each socket. Names of mod types, adapters, materials and sockets are prefixed with the custom environment. The xml file is reference-counted and deleted after the last callback. |
| `ConnectionHoseManager:basicHoseI3DFileLoaded(i3dNode: string, failedReason: any, args: any)` | 270 | ✍ Async callback for a basic hose i3d: unlinks the node, reads straightening values and minCenterPointAngle, and stores it only if length, realLength and diameter are all defined (warns otherwise). Deletes the i3d root and releases the xml reference. |
| `ConnectionHoseManager:adapterI3DFileLoaded(i3dNode: string, failedReason: any, args: any)` | 320 | ✍ Async callback for an adapter i3d: unlinks the adapter node and optional detached node, and registers the adapter under its upper-cased name in the hose type if its first child (the hose reference node) exists; warns otherwise. |
| `ConnectionHoseManager:materialI3DFileLoaded(i3dNode: string, failedReason: any, args: any)` | 359 | ✍ Async callback for a hose material i3d: unlinks the material node and stores it with uvMinMax, uvLengthScale, uvRandomOffset and optional materialTemplateName in the hose type's hoses table. |
| `ConnectionHoseManager:socketI3DFileLoaded(i3dNode: string, failedReason: any, args: any)` | 393 | ✍ Async callback for a socket i3d: unlinks the socket node, reads its reference node and cap definitions (opened and closed rotation and visibility), and stores it by upper-cased name; an already existing name logs an xml error. |
| `ConnectionHoseManager:getHoseTypeByName(typeName: any, customEnvironment: any)` | 450 | ✍ Returns the hose type for a name, trying the custom-environment-prefixed name first, then the plain name, case-insensitive. Nil if the name is nil or unknown. |
| `ConnectionHoseManager:getHoseAdapterByName(hoseType: any, adapterName: any, customEnvironment: any)` | 467 | ✍ Returns an adapter entry of a hose type by name, preferring the custom-environment-prefixed name; nil when the type or name is nil or unknown. |
| `ConnectionHoseManager:getHoseMaterialByName(hoseType: any, materialName: any, customEnvironment: any)` | 484 | ✍ Returns a hose material entry of a hose type by name, preferring the custom-environment-prefixed name; nil when not found. |
| `ConnectionHoseManager:getSocketByName(socketName: any, customEnvironment: any)` | 501 | ✍ Returns a socket entry by name, preferring the custom-environment-prefixed name; nil when the name is nil or unknown. |
| `ConnectionHoseManager:getClonedAdapterNode(typeName: any, adapterName: any, customEnvironment: any, detached: any)` | 518 | ✍ Clones an adapter node (or its detached node when detached is true) with position and rotation reset to zero. Returns the clone and its hose reference node, or only the detached clone; nil if the type, adapter or detached node is missing. |
| `ConnectionHoseManager:getClonedHoseNode(typeName: any, hoseName: any, length: any, diameter: any, vehicleMaterial: any, customEnvironment: any)` | 546 | ✍ Clones the closest basic hose for a length and diameter and applies the hose material, optional template and optional vehicle material, then sets length, diameter and UV shader parameters (with random UV offset). Returns the node plus start straightening, end straightening and minimum centre angle; four nils on failure. |
| `ConnectionHoseManager:getClonedBasicHose(length: any, diameter: any)` | 594 | ✍ Picks the basic hose with the closest diameter and, among those, the closest length, and returns a clone with realLength, straightening values, minimum centre angle and the chosen diameter. Nil if there are no basic hoses. |
| `ConnectionHoseManager:linkSocketToNode(socketName: any, node: any, customEnvironment: any, socketMaterial: any)` | 635 | ✍ Clones a socket (with its caps), optionally applies a socket material to the material named connector_color_mat, links it to the given node at zero offset and closes it. Returns the linked socket table, or nil if the socket or node is missing. |
| `ConnectionHoseManager:getSocketTarget(socket: any, defaultTarget: any)` | 671 | ✍ Returns the socket's reference node if it has one, otherwise the given default target. |
| `ConnectionHoseManager:openSocket(socket: any)` | 683 | ✍ Applies the opened rotation (if defined) and opened visibility to each cap of the socket; does nothing for a nil socket or one without caps. |
| `ConnectionHoseManager:closeSocket(socket: any)` | 698 | ✍ Applies the closed rotation and closed visibility to each cap. Note: the rotation is only applied when openedRotation is defined, yet closedRotation is the value used, which looks like a mismatch. |
| `ConnectionHoseManager:registerXMLPaths(schema: any)` | 713 | ✍ Registers the schema paths for connectionHoses: basic hoses (node, straightening, lengths, diameter), hose types with adapters and materials (UV settings, material template) and sockets with caps. |
