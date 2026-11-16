---@meta
-- FS25 1.25.1.0 : animals/events/AnimalCleanEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event that lowers the dirt level of one animal cluster (horse) in a husbandry. It carries the husbandry, the cluster id and a non-negative dirt delta, and applies the change through the cluster's changeDirt when it runs.
---@class AnimalCleanEvent : Event
AnimalCleanEvent = {}

--- Creates an empty event instance, used before reading from a stream.
function AnimalCleanEvent.emptyNew() end

--- Creates the event for a husbandry, cluster id and dirt amount (stored as the absolute value of the floored delta).
---@param husbandry any
---@param clusterId any
---@param delta any
function AnimalCleanEvent.new(husbandry, clusterId, delta) end

--- Reads the husbandry, the cluster id and the delta (bit width AnimalClusterHorse.NUM_BITS_DIRT), then runs the event immediately.
---@param streamId any
---@param connection any
function AnimalCleanEvent:readStream(streamId, connection) end

--- Writes the husbandry, cluster id and dirt delta to the stream.
---@param streamId any
---@param connection any
function AnimalCleanEvent:writeStream(streamId, connection) end

--- Finds the cluster by id in the husbandry and, if it has changeDirt, reduces its dirt by the delta. Nothing is rebroadcast here.
---@param connection any
function AnimalCleanEvent:run(connection) end
