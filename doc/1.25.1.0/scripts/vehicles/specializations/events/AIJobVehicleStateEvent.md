# vehicles/specializations/events/AIJobVehicleStateEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/AIJobVehicleStateEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/AIJobVehicleStateEvent.lua` — FS25 1.25.1.0

✍ Server-to-client event telling clients that an AI job started or finished on a vehicle. The job is sent as its id and looked up in the client's AI system, so it must already exist there.

- **AIJobVehicleStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIJobVehicleStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty event instance with the class metatable; used by the network layer before `readStream` fills it. |
| `AIJobVehicleStateEvent.new(vehicle: table, job: boolean, helperIndex: any, startedFarmId: any)` | 23 | ✍ Creates the event for a vehicle with the AI job (nil when the job ended), helper index and the farm id that started it. |
| `AIJobVehicleStateEvent:readStream(streamId: integer, connection: Connection)` | 38 | ✍ Reads the vehicle and, if flagged, the job id (resolved through `g_currentMission.aiSystem`), farm id and helper index, then calls `run`. |
| `AIJobVehicleStateEvent:writeStream(streamId: integer, connection: Connection)` | 55 | ✍ Writes the vehicle, a job-present flag and, if present, job id, farm id and helper index. Asserts server-to-client use. |
| `AIJobVehicleStateEvent:run(connection: Connection)` | 69 | ✍ On a synchronized vehicle, calls `aiJobStarted(job, helperIndex, farmId)` when a job is set, otherwise `aiJobFinished()`. |
