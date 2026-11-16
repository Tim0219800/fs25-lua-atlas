---@meta
-- FS25 1.25.1.0 : missions/field/PlowMission.lua (generated stub, FS25 Lua Atlas)

--- Plowing contract, a subclass of AbstractFieldMission using WorkAreaType.PLOW. Completion is the share of field pixels whose ground type is PLOWED. It is offered on fields with a harvested or withered crop whose plow level is not yet at maximum.
---@class PlowMission : AbstractFieldMission
PlowMission = {}

--- Constructor. Builds the mission with the plow title and description texts and the plow work area type.
---@param isServer any
---@param isClient any
---@param customMt any
function PlowMission.new(isServer, isClient, customMt) end

--- Creates a density map modifier on the ground type map and a filter matching the PLOWED value; used to measure completion.
function PlowMission:createModifier() end

--- Sets the field state to fruit type unknown and ground type PLOWED, then returns the parent finish task. Unlike StonePickMission, it does not check isServer.
function PlowMission:getFieldFinishTask() end

--- Returns the reward per hectare stored for the plow mission type in MissionManager.
function PlowMission:getRewardPerHa() end

--- Returns PlowMission.NAME (value defined elsewhere, not in this file).
function PlowMission:getMissionTypeName() end

--- Runs the parent validation, then, if not finished, rechecks that the field is still eligible. Returns false if either fails.
---@param event any
function PlowMission:validate(event) end

--- Reads #rewardPerHa from the map XML (default 2800) into the plow mission type data. Returns true.
---@param xmlFile any
---@param key any
---@param baseDirectory any
function PlowMission.loadMapData(xmlFile, key, baseDirectory) end

--- Server-side generator: if canRun, picks a free eligible field, creates and inits a PlowMission and sets its default end date. Returns the mission or nil.
function PlowMission.tryGenerateMission() end

--- For a new mission, requires a valid state, a non-grass-only field, plow level below max, a known fruit not harvest-mission-only, not a fresh catch crop, and a cut or withered growth state. Always true for an existing mission.
---@param field any
---@param mission any
function PlowMission.isAvailableForField(field, mission) end

--- Returns true while the number of running plow missions is below the maximum for the type.
function PlowMission.canRun() end
