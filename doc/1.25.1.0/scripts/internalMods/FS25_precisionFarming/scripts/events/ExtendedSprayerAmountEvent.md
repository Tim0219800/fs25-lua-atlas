# internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerAmountEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerAmountEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/ExtendedSprayerAmountEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) that synchronises the application amount of an extended sprayer: automatic mode on or off and, in manual mode, a value whose width is NitrogenMap.NUM_BITS.

- **ExtendedSprayerAmountEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `ExtendedSprayerAmountEvent.emptyNew() → table` | 14 | ✍ Creates an empty ExtendedSprayerAmountEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `ExtendedSprayerAmountEvent.new(object: table, automaticMode: boolean, manualValue: integer)` | 24 | ✍ Creates the event for a sprayer object, an automatic mode flag and a manual amount value. |
| `ExtendedSprayerAmountEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Reads the object, the automatic flag and, only if automatic is off, the manual value (NitrogenMap.NUM_BITS bits); then calls run. |
| `ExtendedSprayerAmountEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Writes the object and the automatic flag, then the manual value only when automatic mode is off. |
| `ExtendedSprayerAmountEvent:run(connection: Connection)` | 60 | ✍ Receiving side. On the server it first re-broadcasts the event to the other clients (not the sender); then, if the target object exists and is synchronized, it applies the change locally without sending a new event. It calls object:setSprayAmountAutoMode and, in manual mode, object:setSprayAmountManualValue. |
| `ExtendedSprayerAmountEvent.sendEvent(object: table, automaticMode: boolean, manualValue: any, noEventSend: boolean)` | 77 | ✍ Entry point to sync the spray amount. Server: broadcasts a new ExtendedSprayerAmountEvent to the clients (bound to the object); client: sends it to the server. Does nothing when noEventSend is true. |
