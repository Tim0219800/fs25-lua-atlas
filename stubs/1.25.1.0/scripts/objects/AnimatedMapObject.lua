---@meta
-- FS25 1.25.1.0 : objects/AnimatedMapObject.lua (generated stub, FS25 Lua Atlas)

--- AnimatedObject subclass for animated objects placed directly in a map i3d. The map node carries user attributes (xmlFilename and saveId) pointing to an XML that holds the actual animation definition. The onCreate entry point creates, loads, registers it with the onCreate object system and with the network.
---@class AnimatedMapObject : AnimatedObject
AnimatedMapObject = {}

--- i3d onCreate callback: builds an instance with the current server/client flags, loads it from the node, then adds it to g_currentMission.onCreateObjectSystem and registers it on the network. If loading fails, the object is deleted.
---@param id integer
function AnimatedMapObject:onCreate(id) end

--- Constructor: forwards to AnimatedObject.new using the AnimatedMapObject metatable unless a custom one is given.
---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function AnimatedMapObject.new(isServer, isClient, customMt) end

--- Reads the user attributes xmlFilename (required) and saveId (the legacy attribute "index" is still accepted), resolves the file against the map or object base directory, finds the animatedObjects.animatedObject entry with the same saveId, and calls the parent load on it. Returns false with an error log if an attribute, the file or the entry is missing.
---@param nodeId integer
---@return boolean
function AnimatedMapObject:load(nodeId) end
