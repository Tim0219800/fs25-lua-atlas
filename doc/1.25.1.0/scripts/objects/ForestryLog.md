# objects/ForestryLog.lua

Source : `dataS/scripts/objects/ForestryLog.lua` — FS25 1.25.1.0

- **ForestryLog** hérite de `MountableObject` (l.5)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `ForestryLog.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 31 |  |
| `ForestryLog:delete()` | 43 |  |
| `ForestryLog:readStream(streamId: integer, connection: table)` | 60 |  |
| `ForestryLog:writeStream(streamId: integer, connection: table)` | 71 |  |
| `ForestryLog:loadFromFilename(i3dFilename: string, x: number, y: number, z: number, rx: number, ry: number, rz: number, asyncCallback: any, asyncTarget: any, asyncArguments: any)` | 84 |  |
| `ForestryLog:onForestryLogLoaded(nodeId: any, failedReason: any, asyncCallbackArguments: any)` | 110 |  |
| `ForestryLog:loadAsyncFromXMLFile(xmlFile: XMLFile, key: string, resetVehicles: boolean, asyncCallback: any, asyncTarget: any, asyncArguments: any) → boolean` | 150 |  |
| `ForestryLog:saveToXMLFile(xmlFile: any, key: any)` | 169 |  |
| `ForestryLog:mount(object: table, node: integer, x: number, y: number, z: number, rx: number, ry: number, rz: number)` | 190 |  |
| `ForestryLog:unmount()` | 198 |  |
| `ForestryLog:mountKinematic(object: table, node: integer, x: number, y: number, z: number, rx: number, ry: number, rz: number)` | 217 |  |
| `ForestryLog:unmountKinematic()` | 225 |  |
| `ForestryLog:mountDynamic(object: any, objectActorId: any, jointNode: any, mountType: any, forceAcceleration: any)` | 236 |  |
| `ForestryLog:unmountDynamic(isDelete: any)` | 243 |  |
| `ForestryLog:setForestryLogAIObstacle(isActive: any)` | 250 |  |
| `ForestryLog:getMeshNodes()` | 262 |  |
| `ForestryLog:getSupportsTensionBelts()` | 268 |  |
| `ForestryLog:getAllowPickup()` | 274 |  |
| `ForestryLog:getDefaultRigidBodyType() → string` | 281 |  |
