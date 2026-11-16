---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Tedder.lua (generated stub, FS25 Lua Atlas)

--- Tedder specialization: picks up the windrow/forage under the work area (height map, DensityMapHeightUtil) and drops it again spread out in a drop area, converting the fill type (fillTypeConverter: e.g. grass to dry hay, names not re-read). Prerequisites: WorkArea and TurnOnVehicle. EFFECTS (client): animationNodes (vehicle.tedder.animationNodes, started on turn-on, stopped on turn-off) and a list of effects vehicle.tedder.effects.effect(?) loaded by g_effectManager:loadEffect, each tied to an area by workAreaIndex, with a 250 ms activity window. Effect classes are absent from the dump: rendering UNVERIFIED. TRIGGER (server): in processTedderArea, if litres were actually dropped again (dropped > 0) and speed (getLastSpeed(true)) is > 0.5, the area's effects are armed (activeTime = time + 250 ms), started if needed and set to the dropped fill type (setEffectTypeInfo at start or when the type changes). The effect density is set to max(speed / speed limit, 0.6) on the player host (g_effectManager:setDensity); on a remote client, the network stream only carries the type and the active state: density is not set (onReadUpdateStream applies setEffectTypeInfo and startEffects, then handles sounds), so the effect runs there at the default density of the XML definition (UNVERIFIED: EffectManager behaviour is absent). In other words, the thrown dust/forage only appears if material is really picked up AND dropped, not when running empty. The effects therefore receive the converted (target) fill type, never a crop stage. STOP: onUpdateTick (server only, the listener is removed otherwise) stops expired effects and raises effectDirtyFlag. WEATHER/WETNESS: no data read. NETWORK: array of fill types per area (fillTypesDirtyFlag, SEND_NUM_BITS) and an active-effect boolean per effect (effectDirtyFlag); the client applies type + start/stop on reception; the client does not recompute the effect. CONDITIONS: active according to the TEDDER area type (no turn-on test in getIsWorkAreaActive: not overridden here, the activation logic comes from elsewhere, UNVERIFIED); doCheckSpeedLimit applies if turned on and implement chain lowered. isWorking = litres dropped during the pass > 0 (onEndWorkAreaProcessing). Pickup: tipToGroundAroundLine with -infinity on each input type; processing skipped for a distant client (> Tedder.CLIENT_DM_UPDATE_RADIUS, a constant not defined here, UNVERIFIED). dt: 250 ms windows in game time (g_currentMission.time). Note: onPostLoad, for an invalid workAreaIndex, calls table.insert(spec.effects, i) instead of table.remove (Tedder.lua:166), which looks like a mistake (not verified in game). The tedderWorkAreaFillTypes table is initialised with FruitType.UNKNOWN although it holds fill types. EXTENSION POINTS: registerFunctions functions (preprocessTedderArea, processTedderArea, processDropArea); overrides loadWorkAreaFromXML (adds dropWindrowWorkAreaIndex and the area effect fields), getDirtMultiplier, getWearMultiplier, doCheckSpeedLimit; events onLoad, onPostLoad, streams, onUpdateTick, onTurnedOn/Off, onStart/EndWorkAreaProcessing, onDeactivate. Default speed limit: 15.
---@class Tedder
Tedder = {}

--- Declares the tedder area type and the XML schema: effects (vehicle.tedder.effects.effect(?)), animationNodes, type converter, sounds. Not re-read key by key.
function Tedder.initSpecialization() end

--- Requires WorkArea and TurnOnVehicle.
---@param specializations any
function Tedder.prerequisitesPresent(specializations) end

--- Registers preprocessTedderArea, processTedderArea and processDropArea.
---@param vehicleType any
function Tedder.registerFunctions(vehicleType) end

--- Overrides loadWorkAreaFromXML, getDirtMultiplier, getWearMultiplier and doCheckSpeedLimit (list not re-read line by line).
---@param vehicleType any
function Tedder.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onDelete, the four stream events, onUpdateTick, onStart/EndWorkAreaProcessing, onTurnedOn/Off, onAIFieldCourseSettingsInitialized and onDeactivate (list not re-read line by line).
---@param vehicleType any
function Tedder.registerEventListeners(vehicleType) end

--- Loads the type converter (warns if missing), the animations and effects (client), initialises dropped litres, the stone wear multiplier (TEDDER type) and network flags; declares to the AI the requirement of a grass windrow.
---@param savegame any
function Tedder:onLoad(savegame) end

--- Links each effect to its area (workAreaToEffects) and to the area's fill type index; removes the onUpdateTick listener off the server. Note: insertion instead of removal for an invalid index.
---@param savegame any
function Tedder:onPostLoad(savegame) end

--- Releases the effects and animations.
function Tedder:onDelete() end

--- Reads the fill types per area then the state of each effect, and starts/stops the effects with the area's type.
---@param streamId any
---@param connection any
function Tedder:onReadStream(streamId, connection) end

--- Writes the fill types per area then the sent state of each effect.
---@param streamId any
---@param connection any
function Tedder:onWriteStream(streamId, connection) end

--- Client side: reads, if present, the types per area and the state of each effect, applies type and start/stop then drives the work sounds; does not set the density.
---@param streamId any
---@param timestamp any
---@param connection any
function Tedder:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes types (fillTypesDirtyFlag) and effect states (effectDirtyFlag).
---@param streamId any
---@param connection any
---@param dirtyMask any
function Tedder:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Server: stops the effects whose 250 ms window has expired, updates isActiveSent and the flags; on the player host, calls stopEffects.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Tedder:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Forces the TEDDER type if DEFAULT; for a TEDDER area, reads the drop area (dropWindrowWorkAreaIndex) and initialises litres to drop, the last drop type and particle flags, and reserves a slot in tedderWorkAreaFillTypes.
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function Tedder:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Adds the work dirt weighted by speed/limit when isWorking.
---@param superFunc any
function Tedder:getDirtMultiplier(superFunc) end

--- Adds the work wear weighted by speed/limit and by the stone multiplier.
---@param superFunc any
function Tedder:getWearMultiplier(superFunc) end

--- Applies the speed limit if the tool is turned on and the implement chain is lowered.
---@param superFunc any
function Tedder:doCheckSpeedLimit(superFunc) end

--- Resets the picked-up and dropped litres of the area before processing.
---@param workArea any
function Tedder:preprocessTedderArea(workArea) end

--- Picks up each converter input type along the area's line, adds the litres to drop, drops them again via processDropArea and, on the server at speed > 0.5, updates the type per area, arms and starts the effects (with density). Also reads stone presence if the tool is moving. Returns the area (line width * distance travelled) twice.
---@param workArea any
---@param dt any
function Tedder:processTedderArea(workArea, dt) end

--- Drops the converted litres on the drop area's line (tipToGroundAroundLine) and stores the line offset; returns the litres actually dropped (0, 0 for a distant client: the return value is not uniform).
---@param dropArea any
---@param fillType any
---@param litersToDrop any
function Tedder:processDropArea(dropArea, fillType, litersToDrop) end

--- Resets spec.lastDroppedLiters before the pass.
---@param dt any
function Tedder:onStartWorkAreaProcessing(dt) end

--- isWorking becomes true if litres were dropped during the pass.
---@param dt any
---@param hasProcessed any
function Tedder:onEndWorkAreaProcessing(dt, hasProcessed) end

--- Client: starts the animationNodes.
function Tedder:onTurnedOn() end

--- Client: stops the animations and all effects.
function Tedder:onTurnedOff() end

--- AI course settings: borders first, initial segment worked.
---@param fieldCourseSettings any
function Tedder:onAIFieldCourseSettingsInitialized(fieldCourseSettings) end

--- Client: stops all effects.
function Tedder:onDeactivate() end

--- Default speed limit: 15.
function Tedder.getDefaultSpeedLimit() end
