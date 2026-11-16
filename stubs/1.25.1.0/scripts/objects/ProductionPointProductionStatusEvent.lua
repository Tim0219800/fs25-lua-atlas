---@meta
-- FS25 1.25.1.0 : objects/ProductionPointProductionStatusEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event carrying the status of one production of a production point, identified by its index in the productions list (sent as 8 bits). A client sends it to the server, which applies it and rebroadcasts it to the other clients. Status values come from ProductionPoint constants not present in this dump.
---@class ProductionPointProductionStatusEvent : Event
ProductionPointProductionStatusEvent = {}

--- Creates an empty event instance, used when reading from a stream.
---@return table
function ProductionPointProductionStatusEvent.emptyNew() end

--- Creates the event with the production point, the production index and the status value.
---@param productionPoint ProductionPoint
---@param productionIndex integer
---@param status integer
---@return ProductionPointProductionStatusEvent
function ProductionPointProductionStatusEvent.new(productionPoint, productionIndex, status) end

--- Reads the production point object, the production index (8 bits) and the status from the stream, then runs the event.
---@param streamId any
---@param connection any
function ProductionPointProductionStatusEvent:readStream(streamId, connection) end

--- Writes the production point object, production index (8 bits) and status to the stream.
---@param streamId any
---@param connection any
function ProductionPointProductionStatusEvent:writeStream(streamId, connection) end

--- On the server, rebroadcasts the event; then looks up the production by index and calls setProductionStatus with the no-event flag. Note: no check that the index maps to an existing production.
---@param connection any
function ProductionPointProductionStatusEvent:run(connection) end

--- Sends the change unless noEventSend is true: the server broadcasts it to all clients, a client sends it to the server.
---@param productionPoint any
---@param productionIndex any
---@param status any
---@param noEventSend any
function ProductionPointProductionStatusEvent.sendEvent(productionPoint, productionIndex, status, noEventSend) end
