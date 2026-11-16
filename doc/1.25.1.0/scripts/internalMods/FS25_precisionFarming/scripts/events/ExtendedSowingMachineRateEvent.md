# internalMods/FS25_precisionFarming/scripts/events/ExtendedSowingMachineRateEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/ExtendedSowingMachineRateEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/ExtendedSowingMachineRateEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) that synchronises the seed rate setting of an extended sowing machine: automatic mode on or off and, in manual mode, a 2 bit rate value.

- **ExtendedSowingMachineRateEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `ExtendedSowingMachineRateEvent.emptyNew() → table` | 14 | ✍ Creates an empty ExtendedSowingMachineRateEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `ExtendedSowingMachineRateEvent.new(object: table, automaticMode: boolean, manualValue: integer)` | 24 | ✍ Creates the event for a machine object, an automatic mode flag and a manual rate value. |
| `ExtendedSowingMachineRateEvent:readStream(streamId: integer, connection: Connection)` | 36 | ✍ Reads the object, the automatic flag and, only if automatic is off, the 2 bit manual value; then calls run. |
| `ExtendedSowingMachineRateEvent:writeStream(streamId: integer, connection: Connection)` | 50 | ✍ Writes the object and the automatic flag, followed by the 2 bit manual value only when automatic mode is off. |
| `ExtendedSowingMachineRateEvent:run(connection: Connection)` | 60 | ✍ Receiving side. On the server it first re-broadcasts the event to the other clients (not the sender); then, if the target object exists and is synchronized, it applies the change locally without sending a new event. It calls object:setSeedRateAutoMode and, in manual mode, object:setManualSeedRate. |
| `ExtendedSowingMachineRateEvent.sendEvent(object: table, automaticMode: boolean, manualValue: any, noEventSend: boolean)` | 77 | ✍ Entry point to sync the seed rate. Server: broadcasts a new ExtendedSowingMachineRateEvent to the clients (bound to the object); client: sends it to the server. Does nothing when noEventSend is true. |
