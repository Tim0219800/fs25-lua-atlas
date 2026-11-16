---@meta
-- FS25 1.25.1.0 : objects/ProductionPointOutputModeEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event telling that the output distribution mode of one output fill type of a production point changed (see ProductionPoint.OUTPUT_MODE, defined outside this dump). A client sends it to the server, which applies it and rebroadcasts it to the other clients.
---@class ProductionPointOutputModeEvent : Event
ProductionPointOutputModeEvent = {}

--- Creates an empty event instance, used when reading from a stream.
---@return table
function ProductionPointOutputModeEvent.emptyNew() end

--- Creates the event with the production point, the output fill type id and the output mode.
---@param productionPoint any
---@param outputFillTypeId any
---@param outputMode any
function ProductionPointOutputModeEvent.new(productionPoint, outputFillTypeId, outputMode) end

--- Reads the production point object, fill type id and mode from the stream, then runs the event.
---@param streamId any
---@param connection any
function ProductionPointOutputModeEvent:readStream(streamId, connection) end

--- Writes the production point object, fill type id and mode to the stream.
---@param streamId any
---@param connection any
function ProductionPointOutputModeEvent:writeStream(streamId, connection) end

--- On the server, rebroadcasts the event to the other clients; then, if the production point still exists, calls setOutputDistributionMode with the no-event flag so it does not resend.
---@param connection any
function ProductionPointOutputModeEvent:run(connection) end

--- Sends the change unless noEventSend is true: the server broadcasts it to all clients, a client sends it to the server.
---@param productionPoint any
---@param outputFillTypeId any
---@param outputMode any
---@param noEventSend any
function ProductionPointOutputModeEvent.sendEvent(productionPoint, outputFillTypeId, outputMode, noEventSend) end
