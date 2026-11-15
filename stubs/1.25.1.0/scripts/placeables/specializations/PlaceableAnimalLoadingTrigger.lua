---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableAnimalLoadingTrigger.lua (stub généré, atlas Lua FS25)

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
