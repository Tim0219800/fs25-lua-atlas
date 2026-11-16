---@meta
-- FS25 1.25.1.0 : objects/ProductionPointProductionStateEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event telling that a production of a production point was switched on or off, identified by its string id. A client sends it to the server, which applies it and rebroadcasts it to the other clients.
---@class ProductionPointProductionStateEvent : Event
ProductionPointProductionStateEvent = {}

--- Creates an empty event instance, used when reading from a stream.
---@return table
function ProductionPointProductionStateEvent.emptyNew() end

--- Creates the event with the production point, the production id string and the enabled flag.
---@param productionPoint any
---@param productionId any
---@param isEnabled any
function ProductionPointProductionStateEvent.new(productionPoint, productionId, isEnabled) end

--- Reads the production point object, production id string and enabled flag from the stream, then runs the event.
---@param streamId any
---@param connection any
function ProductionPointProductionStateEvent:readStream(streamId, connection) end

--- Writes the production point object, production id string and enabled flag to the stream.
---@param streamId any
---@param connection any
function ProductionPointProductionStateEvent:writeStream(streamId, connection) end

--- On the server, rebroadcasts the event to the other clients; then, if the production point exists, calls setProductionState with the no-event flag.
---@param connection any
function ProductionPointProductionStateEvent:run(connection) end

--- Sends the change unless noEventSend is true: the server broadcasts it to all clients, a client sends it to the server.
---@param productionPoint any
---@param productionId any
---@param isEnabled any
---@param noEventSend any
function ProductionPointProductionStateEvent.sendEvent(productionPoint, productionId, isEnabled, noEventSend) end
