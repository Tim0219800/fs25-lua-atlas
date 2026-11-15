---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FruitPreparer.lua (stub généré, atlas Lua FS25)

---@class FruitPreparer
FruitPreparer = {}

function FruitPreparer.initSpecialization() end

---@param specializations table
---@return boolean
function FruitPreparer.prerequisitesPresent(specializations) end

---@param vehicleType any
function FruitPreparer.registerFunctions(vehicleType) end

---@param vehicleType any
function FruitPreparer.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function FruitPreparer.registerEventListeners(vehicleType) end

---@param savegame table
function FruitPreparer:onLoad(savegame) end

function FruitPreparer:onDelete() end

---@param streamId integer
---@param timestamp integer
---@param connection table
function FruitPreparer:onReadUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function FruitPreparer:onWriteUpdateStream(streamId, connection, dirtyMask) end

function FruitPreparer:onTurnedOn() end

function FruitPreparer:onTurnedOff() end

---@param superFunc table
---@param workArea table
---@param xmlFile XMLFile
---@param key string
---@return boolean
function FruitPreparer:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

---@param superFunc any
---@return boolean
function FruitPreparer:getDoGroundManipulation(superFunc) end

---@param superFunc any
---@return boolean
function FruitPreparer:doCheckSpeedLimit(superFunc) end

---@param superFunc any
function FruitPreparer:getAllowCutterAIFruitRequirements(superFunc) end

---@param superFunc any
function FruitPreparer:getDirtMultiplier(superFunc) end

---@param superFunc any
function FruitPreparer:getWearMultiplier(superFunc) end

---@param superFunc any
---@param part any
---@param xmlFile any
---@param key any
function FruitPreparer:loadRandomlyMovingPartFromXML(superFunc, part, xmlFile, key) end

---@param superFunc any
---@param part any
function FruitPreparer:getIsRandomlyMovingPartActive(superFunc, part) end

---@return number
function FruitPreparer.getDefaultSpeedLimit() end

---@param dt any
function FruitPreparer:onEndWorkAreaProcessing(dt) end

---@param fieldCourseSettings any
function FruitPreparer:onAIFieldCourseSettingsInitialized(fieldCourseSettings) end

---@param workArea any
function FruitPreparer:processFruitPreparerArea(workArea) end
