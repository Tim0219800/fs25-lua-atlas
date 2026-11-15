---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableAnimalLoadingTrigger.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableAnimalLoadingTrigger
PlaceableAnimalLoadingTrigger = {}

---@param specializations table
---@return boolean
function PlaceableAnimalLoadingTrigger.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableAnimalLoadingTrigger.registerEventListeners(placeableType) end

---@param placeableType any
function PlaceableAnimalLoadingTrigger.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableAnimalLoadingTrigger.registerOverwrittenFunctions(placeableType) end

---@param schema any
---@param basePath any
function PlaceableAnimalLoadingTrigger.registerXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function PlaceableAnimalLoadingTrigger.registerSavegameXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableAnimalLoadingTrigger:onLoad(savegame) end

function PlaceableAnimalLoadingTrigger:onDelete() end
