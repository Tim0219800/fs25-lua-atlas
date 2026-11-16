---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Windrower.lua (generated stub, FS25 Lua Atlas)

--- Windrower specialization: picks up the spread forage (types listed by vehicle.windrower#fillTypes / #fillTypeCategories) on the work area via the height map (DensityMapHeightUtil.tipToGroundAroundLine with -infinity) and deposits it as a windrow in a drop area (dropWindrowWorkAreaIndex). Same architecture as Tedder. EFFECTS: animationNodes (client, started on switch-on) and a list vehicle.windrower.effects.effect(?) loaded by g_effectManager:loadEffect, each bound to an area (workAreaIndex) and optionally to a drop area (dropAreaIndex), activity window 250 ms; if the effect exposes setWorkAreaIndex, the area is communicated to it. Effect classes absent from the dump: rendering UNVERIFIED. TRIGGER (server): in processWindrowerArea, when the area picked up liters, if the drop actually deposited material (dropped > 0) and the speed (getLastSpeed(true)) exceeds 0.5, the effects of the area whose dropAreaIndex matches are armed (activeTime = time + 250 ms), started if needed and set to the deposited type (setEffectTypeInfo). No density set (unlike Tedder). The type passed is that of the last windrow picked up (lastValidPickupFillType), never a crop stage. Each pickup also calls setTestAreaRequirements(nil, type, nil) with the picked-up type (exact role in rendering UNVERIFIED: function outside this file). CONDITIONS: isWorking = speed > 0.5 when an area is processed; doCheckSpeedLimit applies if on (or without TurnOnVehicle) and the chain is lowered; no switch-on test in the area itself (getIsWorkAreaActive not overridden here: UNVERIFIED). Processing skipped for a distant client (> Windrower.CLIENT_DM_UPDATE_RADIUS, constant not defined here: UNVERIFIED). STOP: onUpdateTick (server side) cuts expired effects and raises effectDirtyFlag; onTurnedOff cuts everything. On a dedicated server, g_effectManager is called without an isClient guard (harmless? not verified). WEATHER/MOISTURE: no data read. NETWORK: fill types per area (fillTypesDirtyFlag) and a boolean per effect (effectDirtyFlag), broadcast in the initial stream and in updates; the client applies type and start/stop. dt: 250 ms of game time; no dt in the drop physics. Note: onPostLoad uses table.insert(spec.effects, i) instead of table.remove for an invalid index (Windrower.lua:171), likely a mistake (not verified in game). particleSystemIndex is read in loadWorkAreaFromXML but never used in this file (leftover of the old particle system; the vehicle.windrowerParticleSystems keys are flagged obsolete). EXTENSION POINTS: functions processWindrowerArea, processDropArea; overrides doCheckSpeedLimit, loadWorkAreaFromXML (WINDROWER type), getDirtMultiplier, getWearMultiplier; events onLoad, onPostLoad, streams, onUpdateTick, onTurnedOn/Off, onStart/EndWorkAreaProcessing, onAIFieldCourseSettingsInitialized. Default speed limit: 15.
---@class Windrower
Windrower = {}

--- Declares the windrower area type and the XML schema: effects, animationNodes, supported fill types, limitToLineHeight, sounds. Not reread key by key.
function Windrower.initSpecialization() end

--- Requires the WorkArea specialization (only).
---@param specializations any
function Windrower.prerequisitesPresent(specializations) end

--- Registers processWindrowerArea and processDropArea.
---@param vehicleType any
function Windrower.registerFunctions(vehicleType) end

--- Overrides doCheckSpeedLimit, loadWorkAreaFromXML, getDirtMultiplier and getWearMultiplier.
---@param vehicleType any
function Windrower.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onDelete, the four stream events, onUpdateTick, onTurnedOn/Off, onStart/EndWorkAreaProcessing and onAIFieldCourseSettingsInitialized (list not reread line by line).
---@param vehicleType any
function Windrower.registerEventListeners(vehicleType) end

--- Loads animations and effects (client), reads limitToLineHeight and the supported types list, initializes the stone wear multiplier (WINDROWER type) and the network flags, declares to the AI the required height types.
---@param savegame any
function Windrower:onLoad(savegame) end

--- Binds each effect to its work area and to the area's type index; warns if the index is invalid (with the faulty insertion noted in the module).
---@param savegame any
function Windrower:onPostLoad(savegame) end

--- Releases animations and effects.
function Windrower:onDelete() end

--- Reads the fill types per area then the state of each effect; starts or stops the effects with the area's type.
---@param streamId any
---@param connection any
function Windrower:onReadStream(streamId, connection) end

--- Writes the types per area then the sent state of each effect.
---@param streamId any
---@param connection any
function Windrower:onWriteStream(streamId, connection) end

--- Client side: reads effect types and states if present, applies start/stop with setEffectTypeInfo.
---@param streamId any
---@param timestamp any
---@param connection any
function Windrower:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes types (fillTypesDirtyFlag) and states (effectDirtyFlag).
---@param streamId any
---@param connection any
---@param dirtyMask any
function Windrower:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Server: cuts the effects whose 250 ms window has expired and raises effectDirtyFlag.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Windrower:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client: starts the work sound and the animationNodes.
function Windrower:onTurnedOn() end

--- Cuts all the effects (without a client guard) and stops the animations.
function Windrower:onTurnedOff() end

--- Applies the speed limit if the implement chain is lowered and the implement is on (or cannot be turned on).
---@param superFunc any
function Windrower:doCheckSpeedLimit(superFunc) end

--- Default speed limit: 15.
function Windrower.getDefaultSpeedLimit() end

--- Forces the WINDROWER type if DEFAULT; for a WINDROWER area reads particleSystemIndex (unused) and the drop area, initializes liters and type, reserves a slot in windrowerWorkAreaFillTypes.
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function Windrower:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Adds the work dirt weighted by speed/limit when isWorking.
---@param superFunc any
function Windrower:getDirtMultiplier(superFunc) end

--- Adds the work wear weighted by speed/limit and by the stone multiplier.
---@param superFunc any
function Windrower:getWearMultiplier(superFunc) end

--- Resets, for each area, the picked-up valid type, picked-up and deposited liters; isWorking = false.
---@param dt any
---@param workAreas any
function Windrower:onStartWorkAreaProcessing(dt, workAreas) end

--- Client without TurnOnVehicle: starts/stops the work sound according to isWorking. No visual effect here.
---@param dt any
---@param workAreas any
function Windrower:onEndWorkAreaProcessing(dt, workAreas) end

--- AI course settings: borders first, initial segment worked.
---@param fieldCourseSettings any
function Windrower:onAIFieldCourseSettingsInitialized(fieldCourseSettings) end

--- Picks up the windrow under the area: looks for a supported type (or reuses the last type, fresh and dry grass being equivalent), remembers lastValidPickupFillType and calls setTestAreaRequirements, accumulates liters to deposit, deposits via processDropArea and, on the server at speed > 0.5 with an actual drop, updates the type per area and arms/starts the effects. Returns deposited liters and area (width * distance traveled).
---@param workArea any
---@param dt any
function Windrower:processWindrowerArea(workArea, dt) end

--- Deposits the liters on the line of the drop area (tipToGroundAroundLine), remembers the line offset and returns the liters actually deposited.
---@param dropArea any
---@param litersToDrop any
---@param fillType any
function Windrower:processDropArea(dropArea, litersToDrop, fillType) end
