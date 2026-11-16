# internalMods/FS25_precisionFarming/scripts/events/PurchaseSoilMapsEvent.lua

*[Version française](../../../../../fr/scripts/internalMods/FS25_precisionFarming/scripts/events/PurchaseSoilMapsEvent.md)*

Source: `dataS/scripts/internalMods/FS25_precisionFarming/scripts/events/PurchaseSoilMapsEvent.lua` — FS25 1.25.1.0

✍ Network event (subclass of Event) sent by a client to buy the soil maps of a farmland. The server performs the purchase through the soilMap object of g_precisionFarming.

- **PurchaseSoilMapsEvent** inherits from `Event` (l.7)

## Functions

| Function | Line | Description |
|---|---|---|
| `PurchaseSoilMapsEvent.emptyNew() → table` | 14 | ✍ Creates an empty PurchaseSoilMapsEvent instance with the Event metatable; the network layer calls it before readStream fills the fields. |
| `PurchaseSoilMapsEvent.new(farmlandId: table)` | 22 | ✍ Creates the event for a farmland id. |
| `PurchaseSoilMapsEvent:readStream(streamId: integer, connection: Connection)` | 32 | ✍ Server side: reads the farmland id, then calls run. |
| `PurchaseSoilMapsEvent:writeStream(streamId: integer, connection: Connection)` | 41 | ✍ Client side: writes the farmland id. |
| `PurchaseSoilMapsEvent:run(connection: Connection)` | 48 | ✍ Executes only on the server: calls g_precisionFarming.soilMap:purchaseSoilMaps for the farmland, then updatePrecisionFarmingOverlays. Nothing is broadcast here. |
