---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceablePlacement.lua (generated stub, FS25 Lua Atlas)

---@class PlaceablePlacement
PlaceablePlacement = {}

---@param specializations table
---@return boolean
function PlaceablePlacement.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceablePlacement.registerFunctions(placeableType) end

---@param placeableType any
function PlaceablePlacement.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceablePlacement.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceablePlacement:onLoad(savegame) end

function PlaceablePlacement:onDelete() end

---@param xmlFile any
---@param key any
---@param area any
function PlaceablePlacement:loadTestArea(xmlFile, key, area) end

---@param x any
---@param y any
---@param z any
function PlaceablePlacement:getPlacementRotation(x, y, z) end

---@param x any
---@param y any
---@param z any
function PlaceablePlacement:getPlacementPosition(x, y, z) end

function PlaceablePlacement:getPositionSnapSize() end

function PlaceablePlacement:getPositionSnapOffset() end

function PlaceablePlacement:getRotationSnapAngle() end

function PlaceablePlacement:onPreFinalizePlacement() end

---@param sx any
---@param sz any
---@param wx any
---@param wz any
---@param hx any
---@param hz any
---@param farmId any
function PlaceablePlacement:getIsAreaOwnedByFarm(sx, sz, wx, wz, hx, hz, farmId) end

---@param x any
---@param y any
---@param z any
---@param rotY any
function PlaceablePlacement:startPlacementCheck(x, y, z, rotY) end

---@param x any
---@param y any
---@param z any
---@param rotY any
---@param checkFunc any
function PlaceablePlacement:getHasOverlap(x, y, z, rotY, checkFunc) end

---@param places any
---@param x any
---@param y any
---@param z any
---@param rotY any
function PlaceablePlacement:getHasOverlapWithPlaces(places, x, y, z, rotY) end

---@param zones any
---@param x any
---@param y any
---@param z any
---@param rotY any
function PlaceablePlacement:getHasOverlapWithZones(zones, x, y, z, rotY) end

---@param testArea any
---@param x any
---@param z any
---@param rotY any
function PlaceablePlacement:getTestParallelogramAtWorldPosition(testArea, x, z, rotY) end

function PlaceablePlacement:playPlaceSound() end

---@param onlyIfNotPlaying any
function PlaceablePlacement:playDestroySound(onlyIfNotPlaying) end
