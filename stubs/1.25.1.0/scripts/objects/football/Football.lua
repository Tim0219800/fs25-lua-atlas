---@meta
-- FS25 1.25.1.0 : objects/football/Football.lua (generated stub, FS25 Lua Atlas)

--- Football (soccer ball) physics object, extending PhysicsObject. This file only contains the constructor and the destructor; the ball behaviour is inherited or implemented in the field class.
---@class Football : PhysicsObject
Football = {}

--- Constructor: builds the PhysicsObject, sets a forced clip distance of 200 and registers the class name `Football`.
---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function Football.new(isServer, isClient, customMt) end

--- Deletes the sound samples, unregisters the class name, removes children from the node object, and calls the grandparent `delete` deliberately so the ball entity itself is not deleted.
function Football:delete() end
