---@meta
-- FS25 1.25.1.0 : collections/ObjectPool.lua (generated stub, FS25 Lua Atlas)

--- Reusable object pool that hands out pooled tables and builds new ones with a constructor when empty. A set prevents the same instance being pooled twice. ObjectPool.EMPTY_TABLE_CONSTRUCTOR is used here but not defined in this file (UNVERIFIED).
---@class ObjectPool
ObjectPool = {}

--- Creates a pool. The optional constructor and its extra arguments are kept for creating objects when the pool is empty; without one, a default empty-table constructor is used.
---@param objectConstructor function?
---@return ObjectPool
function ObjectPool.new(objectConstructor, ...) end

--- Returns how many objects are currently waiting in the pool.
---@return integer
function ObjectPool:getLength() end

--- Empties the pool and its duplicate-check set. Pooled objects are simply forgotten, not deleted.
function ObjectPool:clear() end

--- Removes and returns the last pooled object, or creates a new one with the constructor and its saved arguments if the pool is empty.
---@return table
function ObjectPool:getOrCreateNext() end

--- Puts an instance back in the pool. Default empty tables are cleared, other objects get their reset method called if present. Returns false for nil or an already pooled instance, else true.
---@param instance table
function ObjectPool:returnToPool(instance) end
