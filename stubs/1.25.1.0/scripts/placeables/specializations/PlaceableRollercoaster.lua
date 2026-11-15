---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableRollercoaster.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableRollercoaster
PlaceableRollercoaster = {}

---@param specializations table
---@return boolean
function PlaceableRollercoaster.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableRollercoaster.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableRollercoaster.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableRollercoaster.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableRollercoaster.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableRollercoaster.registerSavegameXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableRollercoaster:onLoad(savegame) end

---@param node any
---@param failedReason any
---@param args any
function PlaceableRollercoaster:onSharedAnimationFileLoaded(node, failedReason, args) end

---@param savegame any
function PlaceableRollercoaster:onFinalizePlacement(savegame) end

function PlaceableRollercoaster:onDelete() end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableRollercoaster:saveToXMLFile(xmlFile, key, usedModNames) end

---@param xmlFile any
---@param key any
function PlaceableRollercoaster:loadFromXMLFile(xmlFile, key) end

---@param streamId any
---@param connection any
function PlaceableRollercoaster:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableRollercoaster:onWriteStream(streamId, connection) end
