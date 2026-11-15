---@meta
-- FS25 1.25.1.0 : utils/TargetedFunction.lua (stub généré, atlas Lua FS25)

---@class TargetedFunction
TargetedFunction = {}

---@param targetFunction function
---@param targetObject table?
---@return TargetedFunction
function TargetedFunction.new(targetFunction, targetObject, ...) end

function TargetedFunction:delete() end

---@param targetFunction function
---@param targetObject table?
---@return TargetedFunction
function TargetedFunction.resolveListener(targetFunction, targetObject) end

---@return any
function TargetedFunction:unpackCombinedArguments(...) end

---@return any
function TargetedFunction:invoke(...) end

---@param instance TargetedFunction
---@return any
function TargetedFunction_mt.__call(instance, ...) end
