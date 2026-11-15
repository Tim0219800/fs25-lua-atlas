---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryFeedingRobot.lua (stub généré, atlas Lua FS25)

---@class PlaceableHusbandryFeedingRobot
PlaceableHusbandryFeedingRobot = {}

---@param specializations table
---@return boolean
function PlaceableHusbandryFeedingRobot.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableHusbandryFeedingRobot.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandryFeedingRobot.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandryFeedingRobot.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableHusbandryFeedingRobot.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableHusbandryFeedingRobot.registerSavegameXMLPaths(schema, basePath) end

---@param savegame any
function PlaceableHusbandryFeedingRobot:onLoad(savegame) end

---@param savegame any
function PlaceableHusbandryFeedingRobot:onPostLoad(savegame) end

---@param robot any
---@param args any
function PlaceableHusbandryFeedingRobot:onFeedingRobotLoaded(robot, args) end

function PlaceableHusbandryFeedingRobot:onDelete() end

function PlaceableHusbandryFeedingRobot:onFinalizePlacement() end

---@param streamId any
---@param connection any
function PlaceableHusbandryFeedingRobot:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableHusbandryFeedingRobot:onWriteStream(streamId, connection) end

---@param xmlFile any
---@param key any
function PlaceableHusbandryFeedingRobot:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableHusbandryFeedingRobot:saveToXMLFile(xmlFile, key, usedModNames) end

---@param superFunc any
---@param farmId any
function PlaceableHusbandryFeedingRobot:setOwnerFarmId(superFunc, farmId) end

---@param superFunc any
function PlaceableHusbandryFeedingRobot:updateFeeding(superFunc) end

---@param superFunc any
---@param node any
function PlaceableHusbandryFeedingRobot:collectPickObjects(superFunc, node) end

---@param superFunc any
---@param infoTable any
function PlaceableHusbandryFeedingRobot:updateInfo(superFunc, infoTable) end
