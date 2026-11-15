---@meta
-- FS25 1.25.1.0 : fence/Fence.lua (stub généré, atlas Lua FS25)

---@class Fence
Fence = {}

---@param schema XMLSchema
---@param basePath string
function Fence.registerXMLPaths(schema, basePath) end

---@param schema XMLSchema
---@param basePath string
function Fence.registerSavegameXMLPaths(schema, basePath) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function Fence:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId integer
---@param connection table
function Fence:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function Fence:writeStream(streamId, connection) end
