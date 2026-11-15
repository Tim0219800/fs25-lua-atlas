---@meta
-- FS25 1.25.1.0 : objects/AnimatedMapObject.lua (stub généré, atlas Lua FS25)

---@class AnimatedMapObject : AnimatedObject
AnimatedMapObject = {}

---@param id integer
function AnimatedMapObject:onCreate(id) end

---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function AnimatedMapObject.new(isServer, isClient, customMt) end

---@param nodeId integer
---@return boolean
function AnimatedMapObject:load(nodeId) end
