# placeables/specializations/events/PlaceableTrainSystemRentEvent.lua

*[Version française](../../../../fr/scripts/placeables/specializations/events/PlaceableTrainSystemRentEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableTrainSystemRentEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes renting or returning the railroad of a PlaceableTrainSystem, along with the renting farm and a spline position. Use `sendEvent` to route it correctly from client or server. Note: the doc comments in the source (ai start, swath) were copied from other events and do not match.

- **PlaceableTrainSystemRentEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableTrainSystemRentEvent.emptyNew() → table` | 14 | ✍ Creates an empty event using the class metatable, with the default channel. |
| `PlaceableTrainSystemRentEvent.new(object: table, isRented: integer, farmId: boolean, splinePosition: integer)` | 25 | ✍ Builds the event from the train system object, a rented flag, the renting farm id and the spline position. Farm id and position only matter when rented. |
| `PlaceableTrainSystemRentEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Reads the object and the rented flag; if rented, also the farm id and the Float32 spline position. Then runs the event. |
| `PlaceableTrainSystemRentEvent:writeStream(streamId: integer, connection: Connection)` | 54 | ✍ Writes the object and the rented flag; if rented, also the farm id and the spline position. |
| `PlaceableTrainSystemRentEvent:run(connection: Connection)` | 65 | ✍ If the object is synchronized, calls `rentRailroad` or `returnRailroad` (both with a no-send flag). When received by the server, it rebroadcasts a new event to the other clients, skipping the sender connection. |
| `PlaceableTrainSystemRentEvent.sendEvent(object: table, isRented: boolean, farmId: boolean, splinePosition: any, noEventSend: boolean)` | 90 | ✍ Static helper: unless `noEventSend` is true, the server broadcasts the event, while a client sends it to the server connection. |
