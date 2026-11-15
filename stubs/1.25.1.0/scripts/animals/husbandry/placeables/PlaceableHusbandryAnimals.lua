---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryAnimals.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableHusbandryAnimals
PlaceableHusbandryAnimals = {}

---@param specializations table
---@return boolean
function PlaceableHusbandryAnimals.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableHusbandryAnimals.registerEvents(placeableType) end

---@param placeableType any
function PlaceableHusbandryAnimals.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandryAnimals.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandryAnimals.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableHusbandryAnimals.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableHusbandryAnimals.registerSavegameXMLPaths(schema, basePath) end

function PlaceableHusbandryAnimals.initSpecialization() end

---@param savegame any
function PlaceableHusbandryAnimals:onLoad(savegame) end

function PlaceableHusbandryAnimals:onDelete() end

function PlaceableHusbandryAnimals:onFinalizePlacement() end

---@param streamId any
---@param connection any
function PlaceableHusbandryAnimals:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableHusbandryAnimals:onWriteStream(streamId, connection) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableHusbandryAnimals:saveToXMLFile(xmlFile, key, usedModNames) end

---@param xmlFile any
---@param key any
function PlaceableHusbandryAnimals:loadFromXMLFile(xmlFile, key) end

---@param dt any
function PlaceableHusbandryAnimals:onUpdate(dt) end

---@param node any
---@param failedReason any
---@param args any
function PlaceableHusbandryAnimals:onExternalNavigationMeshLoaded(node, failedReason, args) end

function PlaceableHusbandryAnimals:createHusbandry() end

---@param superFunc any
---@param infoTable any
function PlaceableHusbandryAnimals:updateInfo(superFunc, infoTable) end

---@param superFunc any
function PlaceableHusbandryAnimals:getNeedDayChanged(superFunc) end

---@param isNewSavegame any
function PlaceableHusbandryAnimals:onMissionStarted(isNewSavegame) end

function PlaceableHusbandryAnimals:updateVisualAnimals() end

function PlaceableHusbandryAnimals:getAnimalTypeIndex() end

---@param superFunc any
---@param foodFactor any
---@param productionFactor any
---@param globalProductionFactor any
function PlaceableHusbandryAnimals:updateOutput(superFunc, foodFactor, productionFactor, globalProductionFactor) end

function PlaceableHusbandryAnimals:onPeriodChanged() end

function PlaceableHusbandryAnimals:onDayChanged() end

function PlaceableHusbandryAnimals:getNumOfAnimals() end

function PlaceableHusbandryAnimals:getMaxNumOfAnimals() end

function PlaceableHusbandryAnimals:getNumOfFreeAnimalSlots() end

---@param subTypeIndex any
function PlaceableHusbandryAnimals:getSupportsAnimalSubType(subTypeIndex) end

function PlaceableHusbandryAnimals:getNumOfClusters() end

function PlaceableHusbandryAnimals:getClusters() end

---@param index any
function PlaceableHusbandryAnimals:getCluster(index) end

---@param id any
function PlaceableHusbandryAnimals:getClusterById(id) end

---@param cluster any
function PlaceableHusbandryAnimals:addCluster(cluster) end

---@param subTypeIndex any
---@param numAnimals any
---@param age any
function PlaceableHusbandryAnimals:addAnimals(subTypeIndex, numAnimals, age) end

function PlaceableHusbandryAnimals:getClusterSystem() end

---@param husbandry any
function PlaceableHusbandryAnimals:updatedClusters(husbandry) end

---@param clusterId any
---@param name any
---@param noEventSend any
function PlaceableHusbandryAnimals:renameAnimal(clusterId, name, noEventSend) end

---@param clusterId any
function PlaceableHusbandryAnimals:getAnimalSupportsRiding(clusterId) end

---@param clusterId any
function PlaceableHusbandryAnimals:getAnimalCanBeRidden(clusterId) end

---@param clusterId any
---@param player any
function PlaceableHusbandryAnimals:startRiding(clusterId, player) end

---@param vehicles any
---@param vehicleLoadState any
---@param arguments any
function PlaceableHusbandryAnimals:onLoadedRideable(vehicles, vehicleLoadState, arguments) end

---@param xmlFile any
---@param key any
---@param area any
function PlaceableHusbandryAnimals:loadDeliveryArea(xmlFile, key, area) end

---@param x any
---@param z any
function PlaceableHusbandryAnimals:getIsInAnimalDeliveryArea(x, z) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function PlaceableHusbandryAnimals.loadSpecValueNumberAnimals(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
function PlaceableHusbandryAnimals.getSpecValueNumberAnimals(storeItem, realItem) end

---@param superFunc any
function PlaceableHusbandryAnimals:canBeSold(superFunc) end

---@param superFunc any
function PlaceableHusbandryAnimals:getConditionInfos(superFunc) end

---@param superFunc any
---@param cluster any
function PlaceableHusbandryAnimals:getAnimalInfos(superFunc, cluster) end

---@param superFunc any
---@param cluster any
function PlaceableHusbandryAnimals:getAnimalDescription(superFunc, cluster) end

---@param _ any
---@param numAnimals any
---@param subTypeIndex any
function PlaceableHusbandryAnimals.consoleCommandAddAnimals(_, numAnimals, subTypeIndex) end
