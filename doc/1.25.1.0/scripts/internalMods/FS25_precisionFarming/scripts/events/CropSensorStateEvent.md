# internalMods/FS25_precisionFarming/scripts/events/CropSensorStateEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/CropSensorStateEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/CropSensorStateEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) that synchronises the on/off state of a crop sensor on a vehicle between clients and server. A client sends it to the server, which re-broadcasts it.

- **CropSensorStateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `CropSensorStateEvent.emptyNew() → table` | 14 | ✍ Creates an empty CropSensorStateEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `CropSensorStateEvent.new(object: table, state: boolean)` | 23 | ✍ Creates the event for a vehicle object and a boolean sensor state. |
| `CropSensorStateEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the network object reference and the boolean state, then calls run. |
| `CropSensorStateEvent:writeStream(streamId: integer, connection: Connection)` | 44 | ✍ Writes the network object reference and the boolean state. |
| `CropSensorStateEvent:run(connection: Connection)` | 52 | ✍ Receiving side. On the server it first re-broadcasts the event to the other clients (not the sender); then, if the target object exists and is synchronized, it applies the change locally without sending a new event. The change is applied with object:setCropSensorActive(state, true). |
| `CropSensorStateEvent.sendEvent(object: table, state: boolean, noEventSend: boolean)` | 67 | ✍ Entry point to sync the crop sensor state. Server: broadcasts a new CropSensorStateEvent to the clients (bound to the object); client: sends it to the server. Does nothing when noEventSend is true. |
