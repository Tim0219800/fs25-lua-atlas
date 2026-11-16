# vehicles/specializations/events/PalletFillerBuyPalletEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/PalletFillerBuyPalletEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/PalletFillerBuyPalletEvent.lua` — FS25 1.25.1.0

✍ Network event class `PalletFillerBuyPalletEvent` (extends `Event`) that replicates buying pallets for a pallet filler. It carries only the vehicle. It belongs to the vehicle specialization events and defines nothing else.

- **PalletFillerBuyPalletEvent** inherits from `Event` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PalletFillerBuyPalletEvent.emptyNew() → table` | 19 | ✍ Creates an empty `PalletFillerBuyPalletEvent` instance without data, used when the event is read from a network stream. |
| `PalletFillerBuyPalletEvent.new(object: table) → table` | 29 | ✍ Creates the event with its data: only the vehicle. |
| `PalletFillerBuyPalletEvent:readStream(streamId: integer, connection: Connection)` | 40 | ✍ Reads the event data from the network stream (only the vehicle), then calls `run`. |
| `PalletFillerBuyPalletEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Writes the event data to the network stream (only the vehicle). |
| `PalletFillerBuyPalletEvent:run(connection: Connection)` | 57 | ✍ Executes the event on the receiving side: on the server, forwards the event then calls `buyPalletFillerPallets(true)` if the pallet slot limit allows, otherwise sends the sender a `BuyVehicleEvent` with `STATE_TOO_MANY_PALLETS`; on a client just calls `buyPalletFillerPallets(true)`. |
