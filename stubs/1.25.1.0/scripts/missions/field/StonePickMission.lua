---@meta
-- FS25 1.25.1.0 : missions/field/StonePickMission.lua (generated stub, FS25 Lua Atlas)

--- Stone picking contract, a subclass of AbstractFieldMission using WorkAreaType.STONEPICKER. Progress is measured in the stone system density map. It is only offered on plowed, unsown fields that really contain stones, outside winter, when stones are enabled in the savegame.
---@class StonePickMission : AbstractFieldMission
StonePickMission = {}

--- Constructor. Builds the mission with the stone-pick title and description texts, stone picker work area type, stoneValue 3 and spawnedPixels 0.
---@param isServer any
---@param isClient any
---@param customMt any
function StonePickMission.new(isServer, isClient, customMt) end

--- On the server, sets the field state stone level to stoneValue, then returns the parent preparing task.
function StonePickMission:getFieldPreparingTask() end

--- On the server, resets stone level to 0 and ground type to CULTIVATED on the field state, then returns the parent finish task.
function StonePickMission:getFieldFinishTask() end

--- Creates masked and unmasked density map modifiers on the stone density map, with filters comparing the value to the maximum stone value, greater than 0, and equal to 0.
function StonePickMission:createModifier() end

--- Sets the partition region and returns sum of pixels, area and total area from the stone map. The total excludes the unmasked (stone-free) area. Returns 0, 0, 0 without modifier.
---@param partitionIndex any
function StonePickMission:getPartitionCompletion(partitionIndex) end

--- Calls the parent version, then applies the field density map polygon to the unmasked modifier.
function StonePickMission:initializeModifier() end

--- Calls the parent, then, if there is more than one partition, clips the unmasked modifier to the partition minZ/maxZ range.
---@param partitionIndex any
function StonePickMission:setPartitionRegion(partitionIndex) end

--- Returns the reward per hectare stored for this mission type in MissionManager.
function StonePickMission:getRewardPerHa() end

--- Returns StonePickMission.NAME (the value is set elsewhere, not in this file).
function StonePickMission:getMissionTypeName() end

--- Runs the parent validation, then, if the mission is not finished, rechecks that the field is still eligible. Returns false when either check fails.
---@param event any
function StonePickMission:validate(event) end

--- Reads #rewardPerHa from the map XML (default 2200) into the mission type data. Returns true.
---@param xmlFile any
---@param key any
---@param baseDirectory any
function StonePickMission.loadMapData(xmlFile, key, baseDirectory) end

--- Server-side generator: if canRun, takes a field for a mission, requires it to be free and eligible, builds and inits a mission and sets its default end date. Returns the mission or nil.
function StonePickMission.tryGenerateMission() end

--- Returns true if the stone density map has at least one pixel above 0 inside the field polygon. False when the map has no stones.
---@param field table
---@return boolean
function StonePickMission.getFieldHasStones(field) end

--- For a new mission, requires a valid field state, no fruit, plowed ground and stones present. In all cases refuses during winter.
---@param field any
---@param mission any
function StonePickMission.isAvailableForField(field, mission) end

--- Returns true only if the instance limit is not reached, the map has stones and stones are enabled in the savegame settings.
function StonePickMission.canRun() end
