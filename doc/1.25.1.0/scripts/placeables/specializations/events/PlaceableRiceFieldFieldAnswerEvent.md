# placeables/specializations/events/PlaceableRiceFieldFieldAnswerEvent.lua

*[Version française](../../../../fr/scripts/placeables/specializations/events/PlaceableRiceFieldFieldAnswerEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableRiceFieldFieldAnswerEvent.lua` — FS25 1.25.1.0

✍ Network event sent by the server back to a client to report the outcome (status code) of a rice field creation request made with PlaceableRiceFieldFieldEvent. The client only republishes the code on the message center; the meaning of the codes is defined elsewhere (UNVERIFIED).

- **PlaceableRiceFieldFieldAnswerEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableRiceFieldFieldAnswerEvent.emptyNew() → table` | 14 | ✍ Creates an empty event bound to the main network channel (`NetworkNode.CHANNEL_MAIN`). |
| `PlaceableRiceFieldFieldAnswerEvent.new(placeableRiceField: any, statusCode: any)` | 20 | ✍ Builds the answer event from the rice field placeable and a numeric status code. |
| `PlaceableRiceFieldFieldAnswerEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Reads the rice field object and a UInt8 status code, then runs the event right away. |
| `PlaceableRiceFieldFieldAnswerEvent:writeStream(streamId: integer, connection: Connection)` | 45 | ✍ Writes the rice field object and the UInt8 status code. |
| `PlaceableRiceFieldFieldAnswerEvent:run(connection: Connection)` | 54 | ✍ If the rice field exists and is synchronized, publishes the status code on `g_messageCenter` under the event class as topic. The listener that consumes it is not in this file. |
