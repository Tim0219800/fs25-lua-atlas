---@meta
-- FS25 1.25.1.0 : collections/ListenerList.lua (generated stub, FS25 Lua Atlas)

--- Small observer helper holding an ordered list of listeners, each resolved through TargetedFunction.resolveListener (class defined elsewhere, UNVERIFIED). Calling the list, or invoke, runs every listener in registration order. There is no unregister function in this file.
---@class ListenerList
ListenerList = {}

--- Creates an empty listener list. With ignoreFirstArgument true, invoke drops its first argument (typically the owning table) before calling listeners.
---@param ignoreFirstArgument boolean?
---@return ListenerList
function ListenerList.new(ignoreFirstArgument) end

--- Resolves a function or TargetedFunction with an optional target object and appends it to the list. The same listener can be added more than once.
---@param listenerFunction (function|TargetedFunction)
---@param targetObject table?
function ListenerList:registerListener(listenerFunction, targetObject) end

--- Calls every listener in order with the given arguments; the first argument is skipped when the list was created with ignoreFirstArgument. Return values are discarded.
---@param targetObject any
function ListenerList:invoke(targetObject, ...) end

--- Metamethod that lets the list be called like a function, forwarding to invoke with the same arguments.
---@param instance ListenerList
function ListenerList_mt.__call(instance, ...) end
