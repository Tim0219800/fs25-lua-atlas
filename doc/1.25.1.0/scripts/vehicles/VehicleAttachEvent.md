# vehicles/VehicleAttachEvent.lua

*[Version française](../../fr/scripts/vehicles/VehicleAttachEvent.md)*

Source: `dataS/scripts/vehicles/VehicleAttachEvent.lua` — FS25 1.25.1.0

✍ Network event sent by the server to tell clients that an implement was attached to a vehicle. It carries the two node objects, the two joint indices (7 bits each) and whether the implement starts lowered. Subclass of `Event`; on receipt it calls `attachImplement` with noEventSend set.

- **VehicleAttachEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleAttachEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance, used when the event is rebuilt from a network stream. |
| `VehicleAttachEvent.new(vehicle: table, implement: table, inputJointIndex: integer, jointIndex: integer, startLowered: boolean) → table` | 27 | ✍ Builds the event from vehicle, implement, both joint indices and the start-lowered flag. Asserts that `jointIndex` lies in 0..126, since it is sent on 7 bits. |
| `VehicleAttachEvent:readStream(streamId: integer, connection: Connection)` | 42 | ✍ Reads vehicle, implement, joint indices and the lowered flag from the stream, then immediately calls `run`. |
| `VehicleAttachEvent:writeStream(streamId: integer, connection: Connection)` | 55 | ✍ Writes the vehicle and implement node objects, the two 7-bit joint indices and the lowered flag to the stream. |
| `VehicleAttachEvent:run(connection: Connection)` | 66 | ✍ If the vehicle is synchronized, attaches the implement locally (without re-sending an event); logs an error if the implement is unknown. When received by the server, it rebroadcasts the event to the other clients. |
