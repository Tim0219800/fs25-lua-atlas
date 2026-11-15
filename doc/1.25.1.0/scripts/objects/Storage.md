# objects/Storage.lua

Source: `dataS/scripts/objects/Storage.lua` — FS25 1.25.1.0

- **Storage** inherits from `Object` (l.13)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Storage.registerXMLPaths(schema: any, basePath: any)` | 19 |  |
| `Storage.registerSavegameXMLPaths(schema: any, basePath: any)` | 42 |  |
| `Storage.new(isServer: boolean, isClient: boolean, customMt: table?) → table` | 54 |  |
| `Storage:load(components: table, xmlFile: table, key: string, i3dMappings: table, baseDirectory: any) → boolean` | 74 |  |
| `Storage:delete()` | 214 |  |
| `Storage:readStream(streamId: integer, connection: table)` | 235 |  |
| `Storage:writeStream(streamId: integer, connection: table)` | 251 |  |
| `Storage:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 268 |  |
| `Storage:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 288 |  |
| `Storage:loadFromXMLFile(xmlFile: XMLFile, key: string) → boolean` | 308 |  |
| `Storage:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 345 |  |
| `Storage:empty()` | 362 |  |
| `Storage:updateFillPlanes()` | 373 |  |
| `Storage:getIsFillTypeSupported(fillType: integer) → boolean` | 391 |  |
| `Storage:getFillLevel(fillType: integer) → number` | 399 |  |
| `Storage:getFillLevels()` | 405 |  |
| `Storage:getCapacity(fillType: any)` | 411 |  |
| `Storage:setFillLevel(fillLevel: number, fillType: integer, fillInfo: table)` | 420 |  |
| `Storage:getFreeCapacity(fillType: integer) → number` | 471 |  |
| `Storage:getSupportedFillTypes()` | 506 |  |
| `Storage:hourChanged()` | 512 |  |
| `Storage:addUnloadingStation(station: any)` | 527 |  |
| `Storage:removeUnloadingStation(station: any)` | 533 |  |
| `Storage:addLoadingStation(loadingStation: any)` | 539 |  |
| `Storage:removeLoadingStation(loadingStation: any)` | 545 |  |
| `Storage:farmDestroyed(farmId: any)` | 551 |  |
| `Storage:addFillLevelChangedListeners(func: any)` | 563 |  |
| `Storage:removeFillLevelChangedListeners(func: any)` | 569 |  |
| `Storage:draw()` | 575 |  |

## Messages

- subscribes `MessageType.FARM_DELETED` (l.207)
