---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableWorkshop.lua (generated stub, FS25 Lua Atlas)

--- Placeable specialization that turns a building into a workshop by creating a VehicleSellingPoint from `placeable.workshop.sellingPoint`. The selling point is linked back to the placeable and its owner farm is kept in step.
---@class PlaceableWorkshop
PlaceableWorkshop = {}

--- Always returns true: no prerequisite specialization.
---@param specializations table
---@return boolean
function PlaceableWorkshop.prerequisitesPresent(specializations) end

--- Overrides `setOwnerFarmId` on the placeable type.
---@param placeableType any
function PlaceableWorkshop.registerOverwrittenFunctions(placeableType) end

--- Subscribes to onLoad and onDelete.
---@param placeableType any
function PlaceableWorkshop.registerEventListeners(placeableType) end

--- Declares the selling point XML keys via `VehicleSellingPoint.registerXMLPaths` under `.workshop.sellingPoint`.
---@param schema any
---@param basePath any
function PlaceableWorkshop.registerXMLPaths(schema, basePath) end

--- Creates and loads the VehicleSellingPoint, sets its owner farm and stores `owningPlaceable` on it.
---@param savegame table
function PlaceableWorkshop:onLoad(savegame) end

--- Deletes the selling point if it exists.
function PlaceableWorkshop:onDelete() end

--- Calls the parent, then propagates the new owner farm to the selling point.
---@param superFunc any
---@param ownerFarmId any
---@param noEventSend any
function PlaceableWorkshop:setOwnerFarmId(superFunc, ownerFarmId, noEventSend) end
