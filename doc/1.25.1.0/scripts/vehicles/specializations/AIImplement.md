# vehicles/specializations/AIImplement.lua

*[Version française](../../../fr/scripts/vehicles/specializations/AIImplement.md)*

Source: `dataS/scripts/vehicles/specializations/AIImplement.lua` — FS25 1.25.1.0

✍ Specialization (no prerequisites) that gives tools and implements their AI data: area and size markers, collision trigger, turning radius limits, lowering and reverse-turn rules, headland and row alignment settings, and the ground, fruit and density-height requirements that decide where the AI may work. It reads the vehicle.ai XML node, optionally replaced by an aiConfigurations entry chosen by the "ai" configuration. It raises the onAIImplement* events (start, end, line, turn, block and so on); the code that raises most of them lives in other files. Requirements are turned into a FieldCropsQuery object, whose engine-side behaviour is UNVERIFIED.

- **AIImplement** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `AIImplement.prerequisitesPresent(specializations: table) → boolean` | 17 | ✍ Always returns true: any vehicle type can carry this specialization. |
| `AIImplement.initSpecialization()` | 23 | ✍ Adds the "ai" vehicle configuration type and registers the vehicle.ai XML paths, plus the same paths under each aiConfiguration entry. |
| `AIImplement.registerAIImplementXMLPaths(schema: any, basePath: any)` | 37 | ✍ Registers every AI implement XML setting under a base path: turning radius, lowering, root alignment, backward turning, vineyard flags, reverser node, turn limitation, look-ahead, coverage, headland, overlap and row alignment. |
| `AIImplement.registerAIImplementBaseXMLPaths(schema: any, basePath: any)` | 80 | ✍ Registers the area markers (left, right, back, side offset, width, validity offset) and size markers, then the collision trigger paths. Can be reused by other specializations for their own AI setups. |
| `AIImplement.registerAICollisionTriggerXMLPaths(schema: any, basePath: any)` | 98 | ✍ Registers the collisionTrigger XML keys: useSize, node, backNode, width (default 4), height (default 3) and length (default 5). |
| `AIImplement.registerEvents(vehicleType: any)` | 109 | ✍ Registers the onAIImplement* vehicle events: start, active, end, prepare for work or transport, start and end line, start, progress and end turn, side offset changed, block, continue, and the two job-vehicle block and continue events. |
| `AIImplement.registerFunctions(vehicleType: any)` | 136 | ✍ Adds the specialization's getters, setters, requirement functions and line start and end helpers to the vehicle type. |
| `AIImplement.registerOverwrittenFunctions(vehicleType: any)` | 211 | ✍ Overrides addVehicleToAIImplementList, getAllowTireTracks, getDoConsumePtoPower and checkMovingPartDirtyUpdateNode. |
| `AIImplement.registerEventListeners(vehicleType: any)` | 220 | ✍ Subscribes to onLoad, onPostLoad and onPostAIFieldCourseSettingsInitialized. |
| `AIImplement:onLoad(savegame: table)` | 229 | ✍ Warns about deprecated XML keys, picks vehicle.ai or the aiConfiguration chosen by the "ai" configuration, and loads all AI settings into spec_aiImplement: markers, lowering, turning, headland, overlap, row alignment (from a fruit type or explicit values), and empty requirement lists. Also reads the ground-type channels of the field ground system. |
| `AIImplement:onPostLoad(savegame: any)` | 353 | ✍ Resolves the wheel indices of the turn limitation to wheel objects (warning on unknown index) and precomputes marker offsets relative to each input attacher joint for the main setup and every custom setup. |
| `AIImplement:onPostAIFieldCourseSettingsInitialized(fieldCourseSettings: any)` | 385 | ✍ Called once the automatic field course settings are ready: copies this tool's XML values (vineyard flags, tail avoidance, straightening, side offset alternation, headland min and max count, corner cut-out, forced direction) into the given settings object. |
| `AIImplement:loadAICollisionTriggerFromXML(xmlFile: any, key: any)` | 436 | ✍ Builds a collision trigger table from a key: uses the given node with width, height and length, or, with useSize, creates nodes from the vehicle size box; creates a reversed back node if missing. Returns nil when neither is defined. |
| `AIImplement:loadAIImplementBaseSetupFromXML(xmlFile: any, key: any, availableFunc: any)` | 482 | ✍ Loads markers, side offsets, marker width (computed from the left and right markers if absent), size markers and collision trigger from a key. Without availableFunc it fills the main spec; with one it creates an alternative setup stored in aiBaseSetups. Always returns true. |
| `AIImplement:getCustomAIImplementBaseSetup()` | 523 | ✍ Returns the first alternative AI setup whose availability function returns true for this vehicle, or nil if none applies. |
| `AIImplement:getCanAIImplementContinueWork(isTurning: any)` | 537 | ✍ Default hook returning true, false, nil; other specializations override it to report that work must pause (the meaning of the extra returns is UNVERIFIED). |
| `AIImplement:getCanImplementBeUsedForAI()` | 543 | ✍ Returns true only if left, right and back AI markers are all defined. |
| `AIImplement:addVehicleToAIImplementList(superFunc: any, list: any)` | 554 | ✍ Override: appends this vehicle to the list as {object=self} when it can be used for AI, then calls the parent so attached vehicles are added too. |
| `AIImplement:getAllowTireTracks(superFunc: any)` | 564 | ✍ Override: tire tracks are allowed only if the parent allows them and the vehicle is not under AI control. |
| `AIImplement:getDoConsumePtoPower(superFunc: any)` | 570 | ✍ Override: returns false while the root vehicle's AI is turning on the headland (to avoid slow turns); otherwise defers to the parent. |
| `AIImplement:checkMovingPartDirtyUpdateNode(superFunc: any, node: any, movingPart: any)` | 584 | ✍ Override: after the parent check, logs an XML error if an AI marker, size marker or collision trigger node sits inside a moving part with a limited update distance, since that breaks AI positioning. |
| `AIImplement:getAIMinTurningRadius()` | 603 | ✍ Returns the minimum turning radius from XML, or nil if not defined. |
| `AIImplement:getAIMarkers()` | 609 | ✍ Returns left, right and back marker nodes, an inverted flag, marker width and validity offset, delegating to the first attached implement when configured so, and swapping left and right if inverted. Uses an alternative setup if one is available. |
| `AIImplement:updateAIMarkerWidth()` | 635 | ✍ Fills in a missing marker width from the left and right marker distance for the main setup and alternatives. Note: onLoad always sets the width, so these branches rarely run. |
| `AIImplement:setAIMarkersInverted(state: any)` | 663 | ✍ Toggles the inverted state of the AI markers. Note: the state parameter is ignored, the flag is always flipped. |
| `AIImplement:calcAIMarkerAttacherJointOffset(leftMarker: any, rightMarker: any, backMarker: any)` | 670 | ✍ For each input attacher joint, stores the front and back offsets of the given markers relative to the joint node, so the AI can later account for how the tool is hitched. |
| `AIImplement:getAIMarkerAttacherJointOffset(leftMarker: any)` | 695 | ✍ Returns the stored offset entry for the given left marker and the active input attacher joint, or nil if there is none. |
| `AIImplement:getAIInvertMarkersOnTurn(turnLeft: any)` | 713 | ✍ Default hook returning false: markers are not inverted when turning; overridable. |
| `AIImplement:getAISizeMarkers()` | 719 | ✍ Returns the left, right and back size marker nodes from the active setup (alternative or main). |
| `AIImplement:getAILookAheadSize()` | 732 | ✍ Returns the look-ahead size used to check the ground in front of the tool (default 3). |
| `AIImplement:getAIHasNoFullCoverageArea()` | 738 | ✍ Returns whether the tool does not cover its full width (like plows) and the associated offset. |
| `AIImplement:getAIAreaOverlap()` | 744 | ✍ Returns the line-to-line overlap from XML, or nil if undefined. |
| `AIImplement:getAIRowAlignment()` | 750 | ✍ Returns true plus spacing, snap angle and offset when row alignment is configured; otherwise false, 0, 0, 0. |
| `AIImplement:getImplementAllowAutomaticSteering()` | 761 | ✍ Default hook returning false; implements that support steering assist override it (used by AIAutomaticSteering). |
| `AIImplement:getAIImplementCollisionTrigger()` | 767 | ✍ Returns the collision trigger table of the active setup, or the main one if the alternative has none. |
| `AIImplement:getAIImplementCollisionTriggers(collisionTriggers: any)` | 780 | ✍ Adds this vehicle's collision trigger, if any, to the given table keyed by vehicle. |
| `AIImplement:getAINeedsLowering()` | 789 | ✍ Returns whether the AI must lower this tool to work (default true). |
| `AIImplement:getAILowerIfAnyIsLowered()` | 795 | ✍ Returns whether this tool should be lowered whenever any attached AI tool is lowered. |
| `AIImplement:getAINeedsRootAlignment()` | 801 | ✍ Returns whether the tool has to stay aligned with the root vehicle's heading during work (default true). |
| `AIImplement:getAIAllowTurnBackward()` | 807 | ✍ Returns whether the AI may turn backward with this tool (default true). |
| `AIImplement:getAIBlockTurnBackward()` | 813 | ✍ Returns whether this tool forbids the AI from driving backward (default false). |
| `AIImplement:getAIIsVineyardTool()` | 819 | ✍ Returns whether AI field work with this tool is restricted to vineyards. |
| `AIImplement:getAIToolReverserDirectionNode()` | 825 | ✍ Returns the optional reverser direction node, used as the target node when driving backward. |
| `AIImplement:getAITurnRadiusLimitation()` | 831 | ✍ Returns five values: the limiting radius, rotation joint node, wheel list, rotation limit factor and initial turn radius factor. |
| `AIImplement:setAIImplementVariableSideOffset(variableSideOffset: any)` | 838 | ✍ Sets the flag telling that the tool's side offset can change while working. |
| `AIImplement:getAIImplementSideOffset()` | 844 | ✍ Returns the side offset of the active setup (0 if none) and the variable side offset flag. |
| `AIImplement:setAIFruitRequirements(fruitType: any, minGrowthState: any, maxGrowthState: any)` | 857 | ✍ Replaces all fruit requirements with a single one: fruit type and growth state range the AI needs on the ground. |
| `AIImplement:addAIFruitRequirement(fruitType: any, minGrowthState: any, maxGrowthState: any, customMapId: any, customMapStartChannel: any, customMapNumChannels: any)` | 864 | ✍ Adds a fruit requirement (fruit type, min and max growth state, optional custom density map and channels) and rebuilds the field crops query if it already exists. |
| `AIImplement:clearAIFruitRequirements()` | 878 | ✍ Removes all fruit requirements and refreshes the field crops query. |
| `AIImplement:getAIFruitRequirements()` | 888 | ✍ Returns the list of fruit requirement tables. |
| `AIImplement:setAIDensityHeightTypeRequirements(fillType: any)` | 894 | ✍ Replaces the density-height (bulk material) requirements with the single given fill type. |
| `AIImplement:addAIDensityHeightTypeRequirement(fillType: any)` | 901 | ✍ Adds a fill type to the density-height requirements and refreshes the field crops query. |
| `AIImplement:clearAIDensityHeightTypeRequirements()` | 910 | ✍ Removes all density-height type requirements and refreshes the query. |
| `AIImplement:getAIDensityHeightTypeRequirements()` | 920 | ✍ Returns the list of required density-height fill types. |
| `AIImplement:getAIImplementUseVineSegment(placeable: any, segment: any, segmentSide: any)` | 926 | ✍ Default hook returning true: the AI may use the given vine segment; overridable. |
| `AIImplement:setAIFruitProhibitions(fruitType: any, minGrowthState: any, maxGrowthState: any)` | 932 | ✍ Replaces all fruit prohibitions with a single one (fruit type and growth state range where the AI must not work). |
| `AIImplement:addAIFruitProhibitions(fruitType: any, minGrowthState: any, maxGrowthState: any, customMapId: any, customMapStartChannel: any, customMapNumChannels: any)` | 939 | ✍ Adds a fruit prohibition (type, growth state range, optional custom density map and channels) and refreshes the field crops query. |
| `AIImplement:clearAIFruitProhibitions()` | 954 | ✍ Removes all fruit prohibitions and refreshes the query. |
| `AIImplement:getAIFruitProhibitions()` | 964 | ✍ Returns the list of fruit prohibition tables. |
| `AIImplement:addAITerrainDetailRequiredRange(detailType1: any, detailType2: any, minState: any, maxState: any)` | 971 | ✍ Adds a required terrain detail value range (two detail types and a channel range, defaulting to the ground type channels) and refreshes the query. |
| `AIImplement:addAIGroundTypeRequirements(groundTypes: any, excludedType1: any, excludedType2: any, excludedType3: any, excludedType4: any, excludedType5: any, excludedType6: any)` | 979 | ✍ Adds a required terrain range for each listed ground type, skipping up to six excluded types, and refreshes the query. |
| `AIImplement:clearAITerrainDetailRequiredRange()` | 999 | ✍ Removes all required terrain detail ranges and refreshes the query. |
| `AIImplement:getAITerrainDetailRequiredRange()` | 1006 | ✍ Returns the required terrain detail ranges, taken from the first attached implement that provides them when configured to use the attached implement's attributes. |
| `AIImplement:addAITerrainDetailProhibitedRange(detailType1: any, detailType2: any, minState: any, maxState: any)` | 1025 | ✍ Adds a prohibited terrain detail value range and refreshes the query. |
| `AIImplement:clearAITerrainDetailProhibitedRange()` | 1032 | ✍ Removes all prohibited terrain detail ranges and refreshes the query. |
| `AIImplement:getAITerrainDetailProhibitedRange()` | 1039 | ✍ Returns the prohibited terrain detail ranges, delegating to the first attached implement when configured to use its attributes. |
| `AIImplement:getFieldCropsQuery()` | 1057 | ✍ Returns the field crops query and its validity flag, creating the query on first use. The query is only valid when at least one requirement or prohibition exists. |
| `AIImplement:updateFieldCropsQuery()` | 1068 | ✍ Rebuilds the field crops query only if it was already created, so unused queries are not built needlessly. |
| `AIImplement:compareFieldCropsQuery(otherVehicle: any)` | 1077 | ✍ Returns true if every fruit requirement, fruit prohibition and terrain range of this vehicle is also present on the other vehicle; returns false if the other has no AI requirement getter. Note: the check is one-way, extra entries on the other vehicle are not detected. |
| `AIImplement:createFieldCropsQuery()` | 1171 | ✍ Builds a FieldCropsQuery on the ground type density map from the fruit requirements, prohibitions and terrain ranges, and flags it valid when any exist. Does nothing if the ground type map is unavailable. |
| `AIImplement:getIsAIImplementInLine()` | 1231 | ✍ Returns whether the implement is currently inside a work line. |
| `AIImplement:aiImplementStartLine()` | 1237 | ✍ Marks the line as started, raises onAIImplementStartLine and tells the root vehicle's action controller about it. |
| `AIImplement:aiImplementEndLine()` | 1249 | ✍ Marks the line as ended, raises onAIImplementEndLine and tells the root vehicle's action controller about it. |

## Specialization

| Type | Name | Line |
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
