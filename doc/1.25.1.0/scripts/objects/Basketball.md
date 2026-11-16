# objects/Basketball.lua

*[Version française](../../fr/scripts/objects/Basketball.md)*

Source: `dataS/scripts/objects/Basketball.lua` — FS25 1.25.1.0

✍ Physics object for a basketball placed on a map. It extends PhysicsObject, is created either from a map i3d node (onCreate, user attribute filename) or in code, and loads its model through the shared i3d manager. The server registers it and the stream functions send the i3d filename to joining clients.

- **Basketball** inherits from `PhysicsObject` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `Basketball:onCreate(id: integer)` | 14 | ✍ Map callback for an i3d node: reads the node transform and the optional filename user attribute (default basketball i3d), builds a ball, loads it, adds it to onCreateObjectSystem and registers it, or deletes it if loading fails. |
| `Basketball.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 35 | ✍ Constructor. Calls the PhysicsObject constructor, sets a forced clip distance of 150 and registers the object under the class name Basketball. Returns the new instance. |
| `Basketball:delete()` | 47 | ✍ Releases the shared i3d load request if any, unregisters the class name and calls the parent delete. |
| `Basketball:readStream(streamId: integer, connection: table)` | 60 | ✍ Client side, when joining: reads the i3d filename sent by the server, creates the node if none exists yet, then lets the parent read its own data. Does nothing if the connection is not to a server. |
| `Basketball:writeStream(streamId: integer, connection: table)` | 74 | ✍ Server side, when a client joins: writes the i3d filename in network form, then the parent data. Does nothing on a connection to a server. |
| `Basketball:createNode(i3dFilename: string)` | 84 | ✍ Stores the i3d filename and mod environment, loads the file through the shared i3d manager, takes its first child, links it to the root node, deletes the loaded root and sets it as the object node. |
| `Basketball:load(i3dFilename: string, x: number, y: number, z: number, rx: number, ry: number, rz: number)` | 106 | ✍ Creates the node from the i3d file, then places it at the given world position and rotation. Always returns true. |
