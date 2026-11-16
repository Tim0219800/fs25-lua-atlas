---@meta
-- FS25 1.25.1.0 : vehicles/specializations/events/PalletFillerBuyPalletEvent.lua (generated stub, FS25 Lua Atlas)

--- Network event class `PalletFillerBuyPalletEvent` (extends `Event`) that replicates buying pallets for a pallet filler. It carries only the vehicle. It belongs to the vehicle specialization events and defines nothing else.
---@class PalletFillerBuyPalletEvent : Event
PalletFillerBuyPalletEvent = {}

--- Creates an empty `PalletFillerBuyPalletEvent` instance without data, used when the event is read from a network stream.
---@return table
function PalletFillerBuyPalletEvent.emptyNew() end

--- Creates the event with its data: only the vehicle.
---@param object table
---@return table
function PalletFillerBuyPalletEvent.new(object) end

--- Reads the event data from the network stream (only the vehicle), then calls `run`.
---@param streamId integer
---@param connection Connection
function PalletFillerBuyPalletEvent:readStream(streamId, connection) end

--- Writes the event data to the network stream (only the vehicle).
---@param streamId integer
---@param connection Connection
function PalletFillerBuyPalletEvent:writeStream(streamId, connection) end

--- Executes the event on the receiving side: on the server, forwards the event then calls `buyPalletFillerPallets(true)` if the pallet slot limit allows, otherwise sends the sender a `BuyVehicleEvent` with `STATE_TOO_MANY_PALLETS`; on a client just calls `buyPalletFillerPallets(true)`.
---@param connection Connection
function PalletFillerBuyPalletEvent:run(connection) end
