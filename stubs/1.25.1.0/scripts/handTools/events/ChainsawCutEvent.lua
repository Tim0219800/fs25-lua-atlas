---@meta
-- FS25 1.25.1.0 : handTools/events/ChainsawCutEvent.lua (stub généré, atlas Lua FS25)

---@class ChainsawCutEvent : Event
ChainsawCutEvent = {}

---@return table
function ChainsawCutEvent.emptyNew() end

---@param splitShapeId integer
---@param x number
---@param y number
---@param z number
---@param nx number
---@param ny number
---@param nz number
---@param yx number
---@param yy number
---@param yz number
---@param cutSizeY number
---@param cutSizeZ number
---@param farmId integer
---@return any
function ChainsawCutEvent.new(splitShapeId, x, y, z, nx, ny, nz, yx, yy, yz, cutSizeY, cutSizeZ, farmId) end

---@param streamId integer
---@param connection Connection
function ChainsawCutEvent:readStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function ChainsawCutEvent:writeStream(streamId, connection) end

---@param connection Connection
function ChainsawCutEvent:run(connection) end
