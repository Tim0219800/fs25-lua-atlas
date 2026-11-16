---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AIImplement.lua (generated stub, FS25 Lua Atlas)

--- Specialization (no prerequisites) that gives tools and implements their AI data: area and size markers, collision trigger, turning radius limits, lowering and reverse-turn rules, headland and row alignment settings, and the ground, fruit and density-height requirements that decide where the AI may work. It reads the vehicle.ai XML node, optionally replaced by an aiConfigurations entry chosen by the "ai" configuration. It raises the onAIImplement* events (start, end, line, turn, block and so on); the code that raises most of them lives in other files. Requirements are turned into a FieldCropsQuery object, whose engine-side behaviour is UNVERIFIED.
---@class AIImplement
AIImplement = {}

--- Always returns true: any vehicle type can carry this specialization.
---@param specializations table
---@return boolean
function AIImplement.prerequisitesPresent(specializations) end

--- Adds the "ai" vehicle configuration type and registers the vehicle.ai XML paths, plus the same paths under each aiConfiguration entry.
function AIImplement.initSpecialization() end

--- Registers every AI implement XML setting under a base path: turning radius, lowering, root alignment, backward turning, vineyard flags, reverser node, turn limitation, look-ahead, coverage, headland, overlap and row alignment.
---@param schema any
---@param basePath any
function AIImplement.registerAIImplementXMLPaths(schema, basePath) end

--- Registers the area markers (left, right, back, side offset, width, validity offset) and size markers, then the collision trigger paths. Can be reused by other specializations for their own AI setups.
---@param schema any
---@param basePath any
function AIImplement.registerAIImplementBaseXMLPaths(schema, basePath) end

--- Registers the collisionTrigger XML keys: useSize, node, backNode, width (default 4), height (default 3) and length (default 5).
---@param schema any
---@param basePath any
function AIImplement.registerAICollisionTriggerXMLPaths(schema, basePath) end

--- Registers the onAIImplement* vehicle events: start, active, end, prepare for work or transport, start and end line, start, progress and end turn, side offset changed, block, continue, and the two job-vehicle block and continue events.
---@param vehicleType any
function AIImplement.registerEvents(vehicleType) end

--- Adds the specialization's getters, setters, requirement functions and line start and end helpers to the vehicle type.
---@param vehicleType any
function AIImplement.registerFunctions(vehicleType) end

--- Overrides addVehicleToAIImplementList, getAllowTireTracks, getDoConsumePtoPower and checkMovingPartDirtyUpdateNode.
---@param vehicleType any
function AIImplement.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad and onPostAIFieldCourseSettingsInitialized.
---@param vehicleType any
function AIImplement.registerEventListeners(vehicleType) end

--- Warns about deprecated XML keys, picks vehicle.ai or the aiConfiguration chosen by the "ai" configuration, and loads all AI settings into spec_aiImplement: markers, lowering, turning, headland, overlap, row alignment (from a fruit type or explicit values), and empty requirement lists. Also reads the ground-type channels of the field ground system.
---@param savegame table
function AIImplement:onLoad(savegame) end

--- Resolves the wheel indices of the turn limitation to wheel objects (warning on unknown index) and precomputes marker offsets relative to each input attacher joint for the main setup and every custom setup.
---@param savegame any
function AIImplement:onPostLoad(savegame) end

--- Called once the automatic field course settings are ready: copies this tool's XML values (vineyard flags, tail avoidance, straightening, side offset alternation, headland min and max count, corner cut-out, forced direction) into the given settings object.
---@param fieldCourseSettings any
function AIImplement:onPostAIFieldCourseSettingsInitialized(fieldCourseSettings) end

--- Builds a collision trigger table from a key: uses the given node with width, height and length, or, with useSize, creates nodes from the vehicle size box; creates a reversed back node if missing. Returns nil when neither is defined.
---@param xmlFile any
---@param key any
function AIImplement:loadAICollisionTriggerFromXML(xmlFile, key) end

--- Loads markers, side offsets, marker width (computed from the left and right markers if absent), size markers and collision trigger from a key. Without availableFunc it fills the main spec; with one it creates an alternative setup stored in aiBaseSetups. Always returns true.
---@param xmlFile any
---@param key any
---@param availableFunc any
function AIImplement:loadAIImplementBaseSetupFromXML(xmlFile, key, availableFunc) end

--- Returns the first alternative AI setup whose availability function returns true for this vehicle, or nil if none applies.
function AIImplement:getCustomAIImplementBaseSetup() end

--- Default hook returning true, false, nil; other specializations override it to report that work must pause (the meaning of the extra returns is UNVERIFIED).
---@param isTurning any
function AIImplement:getCanAIImplementContinueWork(isTurning) end

--- Returns true only if left, right and back AI markers are all defined.
function AIImplement:getCanImplementBeUsedForAI() end

--- Override: appends this vehicle to the list as {object=self} when it can be used for AI, then calls the parent so attached vehicles are added too.
---@param superFunc any
---@param list any
function AIImplement:addVehicleToAIImplementList(superFunc, list) end

--- Override: tire tracks are allowed only if the parent allows them and the vehicle is not under AI control.
---@param superFunc any
function AIImplement:getAllowTireTracks(superFunc) end

--- Override: returns false while the root vehicle's AI is turning on the headland (to avoid slow turns); otherwise defers to the parent.
---@param superFunc any
function AIImplement:getDoConsumePtoPower(superFunc) end

--- Override: after the parent check, logs an XML error if an AI marker, size marker or collision trigger node sits inside a moving part with a limited update distance, since that breaks AI positioning.
---@param superFunc any
---@param node any
---@param movingPart any
function AIImplement:checkMovingPartDirtyUpdateNode(superFunc, node, movingPart) end

--- Returns the minimum turning radius from XML, or nil if not defined.
function AIImplement:getAIMinTurningRadius() end

--- Returns left, right and back marker nodes, an inverted flag, marker width and validity offset, delegating to the first attached implement when configured so, and swapping left and right if inverted. Uses an alternative setup if one is available.
function AIImplement:getAIMarkers() end

--- Fills in a missing marker width from the left and right marker distance for the main setup and alternatives. Note: onLoad always sets the width, so these branches rarely run.
function AIImplement:updateAIMarkerWidth() end

--- Toggles the inverted state of the AI markers. Note: the state parameter is ignored, the flag is always flipped.
---@param state any
function AIImplement:setAIMarkersInverted(state) end

--- For each input attacher joint, stores the front and back offsets of the given markers relative to the joint node, so the AI can later account for how the tool is hitched.
---@param leftMarker any
---@param rightMarker any
---@param backMarker any
function AIImplement:calcAIMarkerAttacherJointOffset(leftMarker, rightMarker, backMarker) end

--- Returns the stored offset entry for the given left marker and the active input attacher joint, or nil if there is none.
---@param leftMarker any
function AIImplement:getAIMarkerAttacherJointOffset(leftMarker) end

--- Default hook returning false: markers are not inverted when turning; overridable.
---@param turnLeft any
function AIImplement:getAIInvertMarkersOnTurn(turnLeft) end

--- Returns the left, right and back size marker nodes from the active setup (alternative or main).
function AIImplement:getAISizeMarkers() end

--- Returns the look-ahead size used to check the ground in front of the tool (default 3).
function AIImplement:getAILookAheadSize() end

--- Returns whether the tool does not cover its full width (like plows) and the associated offset.
function AIImplement:getAIHasNoFullCoverageArea() end

--- Returns the line-to-line overlap from XML, or nil if undefined.
function AIImplement:getAIAreaOverlap() end

--- Returns true plus spacing, snap angle and offset when row alignment is configured; otherwise false, 0, 0, 0.
function AIImplement:getAIRowAlignment() end

--- Default hook returning false; implements that support steering assist override it (used by AIAutomaticSteering).
function AIImplement:getImplementAllowAutomaticSteering() end

--- Returns the collision trigger table of the active setup, or the main one if the alternative has none.
function AIImplement:getAIImplementCollisionTrigger() end

--- Adds this vehicle's collision trigger, if any, to the given table keyed by vehicle.
---@param collisionTriggers any
function AIImplement:getAIImplementCollisionTriggers(collisionTriggers) end

--- Returns whether the AI must lower this tool to work (default true).
function AIImplement:getAINeedsLowering() end

--- Returns whether this tool should be lowered whenever any attached AI tool is lowered.
function AIImplement:getAILowerIfAnyIsLowered() end

--- Returns whether the tool has to stay aligned with the root vehicle's heading during work (default true).
function AIImplement:getAINeedsRootAlignment() end

--- Returns whether the AI may turn backward with this tool (default true).
function AIImplement:getAIAllowTurnBackward() end

--- Returns whether this tool forbids the AI from driving backward (default false).
function AIImplement:getAIBlockTurnBackward() end

--- Returns whether AI field work with this tool is restricted to vineyards.
function AIImplement:getAIIsVineyardTool() end

--- Returns the optional reverser direction node, used as the target node when driving backward.
function AIImplement:getAIToolReverserDirectionNode() end

--- Returns five values: the limiting radius, rotation joint node, wheel list, rotation limit factor and initial turn radius factor.
function AIImplement:getAITurnRadiusLimitation() end

--- Sets the flag telling that the tool's side offset can change while working.
---@param variableSideOffset any
function AIImplement:setAIImplementVariableSideOffset(variableSideOffset) end

--- Returns the side offset of the active setup (0 if none) and the variable side offset flag.
function AIImplement:getAIImplementSideOffset() end

--- Replaces all fruit requirements with a single one: fruit type and growth state range the AI needs on the ground.
---@param fruitType any
---@param minGrowthState any
---@param maxGrowthState any
function AIImplement:setAIFruitRequirements(fruitType, minGrowthState, maxGrowthState) end

--- Adds a fruit requirement (fruit type, min and max growth state, optional custom density map and channels) and rebuilds the field crops query if it already exists.
---@param fruitType any
---@param minGrowthState any
---@param maxGrowthState any
---@param customMapId any
---@param customMapStartChannel any
---@param customMapNumChannels any
function AIImplement:addAIFruitRequirement(fruitType, minGrowthState, maxGrowthState, customMapId, customMapStartChannel, customMapNumChannels) end

--- Removes all fruit requirements and refreshes the field crops query.
function AIImplement:clearAIFruitRequirements() end

--- Returns the list of fruit requirement tables.
function AIImplement:getAIFruitRequirements() end

--- Replaces the density-height (bulk material) requirements with the single given fill type.
---@param fillType any
function AIImplement:setAIDensityHeightTypeRequirements(fillType) end

--- Adds a fill type to the density-height requirements and refreshes the field crops query.
---@param fillType any
function AIImplement:addAIDensityHeightTypeRequirement(fillType) end

--- Removes all density-height type requirements and refreshes the query.
function AIImplement:clearAIDensityHeightTypeRequirements() end

--- Returns the list of required density-height fill types.
function AIImplement:getAIDensityHeightTypeRequirements() end

--- Default hook returning true: the AI may use the given vine segment; overridable.
---@param placeable any
---@param segment any
---@param segmentSide any
function AIImplement:getAIImplementUseVineSegment(placeable, segment, segmentSide) end

--- Replaces all fruit prohibitions with a single one (fruit type and growth state range where the AI must not work).
---@param fruitType any
---@param minGrowthState any
---@param maxGrowthState any
function AIImplement:setAIFruitProhibitions(fruitType, minGrowthState, maxGrowthState) end

--- Adds a fruit prohibition (type, growth state range, optional custom density map and channels) and refreshes the field crops query.
---@param fruitType any
---@param minGrowthState any
---@param maxGrowthState any
---@param customMapId any
---@param customMapStartChannel any
---@param customMapNumChannels any
function AIImplement:addAIFruitProhibitions(fruitType, minGrowthState, maxGrowthState, customMapId, customMapStartChannel, customMapNumChannels) end

--- Removes all fruit prohibitions and refreshes the query.
function AIImplement:clearAIFruitProhibitions() end

--- Returns the list of fruit prohibition tables.
function AIImplement:getAIFruitProhibitions() end

--- Adds a required terrain detail value range (two detail types and a channel range, defaulting to the ground type channels) and refreshes the query.
---@param detailType1 any
---@param detailType2 any
---@param minState any
---@param maxState any
function AIImplement:addAITerrainDetailRequiredRange(detailType1, detailType2, minState, maxState) end

--- Adds a required terrain range for each listed ground type, skipping up to six excluded types, and refreshes the query.
---@param groundTypes any
---@param excludedType1 any
---@param excludedType2 any
---@param excludedType3 any
---@param excludedType4 any
---@param excludedType5 any
---@param excludedType6 any
function AIImplement:addAIGroundTypeRequirements(groundTypes, excludedType1, excludedType2, excludedType3, excludedType4, excludedType5, excludedType6) end

--- Removes all required terrain detail ranges and refreshes the query.
function AIImplement:clearAITerrainDetailRequiredRange() end

--- Returns the required terrain detail ranges, taken from the first attached implement that provides them when configured to use the attached implement's attributes.
function AIImplement:getAITerrainDetailRequiredRange() end

--- Adds a prohibited terrain detail value range and refreshes the query.
---@param detailType1 any
---@param detailType2 any
---@param minState any
---@param maxState any
function AIImplement:addAITerrainDetailProhibitedRange(detailType1, detailType2, minState, maxState) end

--- Removes all prohibited terrain detail ranges and refreshes the query.
function AIImplement:clearAITerrainDetailProhibitedRange() end

--- Returns the prohibited terrain detail ranges, delegating to the first attached implement when configured to use its attributes.
function AIImplement:getAITerrainDetailProhibitedRange() end

--- Returns the field crops query and its validity flag, creating the query on first use. The query is only valid when at least one requirement or prohibition exists.
function AIImplement:getFieldCropsQuery() end

--- Rebuilds the field crops query only if it was already created, so unused queries are not built needlessly.
function AIImplement:updateFieldCropsQuery() end

--- Returns true if every fruit requirement, fruit prohibition and terrain range of this vehicle is also present on the other vehicle; returns false if the other has no AI requirement getter. Note: the check is one-way, extra entries on the other vehicle are not detected.
---@param otherVehicle any
function AIImplement:compareFieldCropsQuery(otherVehicle) end

--- Builds a FieldCropsQuery on the ground type density map from the fruit requirements, prohibitions and terrain ranges, and flags it valid when any exist. Does nothing if the ground type map is unavailable.
function AIImplement:createFieldCropsQuery() end

--- Returns whether the implement is currently inside a work line.
function AIImplement:getIsAIImplementInLine() end

--- Marks the line as started, raises onAIImplementStartLine and tells the root vehicle's action controller about it.
function AIImplement:aiImplementStartLine() end

--- Marks the line as ended, raises onAIImplementEndLine and tells the root vehicle's action controller about it.
function AIImplement:aiImplementEndLine() end
