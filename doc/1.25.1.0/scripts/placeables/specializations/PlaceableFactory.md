# placeables/specializations/PlaceableFactory.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableFactory.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableFactory.lua` — FS25 1.25.1.0

✍ Placeable specialization for a factory building that consumes configured input fill types over time and, once all are used up, yields a single high-value item (for example a finished machine) sold by the farm. It requires PlaceableSellingStation, reuses its SellingStation, adds a Storage for the inputs, and registers itself as a production-like entry for the production menu. Server drives the progress; clients receive it through the stream. Several methods it registers (updateRemainingAmount, setMeshProgress, createFactoryItem, sellFactoryItem, updateInfo, onUpdate and others) have no body in the SDK dump: UNVERIFIED.

- **PlaceableFactory** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableFactory.prerequisitesPresent(specializations: table) → boolean` | 19 | ✍ Returns true only when the placeable type also has the PlaceableSellingStation specialization. |
| `PlaceableFactory.registerFunctions(placeableType: any)` | 25 | ✍ Registers the factory methods on the placeable type: mesh loading, remaining amount and progress, item creation and selling, capacity and fill level, buy request, player trigger and info data. |
| `PlaceableFactory.registerOverwrittenFunctions(placeableType: any)` | 41 | ✍ Overrides updateInfo and setOwnerFarmId on the placeable type so the factory can add its own info lines and react to ownership changes. |
| `PlaceableFactory.registerEventListeners(placeableType: any)` | 48 | ✍ Subscribes the specialization to load, delete, update, stream read/write, update-stream, finalize-placement and info-trigger enter/leave events. |
| `PlaceableFactory.registerXMLPaths(schema: any, basePath: any)` | 63 | ✍ Declares the XML paths under factory: player trigger, item (link node, i3d file, reward, progressive-visibility meshes), production inputs and output, selling station, storage and active sound. |
| `PlaceableFactory.registerSavegameXMLPaths(schema: any, basePath: any)` | 93 | ✍ Declares the savegame paths: one input entry per fill type with its remaining amount, plus the storage block. |
| `PlaceableFactory:onLoad(savegame: table)` | 103 | ✍ Loads the item i3d asynchronously, builds the Storage and patches the SellingStation (accepts any good, skips selling while a farm owns it). Parses inputs (amount, usagePerHour converted to per second) and the output into a productions entry, creates the player trigger and the sound. |
| `PlaceableFactory:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 340 | ✍ Saves each input's fill type and remaining amount, then the storage content, into the savegame. |
| `PlaceableFactory:loadFromXMLFile(xmlFile: any, key: any)` | 353 | ✍ Restores remaining amounts per input by matching fill type names (through updateRemainingAmount), then loads the storage content. |
| `PlaceableFactory:onReadStream(streamId: any, connection: any)` | 373 | ✍ Client side join: reads the storage object id and state, the has-input-materials flag, the compressed progress and each progressive mesh's hide index, applying them with setMeshProgress. |
| `PlaceableFactory:onWriteStream(streamId: any, connection: any)` | 394 | ✍ Server side counterpart of onReadStream: writes the storage object id and state, registers it in the stream, then the input flag, the progress and the last value of each progressive mesh. |
| `PlaceableFactory:setOwnerFarmId(superFunc: any, farmId: any)` | 520 | ✍ Calls the parent, then shows the player trigger only while the factory is unowned. Outside construction preview it re-registers the factory in the production chain and adds or removes its selling station from the economy and storage systems. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `onMeshI3DFileLoaded` | 26 |
| registerFunction | `updateRemainingAmount` | 27 |
| registerFunction | `setMeshProgress` | 28 |
| registerFunction | `createFactoryItem` | 29 |
| registerFunction | `sellFactoryItem` | 30 |
| registerFunction | `getCapacity` | 31 |
| registerFunction | `getFillLevel` | 32 |
| registerFunction | `removeFillLevel` | 33 |
| registerFunction | `playerTriggerCallback` | 34 |
| registerFunction | `buyRequest` | 35 |
| registerFunction | `updateInfoData` | 36 |
| registerOverwrittenFunction | `updateInfo` | 42 |
| registerOverwrittenFunction | `setOwnerFarmId` | 43 |
| registerEventListener | `onLoad` | 49 |
| registerEventListener | `onDelete` | 50 |
| registerEventListener | `onUpdate` | 51 |
| registerEventListener | `onReadStream` | 52 |
| registerEventListener | `onWriteStream` | 53 |
| registerEventListener | `onReadUpdateStream` | 54 |
| registerEventListener | `onWriteUpdateStream` | 55 |
| registerEventListener | `onFinalizePlacement` | 56 |
| registerEventListener | `onInfoTriggerEnter` | 57 |
| registerEventListener | `onInfoTriggerLeave` | 58 |
