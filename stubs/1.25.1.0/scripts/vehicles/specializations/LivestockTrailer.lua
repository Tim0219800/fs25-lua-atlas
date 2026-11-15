---@meta
-- FS25 1.25.1.0 : vehicles/specializations/LivestockTrailer.lua (generated stub, FS25 Lua Atlas)

---@class LivestockTrailer
LivestockTrailer = {}

function LivestockTrailer.initSpecialization() end

---@param specializations any
function LivestockTrailer.prerequisitesPresent(specializations) end

---@param vehicleType any
function LivestockTrailer.registerFunctions(vehicleType) end

---@param vehicleType any
function LivestockTrailer.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function LivestockTrailer.registerEventListeners(vehicleType) end

---@param savegame table
function LivestockTrailer:onLoad(savegame) end

---@param savegame any
function LivestockTrailer:onLoadFinished(savegame) end

function LivestockTrailer:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function LivestockTrailer:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId any
---@param connection any
function LivestockTrailer:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function LivestockTrailer:onWriteStream(streamId, connection) end

---@param animalTypeIndex any
function LivestockTrailer:getSupportsAnimalType(animalTypeIndex) end

---@param subTypeIndex any
function LivestockTrailer:getSupportsAnimalSubType(subTypeIndex) end

function LivestockTrailer:getCurrentAnimalType() end

---@param trigger any
function LivestockTrailer:setLoadingTrigger(trigger) end

function LivestockTrailer:getLoadingTrigger() end

---@param controller any
function LivestockTrailer:setAnimalScreenController(controller) end

---@param subTypeIndex any
---@param numAnimals any
---@param age any
function LivestockTrailer:addAnimals(subTypeIndex, numAnimals, age) end

---@param cluster any
function LivestockTrailer:addCluster(cluster) end

function LivestockTrailer:getClusters() end

function LivestockTrailer:getRideablesInTrigger() end

---@param id any
function LivestockTrailer:getClusterById(id) end

function LivestockTrailer:getClusterSystem() end

function LivestockTrailer:getNumOfAnimals() end

---@param animalType any
function LivestockTrailer:getMaxNumOfAnimals(animalType) end

---@param subTypeIndex any
function LivestockTrailer:getNumOfFreeAnimalSlots(subTypeIndex) end

---@param trailer any
function LivestockTrailer:updatedClusters(trailer) end

function LivestockTrailer:updateAnimals() end

function LivestockTrailer:clearAnimals() end

---@param i3dNode any
---@param failedReason any
---@param args any
function LivestockTrailer:onAnimalLoaded(i3dNode, failedReason, args) end

---@param superFunc any
---@param component any
function LivestockTrailer:getAdditionalComponentMass(superFunc, component) end

---@param superFunc any
function LivestockTrailer:getSellPrice(superFunc) end

---@param superFunc any
function LivestockTrailer:dayChanged(superFunc) end

---@param superFunc any
function LivestockTrailer:periodChanged(superFunc) end

---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function LivestockTrailer:onAnimalLoadTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end

---@param rideable any
function LivestockTrailer:onAnimalRideableDeleted(rideable) end

function LivestockTrailer:getAnimalUnloadPlaces() end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
---@param animalTypeName any
function LivestockTrailer.loadSpecValueNumberAnimals(xmlFile, customEnvironment, baseDir, animalTypeName) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function LivestockTrailer.loadSpecValueNumberAnimalsCow(xmlFile, customEnvironment, baseDir) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function LivestockTrailer.loadSpecValueNumberAnimalsPig(xmlFile, customEnvironment, baseDir) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function LivestockTrailer.loadSpecValueNumberAnimalsSheep(xmlFile, customEnvironment, baseDir) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function LivestockTrailer.loadSpecValueNumberAnimalsHorse(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
---@param specName any
function LivestockTrailer.getSpecValueNumberAnimals(storeItem, realItem, specName) end

---@param storeItem any
---@param realItem any
function LivestockTrailer.getSpecValueNumberAnimalsCow(storeItem, realItem) end

---@param storeItem any
---@param realItem any
function LivestockTrailer.getSpecValueNumberAnimalsPig(storeItem, realItem) end

---@param storeItem any
---@param realItem any
function LivestockTrailer.getSpecValueNumberAnimalsSheep(storeItem, realItem) end

---@param storeItem any
---@param realItem any
function LivestockTrailer.getSpecValueNumberAnimalsHorse(storeItem, realItem) end
