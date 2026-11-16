---@meta
-- FS25 1.25.1.0 : utils/ClassUtil.lua (generated stub, FS25 Lua Atlas)

--- Signature only (no body in the SDK dump): helpers to resolve class tables, class names and functions from strings, including names of the form "customEnv.name" that point into a mod environment. All behaviour below is inferred from names and parameters (UNVERIFIED).
---@class ClassUtil
ClassUtil = {}

--- Signature only (no body in the SDK dump): presumably tests whether a string is an acceptable class name and returns a boolean. UNVERIFIED.
---@param className string
---@return boolean
function ClassUtil.getIsValidClassName(className) end

--- Signature only (no body in the SDK dump): presumably tests whether a string is an acceptable index name and returns a boolean. UNVERIFIED.
---@param indexName string
---@return boolean
function ClassUtil.getIsValidIndexName(indexName) end

--- Signature only (no body in the SDK dump): presumably resolves a class name string to the class table. UNVERIFIED.
---@param className string
---@return table
function ClassUtil.getClassObject(className) end

--- Signature only (no body in the SDK dump): presumably returns the class table of a given object instance. UNVERIFIED.
---@param object table
---@return table
function ClassUtil.getClassObjectByObject(object) end

--- Signature only (no body in the SDK dump): presumably returns the registered name of a class table, or nil if unknown. UNVERIFIED.
---@param classObject table
---@return string|nil
function ClassUtil.getClassName(classObject) end

--- Signature only (no body in the SDK dump): presumably returns the class name of an object instance, or nil. UNVERIFIED.
---@param object table
---@return string|nil
function ClassUtil.getClassNameByObject(object) end

--- Signature only (no body in the SDK dump): presumably extracts the mod name from a class name written as "customEnv.className", or nil. UNVERIFIED.
---@param className string
---@return string|nil
function ClassUtil.getClassModName(className) end

--- Signature only (no body in the SDK dump): presumably resolves a function from a name written as "customEnv.functionName" and returns it. UNVERIFIED.
---@param functionName string
---@return any
function ClassUtil.getFunction(functionName) end
