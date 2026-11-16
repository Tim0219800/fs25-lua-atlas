---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Mulcher.lua (generated stub, FS25 Lua Atlas)

--- Specialization for mulchers (haulm, stubble, cover crop, vine mulchers). It is one of the few specializations in this batch with a real per-work-area effect system. EFFECTS: vehicle.mulcher.effects.effect(?), loaded by g_effectManager:loadEffect; each entry has workAreaIndex (linked area), activeDirection (0 = all, otherwise must equal movingDirection) and an activity duration of 250 ms. The fill type passed to the effect is fixed: spec.effectFillType = WHEAT (setEffectTypeInfo with that sole argument); no reading of the crop actually mulched nor of its stage. For effects of class CultivatorMotionPathEffect, autoTurnOffSpeed is forced to -infinity (so stopping is driven by this script, not by speed). The effect classes and EffectManager are absent from the dump: rendering UNVERIFIED. TRIGGER (server, or client within Mulcher.CLIENT_DM_UPDATE_RADIUS, constant not defined here, UNVERIFIED): in processMulcherArea, if the FSDensityMapUtil.updateMulcherArea call returns an actually modified area > 0 AND the speed is > 0.5, the effects of that area whose direction fits are (re)armed: activeTime = current time + 250 ms and started if they were stopped. In other words, dust/debris is only emitted when material is actually mulched in the density map (not simply when driving). STOP: onUpdateTick (server side only) turns off expired effects. NETWORK: one boolean per effect sent in the initial stream (onWriteStream) and in updates via effectDirtyFlag; the client applies setEffectTypeInfo + startEffects/stopEffects on reception. A client therefore does not compute the effect itself, unless it also runs processMulcherArea. Note: onLoad removes the onUpdateTick listener when the instance is not a client (Mulcher.lua:173) whereas this function only runs server side; on a dedicated server, effect expiry would therefore never be processed and isActive would stay true, which would prevent any new stop flag (not verified in game). WEATHER/MOISTURE: no reading. MAPS: eraseTireTrack (always, even on a distant client), updateMulcherArea (body absent from the dump), getStoneArea for wear. isWorking = less than 500 ms elapsed since the last real mulching (g_time); getDoGroundManipulation (override) returns false if not isWorking, which WorkParticles.lua:238 consults for its ground particles. dt: activeTime in milliseconds of game time, independent of FPS. EXTENSION POINTS: function processMulcherArea; overrides doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, getAIImplementUseVineSegment, loadWorkAreaFromXML (type MULCHER); events onLoad, onPostLoad, onDelete, network streams, onUpdateTick, onDeactivate, onStart/EndWorkAreaProcessing, onAIFieldCourseSettingsInitialized. Default speed limit: 15.
---@class Mulcher
Mulcher = {}

--- Declares the mulcher area type and the XML schema: effects (vehicle.mulcher.effects.effect(?) with workAreaIndex/activeDirection) and idle/work sounds. Not read key by key.
function Mulcher.initSpecialization() end

--- Requires WorkArea and GroundReference.
---@param specializations table
---@return boolean
function Mulcher.prerequisitesPresent(specializations) end

--- Registers processMulcherArea on the vehicle type.
---@param vehicleType any
function Mulcher.registerFunctions(vehicleType) end

--- Overrides doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, getAIImplementUseVineSegment and loadWorkAreaFromXML.
---@param vehicleType any
function Mulcher.registerOverwrittenFunctions(vehicleType) end

--- Subscribes notably to onLoad, onPostLoad, onDelete, the four network stream events, onUpdateTick, onDeactivate and the area processing events (exact list not re-read).
---@param vehicleType any
function Mulcher.registerEventListeners(vehicleType) end

--- Loads sounds and effects (one table per effect with area, direction, 250 ms window, active/sent states), sets effectFillType to WHEAT, declares the AI needs (crops whose mulched stage is defined, weed replacements) and the stone wear multiplier; removes onUpdateTick if not a client or without effects.
---@param savegame table
function Mulcher:onLoad(savegame) end

--- Attaches each effect to its work area (workAreaToEffects) and removes those whose workAreaIndex is invalid (with an XML warning).
---@param savegame any
function Mulcher:onPostLoad(savegame) end

--- Frees sounds and effects.
function Mulcher:onDelete() end

--- Receives each effect's active state on connection: starts (with effectFillType) or stops the effect.
---@param streamId any
---@param connection any
function Mulcher:onReadStream(streamId, connection) end

--- Writes each effect's active state.
---@param streamId any
---@param connection any
function Mulcher:onWriteStream(streamId, connection) end

--- Client side: if the flag is present, reads each effect's state and starts or stops it.
---@param streamId any
---@param timestamp any
---@param connection any
function Mulcher:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes the effects' state when effectDirtyFlag is raised.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Mulcher:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Server only: deactivates the effects whose 250 ms window has expired, raises effectDirtyFlag and calls stopEffects. Removed from the subscription if the instance is not a client or without effects (see module).
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Mulcher:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Erases tire tracks, applies mulching to the density map (updateMulcherArea) and, if real area is processed at speed > 0.5, arms/starts the area's effects (direction permitting) then raises the network flag. Updates lastWorkTime (g_time), isWorking (< 500 ms) and the stone reading. Returns the real and total areas.
---@param workArea any
---@param dt any
function Mulcher:processMulcherArea(workArea, dt) end

--- Applies the speed limit as soon as the tool chain is lowered.
---@param superFunc any
---@return boolean
function Mulcher:doCheckSpeedLimit(superFunc) end

--- Returns false as long as isWorking is false; otherwise delegates to the parent. Queried by WorkParticles for its ground particles.
---@param superFunc any
---@return boolean
function Mulcher:getDoGroundManipulation(superFunc) end

--- Adds the work soiling weighted by speed when isWorking (reads spec.speedLimit, a field of the specialization table that this file does not define anywhere, whereas other tools read self.speedLimit: Note: may be provided elsewhere, UNVERIFIED).
---@param superFunc any
---@return number
function Mulcher:getDirtMultiplier(superFunc) end

--- Adds the work wear weighted by speed and by the stone multiplier.
---@param superFunc any
---@return number
function Mulcher:getWearMultiplier(superFunc) end

--- Tells whether the AI should process a vine segment: true if more than 1% of the segment's area is covered by the tool.
---@param superFunc any
---@param placeable any
---@param segment any
---@param segmentSide any
function Mulcher:getAIImplementUseVineSegment(superFunc, placeable, segment, segmentSide) end

--- Forces the MULCHER area type if the type read is DEFAULT.
---@param superFunc table
---@param workArea table
---@param xmlFile integer
---@param key string
---@return boolean
function Mulcher:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Stops sounds and effects.
function Mulcher:onDeactivate() end

--- Resets isWorking and isWorkingIdle to false before the pass.
---@param dt any
function Mulcher:onStartWorkAreaProcessing(dt) end

--- Client: starts/stops the work sound (according to isWorking) and the idle sound (according to isWorkingIdle, speed > 0.5).
---@param dt any
function Mulcher:onEndWorkAreaProcessing(dt) end

--- AI course settings: borders first, initial segment worked.
---@param fieldCourseSettings any
function Mulcher:onAIFieldCourseSettingsInitialized(fieldCourseSettings) end

--- Default speed limit: 15.
---@return number
function Mulcher.getDefaultSpeedLimit() end
