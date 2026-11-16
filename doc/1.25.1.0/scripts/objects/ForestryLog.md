# objects/ForestryLog.lua

*[Version française](../../fr/scripts/objects/ForestryLog.md)*

Source: `dataS/scripts/objects/ForestryLog.lua` — FS25 1.25.1.0

✍ A felled tree log as an item the player can handle. It extends MountableObject, loads a random child of an i3d file (log variant) asynchronously, registers itself in the item system and as an AI obstacle while free, and is saved and loaded from the savegame XML with uniqueId, filename, position, rotation and farmId. Mounting hides it from the item system and AI.

- **ForestryLog** inherits from `MountableObject` (l.5)

## Functions

| Function | Line | Description |
|---|---|---|
| `ForestryLog.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 31 | ✍ Constructor. Calls the MountableObject constructor, registers the class name ForestryLog and sets uniqueId to nil. Returns the instance. |
| `ForestryLog:delete()` | 43 | ✍ Releases the shared i3d request, removes the AI obstacle, unregisters the class name, removes the log from the item system and calls the parent delete. |
| `ForestryLog:readStream(streamId: integer, connection: table)` | 60 | ✍ On join, reads the i3d filename and loads the log if it has no node yet. The connection is not checked and no parent readStream is called. |
| `ForestryLog:writeStream(streamId: integer, connection: table)` | 71 | ✍ Writes the i3d filename in network form. No parent writeStream is called. |
| `ForestryLog:loadFromFilename(i3dFilename: string, x: number, y: number, z: number, rx: number, ry: number, rz: number, asyncCallback: any, asyncTarget: any, asyncArguments: any)` | 84 | ✍ Starts an asynchronous load of the i3d file (after checking the file exists) and keeps position, rotation and an optional callback for onForestryLogLoaded. Returns false if the name is nil or the file is missing, true once loading started. |
| `ForestryLog:onForestryLogLoaded(nodeId: any, failedReason: any, asyncCallbackArguments: any)` | 110 | ✍ Async load callback. On success it clones a random child of the loaded file, links it to the root, applies the given pose if complete, sets it as node, registers the item and AI obstacle and deletes the loaded root. Then calls the optional callback with a success flag. |
| `ForestryLog:loadAsyncFromXMLFile(xmlFile: XMLFile, key: string, resetVehicles: boolean, asyncCallback: any, asyncTarget: any, asyncArguments: any) → boolean` | 150 | ✍ Reads position, rotation, uniqueId and filename from the savegame XML and starts the async load. Calls the callback with false if the pose is missing or loading cannot start. |
| `ForestryLog:saveToXMLFile(xmlFile: any, key: any)` | 169 | ✍ Writes uniqueId, HTML-encoded network filename, position, rotation and owner farmId of the log to the savegame XML under the given key. |
| `ForestryLog:mount(object: table, node: integer, x: number, y: number, z: number, rx: number, ry: number, rz: number)` | 190 | ✍ Calls the parent mount, then removes the log from the item system and disables its AI obstacle. |
| `ForestryLog:unmount()` | 198 | ✍ Calls the parent unmount. If it succeeds, puts the log back in the item system and re-enables the AI obstacle. Returns true on success, otherwise false. |
| `ForestryLog:mountKinematic(object: table, node: integer, x: number, y: number, z: number, rx: number, ry: number, rz: number)` | 217 | ✍ Calls the parent mountKinematic, then removes the log from the item system and disables the AI obstacle. |
| `ForestryLog:unmountKinematic()` | 225 | ✍ Calls the parent unmountKinematic. On success restores the item system entry and the AI obstacle and returns true, otherwise false. |
| `ForestryLog:mountDynamic(object: any, objectActorId: any, jointNode: any, mountType: any, forceAcceleration: any)` | 236 | ✍ Calls the parent mountDynamic and disables the AI obstacle. Unlike the other mount variants it does not touch the item system. |
| `ForestryLog:unmountDynamic(isDelete: any)` | 243 | ✍ Calls the parent unmountDynamic, then re-enables the AI obstacle. |
| `ForestryLog:setForestryLogAIObstacle(isActive: any)` | 250 | ✍ Adds the log node as an obstacle to aiSystem when enabling (if none yet) or removes it when disabling. Keeps the obstacle node in obstacleNodeId. |
| `ForestryLog:getMeshNodes()` | 262 | ✍ Returns the tensionBeltMeshes table, which is set empty when loading. |
| `ForestryLog:getSupportsTensionBelts()` | 268 | ✍ Returns true: logs can be strapped with tension belts. |
| `ForestryLog:getAllowPickup()` | 274 | ✍ Returns false: logs cannot be picked up by hand. |
| `ForestryLog:getDefaultRigidBodyType() → string` | 281 | ✍ Returns RigidBodyType.KINEMATIC as the default body type of a free log. |
