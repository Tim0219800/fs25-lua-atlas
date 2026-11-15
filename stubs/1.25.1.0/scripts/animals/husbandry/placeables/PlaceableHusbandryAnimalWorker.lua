---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryAnimalWorker.lua (stub généré, atlas Lua FS25)

---@class PlaceableHusbandryAnimalWorker
PlaceableHusbandryAnimalWorker = {}

---@param schema XMLSchema
---@param basePath string
function PlaceableHusbandryAnimalWorker.registerXMLPaths(schema, basePath) end

---@param schema XMLSchema
---@param basePath string
function PlaceableHusbandryAnimalWorker.registerSavegameXMLPaths(schema, basePath) end

---@param placeableType table
function PlaceableHusbandryAnimalWorker.registerFunctions(placeableType) end

---@param placeableType table
function PlaceableHusbandryAnimalWorker.registerOverwrittenFunctions(placeableType) end

---@param placeableType table
function PlaceableHusbandryAnimalWorker.registerEventListeners(placeableType) end

---@param specializations table
---@return boolean
function PlaceableHusbandryAnimalWorker.prerequisitesPresent(specializations) end

---@param savegame table?
function PlaceableHusbandryAnimalWorker:onLoad(savegame) end

function PlaceableHusbandryAnimalWorker:loadAnimalWorkerPriceOverrides() end

---@param streamId integer
---@param connection table
function PlaceableHusbandryAnimalWorker:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection table
function PlaceableHusbandryAnimalWorker:onWriteStream(streamId, connection) end

---@param xmlFile XMLFile
---@param key string
---@return boolean
function PlaceableHusbandryAnimalWorker:loadFromXMLFile(xmlFile, key) end

---@param xmlFile XMLFile
---@param key string
function PlaceableHusbandryAnimalWorker:saveToXMLFile(xmlFile, key) end

---@param hour integer
function PlaceableHusbandryAnimalWorker:onHourChanged(hour) end

---@param currentDay integer
function PlaceableHusbandryAnimalWorker:onDayChanged(currentDay) end

---@param superFunc function
---@return table
function PlaceableHusbandryAnimalWorker:getConditionInfos(superFunc) end

---@param task table
---@return integer
---@return integer
function PlaceableHusbandryAnimalWorker:performAnimalWorkerTask(task) end

---@param task table
---@param enabled boolean
---@return boolean
function PlaceableHusbandryAnimalWorker:applyAnimalWorkerStateFromEvent(task, enabled) end

---@param task table?
---@return table?
function PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskState(task) end

---@return table
function PlaceableHusbandryAnimalWorker:getAnimalWorkerAvailableTasks() end

---@param task table?
---@return boolean
function PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskIsEnabled(task) end

---@param task table?
---@param numAnimals integer
---@return integer
function PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskCost(task, numAnimals) end

---@param task table
---@param hour integer
---@return boolean
function PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskIsDue(task, hour) end
