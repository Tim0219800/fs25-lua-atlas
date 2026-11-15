---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AdditionalToolConnections.lua (generated stub, FS25 Lua Atlas)

---@param specializations table
---@return boolean
function AdditionalToolConnections.prerequisitesPresent(specializations) end

function AdditionalToolConnections.initSpecialization() end

---@param vehicleType any
function AdditionalToolConnections.registerFunctions(vehicleType) end

---@param vehicleType any
function AdditionalToolConnections.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function AdditionalToolConnections.registerEventListeners(vehicleType) end

---@param savegame any
function AdditionalToolConnections:onPostLoad(savegame) end

---@param superFunc table
---@param attacherJoint table
---@param xmlFile string
---@param baseName string
---@param index integer
function AdditionalToolConnections:loadAttacherJointFromXML(superFunc, attacherJoint, xmlFile, baseName, index, ...) end

---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
---@param loadFromSavegame boolean
function AdditionalToolConnections:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex, loadFromSavegame) end

---@param attacherVehicle table
---@param implement table
function AdditionalToolConnections:onPreDetach(attacherVehicle, implement) end
