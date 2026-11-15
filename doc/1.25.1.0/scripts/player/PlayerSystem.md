# player/PlayerSystem.lua

Source : `dataS/scripts/player/PlayerSystem.lua` — FS25 1.25.1.0

- **PlayerSystem** (l.12)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `PlayerSystem:saveToXMLFile(xmlFilename: string) → boolean` | 118 |  |
| `PlayerSystem:saveUnloadedPlayers(xmlFile: XMLFile, baseKey: string)` | 153 |  |
| `PlayerSystem:saveHugeUnloadedPlayers(xmlFile: XMLFile, baseKey: string)` | 172 |  |
| `PlayerSystem:draw()` | 306 |  |
| `PlayerSystem:getHasPlayerWithUniqueId(uniqueId: string) → boolean` | 389 |  |
| `PlayerSystem:getIsPlayerAdded(player: Player) → boolean` | 401 |  |
| `PlayerSystem:getPlayerCount() → integer` | 408 |  |
| `PlayerSystem:getPlayerByIndex(index: integer) → Player` | 416 |  |
| `PlayerSystem:getPlayerByUniqueId(uniqueId: string) → Player` | 424 |  |
| `PlayerSystem:getPlayerByUserId(userId: string) → Player` | 432 |  |
| `PlayerSystem:getPlayerByRootNode(rootNode: integer) → Player` | 440 |  |
| `PlayerSystem:getPlayerByConnection(connection: Connection) → Player` | 448 |  |
| `PlayerSystem:getPlayerDataByUniqueId(uniqueId: string) → table?` | 456 |  |
| `PlayerSystem:addPlayer(player: Player) → boolean` | 502 |  |
| `PlayerSystem:debugDrawAllPlayers(x: number, y: number, textSize: number)` | 623 |  |
