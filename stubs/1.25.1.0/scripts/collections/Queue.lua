---@meta
-- FS25 1.25.1.0 : collections/Queue.lua (generated stub, FS25 Lua Atlas)

--- Queue class stub: the dump only contains peek, which reads a `first` field. No constructor or push/pop function is present in this file, so how that field is filled is UNVERIFIED.
---@class Queue
Queue = {}

--- Gives back whatever sits first in the queue, read from the `first` field, without taking it out; nil if there is nothing.
---@return table?
function Queue:peek() end
