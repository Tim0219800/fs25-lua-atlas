---@meta
-- FS25 1.25.1.0 : missions/field/PlowMission.lua (generated stub, FS25 Lua Atlas)

---@class PlowMission : AbstractFieldMission
PlowMission = {}

---@param isServer any
---@param isClient any
---@param customMt any
function PlowMission.new(isServer, isClient, customMt) end

function PlowMission:createModifier() end

function PlowMission:getFieldFinishTask() end

function PlowMission:getRewardPerHa() end

function PlowMission:getMissionTypeName() end

---@param event any
function PlowMission:validate(event) end

---@param xmlFile any
---@param key any
---@param baseDirectory any
function PlowMission.loadMapData(xmlFile, key, baseDirectory) end

function PlowMission.tryGenerateMission() end

---@param field any
---@param mission any
function PlowMission.isAvailableForField(field, mission) end

function PlowMission.canRun() end
