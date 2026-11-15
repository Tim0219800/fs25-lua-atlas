---@meta
-- FS25 1.25.1.0 : objects/SellingStation.lua (stub généré, atlas Lua FS25)

---@class SellingStation : UnloadingStation
SellingStation = {}

---@param xmlFile XMLFile
---@param key string
---@return boolean
function SellingStation:loadFromXMLFile(xmlFile, key) end

---@param schema any
---@param basePath any
function SellingStation.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function SellingStation.registerSavegameXMLPaths(schema, basePath) end

---@param xmlFile XMLFile
---@param customEnvironment string?
---@param baseDir string?
---@return table?
function SellingStation.loadSpecValueFillTypes(xmlFile, customEnvironment, baseDir) end

---@param storeItem any
---@param realItem any
function SellingStation.getSpecValueFillTypes(storeItem, realItem) end
