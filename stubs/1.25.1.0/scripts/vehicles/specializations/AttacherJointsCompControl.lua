---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AttacherJointsCompControl.lua (generated stub, FS25 Lua Atlas)

---@param specializations table
---@return boolean
function AttacherJointsCompControl.prerequisitesPresent(specializations) end

function AttacherJointsCompControl.initSpecialization() end

---@param vehicleType any
function AttacherJointsCompControl.registerFunctions(vehicleType) end

---@param vehicleType any
function AttacherJointsCompControl.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function AttacherJointsCompControl.registerEventListeners(vehicleType) end

---@param savegame table
function AttacherJointsCompControl:onPreLoad(savegame) end

---@param state any
---@param data any
function AttacherJointsCompControl:onStateChange(state, data) end

---@param componentJointIndex any
---@param transSpringFactor any
---@param transDampingFactor any
---@param overwrite any
function AttacherJointsCompControl:setDependentComponentJointBaseFactors(componentJointIndex, transSpringFactor, transDampingFactor, overwrite) end

---@param componentJointIndex any
function AttacherJointsCompControl:addDependentComponentJointData(componentJointIndex) end

---@param forceUpdate any
---@param skipInterpolation any
function AttacherJointsCompControl:updateDependentComponentJointValues(forceUpdate, skipInterpolation) end

---@param superFunc any
---@return boolean
function AttacherJointsCompControl:addToPhysics(superFunc) end

---@param superFunc table
---@param attacherJoint table
---@param xmlFile string
---@param baseName string
---@param index integer
function AttacherJointsCompControl:loadAttacherJointFromXML(superFunc, attacherJoint, xmlFile, baseName, index) end

---@param values any
function AttacherJointsCompControl:updateDebugValues(values) end
