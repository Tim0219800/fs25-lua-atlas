---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryMilk.lua (stub généré, atlas Lua FS25)

---@class PlaceableHusbandryMilk
PlaceableHusbandryMilk = {}

---@param specializations table
---@return boolean
function PlaceableHusbandryMilk.prerequisitesPresent(specializations) end

function PlaceableHusbandryMilk.initSpecialization() end

---@param placeableType any
function PlaceableHusbandryMilk.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandryMilk.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandryMilk.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableHusbandryMilk.registerXMLPaths(schema, basePath) end

---@param savegame any
function PlaceableHusbandryMilk:onLoad(savegame) end

---@param robot any
---@param args any
function PlaceableHusbandryMilk:onMilkingRobotLoaded(robot, args) end

function PlaceableHusbandryMilk:onDelete() end

function PlaceableHusbandryMilk:onFinalizePlacement() end

---@param superFunc any
---@param foodFactor any
---@param productionFactor any
---@param globalProductionFactor any
function PlaceableHusbandryMilk:updateOutput(superFunc, foodFactor, productionFactor, globalProductionFactor) end

---@param superFunc any
---@param foodFactor any
function PlaceableHusbandryMilk:updateProduction(superFunc, foodFactor) end

---@param clusters any
function PlaceableHusbandryMilk:onHusbandryAnimalsUpdate(clusters) end

---@param superFunc any
---@param infoTable any
function PlaceableHusbandryMilk:updateInfo(superFunc, infoTable) end

---@param superFunc any
function PlaceableHusbandryMilk:getConditionInfos(superFunc) end
