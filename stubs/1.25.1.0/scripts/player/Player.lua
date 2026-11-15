---@meta
-- FS25 1.25.1.0 : player/Player.lua (stub généré, atlas Lua FS25)

---@class Player : Object
Player = {}

---@param isClient boolean
---@param isOwner boolean
---@param connection Connection
---@param userId integer
---@param farmId integer
---@param userManager UserManager
---@return Player
function Player.createServerInstance(isClient, isOwner, connection, userId, farmId, userManager) end

---@param isServer boolean
---@param isClient boolean
---@return Player
function Player.new(isServer, isClient) end

---@param connection Connection
---@param isOwner boolean
function Player:initialise(connection, isOwner) end

---@param playerData table?
function Player:load(playerData) end

function Player:delete() end

---@param streamId integer
---@param connection Connection
function Player:writeStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
---@param objectId integer
function Player:readStream(streamId, connection, objectId) end

---@param streamId integer
---@param connection Connection
---@param dirtyMask integer
function Player:writeUpdateStream(streamId, connection, dirtyMask) end

---@param streamId integer
---@param timestamp integer
---@param connection Connection
function Player:readUpdateStream(streamId, timestamp, connection) end

---@param dt number
function Player:update(dt) end

---@param dt number
function Player:updateTick(dt) end

---@return string?
function Player:getUniqueUserId() end

---@param uniqueUserId string
function Player:setUniqueUserId(uniqueUserId) end

---@param handTool any
function Player:onPickupHandTool(handTool) end

---@param handTool any
function Player:onDropHandTool(handTool) end

---@param handTool any
function Player:getCanPickupHandTool(handTool) end

---@return boolean
function Player:getIsHoldingHandTool() end

---@param handTool HandTool
---@return boolean
function Player:getIsCarryingHandTool(handTool) end

---@return number
function Player:getCarriedHandToolMass() end

---@return number
---@return number
---@return number
function Player:getMapPositionAndLookYaw() end

---@param isControlled boolean
---@param skipModel any
---@param skipMover any
function Player:updateControlledState(isControlled, skipModel, skipMover) end

---@return number
---@return number
---@return number
---@return number
function Player:findSpawnPositionAndYaw() end

---@param x number
---@param y number
---@param z number
---@return number
---@return number
---@return number
function Player:findEmptyAreaAroundPosition(x, y, z) end

---@return boolean
function Player:getHasSpawnPosition() end

---@return number?
---@return number?
---@return number?
function Player:getSpawnPosition() end

---@return boolean
function Player:getHasSpawnYaw() end

---@return number?
function Player:getSpawnYaw() end

---@param spawnYaw number?
function Player:setSpawnYaw(spawnYaw) end

---@return number
function Player:getMovementYaw() end

---@param skipShowingModel any
---@param skipEnablingMover any
---@param ignoreLocalCheck any
function Player:show(skipShowingModel, skipEnablingMover, ignoreLocalCheck) end

---@param x number
---@param y number
---@param textSize number
---@return number
function Player:debugDraw(x, y, textSize) end
