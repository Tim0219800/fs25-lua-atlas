---@meta
-- FS25 1.25.1.0 : gui/base/MapOverlayGenerator.lua (generated stub, FS25 Lua Atlas)

---@class MapOverlayGenerator
MapOverlayGenerator = {}

---@param l10n table
---@param fruitTypeManager table
---@param fillTypeManager table
---@param farmlandManager table
---@param farmManager table
---@param weedSystem table
---@return MapOverlayGenerator
function MapOverlayGenerator.new(l10n, fruitTypeManager, fillTypeManager, farmlandManager, farmManager, weedSystem) end

function MapOverlayGenerator:delete() end

---@param default any
---@param limitToTwo any
function MapOverlayGenerator:adjustedOverlayResolution(default, limitToTwo) end

---@param missionFruitTypes any
function MapOverlayGenerator:setMissionFruitTypes(missionFruitTypes) end

---@param isColorBlindMode any
function MapOverlayGenerator:setColorBlindMode(isColorBlindMode) end

---@param fruitTypeFilter any
function MapOverlayGenerator:buildFruitTypeMapOverlay(fruitTypeFilter) end

---@param fruitTypeFilter any
function MapOverlayGenerator:buildFieldsOverlay(fruitTypeFilter) end

---@param growthStateFilter any
---@param fruitTypeFilter any
function MapOverlayGenerator:buildGrowthStateMapOverlay(growthStateFilter, fruitTypeFilter) end

---@param soilStateFilter any
function MapOverlayGenerator:buildSoilStateMapOverlay(soilStateFilter) end

---@param selectedFarmland any
function MapOverlayGenerator:buildFarmlandsMapOverlay(selectedFarmland) end

---@param selectedFarmland any
function MapOverlayGenerator:buildSingleFarmlandsMapOverlay(selectedFarmland) end

---@param mapOverlayType any
---@param finishedCallback any
---@param overlayState any
---@param overlayState2 any
function MapOverlayGenerator:generateOverlay(mapOverlayType, finishedCallback, overlayState, overlayState2) end

---@param finishedCallback any
---@param fruitTypeFilter any
function MapOverlayGenerator:generateFruitTypeOverlay(finishedCallback, fruitTypeFilter) end

---@param finishedCallback any
function MapOverlayGenerator:generateFieldsOverlay(finishedCallback) end

---@param finishedCallback any
---@param growthStateFilter any
---@param fruitTypeFilter any
function MapOverlayGenerator:generateGrowthStateOverlay(finishedCallback, growthStateFilter, fruitTypeFilter) end

---@param finishedCallback any
---@param soilStateFilter any
function MapOverlayGenerator:generateSoilStateOverlay(finishedCallback, soilStateFilter) end

---@param finishedCallback any
---@param mapPosition any
function MapOverlayGenerator:generateSingleFarmlandOverlay(finishedCallback, mapPosition) end

---@param finishedCallback any
---@param mapPosition any
function MapOverlayGenerator:generateFarmlandOverlay(finishedCallback, mapPosition) end

function MapOverlayGenerator:checkOverlayFinished() end

function MapOverlayGenerator:reset() end

---@param dt any
function MapOverlayGenerator:update(dt) end

function MapOverlayGenerator:getDisplayCropTypes() end

---@return array
function MapOverlayGenerator:getDisplayGrowthStates() end

---@return array
function MapOverlayGenerator:getDisplaySoilStates() end
