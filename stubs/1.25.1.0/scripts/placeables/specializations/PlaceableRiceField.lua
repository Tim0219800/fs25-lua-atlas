---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableRiceField.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableRiceField
PlaceableRiceField = {}

---@param schema XMLSchema
---@param basePath string
function PlaceableRiceField.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableRiceField.registerSavegameXMLPaths(schema, basePath) end

---@param specializations table
---@return boolean
function PlaceableRiceField.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableRiceField.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableRiceField.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableRiceField.registerEventListeners(placeableType) end

function PlaceableRiceField.initSpecialization() end

---@param savegame table
function PlaceableRiceField:onLoad(savegame) end

---@param i3dNode any
---@param failedReason any
---@param args any
function PlaceableRiceField:onPumpI3DLoaded(i3dNode, failedReason, args) end

function PlaceableRiceField:onDelete() end

---@param streamId any
---@param connection any
function PlaceableRiceField:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableRiceField:onWriteStream(streamId, connection) end

---@param streamId any
---@param connection any
---@param dirtyMask any
function PlaceableRiceField:onWriteUpdateStream(streamId, connection, dirtyMask) end

---@param dt any
function PlaceableRiceField:onUpdateTick(dt) end

---@param xmlFile any
---@param key any
function PlaceableRiceField:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableRiceField:saveToXMLFile(xmlFile, key, usedModNames) end

---@param superFunc any
function PlaceableRiceField:getDestructionMethod(superFunc) end

---@param superFunc function
---@param node integer
---@return array?
function PlaceableRiceField:previewNodeDestructionNodes(superFunc, node) end

---@param superFunc any
---@param node any
function PlaceableRiceField:performNodeDestruction(superFunc, node) end

---@param superFunc any
---@param node any
---@param target any
function PlaceableRiceField:collectPickObjects(superFunc, node, target) end

---@param field any
function PlaceableRiceField:buildMesh(field) end

---@param field any
---@param callback any
function PlaceableRiceField:performTerrainDeformation(field, callback) end

function PlaceableRiceField:getHasValidFields() end
