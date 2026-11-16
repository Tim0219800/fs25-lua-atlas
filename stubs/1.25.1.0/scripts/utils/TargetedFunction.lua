---@meta
-- FS25 1.25.1.0 : utils/TargetedFunction.lua (generated stub, FS25 Lua Atlas)

--- Small class that wraps a function with an optional target object and optional bound arguments, so it can be stored as an event listener and called later. Instances are callable directly through the __call metamethod, which forwards to invoke. Pure Lua, no client or server distinction.
---@class TargetedFunction
TargetedFunction = {}

--- Creates a TargetedFunction from a function, an optional target table and optional extra arguments stored as a packed table. Debug builds assert on the types.
---@param targetFunction function
---@param targetObject table?
---@return TargetedFunction
function TargetedFunction.new(targetFunction, targetObject, ...) end

--- Clears the stored function and target references so they can be collected. The bound arguments are kept.
function TargetedFunction:delete() end

--- Wraps a plain function (with optional target) into a new TargetedFunction; any other value is assumed to be a TargetedFunction already and returned unchanged, without checking.
---@param targetFunction function
---@param targetObject table?
---@return TargetedFunction
function TargetedFunction.resolveListener(targetFunction, targetObject) end

--- Returns the bound arguments followed by the extra arguments given now, as separate values. It relies on table.getListUnion, defined elsewhere (UNVERIFIED).
---@return any
function TargetedFunction:unpackCombinedArguments(...) end

--- Calls the stored function, passing the target object first if there is one, then the bound arguments (when any) followed by the call arguments. Returns the function's return value.
---@return any
function TargetedFunction:invoke(...) end

--- Metamethod that lets the instance be called like a function; it simply forwards the arguments to invoke and returns its result.
---@param instance TargetedFunction
---@return any
function TargetedFunction_mt.__call(instance, ...) end
