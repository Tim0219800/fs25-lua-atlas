---@meta
-- FS25 1.25.1.0 : objects/LoadingStation.lua (generated stub, FS25 Lua Atlas)

--- Station that lets vehicles load fill types out of one or more source storages through load triggers (class extends Object). In this dump only a few members have bodies: stream sync of the load triggers, activation forwarding to the owning placeable, removal of fill level and XML schema registration. Most of the class (loading, storage registration, access rules) is not present in the SDK dump and its behaviour is UNVERIFIED.
---@class LoadingStation : Object
LoadingStation = {}

--- Client-side join: after the parent readStream, when the connection is the server it reads each load trigger's network id and state and completes its registration with the client.
---@param streamId integer
---@param connection table
function LoadingStation:readStream(streamId, connection) end

--- Server-side join: after the parent writeStream, writes each load trigger's network id and state and registers the trigger in the stream for the connecting client.
---@param streamId integer
---@param connection table
function LoadingStation:writeStream(streamId, connection) end

--- Calls the parent raiseActive and also wakes the owning placeable, if any, so both keep updating.
function LoadingStation:raiseActive() end

--- Takes fillDelta of a fill type out of the source storages the farm may access and returns the amount still missing (0 once below 0.0001). Note: each storage is asked for the full fillDelta, not the remaining amount, so later storages may lose more than needed.
---@param fillTypeIndex integer
---@param fillDelta number
---@param farmId integer
---@return number
function LoadingStation:removeFillLevel(fillTypeIndex, fillDelta, farmId) end

--- Registers the XML schema entries for a loading station: node, stationName, storageRadius, supportsExtension, fillTypes, fillTypeCategories, plus repeated loadTrigger children (via LoadTrigger.registerXMLPaths) with a class attribute.
---@param schema any
---@param basePath any
function LoadingStation.registerXMLPaths(schema, basePath) end
