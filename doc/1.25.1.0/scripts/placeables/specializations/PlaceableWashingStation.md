# placeables/specializations/PlaceableWashingStation.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableWashingStation.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableWashingStation.lua` — FS25 1.25.1.0

✍ Placeable specialization that hosts one or more WashingStation objects read from `placeable.washingStation.station(?)`. It creates them on load, registers them at placement, streams them to joining clients and keeps their owner farm in sync with the placeable.

- **PlaceableWashingStation** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableWashingStation.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Always returns true: no prerequisite specialization. |
| `PlaceableWashingStation.registerOverwrittenFunctions(placeableType: any)` | 24 | ✍ Overrides `setOwnerFarmId` on the placeable type. |
| `PlaceableWashingStation.registerEventListeners(placeableType: any)` | 30 | ✍ Subscribes to onLoad, onDelete, onFinalizePlacement, onReadStream and onWriteStream. |
| `PlaceableWashingStation.registerXMLPaths(schema: any, basePath: any)` | 40 | ✍ Declares the washing station XML keys by delegating to `WashingStation.registerXMLPaths` for each `station(?)`. |
| `PlaceableWashingStation:onLoad(savegame: table)` | 49 | ✍ Creates a WashingStation per `station` entry and loads it; stations that fail to load are deleted and dropped. |
| `PlaceableWashingStation:onDelete()` | 65 | ✍ Deletes every washing station object. |
| `PlaceableWashingStation:onFinalizePlacement()` | 77 | ✍ Gives each washing station the placeable owner farm and registers it as a network object. |
| `PlaceableWashingStation:onReadStream(streamId: any, connection: any)` | 89 | ✍ Client side on join: for each station reads its object id, reads its state and finishes its network registration. |
| `PlaceableWashingStation:onWriteStream(streamId: any, connection: any)` | 103 | ✍ Server side on join: for each station writes its object id and state, and registers it in the connection stream. |
| `PlaceableWashingStation:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 117 | ✍ Calls the parent, then copies the new owner farm to every washing station without sending an event. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerOverwrittenFunction | `setOwnerFarmId` | 25 |
| registerEventListener | `onLoad` | 31 |
| registerEventListener | `onDelete` | 32 |
| registerEventListener | `onFinalizePlacement` | 33 |
| registerEventListener | `onReadStream` | 34 |
| registerEventListener | `onWriteStream` | 35 |
