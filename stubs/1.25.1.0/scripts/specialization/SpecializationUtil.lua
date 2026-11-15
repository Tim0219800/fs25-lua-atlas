---@meta
-- FS25 1.25.1.0 : specialization/SpecializationUtil.lua (stub généré, atlas Lua FS25)

---@class SpecializationUtil
SpecializationUtil = {}

---@param object table
---@param eventName string
function SpecializationUtil.raiseAsyncEvent(object, eventName, ...) end

---@param object table
---@param eventName string
function SpecializationUtil.raiseEvent(object, eventName, ...) end

---@param objectType table
---@param funcName string
---@param func function
function SpecializationUtil.registerFunction(objectType, funcName, func) end

---@param objectType table
---@param funcName string
---@param func function
function SpecializationUtil.registerOverwrittenFunction(objectType, funcName, func) end

---@param objectType table
---@param eventName string
function SpecializationUtil.registerEvent(objectType, eventName) end

---@param objectType table
---@param eventName string
---@param specClass table
function SpecializationUtil.registerEventListener(objectType, eventName, specClass) end

---@param object table
---@param eventName string
---@param specClass table
function SpecializationUtil.removeEventListener(object, eventName, specClass) end

---@param spec table
---@param specializations table
---@return boolean
function SpecializationUtil.hasSpecialization(spec, specializations) end

---@param typeManager any
---@param typeDef any
---@param target table
---@return any
function SpecializationUtil.initSpecializationsIntoTypeClass(typeManager, typeDef, target) end

---@param typeDef table
---@param target table
function SpecializationUtil.copyTypeFunctionsInto(typeDef, target) end

---@param typeClass table
---@param target any
---@return table
function SpecializationUtil.createLoadingTask(typeClass, target) end

---@param typeClass table
---@param task table
function SpecializationUtil.finishLoadingTask(typeClass, task) end

---@param typeClass table
---@param loadingStep SpecializationLoadStep
function SpecializationUtil.setLoadingStep(typeClass, loadingStep) end

---@param loadingStep SpecializationLoadStep
---@return boolean
function SpecializationUtil.getIsValidLoadingStep(loadingStep) end
