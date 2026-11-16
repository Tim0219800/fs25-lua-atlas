---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/ConsumableRefillEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `ConsumableRefillEvent` (extends `Event`) that requests a refill of the consumable storage and consuming slots of a vehicle, charging the farm. It carries the vehicle, a consumable type index (uint8) and a variation index (`ConsumableManager.NUM_VARIATION_BITS` bits). It belongs to the vehicle specialization events and defines nothing else.
---@class ConsumableRefillEvent : Event
ConsumableRefillEvent = {}

--- Creates an empty `ConsumableRefillEvent` instance without data, used when the event is read from a network stream.
---@return table
function ConsumableRefillEvent.emptyNew() end

--- Creates the event with its data: the vehicle, a consumable type index (uint8) and a variation index (`ConsumableManager.NUM_VARIATION_BITS` bits).
---@param object table
---@param typeIndex table
---@param variationIndex any
---@return table
function ConsumableRefillEvent.new(object, typeIndex, variationIndex) end

--- Reads the event data from the network stream (the vehicle, a consumable type index (uint8) and a variation index (`ConsumableManager.NUM_VARIATION_BITS` bits)), then calls `run`.
---@param streamId integer
---@param connection Connection
function ConsumableRefillEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (the vehicle, a consumable type index (uint8) and a variation index (`ConsumableManager.NUM_VARIATION_BITS` bits)).
---@param streamId integer
---@param connection Connection
function ConsumableRefillEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: sets the consuming variation, adds fill levels to the storage and consuming slots, then charges expenses and money (`MoneyType.PURCHASE_CONSUMABLES`) from the variation price when positive.
---@param connection Connection
function ConsumableRefillEvent:run(connection) end

--- Helper that sends the event: the server broadcasts it, a client sends it to the server. It has no `noEventSend` parameter.
---@param vehicle table
---@param typeIndex integer
---@param variationIndex integer
function ConsumableRefillEvent.sendEvent(vehicle, typeIndex, variationIndex) end
