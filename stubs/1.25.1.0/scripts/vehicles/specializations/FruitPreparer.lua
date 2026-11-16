---@meta
-- FS25 1.25.1.0 : vehicles/specializations/FruitPreparer.lua (generated stub, FS25 Lua Atlas)

--- Specialization for tools that prepare crops before harvest, such as potato haulm toppers and beet defoliators. It adds a fruitPreparer work area type that calls FSDensityMapUtil.updateFruitPreparerArea for the configured fruit types, tracks a server-side isWorking flag synced to clients, and drives sounds and animations. Also adjusts dirt/wear, speed limit checks and AI settings. Requires WorkArea and TurnOnVehicle.
---@class FruitPreparer
FruitPreparer = {}

--- Registers the "fruitPreparer" work area type and the XML keys: fruit type(s), aiUsePreparedState, drop work area index, animation nodes, work sounds and the moveOnlyIfPreparerCut option of randomly moving parts.
function FruitPreparer.initSpecialization() end

--- Requires the WorkArea and TurnOnVehicle specializations.
---@param specializations table
---@return boolean
function FruitPreparer.prerequisitesPresent(specializations) end

--- Registers processFruitPreparerArea on the vehicle type.
---@param vehicleType any
function FruitPreparer.registerFunctions(vehicleType) end

--- Registers overrides for work area loading, ground manipulation, speed limit check, AI fruit requirements, dirt and wear multipliers and randomly moving part loading/activity.
---@param vehicleType any
function FruitPreparer.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load, delete, update stream, turn on/off, end of work area processing and AI field course settings events.
---@param vehicleType any
function FruitPreparer.registerEventListeners(vehicleType) end

--- Loads sounds and animation nodes on the client and the list of fruit types to prepare (fruitType and fruitTypes). For each, registers AI fruit requirements from the fruit type's preparing growth states, or its harvesting states when it has none. Warns on unknown or missing fruit types.
---@param savegame table
function FruitPreparer:onLoad(savegame) end

--- Deletes the work sound samples and the animation nodes.
function FruitPreparer:onDelete() end

--- Client: reads the isWorking flag sent by the server.
---@param streamId integer
---@param timestamp integer
---@param connection table
function FruitPreparer:onReadUpdateStream(streamId, timestamp, connection) end

--- Server: writes the isWorking flag to clients.
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function FruitPreparer:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Client: starts the work sound and the animation nodes.
function FruitPreparer:onTurnedOn() end

--- Client: stops the sounds and the animation nodes.
function FruitPreparer:onTurnedOff() end

--- Override that calls the parent and, for work areas of type FRUITPREPARER, reads fruitPreparer#dropWorkAreaIndex (with deprecation checks of older attributes). Returns the parent's result.
---@param superFunc table
---@param workArea table
---@param xmlFile XMLFile
---@param key string
---@return boolean
function FruitPreparer:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Override returning the parent result only while the preparer is actually working (isWorking).
---@param superFunc any
---@return boolean
function FruitPreparer:getDoGroundManipulation(superFunc) end

--- Override that also enforces the speed limit when the tool is turned on and lowered (implement chain lowered or tool lowered); otherwise uses the parent result.
---@param superFunc any
---@return boolean
function FruitPreparer:doCheckSpeedLimit(superFunc) end

--- Override always returning false: cutter AI fruit requirements are not used for this tool.
---@param superFunc any
function FruitPreparer:getAllowCutterAIFruitRequirements(superFunc) end

--- Override that adds the work dirt multiplier scaled by speed over the speed limit while the preparer is working.
---@param superFunc any
function FruitPreparer:getDirtMultiplier(superFunc) end

--- Override that adds the work wear multiplier scaled by speed over the speed limit while the preparer is working.
---@param superFunc any
function FruitPreparer:getWearMultiplier(superFunc) end

--- Override that reads the moveOnlyIfPreparerCut flag of a randomly moving part after the parent loader.
---@param superFunc any
---@param part any
---@param xmlFile any
---@param key any
function FruitPreparer:loadRandomlyMovingPartFromXML(superFunc, part, xmlFile, key) end

--- Override that, for parts flagged moveOnlyIfPreparerCut, requires the preparer to be working in addition to the parent's condition.
---@param superFunc any
---@param part any
function FruitPreparer:getIsRandomlyMovingPartActive(superFunc, part) end

--- Returns the default speed limit of this tool type, 15 (unit not stated here, presumably km/h: UNVERIFIED).
---@return number
function FruitPreparer.getDefaultSpeedLimit() end

--- Server: sets isWorking to true if the tool prepared something in the last 500 ms and raises the dirty flag when this changes, so clients get the update.
---@param dt any
function FruitPreparer:onEndWorkAreaProcessing(dt) end

--- Sets the AI field course so headlands are worked first and the initial segment is worked.
---@param fieldCourseSettings any
function FruitPreparer:onAIFieldCourseSettingsInitialized(fieldCourseSettings) end

--- Applies FSDensityMapUtil.updateFruitPreparerArea for each configured fruit type on the work area (optionally over a separate drop area), records the last work time and returns 0 and the worked area. Clients beyond CLIENT_DM_UPDATE_RADIUS return 0, 0. Note: the worked area is overwritten per fruit type, not summed.
---@param workArea any
function FruitPreparer:processFruitPreparerArea(workArea) end
