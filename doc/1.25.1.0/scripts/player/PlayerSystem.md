# player/PlayerSystem.lua

*[Version française](../../fr/scripts/player/PlayerSystem.md)*

Source: `dataS/scripts/player/PlayerSystem.lua` — FS25 1.25.1.0

✍ Registry of all players of a mission. It keeps lookup tables by index, user id, unique user id, root node and network connection, plus server-side data of players who are not currently in the game, and writes them all to the players savegame XML. The constants `MAX_NUM_SAVED_PLAYERS` and `MAX_NUM_DAYS_OFFLINE` and the constructor are not in this dump (UNVERIFIED).

- **PlayerSystem** (l.12)

## Functions

| Function | Line | Description |
|---|---|---|
| `PlayerSystem:saveToXMLFile(xmlFilename: string) → boolean` | 118 | ✍ Server only: creates the players XML file, saves each active player, then the unloaded ones (pruned if the count reaches the maximum), and writes the file. Returns false if the file could not be created, true otherwise. |
| `PlayerSystem:saveUnloadedPlayers(xmlFile: XMLFile, baseKey: string)` | 153 | ✍ Appends every unloaded player data entry to the XML after the active players, without any pruning. Used when the total stays under the saved-player limit. |
| `PlayerSystem:saveHugeUnloadedPlayers(xmlFile: XMLFile, baseKey: string)` | 172 | ✍ Saves unloaded players sorted by most recent connection. Past the limit, it stops at the first player whose last connection is older than the allowed offline days and logs how many were dropped. |
| `PlayerSystem:draw()` | 306 | ✍ Per-frame draw hook: calls `drawUIInfo` on every non-deleted player, and renders animation or sound debug columns for all players when `DEBUG_ANIMATIONS` or `DEBUG_SOUNDS` is set. |
| `PlayerSystem:getHasPlayerWithUniqueId(uniqueId: string) → boolean` | 389 | ✍ Returns true if a player with this unique id is active; on the server, unloaded player data is also checked. A nil id gives false. |
| `PlayerSystem:getIsPlayerAdded(player: Player) → boolean` | 401 | ✍ Returns true if the player is non-nil, has a unique user id and is registered under it as an active player. |
| `PlayerSystem:getPlayerCount() → integer` | 408 | ✍ Returns the number of active players, excluding those who only exist as unloaded data. |
| `PlayerSystem:getPlayerByIndex(index: integer) → Player` | 416 | ✍ Returns the active player at the given list index, or nil. |
| `PlayerSystem:getPlayerByUniqueId(uniqueId: string) → Player` | 424 | ✍ Returns the active player registered under this unique user id, or nil. |
| `PlayerSystem:getPlayerByUserId(userId: string) → Player` | 432 | ✍ Returns the active player with the given session user id, or nil. |
| `PlayerSystem:getPlayerByRootNode(rootNode: integer) → Player` | 440 | ✍ Returns the player whose root scene node is the given node, or nil. |
| `PlayerSystem:getPlayerByConnection(connection: Connection) → Player` | 448 | ✍ Returns the player associated with the given network connection, or nil. |
| `PlayerSystem:getPlayerDataByUniqueId(uniqueId: string) → table?` | 456 | ✍ Server only: returns the saved data of an unloaded player for this unique id; on clients always returns nil. |
| `PlayerSystem:addPlayer(player: Player) → boolean` | 502 | ✍ Registers a player in the list and the by-user-id, by-root-node, by-connection and by-unique-id tables, removes any matching unloaded data on the server, and sets it as local player if it is the owner. Returns false if the user id already exists (error logged if it is another object). |
| `PlayerSystem:debugDrawAllPlayers(x: number, y: number, textSize: number)` | 623 | ✍ Debug helper that calls `debugDraw` on each player, shifting the x position by 0.2 for each one. |
