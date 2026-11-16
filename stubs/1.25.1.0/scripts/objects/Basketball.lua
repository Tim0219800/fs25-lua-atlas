---@meta
-- FS25 1.25.1.0 : objects/Basketball.lua (generated stub, FS25 Lua Atlas)

--- Physics object for a basketball placed on a map. It extends PhysicsObject, is created either from a map i3d node (onCreate, user attribute filename) or in code, and loads its model through the shared i3d manager. The server registers it and the stream functions send the i3d filename to joining clients.
---@class Basketball : PhysicsObject
Basketball = {}

--- Map callback for an i3d node: reads the node transform and the optional filename user attribute (default basketball i3d), builds a ball, loads it, adds it to onCreateObjectSystem and registers it, or deletes it if loading fails.
---@param id integer
function Basketball:onCreate(id) end

--- Constructor. Calls the PhysicsObject constructor, sets a forced clip distance of 150 and registers the object under the class name Basketball. Returns the new instance.
---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function Basketball.new(isServer, isClient, customMt) end

--- Releases the shared i3d load request if any, unregisters the class name and calls the parent delete.
function Basketball:delete() end

--- Client side, when joining: reads the i3d filename sent by the server, creates the node if none exists yet, then lets the parent read its own data. Does nothing if the connection is not to a server.
---@param streamId integer
---@param connection table
function Basketball:readStream(streamId, connection) end

--- Server side, when a client joins: writes the i3d filename in network form, then the parent data. Does nothing on a connection to a server.
---@param streamId integer
---@param connection table
function Basketball:writeStream(streamId, connection) end

--- Stores the i3d filename and mod environment, loads the file through the shared i3d manager, takes its first child, links it to the root node, deletes the loaded root and sets it as the object node.
---@param i3dFilename string
function Basketball:createNode(i3dFilename) end

--- Creates the node from the i3d file, then places it at the given world position and rotation. Always returns true.
---@param i3dFilename string
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
function Basketball:load(i3dFilename, x, y, z, rx, ry, rz) end
