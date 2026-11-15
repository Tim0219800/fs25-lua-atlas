# construction/events/OrchardBuildFinishedEvent.lua

Source: `dataS/scripts/construction/events/OrchardBuildFinishedEvent.lua` — FS25 1.25.1.0

- **OrchardBuildFinishedEvent** inherits from `Event` (l.17)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `OrchardBuildFinishedEvent.emptyNew() → OrchardBuildFinishedEvent` | 39 |  |
| `OrchardBuildFinishedEvent.new(requestId: integer, statusCode: integer, builtSteps: integer) → OrchardBuildFinishedEvent` | 51 |  |
| `OrchardBuildFinishedEvent:readStream(streamId: integer, connection: Connection)` | 65 |  |
| `OrchardBuildFinishedEvent:writeStream(streamId: integer, connection: Connection)` | 77 |  |
| `OrchardBuildFinishedEvent:run(connection: Connection)` | 86 |  |
