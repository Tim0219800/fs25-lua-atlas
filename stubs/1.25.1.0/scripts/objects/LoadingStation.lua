---@meta
-- FS25 1.25.1.0 : objects/LoadingStation.lua (generated stub, FS25 Lua Atlas)

---@class LoadingStation : Object
LoadingStation = {}

---@param streamId integer
---@param connection table
function LoadingStation:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function LoadingStation:writeStream(streamId, connection) end

function LoadingStation:raiseActive() end

---@param fillTypeIndex integer
---@param fillDelta number
---@param farmId integer
---@return number
function LoadingStation:removeFillLevel(fillTypeIndex, fillDelta, farmId) end

---@param schema any
---@param basePath any
function LoadingStation.registerXMLPaths(schema, basePath) end
