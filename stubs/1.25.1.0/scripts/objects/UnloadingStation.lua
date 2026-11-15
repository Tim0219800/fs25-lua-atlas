---@meta
-- FS25 1.25.1.0 : objects/UnloadingStation.lua (stub généré, atlas Lua FS25)

---@class UnloadingStation : Object
UnloadingStation = {}

---@param streamId integer
---@param connection table
function UnloadingStation:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function UnloadingStation:writeStream(streamId, connection) end

---@param xmlFile any
---@param key any
function UnloadingStation:validateUnloadTriggers(xmlFile, key) end

---@param schema any
---@param basePath any
function UnloadingStation.registerXMLPaths(schema, basePath) end
