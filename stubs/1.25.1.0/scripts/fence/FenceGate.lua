---@meta
-- FS25 1.25.1.0 : fence/FenceGate.lua (generated stub, FS25 Lua Atlas)

---@class FenceGate : FenceSegment
FenceGate = {}

---@param schema XMLSchema
---@param basePath string
function FenceGate.registerXMLPaths(schema, basePath) end

---@param schema XMLSchema
---@param basePath string
function FenceGate.registerSavegameXMLPaths(schema, basePath) end

---@param id integer
---@param metadata table
---@param fence Fence
---@param customMt table?
---@return FenceGate
function FenceGate.new(id, metadata, fence, customMt) end

---@param xmlFile XMLFile
---@param key string
---@param id string
---@param fence Fence
---@return table
function FenceGate.loadMetadataFromXML(xmlFile, key, id, fence) end

function FenceGate:delete() end

---@param xmlFile XMLFile
---@param key string
---@return boolean
function FenceGate:loadFromXMLFile(xmlFile, key) end

---@param xmlFile XMLFile
---@param key string
---@return boolean
function FenceGate:saveToXMLFile(xmlFile, key) end

---@param streamId integer
---@param connection table
---@param lastSegment FenceSegment
function FenceGate:readStream(streamId, connection, lastSegment) end

---@param streamId integer
---@param connection table
---@param lastSegment FenceSegment
function FenceGate:writeStream(streamId, connection, lastSegment) end
