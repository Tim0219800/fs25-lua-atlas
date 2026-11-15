---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableConstructible.lua (stub généré, atlas Lua FS25)

---@class PlaceableConstructible
PlaceableConstructible = {}

---@param specializations table
---@return boolean
function PlaceableConstructible.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableConstructible.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableConstructible.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableConstructible.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableConstructible.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableConstructible.registerSavegameXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableConstructible:onLoad(savegame) end

---@param savegame any
function PlaceableConstructible:onFinalizePlacement(savegame) end

function PlaceableConstructible:onDelete() end

---@param superFunc any
---@param node any
function PlaceableConstructible:collectPickObjects(superFunc, node) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableConstructible:saveToXMLFile(xmlFile, key, usedModNames) end

---@param xmlFile any
---@param key any
function PlaceableConstructible:loadFromXMLFile(xmlFile, key) end

---@param streamId any
---@param connection any
function PlaceableConstructible:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableConstructible:onWriteStream(streamId, connection) end

---@param xmlFile XMLFile
---@param customEnvironment string?
---@param baseDir string?
---@param resultTable table?
---@return table?
function PlaceableConstructible.loadSpecValueFillTypes(xmlFile, customEnvironment, baseDir, resultTable) end
