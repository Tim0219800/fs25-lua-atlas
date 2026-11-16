# vehicles/specializations/events/ConsumableRefillEvent.lua

*[Version française](../../../../fr/scripts/vehicles/specializations/events/ConsumableRefillEvent.md)*

Source: `dataS/scripts/vehicles/specializations/events/ConsumableRefillEvent.lua` — FS25 1.25.1.0

✍ Network event class `ConsumableRefillEvent` (extends `Event`) that requests a refill of the consumable storage and consuming slots of a vehicle, charging the farm. It carries the vehicle, a consumable type index (uint8) and a variation index (`ConsumableManager.NUM_VARIATION_BITS` bits). It belongs to the vehicle specialization events and defines nothing else.

- **ConsumableRefillEvent** inherits from `Event` (l.13)

## Functions

| Function | Line | Description |
|---|---|---|
| `ConsumableRefillEvent.emptyNew() → table` | 20 | ✍ Creates an empty `ConsumableRefillEvent` instance without data, used when the event is read from a network stream. |
| `ConsumableRefillEvent.new(object: table, typeIndex: table, variationIndex: any) → table` | 30 | ✍ Creates the event with its data: the vehicle, a consumable type index (uint8) and a variation index (`ConsumableManager.NUM_VARIATION_BITS` bits). |
| `ConsumableRefillEvent:readStream(streamId: integer, connection: Connection)` | 43 | ✍ Reads the event data from the network stream (the vehicle, a consumable type index (uint8) and a variation index (`ConsumableManager.NUM_VARIATION_BITS` bits)), then calls `run`. |
| `ConsumableRefillEvent:writeStream(streamId: integer, connection: Connection)` | 57 | ✍ Writes the event data to the network stream (the vehicle, a consumable type index (uint8) and a variation index (`ConsumableManager.NUM_VARIATION_BITS` bits)). |
| `ConsumableRefillEvent:run(connection: Connection)` | 66 | ✍ Executes the event on the receiving side: sets the consuming variation, adds fill levels to the storage and consuming slots, then charges expenses and money (`MoneyType.PURCHASE_CONSUMABLES`) from the variation price when positive. |
| `ConsumableRefillEvent.sendEvent(vehicle: table, typeIndex: integer, variationIndex: integer)` | 94 | ✍ Helper that sends the event: the server broadcasts it, a client sends it to the server. It has no `noEventSend` parameter. |
