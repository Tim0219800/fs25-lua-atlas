# animals/Dog.lua

Source: `dataS/scripts/animals/Dog.lua` — FS25 1.25.1.0

- **Dog** inherits from `Object` (l.16)

## Functions

| Function | Line | Description (FR) |
|---|---|---|
| `Dog.new(isServer: any, isClient: any, customMt: any) → table` | 38 |  |
| `Dog:load(spawner: any, xmlFilename: any, spawnX: any, spawnY: any, spawnZ: any)` | 72 |  |
| `Dog:delete()` | 106 |  |
| `Dog:loadFromXMLFile(xmlFile: XMLFile, key: string, resetVehicles: boolean) → boolean` | 130 |  |
| `Dog:saveToXMLFile(xmlFile: table, key: string, usedModNames: table)` | 141 |  |
| `Dog:readStream(streamId: integer, connection: table)` | 149 |  |
| `Dog:writeStream(streamId: integer, connection: table)` | 180 |  |
| `Dog:writeUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 199 |  |
| `Dog:readUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 210 |  |
| `Dog:update(dt: number)` | 219 |  |
| `Dog:updateTick(dt: number)` | 245 |  |
| `Dog:testScope(x: number, y: number, z: number, coeff: number, isGuiVisible: any) → boolean` | 261 |  |
| `Dog:getUpdatePriority(skipCount: number, x: number, y: number, z: number, coeff: number, connection: table, isGuiVisible: any) → number` | 277 |  |
| `Dog:onGhostRemove()` | 291 |  |
| `Dog:onGhostAdd()` | 297 |  |
| `Dog:hourChanged()` | 303 |  |
| `Dog:setName(name: any)` | 315 |  |
| `Dog:setVisibility(state: any)` | 321 |  |
| `Dog:playerInteractionTriggerCallback(triggerId: integer, otherId: integer, onEnter: boolean, onLeave: boolean, onStay: boolean)` | 335 |  |
| `Dog:followEntity(player: integer)` | 352 |  |
| `Dog:goToSpawn()` | 373 |  |
| `Dog:onFoodBowlFilled(foodBowlNode: any)` | 386 |  |
| `Dog:fetchItem(player: object, ball: any)` | 395 |  |
| `Dog:pet()` | 408 |  |
| `Dog:idleStay()` | 423 |  |
| `Dog:idleWander()` | 433 |  |
| `Dog:setTextureTileIndices(tileIndexU: integer, tileIndexV: integer)` | 443 |  |
| `Dog:applyTextureTile()` | 463 |  |
| `Dog:isAbandoned(dt: any)` | 470 |  |
| `Dog:resetSteeringParms()` | 510 |  |
| `Dog:teleportToSpawn()` | 517 |  |
| `Dog:playerFarmChanged(player: any)` | 533 |  |
| `Dog:onPlayerLeave(player: any)` | 543 |  |
| `Dog:finalizePlacement()` | 554 |  |
| `Dog:onIndoorStateChanged(isIndoor: any)` | 565 |  |
| `Dog.registerSavegameXMLPaths(schema: any, basePath: any)` | 571 |  |

## Messages

- subscribes `MessageType.HOUR_CHANGED` (l.558)
- subscribes `MessageType.PLAYER_FARM_CHANGED` (l.559)
