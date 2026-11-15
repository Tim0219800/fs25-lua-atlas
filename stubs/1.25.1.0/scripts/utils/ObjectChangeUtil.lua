---@meta
-- FS25 1.25.1.0 : utils/ObjectChangeUtil.lua (stub généré, atlas Lua FS25)

---@class ObjectChangeUtil
ObjectChangeUtil = {}

---@param xmlFile XMLFile
---@param key string
---@param objects table?
---@param rootNode integer
---@param parent table?
---@return array?
function ObjectChangeUtil.loadObjectChangeFromXML(xmlFile, key, objects, rootNode, parent) end

---@param xmlFile XMLFile
---@param key string
---@param node integer
---@param object table
---@param parent table?
---@param rootNode integer?
---@param i3dMappings table?
function ObjectChangeUtil.loadValuesFromXML(xmlFile, key, node, object, parent, rootNode, i3dMappings) end

---@param objects table
---@param isActive boolean
---@param target table?
---@param updateFunc function?
---@param skipInterpolation boolean?
function ObjectChangeUtil.setObjectChanges(objects, isActive, target, updateFunc, skipInterpolation) end

---@param object table
---@param isActive boolean
---@param target table
---@param updateFunc function
---@param skipInterpolation boolean?
function ObjectChangeUtil.setObjectChange(object, isActive, target, updateFunc, skipInterpolation) end

---@param xmlFile XMLFile
---@param key string
---@param configIndex integer
---@param rootNode integer
---@param parent table
function ObjectChangeUtil.updateObjectChanges(xmlFile, key, configIndex, rootNode, parent) end

---@param schema XMLSchema
---@param basePath string
function ObjectChangeUtil.registerObjectChangeXMLPaths(schema, basePath) end

---@param schema XMLSchema
---@param basePath string
function ObjectChangeUtil.registerObjectChangesXMLPaths(schema, basePath) end

---@param schema XMLSchema
---@param basePath string
function ObjectChangeUtil.registerObjectChangeSingleXMLPaths(schema, basePath) end

---@param schema XMLSchema
---@param func function
function ObjectChangeUtil.addAdditionalObjectChangeXMLPaths(schema, func) end
