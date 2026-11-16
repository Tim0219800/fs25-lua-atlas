---@meta
-- FS25 1.25.1.0 : objects/football/FootballField.lua (generated stub, FS25 Lua Atlas)

--- Football field object created from the map (onCreate) and registered in the onCreateObjectSystem. It owns the ball, goal triggers, game area, reset trigger, score and sounds; only creation, deletion and join streaming are in this dump, while `load` and the rest are UNVERIFIED here. It extends Object and is multiplayer-aware.
---@class FootballField : Object
FootballField = {}

--- i3d onCreate callback: creates the field for the local server/client roles, calls `load(id)`, then registers it in the on-create object system and the network, or deletes it if loading failed.
---@param _ integer
---@param id integer
function FootballField.onCreate(_, id) end

--- Constructor: builds the Object, registers the class name `FootballField` and initializes empty `i3dMappings` and `components` tables.
---@param isServer boolean
---@param isClient boolean
---@param customMt table
---@return table
function FootballField.new(isServer, isClient, customMt) end

--- Deletes the ball, removes the goal, game area and reset triggers, resets the ball timer, frees sounds, removes the reset activatable and the `gsFootballFieldReload` console command, then calls the parent delete.
function FootballField:delete() end

--- Server side on client join: after the parent data it writes the ball object id, the ball's own stream, registers the ball with the server for that connection, and sends both scores as UInt8.
---@param streamId integer
---@param connection table
function FootballField:writeStream(streamId, connection) end
