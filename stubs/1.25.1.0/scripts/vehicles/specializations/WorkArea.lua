---@meta
-- FS25 1.25.1.0 : vehicles/specializations/WorkArea.lua (generated stub, FS25 Lua Atlas)

---@class WorkArea
WorkArea = {}

function WorkArea.initSpecialization() end

---@param schema any
---@param basePath any
function WorkArea.registerWorkAreaXMLPaths(schema, basePath) end

---@param specializations any
function WorkArea.prerequisitesPresent(specializations) end

---@param vehicleType any
function WorkArea.registerEvents(vehicleType) end

---@param vehicleType any
function WorkArea.registerFunctions(vehicleType) end

---@param vehicleType any
function WorkArea.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function WorkArea.registerEventListeners(vehicleType) end

---@param savegame table
function WorkArea:onLoad(savegame) end

---@param farmId boolean
---@param x integer
---@param z boolean
---@param workAreaType any
function WorkArea:getIsAccessibleAtWorldPosition(farmId, x, z, workAreaType) end

---@param area any
function WorkArea:updateLastWorkedArea(area) end

function WorkArea:getLastTouchedFarmlandFarmId() end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function WorkArea:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param workArea table
---@param xmlFile XMLFile
---@param key string
---@return boolean
function WorkArea:loadWorkAreaFromXML(workArea, xmlFile, key) end

---@param workAreaIndex any
function WorkArea:getWorkAreaByIndex(workAreaIndex) end

---@param workArea table
---@return boolean
function WorkArea:getIsWorkAreaActive(workArea) end

---@param workAreaIndex integer
function WorkArea:updateWorkAreaWidth(workAreaIndex) end

---@param workAreaIndex integer
function WorkArea:getWorkAreaWidth(workAreaIndex) end

---@param workArea table
function WorkArea:getIsWorkAreaProcessing(workArea) end

---@param areaType integer
---@param needsFieldProperty boolean
---@return table
---@return boolean
---@return number
function WorkArea:getTypedNetworkAreas(areaType, needsFieldProperty) end

---@param areaType integer
---@return table
function WorkArea:getTypedWorkAreas(areaType) end

---@param areaType integer
---@return boolean
---@return table
function WorkArea:getIsTypedWorkAreaActive(areaType) end

function WorkArea:getAIWorkAreaWidth() end

function WorkArea:getIsFarmlandNotOwnedWarningShown() end

---@param superFunc table
---@param speedRotatingPart table
---@param xmlFile XMLFile
---@param key string
---@return boolean
function WorkArea:loadSpeedRotatingPartFromXML(superFunc, speedRotatingPart, xmlFile, key) end

---@param superFunc table
---@param speedRotatingPart table
---@return boolean
function WorkArea:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end

---@param superFunc any
---@param node any
---@param movingPart any
function WorkArea:checkMovingPartDirtyUpdateNode(superFunc, node, movingPart) end

---@param superFunc any
function WorkArea:getImplementAllowAutomaticSteering(superFunc) end
