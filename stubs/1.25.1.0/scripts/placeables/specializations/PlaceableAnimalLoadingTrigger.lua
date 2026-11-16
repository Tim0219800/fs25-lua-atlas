---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableAnimalLoadingTrigger.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization (`spec_animalLoadingTrigger`) that creates an `AnimalLoadingTrigger` from the `placeable.animalLoadingTrigger` XML section so animals can be loaded onto trailers at the placeable. It deletes the trigger with the placeable. Trigger behaviour lives in `AnimalLoadingTrigger`, not in this file.
---@class PlaceableAnimalLoadingTrigger
PlaceableAnimalLoadingTrigger = {}

--- Prerequisite check; always returns true.
---@param specializations table
---@return boolean
function PlaceableAnimalLoadingTrigger.prerequisitesPresent(specializations) end

--- Subscribes to the placeable events `onLoad` and `onDelete`.
---@param placeableType any
function PlaceableAnimalLoadingTrigger.registerEventListeners(placeableType) end

--- Empty; this specialization registers no new functions.
---@param placeableType any
function PlaceableAnimalLoadingTrigger.registerFunctions(placeableType) end

--- Empty; this specialization overrides no placeable functions.
---@param placeableType any
function PlaceableAnimalLoadingTrigger.registerOverwrittenFunctions(placeableType) end

--- Registers the `.animalLoadingTrigger` XML paths by delegating to `AnimalLoadingTrigger.registerXMLPaths`.
---@param schema any
---@param basePath any
function PlaceableAnimalLoadingTrigger.registerXMLPaths(schema, basePath) end

--- Empty; nothing is saved by this specialization.
---@param schema any
---@param basePath any
function PlaceableAnimalLoadingTrigger.registerSavegameXMLPaths(schema, basePath) end

--- Creates an `AnimalLoadingTrigger` for the server/client role and loads it from XML. If loading fails, the trigger is deleted and left nil.
---@param savegame table
function PlaceableAnimalLoadingTrigger:onLoad(savegame) end

--- Deletes the animal loading trigger, if any, and clears the reference.
function PlaceableAnimalLoadingTrigger:onDelete() end
