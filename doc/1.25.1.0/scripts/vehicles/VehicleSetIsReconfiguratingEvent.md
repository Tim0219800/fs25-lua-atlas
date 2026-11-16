# vehicles/VehicleSetIsReconfiguratingEvent.lua

*[Version française](../../fr/scripts/vehicles/VehicleSetIsReconfiguratingEvent.md)*

Source: `dataS/scripts/vehicles/VehicleSetIsReconfiguratingEvent.lua` — FS25 1.25.1.0

✍ Network event sent to a joining client so that a vehicle is flagged as reconfiguring. It only carries the vehicle reference; the receiver sets `isReconfigurating` to true on that vehicle once it is synchronized. It extends `Event`.

- **VehicleSetIsReconfiguratingEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `VehicleSetIsReconfiguratingEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance, used by the network layer before reading a stream. |
| `VehicleSetIsReconfiguratingEvent.new(object: table)` | 23 | ✍ Creates the event for the given vehicle object. Note: the doc comment mentions a `state` parameter that the function does not have. |
| `VehicleSetIsReconfiguratingEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Reads the vehicle node object from the stream and, if it exists and is already synchronized, sets its `isReconfigurating` flag to true. |
| `VehicleSetIsReconfiguratingEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the vehicle node object reference to the stream. |
