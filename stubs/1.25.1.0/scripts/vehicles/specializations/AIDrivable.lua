---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AIDrivable.lua (stub généré, atlas Lua FS25)

---@class AIDrivable
AIDrivable = {}

---@param specializations table
---@return boolean
function AIDrivable.prerequisitesPresent(specializations) end

function AIDrivable.initSpecialization() end

function AIDrivable.postInitSpecialization() end

---@param schema any
---@param basePath any
function AIDrivable.registerAgentXMLPaths(schema, basePath) end

---@param vehicleType any
function AIDrivable.registerEvents(vehicleType) end

---@param vehicleType any
function AIDrivable.registerFunctions(vehicleType) end

---@param vehicleType any
function AIDrivable.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function AIDrivable.registerEventListeners(vehicleType) end

---@param savegame table
function AIDrivable:onLoad(savegame) end

function AIDrivable:onPostLoad() end

---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function AIDrivable:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

---@param helperIndex any
function AIDrivable:createAgent(helperIndex) end

function AIDrivable:deleteAgent() end

---@param task any
---@param x any
---@param y any
---@param z any
---@param dirX any
---@param dirY any
---@param dirZ any
---@param maxSpeed any
---@param useManualDriving any
function AIDrivable:setAITarget(task, x, y, z, dirX, dirY, dirZ, maxSpeed, useManualDriving) end

function AIDrivable:reachedAITarget() end

function AIDrivable:unsetAITarget() end

function AIDrivable:getAIRootNode() end

function AIDrivable:setAIRootNodeDirty() end

function AIDrivable:getAIRootNodeMinZOffset() end

function AIDrivable:getAIRootNodeMaxZOffset() end

function AIDrivable:getAIRootNodeBoundingBox() end

function AIDrivable:getAIAllowsBackwards() end

---@param isControlling any
function AIDrivable:onEnterVehicle(isControlling) end

---@param wasEntered any
function AIDrivable:onLeaveVehicle(wasEntered) end

---@param speed any
---@param speedReverse any
function AIDrivable:onCruiseControlSpeedChanged(speed, speedReverse) end

---@param superFunc any
function AIDrivable:getIsAIReadyToDrive(superFunc) end

---@param superFunc any
function AIDrivable:getIsAIPreparingToDrive(superFunc) end

function AIDrivable:drawDebugAIAgent() end

---@param xmlFile any
---@param agent any
function AIDrivable:loadAgentInfoFromXML(xmlFile, agent) end

function AIDrivable:getAIAgentSize() end

function AIDrivable:getAIAgentMaxBrakeAcceleration() end

function AIDrivable:updateAIAgentAttachments() end

---@param attachmentData any
---@param level any
function AIDrivable:addAIAgentAttachment(attachmentData, level) end

function AIDrivable:startNewAIAgentAttachmentChain() end

function AIDrivable:updateAIAgentAttachmentOffsetData() end

function AIDrivable:updateAIAgentPoseData() end

function AIDrivable:prepareForAIDriving() end

---@param minRadius any
function AIDrivable:getAITurningRadius(minRadius) end

---@param superFunc any
function AIDrivable:getCanStartAIVehicle(superFunc) end

---@param superFunc any
---@param jobName any
function AIDrivable:getIsAIJobSupported(superFunc, jobName) end

---@param turnRadius any
function AIDrivable:consoleCommandSetTurnRadius(turnRadius) end

---@param distance any
function AIDrivable:consoleCommandMove(distance) end
