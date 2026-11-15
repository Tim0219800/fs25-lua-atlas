---@meta
-- FS25 1.25.1.0 : vehicles/DashboardValueType.lua (generated stub, FS25 Lua Atlas)

---@class DashboardValueType
DashboardValueType = {}

---@param specName any
---@param name any
---@param customMt any
function DashboardValueType.new(specName, name, customMt) end

---@param xmlKey any
function DashboardValueType:setXMLKey(xmlKey) end

---@param xmlFile any
---@param vehicle any
function DashboardValueType:loadFromXML(xmlFile, vehicle) end

---@param pollUpdate any
function DashboardValueType:setPollUpdate(pollUpdate) end

---@param loadFunction any
---@param stateFunction any
function DashboardValueType:setAdditionalFunctions(loadFunction, stateFunction) end

---@param valueFactor any
function DashboardValueType:setValueFactor(valueFactor) end

function DashboardValueType:setValueCompare(...) end

---@param idleValue any
function DashboardValueType:setIdleValue(idleValue) end

---@param object any
---@param func any
function DashboardValueType:setValue(object, func) end

---@param centerFunc any
function DashboardValueType:setCenter(centerFunc) end

---@param min any
---@param max any
function DashboardValueType:setRange(min, max) end

---@param interpolationSpeed any
function DashboardValueType:setInterpolationSpeed(interpolationSpeed) end

---@param dashboard any
function DashboardValueType:getValue(dashboard) end

---@param funcName any
---@param object any
---@param value any
function DashboardValueType:setFunction(funcName, object, value) end

function DashboardValueType:getDefaultValue() end
