# objects/PhysicsObject.lua

Source : `dataS/scripts/objects/PhysicsObject.lua` — FS25 1.25.1.0

- **PhysicsObject** hérite de `Object` (l.4)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PhysicsObject.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 16 |  |
| `PhysicsObject:delete()` | 32 |  |
| `PhysicsObject:getAllowsAutoDelete() → boolean` | 48 |  |
| `PhysicsObject:loadOnCreate(nodeId: integer)` | 55 |  |
| `PhysicsObject:setNodeId(nodeId: integer)` | 65 |  |
| `PhysicsObject:readStream(streamId: integer, connection: table, objectId: any)` | 88 |  |
| `PhysicsObject:writeStream(streamId: integer, connection: table)` | 113 |  |
| `PhysicsObject:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 135 |  |
| `PhysicsObject:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 160 |  |
| `PhysicsObject:update(dt: number)` | 179 |  |
| `PhysicsObject:updateMove() → boolean` | 207 |  |
| `PhysicsObject:updateTick(dt: number)` | 225 |  |
| `PhysicsObject:testScope(x: number, y: number, z: number, coeff: number) → boolean` | 238 |  |
| `PhysicsObject:getUpdatePriority(skipCount: number, x: number, y: number, z: number, coeff: number, connection: table, isGuiVisible: any) → number` | 258 |  |
| `PhysicsObject:onGhostRemove()` | 267 |  |
| `PhysicsObject:onGhostAdd()` | 274 |  |
| `PhysicsObject:wakeUp()` | 281 |  |
| `PhysicsObject:setWorldPositionQuaternion(x: number, y: number, z: number, quatX: number, quatY: number, quatZ: number, quatW: number, changeInterp: any)` | 302 |  |
| `PhysicsObject:setLocalPositionQuaternion(x: number, y: number, z: number, quatX: number, quatY: number, quatZ: number, quatW: number, changeInterp: any)` | 327 |  |
| `PhysicsObject:getDefaultRigidBodyType() → string` | 347 |  |
| `PhysicsObject:addChildenToNodeObject(nodeId: integer)` | 373 |  |
