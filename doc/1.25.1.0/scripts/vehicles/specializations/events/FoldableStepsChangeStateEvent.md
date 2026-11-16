# vehicles/specializations/events/FoldableStepsChangeStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/FoldableStepsChangeStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/FoldableStepsChangeStateEvent.lua` — FS25 1.25.1.0

✍ Network event class `FoldableStepsChangeStateEvent` (extends `Event`) that replicates the target state of a stepped foldable implement. It carries the vehicle and a target state (`FoldableSteps.STATE_NUM_BITS` bits). It belongs to the vehicle specialization events and defines nothing else.

- **FoldableStepsChangeStateEvent** inherits from `Event` (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `FoldableStepsChangeStateEvent.emptyNew() → table` | 19 | ✍ Creates an empty `FoldableStepsChangeStateEvent` instance without data, used when the event is read from a network stream. |
| `FoldableStepsChangeStateEvent.new(object: table, targetState: table) → table` | 29 | ✍ Creates the event with its data: the vehicle and a target state (`FoldableSteps.STATE_NUM_BITS` bits). |
| `FoldableStepsChangeStateEvent:readStream(streamId: integer, connection: Connection)` | 41 | ✍ Reads the event data from the network stream (the vehicle and a target state (`FoldableSteps.STATE_NUM_BITS` bits)), then calls `run`. |
| `FoldableStepsChangeStateEvent:writeStream(streamId: integer, connection: Connection)` | 52 | ✍ Writes the event data to the network stream (the vehicle and a target state (`FoldableSteps.STATE_NUM_BITS` bits)). |
| `FoldableStepsChangeStateEvent:run(connection: Connection)` | 60 | ✍ Executes the event on the receiving side: calls `setFoldableStepsFoldState(targetState, true)` on the vehicle. On the server it also forwards the event to the other clients, except the sender. |
| `FoldableStepsChangeStateEvent.sendEvent(vehicle: table, targetState: integer, noEventSend: boolean)` | 75 | ✍ Helper that sends the event: the server broadcasts it to clients, a client sends it to the server. Skipped when `noEventSend` is set. |
