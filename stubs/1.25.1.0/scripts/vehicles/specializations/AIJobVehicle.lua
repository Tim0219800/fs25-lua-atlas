---@meta
-- FS25 1.25.1.0 : vehicles/specializations/AIJobVehicle.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization that lets a vehicle be driven by an AI helper job. It requires the AIVehicle and Drivable specializations. It stores the current and last job, reads the AI steering and reverser nodes and the supported job types from the vehicle XML, and saves the last job and the start/stop permissions in the savegame. Many of its registered functions (job start/stop, helper lookup, hotspot handling) have their bodies stripped from this SDK dump, so only the parts present are described.
---@class AIJobVehicle
AIJobVehicle = {}

--- Returns true only if the vehicle type also has the AIVehicle and Drivable specializations.
---@param specializations table
---@return boolean
function AIJobVehicle.prerequisitesPresent(specializations) end

--- Registers the XML schema keys under vehicle.ai (steering node, reverser node, steering speed, supportsAIJobs, supportedJobTypes) and the savegame keys for start/stop permission and the last job type.
function AIJobVehicle.initSpecialization() end

--- Registers the vehicle events onAIJobStarted, onAIJobFinished, onAIJobVehicleBlock and onAIJobVehicleContinue.
---@param vehicleType any
function AIJobVehicle.registerEvents(vehicleType) end

--- Registers the specialization's public vehicle functions (toggle, can-start/stop checks, job and helper accessors, AI nodes, block/continue and others). Several of the registered bodies are absent from the dump.
---@param vehicleType any
function AIJobVehicle.registerFunctions(vehicleType) end

--- Overrides a set of base vehicle functions, including getIsActive, getIsAIActive, getFullName, getActiveFarm, map hotspot functions and the leave-related getters. Only some of the overriding bodies are present in the dump.
---@param vehicleType any
function AIJobVehicle.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to onLoad, onDelete, onUpdate, onSetBroken, onReadStream, onWriteStream and onAIModeChanged.
---@param vehicleType any
function AIJobVehicle.registerEventListeners(vehicleType) end

--- Initialises spec state, reads steering speed (scaled by 0.001), nodes, supportsAIJobs and supportedJobTypes from the XML, and caches HUD texts. When loading a savegame it recreates the last job through aiJobTypeManager and restores the start/stop flags.
---@param savegame table
function AIJobVehicle:onLoad(savegame) end

--- Client side on join: reads whether a job is running and, if so, its id, farm and helper index, then calls aiJobStarted with the job found by id. Then reads the last job type and rebuilds it from the stream.
---@param streamId integer
---@param connection Connection
function AIJobVehicle:onReadStream(streamId, connection) end

--- Server side on join: writes the running job id, the starting farm and the helper index when a job exists, then the last job type and its data. Mirror of onReadStream.
---@param streamId integer
---@param connection Connection
function AIJobVehicle:onWriteStream(streamId, connection) end

--- When the AI mode becomes anything other than AIModeSelection.MODE.WORKER, stops the current job (if any) with a stopped-by-user message.
---@param aiMode any
function AIJobVehicle:onAIModeChanged(aiMode) end

--- Returns whether the AI toggle input should be shown: false without an AI direction node, when AI is disabled, without the hireAssistant permission, or when the AI limit is reached while the AI is inactive.
---@return boolean
function AIJobVehicle:getShowAIToggleActionEvent() end

--- Override: returns true while the AI is active, otherwise defers to the parent implementation.
---@param superFunc any
---@param connection any
function AIJobVehicle:getIsInUse(superFunc, connection) end

--- Override: the vehicle counts as active whenever the AI is active, otherwise the parent result is used.
---@param superFunc any
function AIJobVehicle:getIsActive(superFunc) end

--- Override: true if the parent says so or if a job is currently assigned to this vehicle.
---@param superFunc any
function AIJobVehicle:getIsAIActive(superFunc) end

--- If the AI runs, stops the job as if the user did it. Otherwise sends an AIJobStartRequestEvent to the server for a startable job, or opens the in-game menu AI screen (mobile has its own path), unless a guided tour is running.
function AIJobVehicle:toggleAIVehicle() end

--- Returns getCanStopAIVehicle when the AI is active, else getCanStartAIVehicle. The stop-check body is not in the dump (UNVERIFIED).
---@return boolean
function AIJobVehicle:getCanToggleAIVehicle() end

--- True only if AI is not disabled, the owner farm is not EVERYONE, jobs are supported and start is allowed, a direction node exists, the AI limit is not reached, the AI is idle and the vehicle is not broken.
---@return boolean
function AIJobVehicle:getCanStartAIVehicle() end

--- Checks a job name against supportedJobTypes from the XML, case-insensitively. Returns true when no list is defined.
---@param aiJobName any
---@return boolean
function AIJobVehicle:getIsAIJobSupported(aiJobName) end

--- Override: lights are turned off on leave only if the parent allows it and the AI is not active.
---@param superFunc any
---@return boolean
function AIJobVehicle:getDeactivateLightsOnLeave(superFunc) end
