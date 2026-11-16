---@meta
-- FS25 1.25.1.0 : player/PlayerSystem.lua (generated stub, FS25 Lua Atlas)

--- Registry of all players of a mission. It keeps lookup tables by index, user id, unique user id, root node and network connection, plus server-side data of players who are not currently in the game, and writes them all to the players savegame XML. The constants `MAX_NUM_SAVED_PLAYERS` and `MAX_NUM_DAYS_OFFLINE` and the constructor are not in this dump (UNVERIFIED).
---@class PlayerSystem
PlayerSystem = {}

--- Server only: creates the players XML file, saves each active player, then the unloaded ones (pruned if the count reaches the maximum), and writes the file. Returns false if the file could not be created, true otherwise.
---@param xmlFilename string
---@return boolean
function PlayerSystem:saveToXMLFile(xmlFilename) end

--- Appends every unloaded player data entry to the XML after the active players, without any pruning. Used when the total stays under the saved-player limit.
---@param xmlFile XMLFile
---@param baseKey string
function PlayerSystem:saveUnloadedPlayers(xmlFile, baseKey) end

--- Saves unloaded players sorted by most recent connection. Past the limit, it stops at the first player whose last connection is older than the allowed offline days and logs how many were dropped.
---@param xmlFile XMLFile
---@param baseKey string
function PlayerSystem:saveHugeUnloadedPlayers(xmlFile, baseKey) end

--- Per-frame draw hook: calls `drawUIInfo` on every non-deleted player, and renders animation or sound debug columns for all players when `DEBUG_ANIMATIONS` or `DEBUG_SOUNDS` is set.
function PlayerSystem:draw() end

--- Returns true if a player with this unique id is active; on the server, unloaded player data is also checked. A nil id gives false.
---@param uniqueId string
---@return boolean
function PlayerSystem:getHasPlayerWithUniqueId(uniqueId) end

--- Returns true if the player is non-nil, has a unique user id and is registered under it as an active player.
---@param player Player
---@return boolean
function PlayerSystem:getIsPlayerAdded(player) end

--- Returns the number of active players, excluding those who only exist as unloaded data.
---@return integer
function PlayerSystem:getPlayerCount() end

--- Returns the active player at the given list index, or nil.
---@param index integer
---@return Player
function PlayerSystem:getPlayerByIndex(index) end

--- Returns the active player registered under this unique user id, or nil.
---@param uniqueId string
---@return Player
function PlayerSystem:getPlayerByUniqueId(uniqueId) end

--- Returns the active player with the given session user id, or nil.
---@param userId string
---@return Player
function PlayerSystem:getPlayerByUserId(userId) end

--- Returns the player whose root scene node is the given node, or nil.
---@param rootNode integer
---@return Player
function PlayerSystem:getPlayerByRootNode(rootNode) end

--- Returns the player associated with the given network connection, or nil.
---@param connection Connection
---@return Player
function PlayerSystem:getPlayerByConnection(connection) end

--- Server only: returns the saved data of an unloaded player for this unique id; on clients always returns nil.
---@param uniqueId string
---@return table?
function PlayerSystem:getPlayerDataByUniqueId(uniqueId) end

--- Registers a player in the list and the by-user-id, by-root-node, by-connection and by-unique-id tables, removes any matching unloaded data on the server, and sets it as local player if it is the owner. Returns false if the user id already exists (error logged if it is another object).
---@param player Player
---@return boolean
function PlayerSystem:addPlayer(player) end

--- Debug helper that calls `debugDraw` on each player, shifting the x position by 0.2 for each one.
---@param x number
---@param y number
---@param textSize number
function PlayerSystem:debugDrawAllPlayers(x, y, textSize) end
