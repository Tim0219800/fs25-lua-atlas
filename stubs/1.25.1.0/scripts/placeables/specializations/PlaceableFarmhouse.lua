---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableFarmhouse.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableFarmhouse
PlaceableFarmhouse = {}

---@param specializations table
---@return boolean
function PlaceableFarmhouse.prerequisitesPresent(specializations) end

---@param placeableType table
function PlaceableFarmhouse.registerFunctions(placeableType) end

---@param placeableType table
function PlaceableFarmhouse.registerOverwrittenFunctions(placeableType) end

---@param placeableType table
function PlaceableFarmhouse.registerEventListeners(placeableType) end

---@param schema XMLSchema
---@param basePath string
function PlaceableFarmhouse.registerXMLPaths(schema, basePath) end

---@param schema XMLSchema
---@param basePath string
function PlaceableFarmhouse.registerSavegameXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableFarmhouse:onLoad(savegame) end

---@param xmlFile XMLFile
---@param key string
function PlaceableFarmhouse:loadFromXMLFile(xmlFile, key) end

---@param xmlFile XMLFile
---@param key string
---@param usedModNames table
function PlaceableFarmhouse:saveToXMLFile(xmlFile, key, usedModNames) end

function PlaceableFarmhouse:onFinalizePlacement() end

function PlaceableFarmhouse:onDelete() end

---@return integer?
function PlaceableFarmhouse:getSpawnPoint() end

function PlaceableFarmhouse:getSpawnWorldPosition() end

---@return integer?
function PlaceableFarmhouse:getSleepCamera() end

---@param triggerId integer
---@param otherActorId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
---@param otherShapeId integer
function PlaceableFarmhouse:farmhouseSleepingTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end
