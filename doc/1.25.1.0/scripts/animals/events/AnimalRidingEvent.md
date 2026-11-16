# animals/events/AnimalRidingEvent.lua

*[Version française](../../../fr/scripts/animals/events/AnimalRidingEvent.md)*

Source: `dataS/scripts/animals/events/AnimalRidingEvent.lua` — FS25 1.25.1.0

✍ Network event requesting that a player start riding an animal cluster (horse) of a husbandry. On run it simply calls startRiding on the husbandry; no rebroadcast is done in this file.

- **AnimalRidingEvent** inherits from `Event` (l.6)

## Functions

| Function | Line | Description |
|---|---|---|
| `AnimalRidingEvent.emptyNew()` | 12 | ✍ Creates an empty event instance, used before reading from a stream. |
| `AnimalRidingEvent.new(husbandry: any, clusterId: any, player: any)` | 19 | ✍ Creates the event for a husbandry, cluster id and player. |
| `AnimalRidingEvent:readStream(streamId: any, connection: any)` | 31 | ✍ Reads the husbandry, cluster id and player, then runs the event. |
| `AnimalRidingEvent:writeStream(streamId: any, connection: any)` | 41 | ✍ Writes the husbandry, cluster id and player to the stream. |
| `AnimalRidingEvent:run(connection: any)` | 49 | ✍ Calls startRiding on the husbandry with the cluster id and player. There is no nil check on the husbandry. |
