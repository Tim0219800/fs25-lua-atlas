---@meta
-- FS25 1.25.1.0 : utils/ClassUtil.lua (stub généré, atlas Lua FS25)

---@class ClassUtil
ClassUtil = {}

---@param className string
---@return boolean
function ClassUtil.getIsValidClassName(className) end

---@param indexName string
---@return boolean
function ClassUtil.getIsValidIndexName(indexName) end

---@param className string
---@return table
function ClassUtil.getClassObject(className) end

---@param object table
---@return table
function ClassUtil.getClassObjectByObject(object) end

---@param classObject table
---@return string|nil
function ClassUtil.getClassName(classObject) end

---@param object table
---@return string|nil
function ClassUtil.getClassNameByObject(object) end

---@param className string
---@return string|nil
function ClassUtil.getClassModName(className) end

---@param functionName string
---@return any
function ClassUtil.getFunction(functionName) end
