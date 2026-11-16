# handTools/events/ChainsawCutEvent.lua

*[Version française](../../../fr/scripts/handTools/events/ChainsawCutEvent.md)*

Source: `dataS/scripts/handTools/events/ChainsawCutEvent.lua` — FS25 1.25.1.0

✍ Client-to-server network event that carries a chainsaw cut: split shape id, cut position, normal and Y axis vectors, cut sizes and farm id. The cut itself is applied on the server inside `readStream` via `ChainsawUtil.cutSplitShape`; `run` is never meant to execute.

- **ChainsawCutEvent** inherits from `Event` (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `ChainsawCutEvent.emptyNew() → table` | 18 | ✍ Creates an empty event instance for the network layer to fill in `readStream`. |
| `ChainsawCutEvent.new(splitShapeId: integer, x: number, y: number, z: number, nx: number, ny: number, nz: number, yx: number, yy: number, yz: number, cutSizeY: number, cutSizeZ: number, farmId: integer) → any` | 39 | ✍ Creates the event with the split shape id, cut position (x, y, z), normal (nx, ny, nz), Y axis (yx, yy, yz), cut sizes along Y and Z, and the farm id. |
| `ChainsawCutEvent:readStream(streamId: integer, connection: Connection)` | 63 | ✍ Server side only (the sender is a client): reads the split shape id, eleven float32 values and the farm id, then, if the shape id is not 0, performs the cut with `ChainsawUtil.cutSplitShape`. Does nothing when received by a client. |
| `ChainsawCutEvent:writeStream(streamId: integer, connection: Connection)` | 89 | ✍ Client side only (connection to the server): writes the split shape id, the eleven float32 values and the farm id in the same order that `readStream` reads them. |
| `ChainsawCutEvent:run(connection: Connection)` | 110 | ✍ Only prints an error message, since this event must not be executed on a local client; the real work is done in `readStream`. |
