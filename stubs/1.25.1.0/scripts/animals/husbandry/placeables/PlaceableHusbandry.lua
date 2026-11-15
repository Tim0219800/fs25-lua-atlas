---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandry.lua (stub généré, atlas Lua FS25)

---@class PlaceableHusbandry
PlaceableHusbandry = {}

---@param specializations table
---@return boolean
function PlaceableHusbandry.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableHusbandry.registerEvents(placeableType) end

---@param placeableType any
function PlaceableHusbandry.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandry.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandry.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableHusbandry.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableHusbandry.registerSavegameXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableHusbandry:onLoad(savegame) end

function PlaceableHusbandry:onDelete() end

function PlaceableHusbandry:onFinalizePlacement() end

---@param streamId any
---@param connection any
function PlaceableHusbandry:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableHusbandry:onWriteStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableHusbandry:onReadUpdateStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableHusbandry:onWriteUpdateStream(streamId, connection) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableHusbandry:saveToXMLFile(xmlFile, key, usedModNames) end

---@param xmlFile any
---@param key any
function PlaceableHusbandry:loadFromXMLFile(xmlFile, key) end

---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableHusbandry:setOwnerFarmId(superFunc, farmId, noEventSend) end

---@param superFunc any
---@param node any
---@param target any
function PlaceableHusbandry:collectPickObjects(superFunc, node, target) end

---@param superFunc any
---@param x any
---@param y any
---@param z any
---@param farmId any
function PlaceableHusbandry:getCanBePlacedAt(superFunc, x, y, z, farmId) end

---@param superFunc any
function PlaceableHusbandry:canBuy(superFunc) end

---@param currentHour any
function PlaceableHusbandry:onHourChanged(currentHour) end

function PlaceableHusbandry:onBuy() end

---@param superFunc any
function PlaceableHusbandry:getNeedHourChanged(superFunc) end

function PlaceableHusbandry:updateFeeding() end

---@param foodFactor any
function PlaceableHusbandry:updateProduction(foodFactor) end

---@param foodFactor any
---@param productionFactor any
---@param globalProductionFactor any
function PlaceableHusbandry:updateOutput(foodFactor, productionFactor, globalProductionFactor) end

function PlaceableHusbandry:getGlobalProductionFactor() end

function PlaceableHusbandry:getConditionInfos() end

function PlaceableHusbandry:getFoodInfos() end

function PlaceableHusbandry:getAnimalInfos() end

---@param cluster any
function PlaceableHusbandry:getAnimalDescription(cluster) end

---@param fillTypeIndex any
---@param farmId any
function PlaceableHusbandry:getHusbandryCapacity(fillTypeIndex, farmId) end

---@param fillTypeIndex any
---@param farmId any
function PlaceableHusbandry:getHusbandryFreeCapacity(fillTypeIndex, farmId) end

---@param farmId any
---@param deltaFillLevel any
---@param fillTypeIndex any
---@param fillPositionData any
---@param toolType any
---@param extraAttributes any
function PlaceableHusbandry:addHusbandryFillLevelFromTool(farmId, deltaFillLevel, fillTypeIndex, fillPositionData, toolType, extraAttributes) end

---@param farmId integer
---@param deltaFillLevel number
---@param fillTypeIndex integer
---@return number
function PlaceableHusbandry:removeHusbandryFillLevel(farmId, deltaFillLevel, fillTypeIndex) end

---@param fillTypeIndex any
---@param farmId any
function PlaceableHusbandry:getHusbandryFillLevel(fillTypeIndex, farmId) end

---@param fillTypeIndex any
function PlaceableHusbandry:getHusbandryIsFillTypeSupported(fillTypeIndex) end

---@param storage any
---@param loadingStation any
function PlaceableHusbandry:onAddedStorageToLoadingStation(storage, loadingStation) end

---@param storage any
---@param loadingStation any
function PlaceableHusbandry:onRemovedStorageFromLoadingStation(storage, loadingStation) end

---@param storage any
---@param unloadingStation any
function PlaceableHusbandry:onAddedStorageToUnloadingStation(storage, unloadingStation) end

---@param storage any
---@param unloadingStation any
function PlaceableHusbandry:onRemovedStorageFromUnloadingStation(storage, unloadingStation) end
