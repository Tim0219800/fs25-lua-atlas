---@meta
-- FS25 1.25.1.0 : collections/ObjectPool.lua (generated stub, FS25 Lua Atlas)

---@class ObjectPool
ObjectPool = {}

---@param objectConstructor function?
---@return ObjectPool
function ObjectPool.new(objectConstructor, ...) end

---@return integer
function ObjectPool:getLength() end

function ObjectPool:clear() end

---@return table
function ObjectPool:getOrCreateNext() end

---@param instance table
function ObjectPool:returnToPool(instance) end
