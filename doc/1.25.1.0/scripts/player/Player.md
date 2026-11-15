# player/Player.lua

Source : `dataS/scripts/player/Player.lua` — FS25 1.25.1.0

- **Player** hérite de `Object` (l.23)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `Player.createServerInstance(isClient: boolean, isOwner: boolean, connection: Connection, userId: integer, farmId: integer, userManager: UserManager) → Player` | 209 |  |
| `Player.new(isServer: boolean, isClient: boolean) → Player` | 271 |  |
| `Player:initialise(connection: Connection, isOwner: boolean)` | 392 |  |
| `Player:load(playerData: table?)` | 504 |  |
| `Player:delete()` | 586 |  |
| `Player:writeStream(streamId: integer, connection: Connection)` | 700 |  |
| `Player:readStream(streamId: integer, connection: Connection, objectId: integer)` | 731 |  |
| `Player:writeUpdateStream(streamId: integer, connection: Connection, dirtyMask: integer)` | 776 |  |
| `Player:readUpdateStream(streamId: integer, timestamp: integer, connection: Connection)` | 789 |  |
| `Player:update(dt: number)` | 818 |  |
| `Player:updateTick(dt: number)` | 860 |  |
| `Player:getUniqueUserId() → string?` | 1015 |  |
| `Player:setUniqueUserId(uniqueUserId: string)` | 1026 |  |
| `Player:onPickupHandTool(handTool: any)` | 1098 |  |
| `Player:onDropHandTool(handTool: any)` | 1111 |  |
| `Player:getCanPickupHandTool(handTool: any)` | 1136 |  |
| `Player:getIsHoldingHandTool() → boolean` | 1311 |  |
| `Player:getIsCarryingHandTool(handTool: HandTool) → boolean` | 1335 |  |
| `Player:getCarriedHandToolMass() → number` | 1342 |  |
| `Player:getMapPositionAndLookYaw() → number, number, number` | 1357 |  |
| `Player:updateControlledState(isControlled: boolean, skipModel: any, skipMover: any)` | 1857 |  |
| `Player:findSpawnPositionAndYaw() → number, number, number, number` | 1889 |  |
| `Player:findEmptyAreaAroundPosition(x: number, y: number, z: number) → number, number, number` | 1933 |  |
| `Player:getHasSpawnPosition() → boolean` | 1970 |  |
| `Player:getSpawnPosition() → number?, number?, number?` | 1979 |  |
| `Player:getHasSpawnYaw() → boolean` | 1998 |  |
| `Player:getSpawnYaw() → number?` | 2005 |  |
| `Player:setSpawnYaw(spawnYaw: number?)` | 2012 |  |
| `Player:getMovementYaw() → number` | 2047 |  |
| `Player:show(skipShowingModel: any, skipEnablingMover: any, ignoreLocalCheck: any)` | 2154 |  |
| `Player:debugDraw(x: number, y: number, textSize: number) → number` | 2665 |  |

## Messages

- écoute `MessageType.PLAYER_FARM_CHANGED` (l.407)
- publie `MessageType.OWN_PLAYER_ENTERED` (l.2189)
