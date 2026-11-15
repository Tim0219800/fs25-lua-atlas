# vehicles/specializations/AIImplement.lua

Source : `dataS/scripts/vehicles/specializations/AIImplement.lua` — FS25 1.25.1.0

- **AIImplement** (l.11)

## Fonctions

| Fonction | Ligne | Description |
|---|---|---|
| `AIImplement.prerequisitesPresent(specializations: table) → boolean` | 17 |  |
| `AIImplement.initSpecialization()` | 23 |  |
| `AIImplement.registerAIImplementXMLPaths(schema: any, basePath: any)` | 37 |  |
| `AIImplement.registerAIImplementBaseXMLPaths(schema: any, basePath: any)` | 80 |  |
| `AIImplement.registerAICollisionTriggerXMLPaths(schema: any, basePath: any)` | 98 |  |
| `AIImplement.registerEvents(vehicleType: any)` | 109 |  |
| `AIImplement.registerFunctions(vehicleType: any)` | 136 |  |
| `AIImplement.registerOverwrittenFunctions(vehicleType: any)` | 211 |  |
| `AIImplement.registerEventListeners(vehicleType: any)` | 220 |  |
| `AIImplement:onLoad(savegame: table)` | 229 |  |
| `AIImplement:onPostLoad(savegame: any)` | 353 |  |
| `AIImplement:onPostAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 385 |  |
| `AIImplement:loadAICollisionTriggerFromXML(xmlFile: any, key: any)` | 436 |  |
| `AIImplement:loadAIImplementBaseSetupFromXML(xmlFile: any, key: any, availableFunc: any)` | 482 |  |
| `AIImplement:getCustomAIImplementBaseSetup()` | 523 |  |
| `AIImplement:getCanAIImplementContinueWork(isTurning: any)` | 537 |  |
| `AIImplement:getCanImplementBeUsedForAI()` | 543 |  |
| `AIImplement:addVehicleToAIImplementList(superFunc: any, list: any)` | 554 |  |
| `AIImplement:getAllowTireTracks(superFunc: any)` | 564 |  |
| `AIImplement:getDoConsumePtoPower(superFunc: any)` | 570 |  |
| `AIImplement:checkMovingPartDirtyUpdateNode(superFunc: any, node: any, movingPart: any)` | 584 |  |
| `AIImplement:getAIMinTurningRadius()` | 603 |  |
| `AIImplement:getAIMarkers()` | 609 |  |
| `AIImplement:updateAIMarkerWidth()` | 635 |  |
| `AIImplement:setAIMarkersInverted(state: any)` | 663 |  |
| `AIImplement:calcAIMarkerAttacherJointOffset(leftMarker: any, rightMarker: any, backMarker: any)` | 670 |  |
| `AIImplement:getAIMarkerAttacherJointOffset(leftMarker: any)` | 695 |  |
| `AIImplement:getAIInvertMarkersOnTurn(turnLeft: any)` | 713 |  |
| `AIImplement:getAISizeMarkers()` | 719 |  |
| `AIImplement:getAILookAheadSize()` | 732 |  |
| `AIImplement:getAIHasNoFullCoverageArea()` | 738 |  |
| `AIImplement:getAIAreaOverlap()` | 744 |  |
| `AIImplement:getAIRowAlignment()` | 750 |  |
| `AIImplement:getImplementAllowAutomaticSteering()` | 761 |  |
| `AIImplement:getAIImplementCollisionTrigger()` | 767 |  |
| `AIImplement:getAIImplementCollisionTriggers(collisionTriggers: any)` | 780 |  |
| `AIImplement:getAINeedsLowering()` | 789 |  |
| `AIImplement:getAILowerIfAnyIsLowered()` | 795 |  |
| `AIImplement:getAINeedsRootAlignment()` | 801 |  |
| `AIImplement:getAIAllowTurnBackward()` | 807 |  |
| `AIImplement:getAIBlockTurnBackward()` | 813 |  |
| `AIImplement:getAIIsVineyardTool()` | 819 |  |
| `AIImplement:getAIToolReverserDirectionNode()` | 825 |  |
| `AIImplement:getAITurnRadiusLimitation()` | 831 |  |
| `AIImplement:setAIImplementVariableSideOffset(variableSideOffset: any)` | 838 |  |
| `AIImplement:getAIImplementSideOffset()` | 844 |  |
| `AIImplement:setAIFruitRequirements(fruitType: any, minGrowthState: any, maxGrowthState: any)` | 857 |  |
| `AIImplement:addAIFruitRequirement(fruitType: any, minGrowthState: any, maxGrowthState: any, customMapId: any, customMapStartChannel: any, customMapNumChannels: any)` | 864 |  |
| `AIImplement:clearAIFruitRequirements()` | 878 |  |
| `AIImplement:getAIFruitRequirements()` | 888 |  |
| `AIImplement:setAIDensityHeightTypeRequirements(fillType: any)` | 894 |  |
| `AIImplement:addAIDensityHeightTypeRequirement(fillType: any)` | 901 |  |
| `AIImplement:clearAIDensityHeightTypeRequirements()` | 910 |  |
| `AIImplement:getAIDensityHeightTypeRequirements()` | 920 |  |
| `AIImplement:getAIImplementUseVineSegment(placeable: any, segment: any, segmentSide: any)` | 926 |  |
| `AIImplement:setAIFruitProhibitions(fruitType: any, minGrowthState: any, maxGrowthState: any)` | 932 |  |
| `AIImplement:addAIFruitProhibitions(fruitType: any, minGrowthState: any, maxGrowthState: any, customMapId: any, customMapStartChannel: any, customMapNumChannels: any)` | 939 |  |
| `AIImplement:clearAIFruitProhibitions()` | 954 |  |
| `AIImplement:getAIFruitProhibitions()` | 964 |  |
| `AIImplement:addAITerrainDetailRequiredRange(detailType1: any, detailType2: any, minState: any, maxState: any)` | 971 |  |
| `AIImplement:addAIGroundTypeRequirements(groundTypes: any, excludedType1: any, excludedType2: any, excludedType3: any, excludedType4: any, excludedType5: any, excludedType6: any)` | 979 |  |
| `AIImplement:clearAITerrainDetailRequiredRange()` | 999 |  |
| `AIImplement:getAITerrainDetailRequiredRange()` | 1006 |  |
| `AIImplement:addAITerrainDetailProhibitedRange(detailType1: any, detailType2: any, minState: any, maxState: any)` | 1025 |  |
| `AIImplement:clearAITerrainDetailProhibitedRange()` | 1032 |  |
| `AIImplement:getAITerrainDetailProhibitedRange()` | 1039 |  |
| `AIImplement:getFieldCropsQuery()` | 1057 |  |
| `AIImplement:updateFieldCropsQuery()` | 1068 |  |
| `AIImplement:compareFieldCropsQuery(otherVehicle: any)` | 1077 |  |
| `AIImplement:createFieldCropsQuery()` | 1171 |  |
| `AIImplement:getIsAIImplementInLine()` | 1231 |  |
| `AIImplement:aiImplementStartLine()` | 1237 |  |
| `AIImplement:aiImplementEndLine()` | 1249 |  |

## Spécialisation

| Type | Nom | Ligne |
|---|---|---|
| registerEvent | `onAIImplementStart` | 110 |
| registerEvent | `onAIImplementActive` | 111 |
| registerEvent | `onAIImplementEnd` | 112 |
| registerEvent | `onAIImplementPrepareForWork` | 114 |
| registerEvent | `onAIImplementStartLine` | 116 |
| registerEvent | `onAIImplementEndLine` | 117 |
| registerEvent | `onAIImplementStartTurn` | 119 |
| registerEvent | `onAIImplementTurnProgress` | 120 |
| registerEvent | `onAIImplementEndTurn` | 121 |
| registerEvent | `onAIImplementSideOffsetChanged` | 123 |
| registerEvent | `onAIImplementBlock` | 125 |
| registerEvent | `onAIImplementContinue` | 126 |
| registerEvent | `onAIImplementPrepareForTransport` | 128 |
| registerEvent | `onAIImplementJobVehicleBlock` | 130 |
| registerEvent | `onAIImplementJobVehicleContinue` | 131 |
| registerFunction | `loadAICollisionTriggerFromXML` | 137 |
| registerFunction | `loadAIImplementBaseSetupFromXML` | 138 |
| registerFunction | `getCustomAIImplementBaseSetup` | 139 |
| registerFunction | `getCanAIImplementContinueWork` | 140 |
| registerFunction | `getCanImplementBeUsedForAI` | 141 |
| registerFunction | `getAIMinTurningRadius` | 142 |
| registerFunction | `getAIMarkers` | 143 |
| registerFunction | `updateAIMarkerWidth` | 144 |
| registerFunction | `setAIMarkersInverted` | 145 |
| registerFunction | `calcAIMarkerAttacherJointOffset` | 146 |
| registerFunction | `getAIMarkerAttacherJointOffset` | 147 |
| registerFunction | `getAIInvertMarkersOnTurn` | 148 |
| registerFunction | `getAISizeMarkers` | 149 |
| registerFunction | `getAILookAheadSize` | 150 |
| registerFunction | `getAIHasNoFullCoverageArea` | 151 |
| registerFunction | `getAIAreaOverlap` | 152 |
| registerFunction | `getAIRowAlignment` | 153 |
| registerFunction | `getImplementAllowAutomaticSteering` | 155 |
| registerFunction | `getAIImplementCollisionTrigger` | 157 |
| registerFunction | `getAIImplementCollisionTriggers` | 158 |
| registerFunction | `getAINeedsLowering` | 160 |
| registerFunction | `getAILowerIfAnyIsLowered` | 161 |
| registerFunction | `getAINeedsRootAlignment` | 162 |
| registerFunction | `getAIAllowTurnBackward` | 163 |
| registerFunction | `getAIBlockTurnBackward` | 164 |
| registerFunction | `getAIIsVineyardTool` | 165 |
| registerFunction | `getAIToolReverserDirectionNode` | 166 |
| registerFunction | `getAITurnRadiusLimitation` | 167 |
| registerFunction | `setAIImplementVariableSideOffset` | 169 |
| registerFunction | `getAIImplementSideOffset` | 170 |
| registerFunction | `setAIFruitProhibitions` | 172 |
| registerFunction | `addAIFruitProhibitions` | 173 |
| registerFunction | `clearAIFruitProhibitions` | 174 |
| registerFunction | `getAIFruitProhibitions` | 175 |
| registerFunction | `setAIFruitRequirements` | 177 |
| registerFunction | `addAIFruitRequirement` | 178 |
| registerFunction | `clearAIFruitRequirements` | 179 |
| registerFunction | `getAIFruitRequirements` | 180 |
| registerFunction | `setAIDensityHeightTypeRequirements` | 182 |
| registerFunction | `addAIDensityHeightTypeRequirement` | 183 |
| registerFunction | `clearAIDensityHeightTypeRequirements` | 184 |
| registerFunction | `getAIDensityHeightTypeRequirements` | 185 |
| registerFunction | `getAIImplementUseVineSegment` | 187 |
| registerFunction | `addAITerrainDetailRequiredRange` | 189 |
| registerFunction | `addAIGroundTypeRequirements` | 190 |
| registerFunction | `clearAITerrainDetailRequiredRange` | 191 |
| registerFunction | `getAITerrainDetailRequiredRange` | 192 |
| registerFunction | `addAITerrainDetailProhibitedRange` | 194 |
| registerFunction | `clearAITerrainDetailProhibitedRange` | 195 |
| registerFunction | `getAITerrainDetailProhibitedRange` | 196 |
| registerFunction | `getFieldCropsQuery` | 198 |
| registerFunction | `updateFieldCropsQuery` | 199 |
| registerFunction | `compareFieldCropsQuery` | 200 |
| registerFunction | `createFieldCropsQuery` | 201 |
| registerFunction | `getIsAIImplementInLine` | 203 |
| registerFunction | `aiImplementStartLine` | 205 |
| registerFunction | `aiImplementEndLine` | 206 |
| registerOverwrittenFunction | `addVehicleToAIImplementList` | 212 |
| registerOverwrittenFunction | `getAllowTireTracks` | 213 |
| registerOverwrittenFunction | `getDoConsumePtoPower` | 214 |
| registerOverwrittenFunction | `checkMovingPartDirtyUpdateNode` | 215 |
| registerEventListener | `onLoad` | 221 |
| registerEventListener | `onPostLoad` | 222 |
| registerEventListener | `onPostAIFieldCourseSettingsInitialized` | 223 |
