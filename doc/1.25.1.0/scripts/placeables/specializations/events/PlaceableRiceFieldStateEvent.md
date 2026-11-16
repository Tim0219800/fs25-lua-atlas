# placeables/specializations/events/PlaceableRiceFieldStateEvent.lua

*[Version française](../../../../fr/scripts/placeables/specializations/events/PlaceableRiceFieldStateEvent.md)*

Source: `dataS/scripts/placeables/specializations/events/PlaceableRiceFieldStateEvent.lua` — FS25 1.25.1.0

✍ Request/response network event used by the rice field dialog: a client asks the server for the crop state of one field, and the server answers with the fruit type and growth state indices, which the client republishes through the message center. The direction is detected with `connection:getIsServer()`.

- **PlaceableRiceFieldStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableRiceFieldStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty event using the class metatable, with the default channel. |
| `PlaceableRiceFieldStateEvent.new(placeableRiceField: any, fieldIndex: any)` | 20 | ✍ Builds the client-to-server request: the rice field placeable and the index of the field whose crop state is wanted. |
| `PlaceableRiceFieldStateEvent.newServerToClient(placeableRiceField: any, fieldIndex: any, fruitTypeIndex: any, growthStateIndex: any)` | 31 | ✍ Builds the server answer carrying the field index, the fruit type index and the growth state index of the field. |
| `PlaceableRiceFieldStateEvent:readStream(streamId: integer, connection: Connection)` | 47 | ✍ Reads the rice field and field index; fruit type (`FruitTypeManager.SEND_NUM_BITS` bits) and growth state are only read when the data comes from the server. Then runs the event. |
| `PlaceableRiceFieldStateEvent:writeStream(streamId: integer, connection: Connection)` | 63 | ✍ Writes the rice field and field index; when sending to a client it also writes the fruit type and growth state. Mirrors `readStream`. |
| `PlaceableRiceFieldStateEvent:run(connection: Connection)` | 77 | ✍ On the server, queries `getRiceFieldState` and replies to the sender with a server-to-client event; on a client, publishes the fruit type and growth state on `g_messageCenter` (used by the rice field dialog). Skipped if the field is not synchronized. |
