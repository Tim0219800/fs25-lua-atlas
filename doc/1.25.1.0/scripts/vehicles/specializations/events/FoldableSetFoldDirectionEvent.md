# vehicles/specializations/events/FoldableSetFoldDirectionEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/FoldableSetFoldDirectionEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/FoldableSetFoldDirectionEvent.lua` — FS25 1.25.1.0

✍ Network event class `FoldableSetFoldDirectionEvent` (extends `Event`) that replicates the fold direction of a foldable implement. It carries the vehicle, a direction (-1, 0 or 1, sent on 2 bits) and a move-to-middle flag. It belongs to the vehicle specialization events and defines nothing else.

- **FoldableSetFoldDirectionEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `FoldableSetFoldDirectionEvent.emptyNew() → table` | 14 | ✍ Creates an empty `FoldableSetFoldDirectionEvent` instance without data, used when the event is read from a network stream. |
| `FoldableSetFoldDirectionEvent.new(object: table, direction: integer, moveToMiddle: boolean)` | 24 | ✍ Creates the event with its data: the vehicle, a direction (-1, 0 or 1, sent on 2 bits) and a move-to-middle flag. |
| `FoldableSetFoldDirectionEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Reads the event data from the network stream (the vehicle, a direction (-1, 0 or 1, sent on 2 bits) and a move-to-middle flag), then calls `run`. |
| `FoldableSetFoldDirectionEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Writes the event data to the network stream (the vehicle, a direction (-1, 0 or 1, sent on 2 bits) and a move-to-middle flag). |
| `FoldableSetFoldDirectionEvent:run(connection: Connection)` | 56 | ✍ Executes the event on the receiving side: calls `setFoldState(direction, moveToMiddle, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
