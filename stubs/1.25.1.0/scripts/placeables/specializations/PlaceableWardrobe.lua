---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableWardrobe.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableWardrobe
PlaceableWardrobe = {}

---@param specializations table
---@return boolean
function PlaceableWardrobe.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableWardrobe.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableWardrobe.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableWardrobe.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableWardrobe.registerSavegameXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableWardrobe:onLoad(savegame) end

---@param xmlFile any
---@param key any
function PlaceableWardrobe:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableWardrobe:saveToXMLFile(xmlFile, key, usedModNames) end

function PlaceableWardrobe:onDelete() end

---@param streamId integer
---@param connection Connection
function PlaceableWardrobe:onReadStream(streamId, connection) end

---@param streamId integer
---@param connection Connection
function PlaceableWardrobe:onWriteStream(streamId, connection) end

---@param triggerId any
---@param otherActorId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function PlaceableWardrobe:wardrobeTriggerCallback(triggerId, otherActorId, onEnter, onLeave, onStay, otherShapeId) end
