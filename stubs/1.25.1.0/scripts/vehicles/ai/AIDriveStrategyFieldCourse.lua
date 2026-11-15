---@meta
-- FS25 1.25.1.0 : vehicles/ai/AIDriveStrategyFieldCourse.lua (generated stub, FS25 Lua Atlas)

---@class AIDriveStrategyFieldCourse : AIDriveStrategy
AIDriveStrategyFieldCourse = {}

---@param reconstructionData any
---@param customMt any
function AIDriveStrategyFieldCourse.new(reconstructionData, customMt) end

function AIDriveStrategyFieldCourse:delete() end

---@param vehicle any
function AIDriveStrategyFieldCourse:setAIVehicle(vehicle) end

---@param fieldCourse any
function AIDriveStrategyFieldCourse:onFieldCourseLoadedCallback(fieldCourse) end

---@param dt any
function AIDriveStrategyFieldCourse:update(dt) end

---@param dt any
---@param vX any
---@param vY any
---@param vZ any
function AIDriveStrategyFieldCourse:getDriveData(dt, vX, vY, vZ) end

---@param data any
function AIDriveStrategyFieldCourse:fillReconstructionData(data) end

---@param data any
---@param xmlFile any
---@param key any
function AIDriveStrategyFieldCourse.saveToXML(data, xmlFile, key) end

---@param data any
---@param xmlFile any
---@param key any
function AIDriveStrategyFieldCourse.loadFromXML(data, xmlFile, key) end

---@param schema any
---@param basePath any
function AIDriveStrategyFieldCourse.registerSavegameXMLPaths(schema, basePath) end
