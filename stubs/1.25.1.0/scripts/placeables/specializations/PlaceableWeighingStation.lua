---@meta
-- FS25 1.25.1.0 : placeables/specializations/PlaceableWeighingStation.lua (stub généré, atlas Lua FS25)

---@class PlaceableWeighingStation
PlaceableWeighingStation = {}

---@param specializations table
---@return boolean
function PlaceableWeighingStation.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableWeighingStation.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableWeighingStation.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableWeighingStation.registerXMLPaths(schema, basePath) end

---@param savegame table
function PlaceableWeighingStation:onLoad(savegame) end

function PlaceableWeighingStation:onDelete() end

function PlaceableWeighingStation:updateWeightDisplay() end

---@param mass any
function PlaceableWeighingStation:setWeightDisplay(mass) end

---@param triggerId integer
---@param otherId integer
---@param onEnter boolean
---@param onLeave boolean
---@param onStay boolean
function PlaceableWeighingStation:onWeighingTriggerCallback(triggerId, otherId, onEnter, onLeave, onStay) end
