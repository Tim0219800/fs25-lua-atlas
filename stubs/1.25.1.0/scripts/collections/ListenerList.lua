---@meta
-- FS25 1.25.1.0 : collections/ListenerList.lua (generated stub, FS25 Lua Atlas)

---@class ListenerList
ListenerList = {}

---@param ignoreFirstArgument boolean?
---@return ListenerList
function ListenerList.new(ignoreFirstArgument) end

---@param listenerFunction (function|TargetedFunction)
---@param targetObject table?
function ListenerList:registerListener(listenerFunction, targetObject) end

---@param targetObject any
function ListenerList:invoke(targetObject, ...) end

---@param instance ListenerList
function ListenerList_mt.__call(instance, ...) end
