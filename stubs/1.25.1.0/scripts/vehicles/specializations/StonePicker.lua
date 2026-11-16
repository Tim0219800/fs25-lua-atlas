---@meta
-- FS25 1.25.1.0 : vehicles/specializations/StonePicker.lua (generated stub, FS25 Lua Atlas)

--- Stone picker specialization: picks up stones from the stone density map (stoneSystem) and pours them into a STONE-type fill unit. EFFECTS (client): two groups loaded by g_effectManager:loadEffect, effects (vehicle.stonePicker.effects: ejected/picked stones) and soilEffects (vehicle.stonePicker.soilEffects: soil lifted by the tool). Effect classes and EffectManager are absent from the dump: rendering UNVERIFIED. TRIGGERING (computed server side in onEndWorkAreaProcessing, then broadcast): the stone effect is active if area was touched within the last 500 ms (lastChangedAreaTime); the soil effect (soilEffects) is active if the tool is working (isWorking: speed > 0.5 during an area processing) AND the vehicle is on a field (self.isOnField). The server calls setStonePickerEffectsState only if one of the three items (stones, stage 1-3, soil) changed, then raises dirtyFlag. DATA PASSED: for stones, setEffectTypeInfo(effects, FillType.STONE, nil, growthState) where growthState = clamp(floor(stoneFactor + 0.49), 1, 3) (stone density stage read by updateStonePickerArea); for soil, a plain start/stop without type. AREA CONDITIONS: area processing happens only if the tool is turned on (if needsActivation, true by default), is not full (freeCapacity > 0, except AI), 2000 ms after attaching and, by default, lowered. Becoming full also stops the tool (onFillUnitFillLevelChanged, server). TERRAIN: updateStonePickerArea (body absent from the dump, UNVERIFIED) returns a stone factor, touched area and total area; litres = area in m2 (getFruitPixelsToSqm) * stoneSystem:getLitersPerSqm() * factor, added to the fill unit at the end of the pass. eraseTireTrack is always called; away from the client (> StonePicker.CLIENT_DM_UPDATE_RADIUS, constant not defined here, UNVERIFIED) the processing is skipped. WEATHER/MOISTURE: no data read. NETWORK: initial stream and update stream (stone effect, stage on 2 bits, soil effect); the client therefore applies the server state via setStonePickerEffectsState without recomputing it. dt: the 500 ms window is measured with g_time, independent of FPS. getDoGroundManipulation (override) returns false if not isWorking: queried by WorkParticles.lua:238 for the ground particles. The dirt/wear multipliers only count forward driving (movingDirection > 0); the dirt one reads spec.speedLimit (field not defined in this file, the wear line reads self.speedLimit: UNVERIFIED). EXTENSION POINTS: functions processStonePickerArea and setStonePickerEffectsState; overrides doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML (STONEPICKER type), getIsWorkAreaActive, getCanBeTurnedOn, getTurnedOnNotAllowedWarning, getCanToggleTurnedOn; stream events, onFillUnitFillLevelChanged, onPostAttach, onDeactivate, onStart/EndWorkAreaProcessing, onAIFieldCourseSettingsInitialized. Also registers an AI strategy (AIDriveStrategyStonePicker). Default speed limit: 10.
---@class StonePicker
StonePicker = {}

--- Registers the AI drive strategy AIDriveStrategyStonePicker, the stonePicker area type and the XML schema (effects and soilEffects, sounds, fill unit, direction node, needsActivation, onlyActiveWhenLowered). Not re-read key by key.
function StonePicker.initSpecialization() end

--- Requires FillUnit and WorkArea.
---@param specializations table
---@return boolean
function StonePicker.prerequisitesPresent(specializations) end

--- Registers processStonePickerArea and setStonePickerEffectsState (exact list not re-read).
---@param vehicleType any
function StonePicker.registerFunctions(vehicleType) end

--- Overrides doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getIsWorkAreaActive, getCanBeTurnedOn, getTurnedOnNotAllowedWarning, getCanToggleTurnedOn.
---@param vehicleType any
function StonePicker.registerOverwrittenFunctions(vehicleType) end

--- Subscribes notably to onLoad, onDelete, the four stream events, onFillUnitFillLevelChanged, onAIFieldCourseSettingsInitialized, onPostAttach, onDeactivate and the area processing events.
---@param vehicleType any
function StonePicker.registerEventListeners(vehicleType) end

--- Loads sounds and two effect groups (client), reads fill unit, load node, direction, needsActivation (true) and onlyActiveWhenLowered (true), initializes the pass parameters and, server side, the AI requirements (sowable range, stone map).
---@param savegame table
function StonePicker:onLoad(savegame) end

--- Frees the effects and soilEffects groups.
function StonePicker:onDelete() end

--- On join, reads the stone effect state, the stage (2 bits) and the soil effect state, then applies them.
---@param streamId any
---@param connection any
function StonePicker:onReadStream(streamId, connection) end

--- Writes these three values.
---@param streamId any
---@param connection any
function StonePicker:onWriteStream(streamId, connection) end

--- Client side: if the flag is raised, reads and applies the three values.
---@param streamId any
---@param timestamp any
---@param connection any
function StonePicker:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes the three values when dirtyFlag is raised.
---@param streamId any
---@param connection any
---@param dirtyMask any
function StonePicker:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Skipped if the tool is not active (isActive of the pass). Erases tire tracks, then (away from a distant client) calls updateStonePickerArea, computes the picked litres, keeps the stone stage 1-3, the last-change time and sets isWorking (speed > 0.5). Returns touched and total area.
---@param workArea any
---@param dt any
function StonePicker:processStonePickerArea(workArea, dt) end

--- Central point of the effects: stores the three states and, client side, starts/stops the stone effect (with FillType.STONE and the stage), the soil effect and the related sounds. Acts only on state change.
---@param state any
---@param growthState any
---@param stateSoil any
function StonePicker:setStonePickerEffectsState(state, growthState, stateSoil) end

--- Applies the speed limit when the tool is lowered and, if activation is required, turned on.
---@param superFunc any
---@return boolean
function StonePicker:doCheckSpeedLimit(superFunc) end

--- Returns false if isWorking is false; otherwise delegates. Queried by WorkParticles.
---@param superFunc any
---@return boolean
function StonePicker:getDoGroundManipulation(superFunc) end

--- Adds the work dirt (forward driving, isWorking, tool turned on if required), weighted by speed.
---@param superFunc any
---@return number
function StonePicker:getDirtMultiplier(superFunc) end

--- Same for wear, without a stone factor.
---@param superFunc any
---@return number
function StonePicker:getWearMultiplier(superFunc) end

--- Forces the STONEPICKER area type if the type read is DEFAULT.
---@param superFunc table
---@param workArea table
---@param xmlFile integer
---@param key string
---@return boolean
function StonePicker:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- For STONEPICKER: inactive during the post-attach delay, if not lowered (when required) or if the tool is full (except AI).
---@param superFunc any
---@param workArea any
function StonePicker:getIsWorkAreaActive(superFunc, workArea) end

--- Refuses turning on if the tool is full (except AI).
---@param superFunc any
function StonePicker:getCanBeTurnedOn(superFunc) end

--- Returns the "tool full" warning text in that case.
---@param superFunc any
function StonePicker:getTurnedOnNotAllowedWarning(superFunc) end

--- Forbids manual toggling if needsActivation is false.
---@param superFunc any
function StonePicker:getCanToggleTurnedOn(superFunc) end

--- Server: turns the tool off when the fill unit becomes full (except AI).
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function StonePicker:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

--- AI course settings: headlands first, initial segment worked, segment splitting at 50, tool always active.
---@param fieldCourseSettings any
function StonePicker:onAIFieldCourseSettingsInitialized(fieldCourseSettings) end

--- Arms the 2000 ms activation delay.
---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
function StonePicker:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

--- Stops the work sound (the end of the file does not stop the effects: not verified in game).
function StonePicker:onDeactivate() end

--- Before the pass: isWorking = false, pass active if turned on (or activation not required), density map angle, litres and areas reset to zero.
---@param dt any
function StonePicker:onStartWorkAreaProcessing(dt) end

--- Server: area statistics, decision of the effect states (stones < 500 ms, soil = isWorking and on field) with network broadcast on change, then adds the stone litres to the fill unit.
---@param dt any
function StonePicker:onEndWorkAreaProcessing(dt) end

--- Default speed limit: 10.
---@return number
function StonePicker.getDefaultSpeedLimit() end
