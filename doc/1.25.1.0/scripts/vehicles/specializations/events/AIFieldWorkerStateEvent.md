# vehicles/specializations/events/AIFieldWorkerStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/AIFieldWorkerStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AIFieldWorkerStateEvent.lua` — FS25 1.25.1.0

✍ Server-to-client event that mirrors the field worker (AI field work) state of a vehicle on clients by calling `startFieldWorker` or `stopFieldWorker`. Writing it from a client triggers an assertion.

- **AIFieldWorkerStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIFieldWorkerStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the class metatable; used by the network layer before `readStream` fills it. |
| `AIFieldWorkerStateEvent.new(vehicle: table, isActive: boolean)` | 23 | ✍ Creates the event for a vehicle with the field worker active flag. |
| `AIFieldWorkerStateEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Reads the vehicle and the active flag, then calls `run`. |
| `AIFieldWorkerStateEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Writes vehicle and flag. Asserts that it is only written on the server side (server to client event). |
| `AIFieldWorkerStateEvent:run(connection: Connection)` | 56 | ✍ On a synchronized vehicle, calls `startFieldWorker` or `stopFieldWorker` depending on the flag. |
