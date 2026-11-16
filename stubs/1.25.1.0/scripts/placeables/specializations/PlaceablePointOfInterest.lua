---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceablePointOfInterest.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization with no prerequisites that attaches one or more PointOfInterest objects to a placeable. Each point is read from placeable.pointOfInterest.point, instantiated from the class named in the XML (default PointOfInterest) and deleted with the placeable. The farm owner is forwarded to every point. What a PointOfInterest does is defined in another class, not in this file.
---@class PlaceablePointOfInterest
PlaceablePointOfInterest = {}

--- Always returns true; no other specialization is required.
---@param specializations table
---@return boolean
function PlaceablePointOfInterest.prerequisitesPresent(specializations) end

--- Declares the XML schema for placeable.pointOfInterest.point(?): a class attribute plus whatever PointOfInterest.registerXMLPaths adds.
---@param schema any
---@param basePath any
function PlaceablePointOfInterest.registerXMLPaths(schema, basePath) end

--- Overrides the placeable's setOwnerFarmId.
---@param placeableType any
function PlaceablePointOfInterest.registerOverwrittenFunctions(placeableType) end

--- Subscribes the specialization to onLoad and onDelete.
---@param placeableType any
function PlaceablePointOfInterest.registerEventListeners(placeableType) end

--- Creates a point object for each XML entry using ClassUtil.getClassObject on the class name, then calls its load. Unknown classes log an error; points whose load fails are deleted and skipped.
---@param savegame table
function PlaceablePointOfInterest:onLoad(savegame) end

--- Deletes every point of interest held by the placeable.
function PlaceablePointOfInterest:onDelete() end

--- Calls the parent setOwnerFarmId, then sets the same farm id on each point of interest.
---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceablePointOfInterest:setOwnerFarmId(superFunc, farmId, noEventSend) end
