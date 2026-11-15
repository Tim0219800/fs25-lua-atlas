---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableDestructible.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableDestructible
PlaceableDestructible = {}

---@param schema any
---@param basePath any
function PlaceableDestructible.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableDestructible.registerSavegameXMLPaths(schema, basePath) end

---@param specializations table
---@return boolean
function PlaceableDestructible.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableDestructible.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableDestructible.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableDestructible.registerEventListeners(placeableType) end

---@param savegame table
function PlaceableDestructible:onLoad(savegame) end

function PlaceableDestructible:onFinalizePlacement() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableDestructible:saveToXMLFile(xmlFile, key, usedModNames) end

---@param xmlFile any
---@param key any
function PlaceableDestructible:loadFromXMLFile(xmlFile, key) end

---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
function PlaceableDestructible:onDestructibleTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay) end
