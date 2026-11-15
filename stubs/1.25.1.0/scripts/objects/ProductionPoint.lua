---@meta
-- FS25 1.25.1.0 : objects/ProductionPoint.lua (generated stub, FS25 Lua Atlas)

---@class ProductionPoint : Object
ProductionPoint = {}

---@param schema any
---@param basePath any
function ProductionPoint.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function ProductionPoint.registerSavegameXMLPaths(schema, basePath) end

---@param streamId integer
---@param connection table
function ProductionPoint:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function ProductionPoint:writeStream(streamId, connection) end

---@param streamId any
---@param timestamp any
---@param connection any
function ProductionPoint:readUpdateStream(streamId, timestamp, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function ProductionPoint:writeUpdateStream(streamId, connection, dirtyMask) end

---@param xmlFile XMLFile
---@param key string
---@return boolean
function ProductionPoint:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function ProductionPoint.loadSpecValueInputFillTypes(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
function ProductionPoint.getSpecValueInputFillTypes(storeItem, realItem) end

---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function ProductionPoint.loadSpecValueOutputFillTypes(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
function ProductionPoint.getSpecValueOutputFillTypes(storeItem, realItem) end

---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function ProductionPoint:interactionTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

function ProductionPoint:openMenu() end

---@param requestCallback any
---@param target any
function ProductionPoint:buyRequest(requestCallback, target) end
