---@meta
-- FS25 1.25.1.0 : player/PlayerSystem.lua (stub généré, atlas Lua FS25)

---@class PlayerSystem
PlayerSystem = {}

---@param xmlFilename string
---@return boolean
function PlayerSystem:saveToXMLFile(xmlFilename) end

---@param xmlFile XMLFile
---@param baseKey string
function PlayerSystem:saveUnloadedPlayers(xmlFile, baseKey) end

---@param xmlFile XMLFile
---@param baseKey string
function PlayerSystem:saveHugeUnloadedPlayers(xmlFile, baseKey) end

function PlayerSystem:draw() end

---@param uniqueId string
---@return boolean
function PlayerSystem:getHasPlayerWithUniqueId(uniqueId) end

---@param player Player
---@return boolean
function PlayerSystem:getIsPlayerAdded(player) end

---@return integer
function PlayerSystem:getPlayerCount() end

---@param index integer
---@return Player
function PlayerSystem:getPlayerByIndex(index) end

---@param uniqueId string
---@return Player
function PlayerSystem:getPlayerByUniqueId(uniqueId) end

---@param userId string
---@return Player
function PlayerSystem:getPlayerByUserId(userId) end

---@param rootNode integer
---@return Player
function PlayerSystem:getPlayerByRootNode(rootNode) end

---@param connection Connection
---@return Player
function PlayerSystem:getPlayerByConnection(connection) end

---@param uniqueId string
---@return table?
function PlayerSystem:getPlayerDataByUniqueId(uniqueId) end

---@param player Player
---@return boolean
function PlayerSystem:addPlayer(player) end

---@param x number
---@param y number
---@param textSize number
function PlayerSystem:debugDrawAllPlayers(x, y, textSize) end
