# handTools/events/FlashlightToggleLightEvent.lua

*[Version française](../../../fr/scripts/handTools/events/FlashlightToggleLightEvent.md)*

Source: `dataS/scripts/handTools/events/FlashlightToggleLightEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronizes the on/off state of a flashlight hand tool. A client sends it to the server, which rebroadcasts it to the others; a server calls `sendEvent` to broadcast directly.

- **FlashlightToggleLightEvent** inherits from `Event` (l.4)

## Functions

| Function | Line | Description |
|---|---|---|
| `FlashlightToggleLightEvent.emptyNew() → table` | 11 | ✍ Creates an empty event instance for the network layer to fill in `readStream`. |
| `FlashlightToggleLightEvent.new(flashlight: HandTool, isActive: boolean) → table` | 21 | ✍ Creates the event for a flashlight hand tool and a boolean telling whether it is on. |
| `FlashlightToggleLightEvent:readStream(streamId: integer, connection: table)` | 34 | ✍ Reads the flashlight (node object) and the active flag from the stream, then runs the event. |
| `FlashlightToggleLightEvent:writeStream(streamId: integer, connection: table)` | 44 | ✍ Writes the flashlight as a node object and the active flag to the stream. |
| `FlashlightToggleLightEvent:run(connection: table)` | 52 | ✍ If received by the server, rebroadcasts it to the other clients. When the flashlight exists and is synchronized, calls `setFlashlightIsActive(isActive, true)`. |
| `FlashlightToggleLightEvent.sendEvent(flashlight: any, isActive: any, noEventSend: any)` | 64 | ✍ Helper unless `noEventSend` is true: a server broadcasts the event to all clients, a client sends it to the server. |
