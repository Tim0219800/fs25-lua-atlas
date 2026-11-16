# vehicles/VehicleAttachRequestEvent.lua

*[Version française](../../fr/scripts/vehicles/VehicleAttachRequestEvent.md)*

Source: `dataS/scripts/vehicles/VehicleAttachRequestEvent.lua` — FS25 1.25.1.0

✍ Network event a client sends to the server to request attaching an implement. It carries the attacher vehicle, the attachable and the joint description indices of both. The server then runs `attachImplementFromInfo`; the actual attach is announced to clients by `VehicleAttachEvent`.

- **VehicleAttachRequestEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleAttachRequestEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance for stream deserialization. |
| `VehicleAttachRequestEvent.new(info: table) → table` | 22 | ✍ Builds the request from an info table (`attacherVehicle`, `attachable`, `attacherVehicleJointDescIndex`, `attachableJointDescIndex`). |
| `VehicleAttachRequestEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads both node objects and both 7-bit joint description indices, then calls `run`. |
| `VehicleAttachRequestEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Writes both node objects and both joint description indices (7 bits each) to the stream. |
| `VehicleAttachRequestEvent:run(connection: Connection)` | 57 | ✍ Server only: if the attacher vehicle is synchronized, calls `attachImplementFromInfo` with this event as info. Ignored on clients. |
