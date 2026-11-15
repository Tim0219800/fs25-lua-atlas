---@meta
-- FS25 1.25.1.0 : missions/field/StonePickMission.lua (stub généré, atlas Lua FS25)

---@class StonePickMission : AbstractFieldMission
StonePickMission = {}

---@param isServer any
---@param isClient any
---@param customMt any
function StonePickMission.new(isServer, isClient, customMt) end

function StonePickMission:getFieldPreparingTask() end

function StonePickMission:getFieldFinishTask() end

function StonePickMission:createModifier() end

---@param partitionIndex any
function StonePickMission:getPartitionCompletion(partitionIndex) end

function StonePickMission:initializeModifier() end

---@param partitionIndex any
function StonePickMission:setPartitionRegion(partitionIndex) end

function StonePickMission:getRewardPerHa() end

function StonePickMission:getMissionTypeName() end

---@param event any
function StonePickMission:validate(event) end

---@param xmlFile any
---@param key any
---@param baseDirectory any
function StonePickMission.loadMapData(xmlFile, key, baseDirectory) end

function StonePickMission.tryGenerateMission() end

---@param field table
---@return boolean
function StonePickMission.getFieldHasStones(field) end

---@param field any
---@param mission any
function StonePickMission.isAvailableForField(field, mission) end

function StonePickMission.canRun() end
