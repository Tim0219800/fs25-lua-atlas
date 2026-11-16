# internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerDefaultFruitTypeEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerDefaultFruitTypeEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerDefaultFruitTypeEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) that synchronises which default fruit requirement index an extended sprayer uses to compute its application amount.

- **ExtendedSprayerDefaultFruitTypeEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `ExtendedSprayerDefaultFruitTypeEvent.emptyNew() → table` | 14 | ✍ Creates an empty ExtendedSprayerDefaultFruitTypeEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `ExtendedSprayerDefaultFruitTypeEvent.new(object: table, fruitRequirementIndex: integer)` | 23 | ✍ Creates the event for a sprayer object and a fruit requirement index. |
| `ExtendedSprayerDefaultFruitTypeEvent:readStream(streamId: integer, connection: Connection)` | 34 | ✍ Reads the object and the index (FruitTypeManager.SEND_NUM_BITS bits), then calls run. |
| `ExtendedSprayerDefaultFruitTypeEvent:writeStream(streamId: integer, connection: Connection)` | 45 | ✍ Writes the object and the fruit requirement index using FruitTypeManager.SEND_NUM_BITS bits. |
| `ExtendedSprayerDefaultFruitTypeEvent:run(connection: Connection)` | 53 | ✍ Receiving side. On the server it first re-broadcasts the event to the other clients (not the sender); then, if the target object exists and is synchronized, it applies the change locally without sending a new event. It calls object:setSprayAmountDefaultFruitRequirementIndex(index, true). |
| `ExtendedSprayerDefaultFruitTypeEvent.sendEvent(object: table, fruitRequirementIndex: boolean, noEventSend: boolean)` | 67 | ✍ Entry point to sync the default fruit requirement index. Server: broadcasts a new ExtendedSprayerDefaultFruitTypeEvent to the clients (bound to the object); client: sends it to the server. Does nothing when noEventSend is true. |
