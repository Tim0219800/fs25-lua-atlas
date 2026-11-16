---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryAnimalWorker.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that lets a husbandry use hireable worker tasks (for example a recurring exercise or harvesting service). It requires PlaceableHusbandryAnimals. Each task from g_currentMission.animalWorkerTaskSystem has an enabled flag, a last-run day and prices that can be overridden in the placeable XML. The server runs due tasks hourly and charges wages; only the enabled flags are synchronized to clients.
---@class PlaceableHusbandryAnimalWorker
PlaceableHusbandryAnimalWorker = {}

--- Registers the optional XML overrides `.husbandry.animalWorker.task(?)` with `#name`, `#basePrice` and `#pricePerAnimal`.
---@param schema XMLSchema
---@param basePath string
function PlaceableHusbandryAnimalWorker.registerXMLPaths(schema, basePath) end

--- Registers the savegame paths `.task(?)` with `#name`, `#enabled` and `#lastRunDay`.
---@param schema XMLSchema
---@param basePath string
function PlaceableHusbandryAnimalWorker.registerSavegameXMLPaths(schema, basePath) end

--- Registers the task functions on the placeable type: price override loading, state, available tasks, enabled, cost, due check, event state application and task execution.
---@param placeableType table
function PlaceableHusbandryAnimalWorker.registerFunctions(placeableType) end

--- Overrides getConditionInfos so the animal menu shows worker status.
---@param placeableType table
function PlaceableHusbandryAnimalWorker.registerOverwrittenFunctions(placeableType) end

--- Subscribes to onLoad, onReadStream, onWriteStream, onHourChanged and onDayChanged.
---@param placeableType table
function PlaceableHusbandryAnimalWorker.registerEventListeners(placeableType) end

--- Returns true only if the placeable type also has PlaceableHusbandryAnimals.
---@param specializations table
---@return boolean
function PlaceableHusbandryAnimalWorker.prerequisitesPresent(specializations) end

--- Builds a state entry (disabled, last run day -1, default prices) for every task of the task system, keyed by task name, then loads XML price overrides. Does nothing if the task system is missing.
---@param savegame table?
function PlaceableHusbandryAnimalWorker:onLoad(savegame) end

--- Reads each `placeable.husbandry.animalWorker.task` entry and overrides base price and price per animal of the matching task state; unknown task names give an XML warning.
function PlaceableHusbandryAnimalWorker:loadAnimalWorkerPriceOverrides() end

--- Client join: reads one enabled bit per registered task, in task order, and applies it to the matching state.
---@param streamId integer
---@param connection table
function PlaceableHusbandryAnimalWorker:onReadStream(streamId, connection) end

--- Server join: writes one enabled bit per registered task in task order, false for tasks this husbandry does not offer.
---@param streamId integer
---@param connection table
function PlaceableHusbandryAnimalWorker:onWriteStream(streamId, connection) end

--- Restores enabled flag and last run day per task by name from the savegame; unknown tasks are ignored. Always returns true.
---@param xmlFile XMLFile
---@param key string
---@return boolean
function PlaceableHusbandryAnimalWorker:loadFromXMLFile(xmlFile, key) end

--- Writes each offered task's name, enabled flag and last run day under indexed `.task` keys, in task system order.
---@param xmlFile XMLFile
---@param key string
function PlaceableHusbandryAnimalWorker:saveToXMLFile(xmlFile, key) end

--- Server only. For each available enabled task that has not run today and is due at this hour, runs performAnimalWorkerTask.
---@param hour integer
function PlaceableHusbandryAnimalWorker:onHourChanged(hour) end

--- Client side, for the local player's farm only: when the day before a scheduled task comes (period matches notifyPeriod and it is the last day of the period) it shows the task's reminder as an in-game notification.
---@param currentDay integer
function PlaceableHusbandryAnimalWorker:onDayChanged(currentDay) end

--- Override that appends a status entry to the condition infos, showing enabled over available tasks as text and ratio. Nothing is added if no tasks are available.
---@param superFunc function
---@return table
function PlaceableHusbandryAnimalWorker:getConditionInfos(superFunc) end

--- Server only. Runs the task through AnimalWorkerTaskSystem.performTask. If animals were handled, it records the day, and charges base price plus price per animal as AI money to the farm (none for the spectator farm). Returns animals handled and cost; a run with nothing done costs nothing.
---@param task table
---@return integer
---@return integer
function PlaceableHusbandryAnimalWorker:performAnimalWorkerTask(task) end

--- Sets the enabled flag of a task, called by the state-change event. Returns the applied value, or false if the husbandry does not offer the task.
---@param task table
---@param enabled boolean
---@return boolean
function PlaceableHusbandryAnimalWorker:applyAnimalWorkerStateFromEvent(task, enabled) end

--- Returns this husbandry's state table for the task, or nil if the task is nil or not offered.
---@param task table?
---@return table?
function PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskState(task) end

--- Returns the tasks that have a state on this husbandry and are currently available according to AnimalWorkerTaskSystem, in task order.
---@return table
function PlaceableHusbandryAnimalWorker:getAnimalWorkerAvailableTasks() end

--- Returns true if the task state exists and is enabled.
---@param task table?
---@return boolean
function PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskIsEnabled(task) end

--- Returns base price plus price per animal times numAnimals, or 0 if the husbandry does not offer the task.
---@param task table?
---@param numAnimals integer
---@return integer
function PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskCost(task, numAnimals) end

--- Decides whether a task is due at the given hour. Non-daily tasks need the scheduled period and day in period; the hour must be at or past the schedule hour (default from AnimalWorkerTaskSystem), so a missed hour still runs later that day.
---@param task table
---@param hour integer
---@return boolean
function PlaceableHusbandryAnimalWorker:getAnimalWorkerTaskIsDue(task, hour) end
