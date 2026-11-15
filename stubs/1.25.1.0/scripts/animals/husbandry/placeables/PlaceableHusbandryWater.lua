---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryWater.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableHusbandryWater
PlaceableHusbandryWater = {}

---@param specializations table
---@return boolean
function PlaceableHusbandryWater.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableHusbandryWater.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandryWater.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandryWater.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableHusbandryWater.registerXMLPaths(schema, basePath) end

---@param savegame any
function PlaceableHusbandryWater:onLoad(savegame) end

function PlaceableHusbandryWater:onPostFinalizePlacement() end

function PlaceableHusbandryWater:onDelete() end

function PlaceableHusbandryWater:onFinalizePlacement() end

function PlaceableHusbandryWater:updateWaterPlane() end

---@param superFunc any
function PlaceableHusbandryWater:updateFeeding(superFunc) end

---@param husbandryId any
function PlaceableHusbandryWater:onHusbandryAnimalsCreated(husbandryId) end

---@param clusters any
function PlaceableHusbandryWater:onHusbandryAnimalsUpdate(clusters) end

---@param fillTypeIndex any
---@param delta any
function PlaceableHusbandryWater:onHusbandryFillLevelChanged(fillTypeIndex, delta) end

---@param superFunc any
function PlaceableHusbandryWater:getConditionInfos(superFunc) end

---@param superFunc any
---@param infoTable any
function PlaceableHusbandryWater:updateInfo(superFunc, infoTable) end
