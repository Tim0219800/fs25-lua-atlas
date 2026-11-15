---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AIImplement.lua (generated stub, FS25 Lua Atlas)

---@class AIImplement
AIImplement = {}

---@param specializations table
---@return boolean
function AIImplement.prerequisitesPresent(specializations) end

function AIImplement.initSpecialization() end

---@param schema any
---@param basePath any
function AIImplement.registerAIImplementXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function AIImplement.registerAIImplementBaseXMLPaths(schema, basePath) end

---@param schema any
---@param basePath any
function AIImplement.registerAICollisionTriggerXMLPaths(schema, basePath) end

---@param vehicleType any
function AIImplement.registerEvents(vehicleType) end

---@param vehicleType any
function AIImplement.registerFunctions(vehicleType) end

---@param vehicleType any
function AIImplement.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function AIImplement.registerEventListeners(vehicleType) end

---@param savegame table
function AIImplement:onLoad(savegame) end

---@param savegame any
function AIImplement:onPostLoad(savegame) end

---@param fieldCourseSettings any
function AIImplement:onPostAIFieldCourseSettingsInitialized(fieldCourseSettings) end

---@param xmlFile any
---@param key any
function AIImplement:loadAICollisionTriggerFromXML(xmlFile, key) end

---@param xmlFile any
---@param key any
---@param availableFunc any
function AIImplement:loadAIImplementBaseSetupFromXML(xmlFile, key, availableFunc) end

function AIImplement:getCustomAIImplementBaseSetup() end

---@param isTurning any
function AIImplement:getCanAIImplementContinueWork(isTurning) end

function AIImplement:getCanImplementBeUsedForAI() end

---@param superFunc any
---@param list any
function AIImplement:addVehicleToAIImplementList(superFunc, list) end

---@param superFunc any
function AIImplement:getAllowTireTracks(superFunc) end

---@param superFunc any
function AIImplement:getDoConsumePtoPower(superFunc) end

---@param superFunc any
---@param node any
---@param movingPart any
function AIImplement:checkMovingPartDirtyUpdateNode(superFunc, node, movingPart) end

function AIImplement:getAIMinTurningRadius() end

function AIImplement:getAIMarkers() end

function AIImplement:updateAIMarkerWidth() end

---@param state any
function AIImplement:setAIMarkersInverted(state) end

---@param leftMarker any
---@param rightMarker any
---@param backMarker any
function AIImplement:calcAIMarkerAttacherJointOffset(leftMarker, rightMarker, backMarker) end

---@param leftMarker any
function AIImplement:getAIMarkerAttacherJointOffset(leftMarker) end

---@param turnLeft any
function AIImplement:getAIInvertMarkersOnTurn(turnLeft) end

function AIImplement:getAISizeMarkers() end

function AIImplement:getAILookAheadSize() end

function AIImplement:getAIHasNoFullCoverageArea() end

function AIImplement:getAIAreaOverlap() end

function AIImplement:getAIRowAlignment() end

function AIImplement:getImplementAllowAutomaticSteering() end

function AIImplement:getAIImplementCollisionTrigger() end

---@param collisionTriggers any
function AIImplement:getAIImplementCollisionTriggers(collisionTriggers) end

function AIImplement:getAINeedsLowering() end

function AIImplement:getAILowerIfAnyIsLowered() end

function AIImplement:getAINeedsRootAlignment() end

function AIImplement:getAIAllowTurnBackward() end

function AIImplement:getAIBlockTurnBackward() end

function AIImplement:getAIIsVineyardTool() end

function AIImplement:getAIToolReverserDirectionNode() end

function AIImplement:getAITurnRadiusLimitation() end

---@param variableSideOffset any
function AIImplement:setAIImplementVariableSideOffset(variableSideOffset) end

function AIImplement:getAIImplementSideOffset() end

---@param fruitType any
---@param minGrowthState any
---@param maxGrowthState any
function AIImplement:setAIFruitRequirements(fruitType, minGrowthState, maxGrowthState) end

---@param fruitType any
---@param minGrowthState any
---@param maxGrowthState any
---@param customMapId any
---@param customMapStartChannel any
---@param customMapNumChannels any
function AIImplement:addAIFruitRequirement(fruitType, minGrowthState, maxGrowthState, customMapId, customMapStartChannel, customMapNumChannels) end

function AIImplement:clearAIFruitRequirements() end

function AIImplement:getAIFruitRequirements() end

---@param fillType any
function AIImplement:setAIDensityHeightTypeRequirements(fillType) end

---@param fillType any
function AIImplement:addAIDensityHeightTypeRequirement(fillType) end

function AIImplement:clearAIDensityHeightTypeRequirements() end

function AIImplement:getAIDensityHeightTypeRequirements() end

---@param placeable any
---@param segment any
---@param segmentSide any
function AIImplement:getAIImplementUseVineSegment(placeable, segment, segmentSide) end

---@param fruitType any
---@param minGrowthState any
---@param maxGrowthState any
function AIImplement:setAIFruitProhibitions(fruitType, minGrowthState, maxGrowthState) end

---@param fruitType any
---@param minGrowthState any
---@param maxGrowthState any
---@param customMapId any
---@param customMapStartChannel any
---@param customMapNumChannels any
function AIImplement:addAIFruitProhibitions(fruitType, minGrowthState, maxGrowthState, customMapId, customMapStartChannel, customMapNumChannels) end

function AIImplement:clearAIFruitProhibitions() end

function AIImplement:getAIFruitProhibitions() end

---@param detailType1 any
---@param detailType2 any
---@param minState any
---@param maxState any
function AIImplement:addAITerrainDetailRequiredRange(detailType1, detailType2, minState, maxState) end

---@param groundTypes any
---@param excludedType1 any
---@param excludedType2 any
---@param excludedType3 any
---@param excludedType4 any
---@param excludedType5 any
---@param excludedType6 any
function AIImplement:addAIGroundTypeRequirements(groundTypes, excludedType1, excludedType2, excludedType3, excludedType4, excludedType5, excludedType6) end

function AIImplement:clearAITerrainDetailRequiredRange() end

function AIImplement:getAITerrainDetailRequiredRange() end

---@param detailType1 any
---@param detailType2 any
---@param minState any
---@param maxState any
function AIImplement:addAITerrainDetailProhibitedRange(detailType1, detailType2, minState, maxState) end

function AIImplement:clearAITerrainDetailProhibitedRange() end

function AIImplement:getAITerrainDetailProhibitedRange() end

function AIImplement:getFieldCropsQuery() end

function AIImplement:updateFieldCropsQuery() end

---@param otherVehicle any
function AIImplement:compareFieldCropsQuery(otherVehicle) end

function AIImplement:createFieldCropsQuery() end

function AIImplement:getIsAIImplementInLine() end

function AIImplement:aiImplementStartLine() end

function AIImplement:aiImplementEndLine() end
