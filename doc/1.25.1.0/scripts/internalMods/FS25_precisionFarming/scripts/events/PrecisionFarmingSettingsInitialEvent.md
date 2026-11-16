# internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsInitialEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsInitialEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/PrecisionFarmingSettingsInitialEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) that sends the current values of all server-side Precision Farming settings to a client, typically when it joins. Settings flagged isServerSetting are written as one boolean each, in list order.

- **PrecisionFarmingSettingsInitialEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PrecisionFarmingSettingsInitialEvent.emptyNew() → table` | 14 | ✍ Creates an empty PrecisionFarmingSettingsInitialEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `PrecisionFarmingSettingsInitialEvent.new(settings: table)` | 22 | ✍ Creates the event with the settings list to send. |
| `PrecisionFarmingSettingsInitialEvent:readStream(streamId: integer, connection: Connection)` | 33 | ✍ Client side: reads one boolean per server setting into setting.state, in order, then calls run. |
| `PrecisionFarmingSettingsInitialEvent:writeStream(streamId: integer, connection: Connection)` | 49 | ✍ Server side: writes one boolean per server setting, in list order. The order must match readStream. |
| `PrecisionFarmingSettingsInitialEvent:run(connection: Connection)` | 62 | ✍ Calls onSettingChanged(setting, true) on the settings object for every server setting so the client applies the received values. |
