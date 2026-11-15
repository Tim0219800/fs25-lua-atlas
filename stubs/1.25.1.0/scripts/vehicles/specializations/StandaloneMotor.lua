---@meta
-- FS25 1.25.1.0 : vehicles/specializations/StandaloneMotor.lua (stub généré, atlas Lua FS25)

---@param specializations table
---@return boolean
function StandaloneMotor.prerequisitesPresent(specializations) end

function StandaloneMotor.initSpecialization() end

---@param vehicleType any
function StandaloneMotor.registerFunctions(vehicleType) end

---@param vehicleType any
function StandaloneMotor.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function StandaloneMotor.registerEventListeners(vehicleType) end

---@param savegame any
function StandaloneMotor:onLoad(savegame) end

function StandaloneMotor:onRegisterDashboardValueTypes() end

function StandaloneMotor:onDelete() end

---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function StandaloneMotor:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

function StandaloneMotor:getNeedsStandaloneMotorRunning() end

function StandaloneMotor:getAllowsStandaloneMotorRunning() end

function StandaloneMotor:getStandaloneMotorTargetRpm() end

function StandaloneMotor:getStandaloneMotorLoad() end

---@param dt any
function StandaloneMotor:updateStandaloneMotorTemperature(dt) end

---@param superFunc any
---@return boolean
function StandaloneMotor:getIsOperating(superFunc) end

---@param superFunc any
---@param xmlFile any
---@param key any
---@param group any
function StandaloneMotor:loadDashboardGroupFromXML(superFunc, xmlFile, key, group) end

---@param superFunc any
---@param group any
function StandaloneMotor:getIsDashboardGroupActive(superFunc, group) end

---@param values any
function StandaloneMotor:updateDebugValues(values) end

---@param self any
---@return boolean
function StandaloneMotor.getMotorIgnitionState(self) end
