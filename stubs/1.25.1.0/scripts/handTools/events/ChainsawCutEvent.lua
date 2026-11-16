---@meta
-- FS25 1.25.1.0 : handTools/events/ChainsawCutEvent.lua (generated stub, FS25 Lua Atlas)

--- Client-to-server network event that carries a chainsaw cut: split shape id, cut position, normal and Y axis vectors, cut sizes and farm id. The cut itself is applied on the server inside `readStream` via `ChainsawUtil.cutSplitShape`; `run` is never meant to execute.
---@class ChainsawCutEvent : Event
ChainsawCutEvent = {}

--- Creates an empty event instance for the network layer to fill in `readStream`.
---@return table
function ChainsawCutEvent.emptyNew() end

--- Creates the event with the split shape id, cut position (x, y, z), normal (nx, ny, nz), Y axis (yx, yy, yz), cut sizes along Y and Z, and the farm id.
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

--- Server side only (the sender is a client): reads the split shape id, eleven float32 values and the farm id, then, if the shape id is not 0, performs the cut with `ChainsawUtil.cutSplitShape`. Does nothing when received by a client.
---@param streamId integer
---@param connection Connection
function ChainsawCutEvent:readStream(streamId, connection) end

--- Client side only (connection to the server): writes the split shape id, the eleven float32 values and the farm id in the same order that `readStream` reads them.
---@param streamId integer
---@param connection Connection
function ChainsawCutEvent:writeStream(streamId, connection) end

--- Only prints an error message, since this event must not be executed on a local client; the real work is done in `readStream`.
---@param connection Connection
function ChainsawCutEvent:run(connection) end
