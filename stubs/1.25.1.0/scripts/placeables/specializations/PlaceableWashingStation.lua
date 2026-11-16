---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableWashingStation.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that hosts one or more WashingStation objects read from `placeable.washingStation.station(?)`. It creates them on load, registers them at placement, streams them to joining clients and keeps their owner farm in sync with the placeable.
---@class PlaceableWashingStation
PlaceableWashingStation = {}

--- Always returns true: no prerequisite specialization.
---@param specializations table
---@return boolean
function PlaceableWashingStation.prerequisitesPresent(specializations) end

--- Overrides `setOwnerFarmId` on the placeable type.
---@param placeableType any
function PlaceableWashingStation.registerOverwrittenFunctions(placeableType) end

--- Subscribes to onLoad, onDelete, onFinalizePlacement, onReadStream and onWriteStream.
---@param placeableType any
function PlaceableWashingStation.registerEventListeners(placeableType) end

--- Declares the washing station XML keys by delegating to `WashingStation.registerXMLPaths` for each `station(?)`.
---@param schema any
---@param basePath any
function PlaceableWashingStation.registerXMLPaths(schema, basePath) end

--- Creates a WashingStation per `station` entry and loads it; stations that fail to load are deleted and dropped.
---@param savegame table
function PlaceableWashingStation:onLoad(savegame) end

--- Deletes every washing station object.
function PlaceableWashingStation:onDelete() end

--- Gives each washing station the placeable owner farm and registers it as a network object.
function PlaceableWashingStation:onFinalizePlacement() end

--- Client side on join: for each station reads its object id, reads its state and finishes its network registration.
---@param streamId any
---@param connection any
function PlaceableWashingStation:onReadStream(streamId, connection) end

--- Server side on join: for each station writes its object id and state, and registers it in the connection stream.
---@param streamId any
---@param connection any
function PlaceableWashingStation:onWriteStream(streamId, connection) end

--- Calls the parent, then copies the new owner farm to every washing station without sending an event.
---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableWashingStation:setOwnerFarmId(superFunc, farmId, noEventSend) end
