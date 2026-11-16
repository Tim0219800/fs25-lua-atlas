# vehicles/specializations/events/RideableStableNotificationEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/RideableStableNotificationEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/RideableStableNotificationEvent.lua` — FS25 1.25.1.0

✍ Network event class `RideableStableNotificationEvent` (extends `Event`) that tells a client whether a horse is in its stable. It carries an isInStable boolean and the horse name. It belongs to the vehicle specialization events and defines nothing else.

- **RideableStableNotificationEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `RideableStableNotificationEvent.emptyNew() → table` | 13 | ✍ Creates an empty `RideableStableNotificationEvent` instance without data, used when the event is read from a network stream. |
| `RideableStableNotificationEvent.new(isInStable: table, name: integer)` | 22 | ✍ Creates the event with its data: an isInStable boolean and the horse name. |
| `RideableStableNotificationEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Reads the event data from the network stream (an isInStable boolean and the horse name), then calls `run`. |
| `RideableStableNotificationEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Writes the event data to the network stream (an isInStable boolean and the horse name). |
| `RideableStableNotificationEvent:run(connection: Connection)` | 51 | ✍ Executes the event on the receiving side: shows an in-game notification (OK or critical) formatted with the horse name. |
