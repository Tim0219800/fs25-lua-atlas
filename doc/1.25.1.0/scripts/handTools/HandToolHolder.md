# handTools/HandToolHolder.lua

Source: `dataS/scripts/handTools/HandToolHolder.lua` — FS25 1.25.1.0

- **HandToolHolder** inherits from `Object` (l.13)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `HandToolHolder.registerXMLPaths(schema: any, basePath: any)` | 17 |  |
| `HandToolHolder.registerSavegameXMLPaths(schema: any, basePath: any)` | 34 |  |
| `HandToolHolder.new(parent: any, isServer: any, isClient: any, customMt: any)` | 40 |  |
| `HandToolHolder:load(xmlFile: any, key: any, callback: any, callbackTarget: any, callbackArgs: any, components: any, i3dMappings: any, baseDirectory: any, customEnv: any)` | 53 |  |
| `HandToolHolder:onDummyHandToolI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 110 |  |
| `HandToolHolder:onSpawnedHandToolLoaded(handTool: any, loadingState: any)` | 121 |  |
| `HandToolHolder:onFinishedLoading()` | 149 |  |
| `HandToolHolder:delete()` | 161 |  |
| `HandToolHolder:saveToXMLFile(xmlFile: any, key: any)` | 201 |  |
| `HandToolHolder:loadFromXMLFile(xmlFile: any, key: any)` | 207 |  |
| `HandToolHolder:writeStream(streamId: integer, connection: Connection)` | 218 |  |
| `HandToolHolder:readStream(streamId: integer, connection: Connection, objectId: integer)` | 234 |  |
| `HandToolHolder:register(alreadySent: any)` | 247 |  |
| `HandToolHolder:getUniqueId() → string` | 260 |  |
| `HandToolHolder:setUniqueId(uniqueId: string)` | 267 |  |
| `HandToolHolder:getHolderName()` | 275 |  |
| `HandToolHolder:setHolderName(name: any)` | 281 |  |
| `HandToolHolder:getHandTool()` | 287 |  |
| `HandToolHolder:getSpawnedHandTool()` | 293 |  |
| `HandToolHolder:getSpawnsHandTool()` | 299 |  |
| `HandToolHolder:getHolderNodePair(handTool: any)` | 305 |  |
| `HandToolHolder:getCanPickupHandToolFromMenu(handTool: any)` | 322 |  |
| `HandToolHolder:getCanPickupHandTool(handTool: any)` | 328 |  |
| `HandToolHolder:onPickupHandTool(handTool: any)` | 355 |  |
| `HandToolHolder:setPlayerInRange(isInRange: any)` | 393 |  |
| `HandToolHolder:updateDummyHandTool()` | 400 |  |
| `HandToolHolder:onDropHandTool(handTool: any)` | 409 |  |
| `HandToolHolder:drawDebug()` | 430 |  |
| `HandToolHolder:setOwnerFarmId(farmId: any, noEventSend: any)` | 443 |  |
| `HandToolHolder:setStoreCallback(storeCallback: any)` | 453 |  |
| `HandToolHolder:setPickupCallback(pickupCallback: any)` | 459 |  |
| `HandToolHolder:onPlayerCallback(triggerId: any, otherId: any, onEnter: any, onLeave: any, onStay: any)` | 465 |  |
