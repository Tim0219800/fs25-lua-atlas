---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AIVehicle.lua (generated stub, FS25 Lua Atlas)

--- Base AI specialization present on all vehicles (no prerequisites). It loads optional vehicle.ai.agentAttachment definitions that describe the footprint (size, rotation centre, joint) the AI path planner should use for an attached tool. It also provides AI event dispatch across the whole vehicle combination and default ready/preparing answers that other specializations can override.
---@class AIVehicle
AIVehicle = {}

--- Always returns true: this specialization has no prerequisites.
---@param specializations table
---@return boolean
function AIVehicle.prerequisitesPresent(specializations) end

--- Registers the agent attachment XML paths under vehicle.ai, including nested sub-attachments.
function AIVehicle.initSpecialization() end

--- Registers the agentAttachment XML keys (jointNode, rotation centre by wheels/node/position, width, height, length, offsets, hasCollision, useSize) and recurses once for sub-attachments if requested.
---@param schema any
---@param basePath any
---@param includeSubAttachments any
function AIVehicle.registerAgentAttachmentPaths(schema, basePath, includeSubAttachments) end

--- Registers the events onAIFieldCourseSettingsInitialized and onPostAIFieldCourseSettingsInitialized.
---@param vehicleType any
function AIVehicle.registerEvents(vehicleType) end

--- Registers the agent attachment helpers, the AI event raisers and the ready/preparing queries on the vehicle type.
---@param vehicleType any
function AIVehicle.registerFunctions(vehicleType) end

--- Empty: no base function is overridden.
---@param vehicleType any
function AIVehicle.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad and onPostLoad.
---@param vehicleType any
function AIVehicle.registerEventListeners(vehicleType) end

--- For vehicles with input attacher joints, loads the agent attachments from the XML, and creates a debug box used to visualise them.
---@param savegame table
function AIVehicle:onLoad(savegame) end

--- If agent attachments exist, validates them against the vehicle's input attacher joints.
---@param savegame table
function AIVehicle:onPostLoad(savegame) end

--- Called on an attached tool to register its attachments with the AI vehicle: those bound to the active input joint first, else the first direct attachment, then all non-direct ones.
---@param aiDrivableVehicle any
function AIVehicle:collectAIAgentAttachments(aiDrivableVehicle) end

--- Adds an attachment and all its sub-attachments to the AI drivable vehicle through addAIAgentAttachment.
---@param aiDrivableVehicle any
---@param agentAttachment any
function AIVehicle:registerAIAgentAttachment(aiDrivableVehicle, agentAttachment) end

--- Reads agentAttachment entries (joint, rotation centre, size, collision flag, optional sub-attachments) into a table, with 3 m defaults or the vehicle size when useSize is set. Warns when an attachable has no definition.
---@param xmlFile any
---@param baseKey any
---@param agentAttachments any
---@param loadSubAttachments any
---@param requiresJointNode any
function AIVehicle:loadAIAgentAttachmentsFromXML(xmlFile, baseKey, agentAttachments, loadSubAttachments, requiresJointNode) end

--- Marks direct attachments and builds the rotation centre transform nodes from a position or from the average of listed wheels. It then computes hitch offsets, recursing into sub-attachments. Creates scene nodes.
---@param agentAttachments any
---@param inputAttacherJoints any
function AIVehicle:validateAIAgentAttachments(agentAttachments, inputAttacherJoints) end

--- Debug drawing: renders a box per agent attachment (green when it has a rotation centre, blue otherwise), recursively.
---@param agentAttachments any
function AIVehicle:drawAIAgentAttachments(agentAttachments) end

--- Raises an AI event on the whole root vehicle combination: the implement-specific event on every other child vehicle, then on this vehicle, then the main event, notifying the action controller for each.
---@param eventName any
---@param implementName any
function AIVehicle:raiseAIEvent(eventName, implementName, ...) end

--- Raises the event on the vehicle only if it has listeners for that event name, avoiding errors for unknown events.
---@param vehicle any
---@param eventName any
function AIVehicle:safeRaiseAIEvent(vehicle, eventName, ...) end

--- Default answer: always true. Other specializations may override it to delay the AI start.
function AIVehicle:getIsAIReadyToDrive() end

--- Default answer: always false. Meant to be overridden by vehicles that need a preparation phase.
function AIVehicle:getIsAIPreparingToDrive() end
