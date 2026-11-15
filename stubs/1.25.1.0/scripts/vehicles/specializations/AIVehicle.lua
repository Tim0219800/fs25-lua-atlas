---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AIVehicle.lua (stub généré, atlas Lua FS25)

---@class AIVehicle
AIVehicle = {}

---@param specializations table
---@return boolean
function AIVehicle.prerequisitesPresent(specializations) end

function AIVehicle.initSpecialization() end

---@param schema any
---@param basePath any
---@param includeSubAttachments any
function AIVehicle.registerAgentAttachmentPaths(schema, basePath, includeSubAttachments) end

---@param vehicleType any
function AIVehicle.registerEvents(vehicleType) end

---@param vehicleType any
function AIVehicle.registerFunctions(vehicleType) end

---@param vehicleType any
function AIVehicle.registerOverwrittenFunctions(vehicleType) end

---@param vehicleType any
function AIVehicle.registerEventListeners(vehicleType) end

---@param savegame table
function AIVehicle:onLoad(savegame) end

---@param savegame table
function AIVehicle:onPostLoad(savegame) end

---@param aiDrivableVehicle any
function AIVehicle:collectAIAgentAttachments(aiDrivableVehicle) end

---@param aiDrivableVehicle any
---@param agentAttachment any
function AIVehicle:registerAIAgentAttachment(aiDrivableVehicle, agentAttachment) end

---@param xmlFile any
---@param baseKey any
---@param agentAttachments any
---@param loadSubAttachments any
---@param requiresJointNode any
function AIVehicle:loadAIAgentAttachmentsFromXML(xmlFile, baseKey, agentAttachments, loadSubAttachments, requiresJointNode) end

---@param agentAttachments any
---@param inputAttacherJoints any
function AIVehicle:validateAIAgentAttachments(agentAttachments, inputAttacherJoints) end

---@param agentAttachments any
function AIVehicle:drawAIAgentAttachments(agentAttachments) end

---@param eventName any
---@param implementName any
function AIVehicle:raiseAIEvent(eventName, implementName, ...) end

---@param vehicle any
---@param eventName any
function AIVehicle:safeRaiseAIEvent(vehicle, eventName, ...) end

function AIVehicle:getIsAIReadyToDrive() end

function AIVehicle:getIsAIPreparingToDrive() end
