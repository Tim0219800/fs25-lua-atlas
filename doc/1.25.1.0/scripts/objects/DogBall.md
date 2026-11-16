# objects/DogBall.lua

*[Version française](../../fr/scripts/objects/DogBall.md)*

Source: `dataS/scripts/objects/DogBall.lua` — FS25 1.25.1.0

✍ Physics object for the ball a dog can fetch. It extends PhysicsObject, loads its model from an i3d file through the shared i3d manager, and remembers spawn position, throw position and start rotation on the server so it can be reset. The Doghouse uses the isDeleted flag to track it (the Doghouse code is not in this file).

- **DogBall** inherits from `PhysicsObject` (l.14)

## Functions

| Function | Line | Description |
|---|---|---|
| `DogBall.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 24 | ✍ Constructor. Calls the PhysicsObject constructor, sets a forced clip distance of 150 and registers the class name DogBall. Returns the instance. |
| `DogBall:delete()` | 36 | ✍ Sets isDeleted to true, releases the shared i3d request, unregisters the class name and calls the parent delete. Note: sharedLoadRequestId is not reset to nil afterwards. |
| `DogBall:readStream(streamId: integer, connection: table)` | 50 | ✍ On a connection to a server, reads the i3d filename and, if the ball has none yet, loads it at the origin (PhysicsObject sets the real pose). Always calls the parent readStream afterwards. |
| `DogBall:writeStream(streamId: integer, connection: table)` | 68 | ✍ When the connection is not to a server, writes the i3d filename in network form. Always calls the parent writeStream afterwards. |
| `DogBall:createNode(i3dFilename: string)` | 79 | ✍ Stores the filename and mod environment, loads the i3d through the shared manager, links its first child to the root node, deletes the loaded root and sets the child as node. |
| `DogBall:load(i3dFilename: string, x: number, y: number, z: number, rx: number, ry: number, rz: number)` | 177 | ✍ Creates the node, applies the given world position and rotation, and on the server stores spawnPos, throwPos and startRot. Always returns true. |
| `DogBall:reset()` | 192 | ✍ Server only: removes the node from physics, puts it back at spawnPos and startRot, then adds it to physics again. |
