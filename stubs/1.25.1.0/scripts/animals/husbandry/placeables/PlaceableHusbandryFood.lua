---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryFood.lua (stub généré, atlas Lua FS25)

---@class PlaceableHusbandryFood
PlaceableHusbandryFood = {}

---@param specializations table
---@return boolean
function PlaceableHusbandryFood.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableHusbandryFood.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandryFood.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandryFood.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableHusbandryFood.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableHusbandryFood.registerSavegameXMLPaths(schema, basePath) end

function PlaceableHusbandryFood.initSpecialization() end

---@param savegame any
function PlaceableHusbandryFood:onLoad(savegame) end

function PlaceableHusbandryFood:onPostLoad() end

function PlaceableHusbandryFood:onDelete() end

function PlaceableHusbandryFood:onFinalizePlacement() end

function PlaceableHusbandryFood:onPostFinalizePlacement() end

---@param streamId any
---@param connection any
function PlaceableHusbandryFood:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableHusbandryFood:onWriteStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function PlaceableHusbandryFood:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function PlaceableHusbandryFood:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param xmlFile any
---@param key any
function PlaceableHusbandryFood:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableHusbandryFood:saveToXMLFile(xmlFile, key, usedModNames) end

---@param superFunc any
function PlaceableHusbandryFood:updateFeeding(superFunc) end

---@param superFunc any
---@param infoTable any
function PlaceableHusbandryFood:updateInfo(superFunc, infoTable) end

---@param superFunc any
function PlaceableHusbandryFood:getFoodInfos(superFunc) end

---@param fillTypeIndex any
function PlaceableHusbandryFood:updateFillPlanes(fillTypeIndex) end

---@param superFunc any
---@param node any
function PlaceableHusbandryFood:collectPickObjects(superFunc, node) end

---@param husbandryId any
function PlaceableHusbandryFood:onHusbandryAnimalsCreated(husbandryId) end

function PlaceableHusbandryFood:updateFoodPlaces() end

function PlaceableHusbandryFood:getTotalFood() end

function PlaceableHusbandryFood:getFoodCapacity() end

---@param fillTypeIndex any
function PlaceableHusbandryFood:getFreeFoodCapacity(fillTypeIndex) end

---@param farmId any
---@param deltaFillLevel any
---@param fillTypeIndex any
---@param fillPositionData any
---@param toolType any
---@param extraAttributes any
function PlaceableHusbandryFood:addFood(farmId, deltaFillLevel, fillTypeIndex, fillPositionData, toolType, extraAttributes) end

---@param absDeltaFillLevel any
---@param fillTypeIndex any
function PlaceableHusbandryFood:removeFood(absDeltaFillLevel, fillTypeIndex) end

---@param clusters any
function PlaceableHusbandryFood:onHusbandryAnimalsUpdate(clusters) end

---@param superFunc any
---@param cluster any
function PlaceableHusbandryFood:getAnimalDescription(superFunc, cluster) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function PlaceableHusbandryFood.loadSpecValueAnimalFoodFillTypes(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
function PlaceableHusbandryFood.getSpecValueAnimalFoodFillTypes(storeItem, realItem) end
