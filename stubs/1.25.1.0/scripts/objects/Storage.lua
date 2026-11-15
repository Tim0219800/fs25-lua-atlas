---@meta
-- FS25 1.25.1.0 : objects/Storage.lua (stub généré, atlas Lua FS25)

---@class Storage : Object
Storage = {}

---@param schema any
---@param basePath any
function Storage.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function Storage.registerSavegameXMLPaths(schema, basePath) end

---@param isServer boolean
---@param isClient boolean
---@param customMt table?
---@return table
function Storage.new(isServer, isClient, customMt) end

---@param components table
---@param xmlFile table
---@param key string
---@param i3dMappings table
---@param baseDirectory any
---@return boolean
function Storage:load(components, xmlFile, key, i3dMappings, baseDirectory) end

function Storage:delete() end

---@param streamId integer
---@param connection table
function Storage:readStream(streamId, connection) end

---@param streamId integer
---@param connection table
function Storage:writeStream(streamId, connection) end

---@param streamId integer
---@param timestamp integer
---@param connection table
function Storage:readUpdateStream(streamId, timestamp, connection) end

---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Storage:writeUpdateStream(streamId, connection, dirtyMask) end

---@param xmlFile XMLFile
---@param key string
---@return boolean
function Storage:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function Storage:saveToXMLFile(xmlFile, key, usedModNames) end

function Storage:empty() end

function Storage:updateFillPlanes() end

---@param fillType integer
---@return boolean
function Storage:getIsFillTypeSupported(fillType) end

---@param fillType integer
---@return number
function Storage:getFillLevel(fillType) end

function Storage:getFillLevels() end

---@param fillType any
function Storage:getCapacity(fillType) end

---@param fillLevel number
---@param fillType integer
---@param fillInfo table
function Storage:setFillLevel(fillLevel, fillType, fillInfo) end

---@param fillType integer
---@return number
function Storage:getFreeCapacity(fillType) end

function Storage:getSupportedFillTypes() end

function Storage:hourChanged() end

---@param station any
function Storage:addUnloadingStation(station) end

---@param station any
function Storage:removeUnloadingStation(station) end

---@param loadingStation any
function Storage:addLoadingStation(loadingStation) end

---@param loadingStation any
function Storage:removeLoadingStation(loadingStation) end

---@param farmId any
function Storage:farmDestroyed(farmId) end

---@param func any
function Storage:addFillLevelChangedListeners(func) end

---@param func any
function Storage:removeFillLevelChangedListeners(func) end

function Storage:draw() end
