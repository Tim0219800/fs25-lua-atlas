# internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) that propagates a changed Precision Farming setting. A setting is identified by its index (settingIndexNumBits bits) plus a boolean state; only boolean settings are supported.

- **PrecisionFarmingSettingsEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PrecisionFarmingSettingsEvent.emptyNew() → table` | 14 | ✍ Creates an empty PrecisionFarmingSettingsEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `PrecisionFarmingSettingsEvent.new(setting: table)` | 22 | ✍ Creates the event for a setting table. |
| `PrecisionFarmingSettingsEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Reads the setting index and the boolean state, writes the state into the matching setting of g_precisionFarming.precisionFarmingSettings, then calls run. |
| `PrecisionFarmingSettingsEvent:writeStream(streamId: integer, connection: Connection)` | 47 | ✍ Writes the setting index and its state as a boolean (anything other than true is written as false). |
| `PrecisionFarmingSettingsEvent:run(connection: Connection)` | 57 | ✍ Receiving side. The server re-broadcasts to the other clients, then every side calls precisionFarmingSettings:onSettingChanged(setting, true) so no new event is sent. |
| `PrecisionFarmingSettingsEvent.sendEvent(setting: table, noEventSend: boolean)` | 70 | ✍ Entry point to sync a changed setting. Server: broadcasts to all clients; client: sends it to the server. Does nothing when noEventSend is true. |
