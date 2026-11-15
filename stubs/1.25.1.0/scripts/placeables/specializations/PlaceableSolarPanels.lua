---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableSolarPanels.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableSolarPanels
PlaceableSolarPanels = {}

---@param specializations table
---@return boolean
function PlaceableSolarPanels.prerequisitesPresent(specializations) end

function PlaceableSolarPanels.initSpecialization() end

---@param placeableType any
function PlaceableSolarPanels.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableSolarPanels.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableSolarPanels.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableSolarPanels.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableSolarPanels.registerSavegameXMLPaths(schema, basePath) end

---@param savegame any
function PlaceableSolarPanels:onLoad(savegame) end

function PlaceableSolarPanels:onFinalizePlacement() end

---@param xmlFile any
---@param key any
function PlaceableSolarPanels:loadFromXMLFile(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param usedModNames any
function PlaceableSolarPanels:saveToXMLFile(xmlFile, key, usedModNames) end

---@param streamId any
---@param connection any
function PlaceableSolarPanels:onReadStream(streamId, connection) end

---@param streamId any
---@param connection any
function PlaceableSolarPanels:onWriteStream(streamId, connection) end

---@param dt any
function PlaceableSolarPanels:onUpdate(dt) end

function PlaceableSolarPanels:onHourChanged() end

function PlaceableSolarPanels:updateHeadRotation() end

---@param superFunc any
function PlaceableSolarPanels:getIncomePerHour(superFunc) end

---@param superFunc any
function PlaceableSolarPanels:getNeedHourChanged(superFunc) end
