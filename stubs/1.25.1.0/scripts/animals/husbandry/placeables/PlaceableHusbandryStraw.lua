---@meta
-- FS25 1.25.1.0 : animals/husbandry/placeables/PlaceableHusbandryStraw.lua (stub généré, atlas Lua FS25)

---@class PlaceableHusbandryStraw
PlaceableHusbandryStraw = {}

---@param specializations table
---@return boolean
function PlaceableHusbandryStraw.prerequisitesPresent(specializations) end

---@param placeableType any
function PlaceableHusbandryStraw.registerFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandryStraw.registerOverwrittenFunctions(placeableType) end

---@param placeableType any
function PlaceableHusbandryStraw.registerEventListeners(placeableType) end

---@param schema any
---@param basePath any
function PlaceableHusbandryStraw.registerXMLPaths(schema, basePath) end

---@param savegame any
function PlaceableHusbandryStraw:onLoad(savegame) end

function PlaceableHusbandryStraw:onPostFinalizePlacement() end

function PlaceableHusbandryStraw:onDelete() end

function PlaceableHusbandryStraw:onFinalizePlacement() end

---@param streamId any
---@param connection any
function PlaceableHusbandryStraw:onReadStream(streamId, connection) end

function PlaceableHusbandryStraw:updateStrawPlane() end

---@param superFunc any
---@param foodFactor any
---@param productionFactor any
---@param globalProductionFactor any
function PlaceableHusbandryStraw:updateOutput(superFunc, foodFactor, productionFactor, globalProductionFactor) end

---@param superFunc any
---@param foodFactor any
function PlaceableHusbandryStraw:updateProduction(superFunc, foodFactor) end

---@param clusters any
function PlaceableHusbandryStraw:onHusbandryAnimalsUpdate(clusters) end

---@param fillTypeIndex any
---@param delta any
function PlaceableHusbandryStraw:onHusbandryFillLevelChanged(fillTypeIndex, delta) end

---@param superFunc any
function PlaceableHusbandryStraw:getConditionInfos(superFunc) end

---@param superFunc any
---@param infoTable any
function PlaceableHusbandryStraw:updateInfo(superFunc, infoTable) end
