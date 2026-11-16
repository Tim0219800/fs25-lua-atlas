# animals/events/AnimalCleanEvent.lua

*[Version française](../../../fr/scripts/animals/events/AnimalCleanEvent.md)*

Source: `dataS/scripts/animals/events/AnimalCleanEvent.lua` — FS25 1.25.1.0

✍ Network event that lowers the dirt level of one animal cluster (horse) in a husbandry. It carries the husbandry, the cluster id and a non-negative dirt delta, and applies the change through the cluster's changeDirt when it runs.

- **AnimalCleanEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `AnimalCleanEvent.emptyNew()` | 12 | ✍ Creates an empty event instance, used before reading from a stream. |
| `AnimalCleanEvent.new(husbandry: any, clusterId: any, delta: any)` | 19 | ✍ Creates the event for a husbandry, cluster id and dirt amount (stored as the absolute value of the floored delta). |
| `AnimalCleanEvent:readStream(streamId: any, connection: any)` | 31 | ✍ Reads the husbandry, the cluster id and the delta (bit width AnimalClusterHorse.NUM_BITS_DIRT), then runs the event immediately. |
| `AnimalCleanEvent:writeStream(streamId: any, connection: any)` | 41 | ✍ Writes the husbandry, cluster id and dirt delta to the stream. |
| `AnimalCleanEvent:run(connection: any)` | 49 | ✍ Finds the cluster by id in the husbandry and, if it has changeDirt, reduces its dirt by the delta. Nothing is rebroadcast here. |
