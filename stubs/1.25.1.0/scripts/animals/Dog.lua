---@meta
-- FS25 1.25.1.0 : animals/Dog.lua (stub généré, atlas Lua FS25)

---@class Dog : Object
Dog = {}

---@param isServer any
---@param isClient any
---@param customMt any
---@return table
function Dog.new(isServer, isClient, customMt) end

---@param spawner any
---@param xmlFilename any
---@param spawnX any
---@param spawnY any
---@param spawnZ any
function Dog:load(spawner, xmlFilename, spawnX, spawnY, spawnZ) end

function Dog:delete() end

---@param xmlFile XMLFile
---@param key string
---@param resetVehicles boolean
---@return boolean
function Dog:loadFromXMLFile(xmlFile, key, resetVehicles) end

---@param xmlFile table
---@param key string
---@param usedModNames table
function Dog:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection table
function Dog:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function Dog:writeStream(streamId, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Dog:writeUpdateStream(streamId, connection, dirtyMask) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function Dog:readUpdateStream(streamId, timestamp, connection) end

---@param dt number
function Dog:update(dt) end

---@param dt number
function Dog:updateTick(dt) end

---@param x number
---@param y number
---@param z number
---@param coeff number
---@param isGuiVisible any
---@return boolean
function Dog:testScope(x, y, z, coeff, isGuiVisible) end

---@param skipCount number
---@param x number
---@param y number
---@param z number
---@param coeff number
---@param connection table
---@param isGuiVisible any
---@return number
function Dog:getUpdatePriority(skipCount, x, y, z, coeff, connection, isGuiVisible) end

function Dog:onGhostRemove() end

function Dog:onGhostAdd() end

function Dog:hourChanged() end

---@param name any
function Dog:setName(name) end

---@param state any
function Dog:setVisibility(state) end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function Dog:playerInteractionTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

---@param player integer
function Dog:followEntity(player) end

function Dog:goToSpawn() end

---@param foodBowlNode any
function Dog:onFoodBowlFilled(foodBowlNode) end

---@param player object
---@param ball any
function Dog:fetchItem(player, ball) end

function Dog:pet() end

function Dog:idleStay() end

function Dog:idleWander() end

---@param tileIndexU integer
---@param tileIndexV integer
function Dog:setTextureTileIndices(tileIndexU, tileIndexV) end

function Dog:applyTextureTile() end

---@param dt any
function Dog:isAbandoned(dt) end

function Dog:resetSteeringParms() end

function Dog:teleportToSpawn() end

---@param player any
function Dog:playerFarmChanged(player) end

---@param player any
function Dog:onPlayerLeave(player) end

function Dog:finalizePlacement() end

---@param isIndoor any
function Dog:onIndoorStateChanged(isIndoor) end

---@param schema any
---@param basePath any
function Dog.registerSavegameXMLPaths(schema, basePath) end
