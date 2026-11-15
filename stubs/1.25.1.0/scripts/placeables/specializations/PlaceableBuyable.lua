---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableBuyable.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableBuyable
PlaceableBuyable = {}

---@param specializations table
---@return boolean
function PlaceableBuyable.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableBuyable.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableBuyable.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableBuyable.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableBuyable.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableBuyable:onLoad(savegame) end

function PlaceableBuyable:onDelete() end

---@param triggerId any
---@param otherId any
---@param onEnter any
---@param onLeave any
---@param onStay any
---@param otherShapeId any
function PlaceableBuyable:onBuyingTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay, otherShapeId) end

---@param requestCallback any
---@param target any
function PlaceableBuyable:buyRequest(requestCallback, target) end

---@param superFunc any
---@param farmId any
---@param noEventSend any
function PlaceableBuyable:setOwnerFarmId(superFunc, farmId, noEventSend) end
