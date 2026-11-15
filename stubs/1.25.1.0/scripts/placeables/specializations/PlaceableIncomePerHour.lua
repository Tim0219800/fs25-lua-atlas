---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableIncomePerHour.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableIncomePerHour
PlaceableIncomePerHour = {}

---@param specializations table
---@return boolean
function PlaceableIncomePerHour.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableIncomePerHour.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableIncomePerHour.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableIncomePerHour.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableIncomePerHour.registerXMLPaths(schema, basePath) end

function PlaceableIncomePerHour.initSpecialization() end

---@param savegame table
function PlaceableIncomePerHour:onLoad(savegame) end

---@param superFunc any
function PlaceableIncomePerHour:getNeedHourChanged(superFunc) end

function PlaceableIncomePerHour:onHourChanged() end

function PlaceableIncomePerHour:getIncomePerHour() end

---@param xmlFile XMLFile
---@param customEnvironment string
---@param baseDir any
---@return table
function PlaceableIncomePerHour.loadSpecValueIncomePerHour(xmlFile, customEnvironment, baseDir) end

---@param storeItem table
---@param realItem table
---@return integer
function PlaceableIncomePerHour.getSpecValueIncomePerHour(storeItem, realItem) end
