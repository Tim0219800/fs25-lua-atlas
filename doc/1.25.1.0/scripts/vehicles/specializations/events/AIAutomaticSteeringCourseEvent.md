# vehicles/specializations/events/AIAutomaticSteeringCourseEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/AIAutomaticSteeringCourseEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AIAutomaticSteeringCourseEvent.lua` — FS25 1.25.1.0

✍ Network event that synchronises the automatic-steering field course of a vehicle (set or cleared) between server and clients. Application happens inside `readStream`; `run` is empty. It has no `sendEvent` helper, so the sender builds and broadcasts it itself. Uses `SteeringFieldCourse` (defined elsewhere, UNVERIFIED).

- **AIAutomaticSteeringCourseEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIAutomaticSteeringCourseEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the class metatable; used by the network layer before `readStream` fills it. |
| `AIAutomaticSteeringCourseEvent.new(vehicle: table, steeringFieldCourse: integer)` | 23 | ✍ Creates the event carrying a vehicle and its steering field course (may be nil to clear it). |
| `AIAutomaticSteeringCourseEvent:readStream(streamId: integer, connection: Connection)` | 35 | ✍ Reads the vehicle, first clears its automatic steering course, then if a course is present reads it asynchronously (`SteeringFieldCourse.readStream`) and applies it with `setAIAutomaticSteeringCourse`, all only if the vehicle is synchronized. |
| `AIAutomaticSteeringCourseEvent:writeStream(streamId: integer, connection: Connection)` | 56 | ✍ Writes the vehicle reference, a presence flag and, when set, the steering field course. |
| `AIAutomaticSteeringCourseEvent:run(connection: Connection)` | 67 | ✍ Empty; all work is done in `readStream`. |
