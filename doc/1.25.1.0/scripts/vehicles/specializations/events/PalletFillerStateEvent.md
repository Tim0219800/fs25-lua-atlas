# vehicles/specializations/events/PalletFillerStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/PalletFillerStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/PalletFillerStateEvent.lua` — FS25 1.25.1.0

✍ Network event class `PalletFillerStateEvent` (extends `Event`) that replicates the state of a pallet filler. It carries the vehicle and a state serialized through `PalletFillerState`. It belongs to the vehicle specialization events and defines nothing else.

- **PalletFillerStateEvent** inherits from `Event` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PalletFillerStateEvent.emptyNew() → table` | 19 | ✍ Creates an empty `PalletFillerStateEvent` instance without data, used when the event is read from a network stream. |
| `PalletFillerStateEvent.new(object: table, state: table) → table` | 29 | ✍ Creates the event with its data: the vehicle and a state serialized through `PalletFillerState`. |
| `PalletFillerStateEvent:readStream(streamId: integer, connection: Connection)` | 41 | ✍ Reads the event data from the network stream (the vehicle and a state serialized through `PalletFillerState`), then calls `run`. |
| `PalletFillerStateEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Writes the event data to the network stream (the vehicle and a state serialized through `PalletFillerState`). |
| `PalletFillerStateEvent:run(connection: Connection)` | 60 | ✍ Executes the event on the receiving side: calls `setPalletFillerState(state, false, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `PalletFillerStateEvent.sendEvent(vehicle: table, state: integer, noEventSend: boolean)` | 75 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
