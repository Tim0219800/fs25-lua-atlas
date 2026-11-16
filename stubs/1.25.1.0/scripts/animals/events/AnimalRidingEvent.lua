---@meta
-- FS25 1.25.1.0 : animals/events/AnimalRidingEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event requesting that a player start riding an animal cluster (horse) of a husbandry. On run it simply calls startRiding on the husbandry; no rebroadcast is done in this file.
---@class AnimalRidingEvent : Event
AnimalRidingEvent = {}

--- Creates an empty event instance, used before reading from a stream.
function AnimalRidingEvent.emptyNew() end

--- Creates the event for a husbandry, cluster id and player.
---@param husbandry any
---@param clusterId any
---@param player any
function AnimalRidingEvent.new(husbandry, clusterId, player) end

--- Reads the husbandry, cluster id and player, then runs the event.
---@param streamId any
---@param connection any
function AnimalRidingEvent:readStream(streamId, connection) end

--- Writes the husbandry, cluster id and player to the stream.
---@param streamId any
---@param connection any
function AnimalRidingEvent:writeStream(streamId, connection) end

--- Calls startRiding on the husbandry with the cluster id and player. There is no nil check on the husbandry.
---@param connection any
function AnimalRidingEvent:run(connection) end
