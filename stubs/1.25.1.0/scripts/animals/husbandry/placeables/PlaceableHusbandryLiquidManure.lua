---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryLiquidManure.lua (generated stub, FS25 Lua Atlas)

---@class PlaceableHusbandryLiquidManure
PlaceableHusbandryLiquidManure = {}

---@param specializations table
---@return boolean
function PlaceableHusbandryLiquidManure.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableHusbandryLiquidManure.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandryLiquidManure.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableHusbandryLiquidManure.registerXMLPaths(schema, basePath) end

---@param savegame any
function PlaceableHusbandryLiquidManure:onLoad(savegame) end

function PlaceableHusbandryLiquidManure:onFinalizePlacement() end

---@param superFunc any
---@param foodFactor any
---@param productionFactor any
---@param globalProductionFactor any
function PlaceableHusbandryLiquidManure:updateOutput(superFunc, foodFactor, productionFactor, globalProductionFactor) end

---@param superFunc any
---@param foodFactor any
function PlaceableHusbandryLiquidManure:updateProduction(superFunc, foodFactor) end

---@param clusters any
function PlaceableHusbandryLiquidManure:onHusbandryAnimalsUpdate(clusters) end

---@param superFunc any
function PlaceableHusbandryLiquidManure:getConditionInfos(superFunc) end

---@param superFunc any
---@param infoTable any
function PlaceableHusbandryLiquidManure:updateInfo(superFunc, infoTable) end
