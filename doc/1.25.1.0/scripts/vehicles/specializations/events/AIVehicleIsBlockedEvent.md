# vehicles/specializations/events/AIVehicleIsBlockedEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/AIVehicleIsBlockedEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AIVehicleIsBlockedEvent.lua` — FS25 1.25.1.0

✍ Network event class `AIVehicleIsBlockedEvent` (extends `Event`) that tells clients that an AI-driven vehicle became blocked or free again. It carries the vehicle object and a blocked flag. It belongs to the vehicle specialization events and defines nothing else.

- **AIVehicleIsBlockedEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIVehicleIsBlockedEvent.emptyNew() → table` | 14 | ✍ Creates an empty `AIVehicleIsBlockedEvent` instance without data, used when the event is read from a network stream. |
| `AIVehicleIsBlockedEvent.new(object: table, isBlocked: boolean)` | 23 | ✍ Creates the event with its data: the vehicle object and a blocked flag. |
| `AIVehicleIsBlockedEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the event data from the network stream (the vehicle object and a blocked flag), then calls `run`. |
| `AIVehicleIsBlockedEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the event data to the network stream (the vehicle object and a blocked flag). |
| `AIVehicleIsBlockedEvent:run(connection: Connection)` | 52 | ✍ Executes the event on the receiving side: calls `aiBlock()` or `aiContinue()` on the vehicle once it is synchronized (no rebroadcast in `run`). |
