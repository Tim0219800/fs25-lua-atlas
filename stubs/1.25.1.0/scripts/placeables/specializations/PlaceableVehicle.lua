---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableVehicle.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableVehicle
PlaceableVehicle = {}

---@param specializations table
---@return boolean
function PlaceableVehicle.prerequisitesPresent(specializations) end

---@param vehicleType any
function PlaceableVehicle.registerFunctions(vehicleType) end

---@param placeableType any
function PlaceableVehicle.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableVehicle.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableVehicle.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableVehicle:onLoad(savegame) end

---@param vehicles any
---@param vehicleLoadState any
---@param vehicleData any
function PlaceableVehicle:onFinishLoadingVehicle(vehicles, vehicleLoadState, vehicleData) end

function PlaceableVehicle:onFinalizePlacement() end

function PlaceableVehicle:onDelete() end

---@param alreadySent any
function PlaceableVehicle:register(alreadySent) end

---@param superFunc any
---@param node any
function PlaceableVehicle:collectPickObjects(superFunc, node) end
