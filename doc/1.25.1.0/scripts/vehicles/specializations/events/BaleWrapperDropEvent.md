# vehicles/specializations/events/BaleWrapperDropEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/BaleWrapperDropEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/BaleWrapperDropEvent.lua` — FS25 1.25.1.0

✍ Network event class `BaleWrapperDropEvent` (extends `Event`) that replicates the dropping of a wrapped bale. It carries the vehicle and a drop animation index (4 bits). It belongs to the vehicle specialization events and defines nothing else.

- **BaleWrapperDropEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `BaleWrapperDropEvent.emptyNew() → table` | 14 | ✍ Creates an empty `BaleWrapperDropEvent` instance without data, used when the event is read from a network stream. |
| `BaleWrapperDropEvent.new(object: table, dropAnimationIndex: integer) → BaleWrapperDropEvent` | 24 | ✍ Creates the event with its data: the vehicle and a drop animation index (4 bits). |
| `BaleWrapperDropEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Reads the event data from the network stream (the vehicle and a drop animation index (4 bits)), then calls `run`. |
| `BaleWrapperDropEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Writes the event data to the network stream (the vehicle and a drop animation index (4 bits)). |
| `BaleWrapperDropEvent:run(connection: Connection)` | 55 | ✍ Executes the event on the receiving side: sets the drop animation with `setBaleWrapperDropAnimation`, then calls `doStateChange(BaleWrapper.CHANGE_WRAPPER_START_DROP_BALE)`. On the server it also forwards the event to the other clients, except the sender. |
