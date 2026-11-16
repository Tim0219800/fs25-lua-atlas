---@meta
-- FS25 1.25.1.0 : ai/errors/AIMessageErrorCouldNotPrepare.lua (generated stub, FS25 Lua Atlas)

--- AI error message for a vehicle that could not be prepared before the job. Unlike most messages it carries a vehicle reference, formats the text with both the helper name and the vehicle name, and serializes the vehicle over the network.
---@class AIMessageErrorCouldNotPrepare : AIMessage
AIMessageErrorCouldNotPrepare = {}

--- Constructor taking the vehicle that could not be prepared and storing it in `self.vehicle`.
---@param vehicle any
---@param customMt any
function AIMessageErrorCouldNotPrepare.new(vehicle, customMt) end

--- Builds the message text from `getI18NText` (not defined in this file, UNVERIFIED), the helper name of the job ("Unknown" if missing) and the vehicle name (empty if none).
---@param job any
function AIMessageErrorCouldNotPrepare:getMessage(job) end

--- Reads the vehicle as a network node object from the stream, so that the client resolves the same vehicle.
---@param streamId any
---@param connection any
function AIMessageErrorCouldNotPrepare:readStream(streamId, connection) end

--- Writes the vehicle as a network node object to the stream (counterpart of `readStream`).
---@param streamId any
---@param connection any
function AIMessageErrorCouldNotPrepare:writeStream(streamId, connection) end
