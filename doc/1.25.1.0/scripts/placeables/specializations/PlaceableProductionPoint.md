# placeables/specializations/PlaceableProductionPoint.lua

*[Version française](../../../fr/scripts/placeables/specializations/PlaceableProductionPoint.md)*

Source: `dataS/scripts/placeables/specializations/PlaceableProductionPoint.lua` — FS25 1.25.1.0

✍ Placeable specialization that wraps a ProductionPoint object (production chains with input/output storage, loading and unloading stations). It requires PlaceableInfoTrigger, supports a configuration per XML (productionPointConfigurations), a not-yet-finalized state for constructible buildings, network streaming of the production point, savegame forwarding, and a limit on production points via g_currentMission.productionChainManager. It raises onOutputFillTypesChanged and onProductionStatusChanged.

- **PlaceableProductionPoint** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlaceableProductionPoint.prerequisitesPresent(specializations: table) → boolean` | 18 | ✍ Requires the PlaceableInfoTrigger specialization to be present. |
| `PlaceableProductionPoint.registerEvents(placeableType: any)` | 24 | ✍ Registers the events onOutputFillTypesChanged and onProductionStatusChanged on the placeable type. |
| `PlaceableProductionPoint.registerFunctions(placeableType: any)` | 31 | ✍ Registers outputsChanged and productionStatusChanged, which the ProductionPoint calls to notify its placeable. |
| `PlaceableProductionPoint.registerOverwrittenFunctions(placeableType: any)` | 38 | ✍ Overrides setOwnerFarmId, collectPickObjects, canBuy, updateInfo and finalizeConstruction (the last is registered here but not defined in this file's dump, UNVERIFIED). |
| `PlaceableProductionPoint.registerEventListeners(placeableType: any)` | 48 | ✍ Subscribes to onLoad, onDelete, onFinalizePlacement, onWriteStream, onReadStream and onBuy. |
| `PlaceableProductionPoint.registerXMLPaths(schema: any, basePath: any)` | 59 | ✍ Declares the production point XML at placeable.productionPoint and inside each productionPointConfiguration, adding an isFinalized flag for constructible buildings. |
| `PlaceableProductionPoint.registerSavegameXMLPaths(schema: any, basePath: any)` | 77 | ✍ Registers the savegame XML paths by delegating to ProductionPoint.registerSavegameXMLPaths. |
| `PlaceableProductionPoint.initSpecialization()` | 85 | ✍ Adds the shop spec types prodPointInputFillTypes and prodPointOutputFillTypes for placeables and registers the productionPoint configuration type with g_placeableConfigurationManager. |
| `PlaceableProductionPoint:onLoad(savegame: table)` | 94 | ✍ Picks the XML node of the selected configuration (falling back to placeable.productionPoint), creates and loads the ProductionPoint. If isFinalized is false, it hides the station from the prices menu and disables missions; on load failure it sets the loading state to ERROR. |
| `PlaceableProductionPoint:onDelete()` | 123 | ✍ Deletes the production point and clears the reference. |
| `PlaceableProductionPoint:onFinalizePlacement()` | 134 | ✍ Registers the production point, sets its owner (AccessHandler.EVERYONE if not finalized), finds storage extensions and updates effects. Disables the interaction trigger for buying if the placeable has a buying trigger. |
| `PlaceableProductionPoint:updateInfo(superFunc: any, infoTable: any)` | 163 | ✍ Calls the parent updateInfo, then lets the production point add its own lines to the info table. |
| `PlaceableProductionPoint:outputsChanged(outputs: any, state: any)` | 171 | ✍ Raises the placeable event onOutputFillTypesChanged with the outputs and the state. |
| `PlaceableProductionPoint:productionStatusChanged(production: any, status: any)` | 177 | ✍ Raises the placeable event onProductionStatusChanged with the production and its status. |
| `PlaceableProductionPoint:onReadStream(streamId: any, connection: any)` | 183 | ✍ Client side of the initial sync: reads the production point's object id, its stream data, then completes the object registration with g_client. |
| `PlaceableProductionPoint:onWriteStream(streamId: any, connection: any)` | 194 | ✍ Server side of the initial sync: writes the production point's object id and data, and registers the object in the stream for that connection. |
| `PlaceableProductionPoint:loadFromXMLFile(xmlFile: any, key: any)` | 205 | ✍ Forwards savegame loading to the production point. |
| `PlaceableProductionPoint:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 214 | ✍ Forwards savegame saving to the production point. |
| `PlaceableProductionPoint:setOwnerFarmId(superFunc: any, farmId: any, noEventSend: any)` | 223 | ✍ Calls the parent, then gives the production point the owner (EVERYONE while not finalized). If not finalized, also removes it from the productionChainManager. |
| `PlaceableProductionPoint:collectPickObjects(superFunc: any, node: any)` | 242 | ✍ Skips adding the node to pick objects when it is a load trigger node or an unloading trigger's exact fill root node; otherwise defers to the parent. |
| `PlaceableProductionPoint:canBuy(superFunc: any)` | 265 | ✍ Returns false with a warning text when productionChainManager has no free slot; otherwise returns the parent result. |
| `PlaceableProductionPoint:onBuy()` | 276 | ✍ Counts production points owned by the current farm and passes the count to g_achievementManager under NumProductionPoints. Note: it counts every owned placeable with this specialization, finalized or not. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onOutputFillTypesChanged` | 25 |
| registerEvent | `onProductionStatusChanged` | 26 |
| registerFunction | `outputsChanged` | 32 |
| registerFunction | `productionStatusChanged` | 33 |
| registerOverwrittenFunction | `setOwnerFarmId` | 39 |
| registerOverwrittenFunction | `collectPickObjects` | 40 |
| registerOverwrittenFunction | `canBuy` | 41 |
| registerOverwrittenFunction | `updateInfo` | 42 |
| registerOverwrittenFunction | `finalizeConstruction` | 43 |
| registerEventListener | `onLoad` | 49 |
| registerEventListener | `onDelete` | 50 |
| registerEventListener | `onFinalizePlacement` | 51 |
| registerEventListener | `onWriteStream` | 52 |
| registerEventListener | `onReadStream` | 53 |
| registerEventListener | `onBuy` | 54 |
