# vehicles/specializations/events/PushHandToolDriveModeEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/PushHandToolDriveModeEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/PushHandToolDriveModeEvent.lua` — FS25 1.25.1.0

✍ Network event class `PushHandToolDriveModeEvent` (extends `Event`) that replicates the drive mode of a push hand tool. It carries the vehicle and a drive-mode boolean. It belongs to the vehicle specialization events and defines nothing else.

- **PushHandToolDriveModeEvent** inherits from `Event` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PushHandToolDriveModeEvent.emptyNew() → table` | 19 | ✍ Creates an empty `PushHandToolDriveModeEvent` instance without data, used when the event is read from a network stream. |
| `PushHandToolDriveModeEvent.new(object: table, driveModeState: integer) → PushHandToolDriveModeEvent` | 29 | ✍ Creates the event with its data: the vehicle and a drive-mode boolean. |
| `PushHandToolDriveModeEvent:readStream(streamId: integer, connection: Connection)` | 41 | ✍ Reads the event data from the network stream (the vehicle and a drive-mode boolean), then calls `run`. |
| `PushHandToolDriveModeEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Writes the event data to the network stream (the vehicle and a drive-mode boolean). |
| `PushHandToolDriveModeEvent:run(connection: Connection)` | 60 | ✍ Executes the event on the receiving side: calls `setPushHandToolDriveMode(state, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `PushHandToolDriveModeEvent.sendEvent(vehicle: table, driveModeState: integer, noEventSend: boolean)` | 75 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
