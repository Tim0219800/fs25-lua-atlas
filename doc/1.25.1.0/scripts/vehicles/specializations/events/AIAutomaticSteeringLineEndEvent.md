# vehicles/specializations/events/AIAutomaticSteeringLineEndEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/AIAutomaticSteeringLineEndEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AIAutomaticSteeringLineEndEvent.lua` — FS25 1.25.1.0

✍ Network event that tells peers a vehicle reached the end of an automatic-steering line, by raising `onAIAutomaticSteeringLineEnd` on the vehicle. It carries only the vehicle reference.

- **AIAutomaticSteeringLineEndEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIAutomaticSteeringLineEndEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the class metatable; used by the network layer before `readStream` fills it. |
| `AIAutomaticSteeringLineEndEvent.new(vehicle: table, state: integer, segmentIndex: any, segmentIsLeft: any)` | 23 | ✍ Creates the event for a vehicle. Note: the extra parameters (state, segmentIndex, segmentIsLeft) are accepted but ignored. |
| `AIAutomaticSteeringLineEndEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the vehicle reference and immediately calls `run`. |
| `AIAutomaticSteeringLineEndEvent:writeStream(streamId: integer, connection: Connection)` | 43 | ✍ Writes only the vehicle reference. |
| `AIAutomaticSteeringLineEndEvent:run(connection: Connection)` | 50 | ✍ If the vehicle is synchronized, raises the specialization event `onAIAutomaticSteeringLineEnd` on it. No rebroadcast here. |
