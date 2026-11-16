---@meta
-- FS25 1.25.1.0 : objects/DogBall.lua (generated stub, FS25 Lua Atlas)

--- Physics object for the ball a dog can fetch. It extends PhysicsObject, loads its model from an i3d file through the shared i3d manager, and remembers spawn position, throw position and start rotation on the server so it can be reset. The Doghouse uses the isDeleted flag to track it (the Doghouse code is not in this file).
---@class DogBall : PhysicsObject
DogBall = {}

--- Constructor. Calls the PhysicsObject constructor, sets a forced clip distance of 150 and registers the class name DogBall. Returns the instance.
---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function DogBall.new(isServer, isClient, customMt) end

--- Sets isDeleted to true, releases the shared i3d request, unregisters the class name and calls the parent delete. Note: sharedLoadRequestId is not reset to nil afterwards.
function DogBall:delete() end

--- On a connection to a server, reads the i3d filename and, if the ball has none yet, loads it at the origin (PhysicsObject sets the real pose). Always calls the parent readStream afterwards.
---@param streamId integer
---@param connection table
function DogBall:readStream(streamId, connection) end

--- When the connection is not to a server, writes the i3d filename in network form. Always calls the parent writeStream afterwards.
---@param streamId integer
---@param connection table
function DogBall:writeStream(streamId, connection) end

--- Stores the filename and mod environment, loads the i3d through the shared manager, links its first child to the root node, deletes the loaded root and sets the child as node.
---@param i3dFilename string
function DogBall:createNode(i3dFilename) end

--- Creates the node, applies the given world position and rotation, and on the server stores spawnPos, throwPos and startRot. Always returns true.
---@param i3dFilename string
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
function DogBall:load(i3dFilename, x, y, z, rx, ry, rz) end

--- Server only: removes the node from physics, puts it back at spawnPos and startRot, then adds it to physics again.
function DogBall:reset() end
