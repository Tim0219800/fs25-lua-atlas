---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Mower.lua (generated stub, FS25 Lua Atlas)

--- Specialization of mowers (cutter bar, discs, mower-conditioner): cuts grass/forage crops from the density map (updateMowerArea, body absent from the dump) and drops the forage either on the drop area (windrow) or into a fill unit. Prerequisites: WorkArea, TurnOnVehicle, FruitExtraObjects. EFFECTS (two families): (1) cutterEffects (vehicle.mower.cutterEffects), a cutting effect driven in onUpdate; (2) dropEffects (vehicle.mower.dropEffects.dropEffect(?)), windrow drop effects, tied to a work area (workAreaIndex) and a drop area (dropAreaIndex), activity window 750 ms. Effect classes are absent from the dump: rendering UNVERIFIED. CUTTER EFFECTS: onUpdate (listener removed if there is no cutting effect) does nothing as long as the tool is not turned on AND getLastSpeed() <= 0.5; otherwise, on the server side, it reads the last cut crop (workAreaParameters.lastInputFruitType and growth state) if a real cut happened within the last 500 ms (g_time), otherwise unknown crop; the effect is active if the crop is known and the test area is not reset. It then calls g_effectManager:setEffectTypeInfo(effects, nil, crop, state) then setMinMaxWidth with the current width of the test area of area no. 1 (getTestAreaWidthByWorkAreaIndex(1), bounds inverted when driving forward) and startEffects. The effects therefore receive crop, growth state (default 3 if nothing recent) and the width actually cut. The state is broadcast (effectDirtyFlag: effectsAreRunning, state on 4 bits, crop on FruitTypeManager.SEND_NUM_BITS); the client rebuilds the same calls from these values and its own test areas (setTestAreaRequirements). Stop: onUpdate if no more cutting, onTurnedOff, or reception of effectsAreRunning false. DROP EFFECTS: on the server side, onEndWorkAreaProcessing activates the effect when the linked area has picked up litres (pickedUpLiters > 0) on the wanted drop area; if there is no more cutting, a timer decreasing by dt (750 ms) extends the effect; onStartWorkAreaProcessing of the next tick broadcasts the change via dirtyFlag and calls setDropEffectEnabled (actual start/stop, client side). The type passed is the fill type of the drop area (dropArea.fillType, from the fruitTypeConverter: grass to windrow, etc.). DROP: processDropArea (end of pass, server or nearby client) drops the accumulated litres on a line drawn at random between the edges of the drop area (math.random, including in the drop physics: not deterministic from one run to another; note: the computation of the end point mixes width and height coordinates, Mower.lua:552-553, an apparently unusual form, not verified in game); lastDropTime is used by isCutting (500 ms) for the cutting sound. LITRES: fruitTypeAreaLiters * harvest multiplier (getHarvestScaleMultiplier with spraying, plowing, lime, weeds, stubble, roller, bees factors: values read from the map) * conversion factor. WEATHER/WETNESS: no reading in this file. NETWORK: initial stream (windrow drop option), update stream (types and states of the dropEffects, isCutting if there are no drop effects; cutting effects). Area processing is skipped for a distant client (> Mower.CLIENT_DM_UPDATE_RADIUS, constant not defined here: UNVERIFIED). dt: the dropEffect timer is in ms of game time, but with different logic from the other tools (countdown in dt, whereas Tedder/Windrower compare with g_currentMission.time). EXTENSION POINTS: functions processMowerArea, processDropArea, getDropArea, setDropEffectEnabled, setCutSoundEnabled, setUseMowerWindrowDropAreas; overrides doCheckSpeedLimit, getCanBeSelected, getDirtMultiplier, getWearMultiplier, getFruitExtraObjectTypeData, loadWorkAreaFromXML (keys mower#dropWindrow, #dropAreaIndex); events onLoad, onPostLoad, streams, onUpdate, onTurnedOn/Off, onStart/EndWorkAreaProcessing, onAIFieldCourseSettingsInitialized; network event MowerToggleWindrowDropEvent. Default speed limit: 20.
---@class Mower
Mower = {}

--- Declares the mower area type and the XML schema: drop and cutting effects, crop converter, fill unit, windrow toggle (texts, animation, initial state), cutting sounds, dropWindrow/dropAreaIndex keys of the areas. Not re-read key by key.
function Mower.initSpecialization() end

--- Requires WorkArea, TurnOnVehicle and FruitExtraObjects.
---@param specializations table
---@return boolean
function Mower.prerequisitesPresent(specializations) end

--- Registers processMowerArea, processDropArea, getDropArea, setDropEffectEnabled, setCutSoundEnabled and setUseMowerWindrowDropAreas.
---@param vehicleType any
function Mower.registerFunctions(vehicleType) end

--- Overrides doCheckSpeedLimit, getCanBeSelected, getDirtMultiplier, getWearMultiplier, getFruitExtraObjectTypeData and loadWorkAreaFromXML (list not re-read line by line).
---@param vehicleType any
function Mower.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onPostLoad, onDelete, the four stream events, onUpdate, onRegisterActionEvents, onTurnedOn/Off, onStart/EndWorkAreaProcessing and onAIFieldCourseSettingsInitialized (list not re-read line by line).
---@param vehicleType any
function Mower.registerEventListeners(vehicleType) end

--- Loads animations and sounds, drop effects (validates area and drop indices, 750 ms window) and cutting effects, the crop converter, the fill unit, the windrow toggle state, the pass parameters and the AI requirements; removes onUpdate if there is no cutting effect.
---@param savegame table
function Mower:onLoad(savegame) end

--- Stores the MOWER areas and attaches its dropEffects to each of them.
---@param savegame table
function Mower:onPostLoad(savegame) end

--- Frees animations, sounds, drop and cutting effects.
function Mower:onDelete() end

--- Reads the state of the windrow option on connection (if toggle texts are defined).
---@param streamId integer
---@param connection Connection
function Mower:onReadStream(streamId, connection) end

--- Writes the windrow option.
---@param streamId integer
---@param connection Connection
function Mower:onWriteStream(streamId, connection) end

--- Client side: reads types and states of the dropEffects (or isCutting), then the state of the cutting effects (state, crop) and stops the effects if effectsAreRunning is false; reinstalls the test areas of the received crop.
---@param streamId integer
---@param timestamp integer
---@param connection table
function Mower:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes types and states of the dropEffects (dirtyFlag) and the state of the cutting effects (effectDirtyFlag: active, state on 4 bits, crop).
---@param streamId integer
---@param connection table
---@param dirtyMask integer
function Mower:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Drives the cutting effects (see module): active only if turned on and speed > 0.5; computes the cut width from test area no. 1, determines crop and state (server) or re-reads them (client), calls setEffectTypeInfo, setMinMaxWidth and startEffects, or stops them and raises the network flag.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Mower:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- For each convertible crop, calls updateMowerArea (changed area, yield factors, state); converts to litres, adds them to the drop area (up to 1000 l) or, without a drop area, directly to the fill unit (server); for fresh grass, sucks up the existing dry hay windrow; stores crop, state and cut time, sets the test area. Sets isWorking if speed > 1 and reads the presence of stones.
---@param workArea any
---@param dt any
function Mower:processMowerArea(workArea, dt) end

--- Drops the accumulated litres of a drop area on a line chosen at random between its edges, if the minimum threshold of the height map is exceeded; stores lastDropTime and the line offset.
---@param dropArea any
---@param dt any
function Mower:processDropArea(dropArea, dt) end

--- Returns the auxiliary drop area (type AUXILIARY) linked to a cutting area, or nil if windrow drop is disabled or the index is invalid (with a warning).
---@param workArea any
function Mower:getDropArea(workArea) end

--- Stores the active state of a drop effect and, client side, applies the fill type then starts or stops it.
---@param dropEffect table
---@param isActive boolean
function Mower:setDropEffectEnabled(dropEffect, isActive) end

--- Client: starts or stops the cutting sounds.
---@param isActive boolean
function Mower:setCutSoundEnabled(isActive) end

--- Enables/disables windrow drop: sends the network event, stores the option and plays the toggle animation.
---@param useMowerWindrowDropAreas boolean
---@param noEventSend boolean
function Mower:setUseMowerWindrowDropAreas(useMowerWindrowDropAreas, noEventSend) end

--- Forces type MOWER if DEFAULT; for MOWER reads dropWindrow (true) and dropAreaIndex (1); for AUXILIARY registers the area as a drop area with litres to drop at zero.
---@param superFunc table
---@param workArea table
---@param xmlFile XMLFile
---@param key string
---@return boolean
function Mower:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Registers, if the texts are defined, the windrow drop toggle action (IMPLEMENT_EXTRA3).
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Mower:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Applies the speed limit if the tool is turned on and lowered (or has no notion of lowering).
---@param superFunc any
---@return boolean
function Mower:doCheckSpeedLimit(superFunc) end

--- Returns true: the tool is selectable.
---@param superFunc any
function Mower:getCanBeSelected(superFunc) end

--- Adds the work dirt weighted by speed/limit while isWorking.
---@param superFunc any
function Mower:getDirtMultiplier(superFunc) end

--- Adds the work wear weighted by speed/limit and by the stone multiplier.
---@param superFunc any
function Mower:getWearMultiplier(superFunc) end

--- Returns the last cut crop for the extra objects (FruitExtraObjects).
---@param superFunc any
function Mower:getFruitExtraObjectTypeData(superFunc) end

--- Client: starts the animationNodes.
function Mower:onTurnedOn() end

--- Client: stops the drop effects and the animations; in every case stops the cutting effects and sets effectsAreRunning back to false.
function Mower:onTurnedOff() end

--- Server: broadcasts and applies the state changes of the dropEffects then sets them back to inactive; resets picked-up litres per area, areas and isWorking to zero.
---@param dt any
function Mower:onStartWorkAreaProcessing(dt) end

--- Drops the litres (processDropArea on each drop area), arms the dropEffects according to pickedUpLiters (750 ms timer in dt); server: statistics (threshedHectares), isCutting state with flag and cutting sound; every 500 ms recomputes the area usage percentage.
---@param dt any
---@param hasProcessed any
function Mower:onEndWorkAreaProcessing(dt, hasProcessed) end

--- AI course parameters: borders first, initial segment worked, corner cutting allowed.
---@param fieldCourseSettings any
function Mower:onAIFieldCourseSettingsInitialized(fieldCourseSettings) end

--- Returns the share of areas that cut during the last 500 ms window (0 without specialization).
function Mower:getMowerLoadPercentage() end

--- Default speed limit: 20.
---@return number
function Mower.getDefaultSpeedLimit() end

--- Input callback: toggles windrow drop.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Mower.actionEventToggleDrop(self, actionName, inputValue, callbackState, isAnalog) end

--- Updates the action text according to the windrow drop state.
---@param self any
function Mower.updateActionEventToggleDrop(self) end
