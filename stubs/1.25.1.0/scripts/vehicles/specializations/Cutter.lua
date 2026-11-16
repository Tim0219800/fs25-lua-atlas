---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Cutter.lua (generated stub, FS25 Lua Atlas)

--- Specialization for cutter bars/headers and pickups (combine, forage harvester, windrow pickup): in the density maps it determines the cut crop (processCutterArea), windrow pickup (processPickupCutterArea) and haulm drop (processHaulmDropArea), then passes litres and areas to the Combine through addCutterArea (called in onEndWorkAreaProcessing, server side). EFFECTS: two groups, loaded client side by g_effectManager:loadEffect: cutterEffects (key vehicle.cutter.effect, crop cutting effect) and fillEffects (vehicle.cutter.fillEffect, material flow) plus animationNodes; since EffectManager is absent from the dump, their rendering is UNVERIFIED. Start conditions in onUpdateTick (client and server): tool turned on, movingDirection equal to the configured one (vehicle.cutter#movingDirection), getLastSpeed() > 0.5, tool lowered (unless allowCuttingWhileRaised) and a valid Combine found (workAreaParameters.combineVehicle). The fillEffect starts if a fill type is known and the tool has cut during the last 300 ms (lastAreaBiggerZeroTime); the cutterEffect starts if a valid input fruit is known and the test area is not reset. The effect receives: fill type, fruit, growth state (setEffectTypeInfo) and the width covered by the test (setMinMaxWidth, min/max bounds and alphas normalised relative to the test area), which lets the effect be limited to the width actually cut. A cutterLoad (smoothed load 0..1, 0.95/0.05 or 0.9 decay) serves as density for the Combine and the HUD. WEATHER/WETNESS DATA: none read (no rain, wind or wetness); rain only acts in Combine.addCutterArea. Crop data used for rendering: growth state (growthState) read from the density map. NETWORK: the effect states (stage, input fruit, fill type, windrow) are sent via effectDirtyFlag (writeCutterToStream / readCutterFromStream, 4 bits for the stage) and lastAreaBiggerZero on every update; the client restores the test areas (setTestAreaRequirements) so it can drive the effect locally. On a client, the three process* functions only work if currentUpdateDistance <= Cutter.CLIENT_DM_UPDATE_RADIUS (a constant not defined in this file: value UNVERIFIED). Extension points: registered functions getCombine, getCutterLoad, getCutterStoneMultiplier, processCutterArea, processPickupCutterArea, processHaulmDropArea, setCutterCutHeight, getCutterTilt*; overrides getIsWorkAreaActive, doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, isAttachAllowed, getConsumingLoad, getIsGroundReferenceNodeThreshold, loadInputAttacherJoint, getFruitExtraObjectTypeData; default speed Cutter.getDefaultSpeedLimit. For a harvest dust mod, onUpdateTick is the only place that knows the cut width, the crop and its stage at the same time.
---@class Cutter
Cutter = {}

--- Registers in the XML schema the keys vehicle.cutter (fruitTypes, fruitTypeCategories, fruitTypeConverter, fillTypeConverter, supportsPickupAI, cutting effect, fillEffect, allowsForageGrowthState, allowCuttingWhileRaised, movingDirection, strawRatio, haulmDrop, spiked drums, sounds, tilt) and vehicles.vehicle(?).cutter#cutHeight for the savegame. Not re-read key by key.
function Cutter.initSpecialization() end

--- Requires WorkArea and TestAreas (the list continues on the same line, not read in full).
---@param specializations any
function Cutter.prerequisitesPresent(specializations) end

--- Exposes getCombine, getAllowCutterAIFruitRequirements, processCutterArea, processPickupCutterArea, processHaulmDropArea, getCutterLoad, getCutterStoneMultiplier, loadCutterTiltFromXML, getCutterTiltIsAvailable, getCutterTiltIsActive, getCutterTiltDelta, the tilt raycast callbacks, setCutterCutHeight, as well as the loading/state of speed-rotating and randomly moving parts.
---@param vehicleType any
function Cutter.registerFunctions(vehicleType) end

--- Overrides getIsWorkAreaActive, doCheckSpeedLimit, loadWorkAreaFromXML, getDirtMultiplier, getWearMultiplier, isAttachAllowed, getConsumingLoad, getIsGroundReferenceNodeThreshold, getDefaultAllowComponentMassReduction, loadInputAttacherJoint, getFruitExtraObjectTypeData and the rotating/moving part functions.
---@param vehicleType any
function Cutter.registerOverwrittenFunctions(vehicleType) end

--- Listens to onLoad, onPostLoad, onDelete, the network streams, onUpdate, onUpdateTick, onStart/EndWorkAreaProcessing, onTurnedOn/Off, onAIImplementStart and onAIFieldCourseSettingsInitialized.
---@param vehicleType any
function Cutter.registerEventListeners(vehicleType) end

--- Loads the supported crops (list, categories), the crop and fill type converters, the output types, the initial cut height, the effects (cutterEffects and fillEffects, client side), the animations and sounds, the automatic tilt, the row of test areas and the internal state (cutterLoad, last fruit, windrow, dirty flag effectDirtyFlag).
---@param savegame any
function Cutter:onLoad(savegame) end

--- After loading: restores the cut height from the savegame.
---@param savegame any
function Cutter:onPostLoad(savegame) end

--- Deletes the cutter's effects, animations and sounds.
function Cutter:onDelete() end

--- Client side on connection: reads the synchronised cutting state (via readCutterFromStream).
---@param streamId any
---@param connection any
function Cutter:onReadStream(streamId, connection) end

--- Server side on connection: writes the cutting state via writeCutterToStream.
---@param streamId any
---@param connection any
function Cutter:onWriteStream(streamId, connection) end

--- Client side: if a flag is true, reads the cutting state; reads lastAreaBiggerZero (updates lastAreaBiggerZeroTime) then restores the test area requirements according to the current fruit.
---@param streamId any
---@param timestamp any
---@param connection any
function Cutter:onReadUpdateStream(streamId, timestamp, connection) end

--- Server side: writes the cutting state if effectDirtyFlag is raised, then lastAreaBiggerZeroSent.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Cutter:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Reads growth state (4 bits), input fruit, validity flag, windrow mode and input fill type; recomputes the output type and the conversion factor from the converters.
---@param streamId any
---@param connection any
function Cutter:readCutterFromStream(streamId, connection) end

--- Writes growth state, input fruit, whether this fruit is the last valid one, windrow mode and input fill type (if windrow).
---@param streamId any
---@param connection any
function Cutter:writeCutterToStream(streamId, connection) end

--- Saves the current cut height (#cutHeight).
---@param xmlFile any
---@param key any
---@param usedModNames any
function Cutter:saveToXMLFile(xmlFile, key, usedModNames) end

--- Per frame: applies the table's automatic tilt (rotation of nodes according to the delta computed by raycast) and, client side, repositions the drum teeth (spikedDrums) along their spline according to the drum rotation.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Cutter:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Per tick: computes isEffectActive (turned on, travel direction, speed > 0.5, lowered, Combine present). If active: smooths cutterLoad, converts the test area into normalised min/max bounds (inverted according to direction), checks that the input fruit is one the Combine can process (otherwise no effect), and, client side, starts/stops fillEffects and cutterEffects (fill type, fruit, stage, width) and the cutting sound. If inactive: stops effects and sound and decays cutterLoad (x0.9). Also determines, every 500 ms, the priority output type to avoid rapid changes at the field edge, and launches the asynchronous tilt raycasts. No weather data.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Cutter:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Finds the Combine that accepts the fruit/output type: through its own verifyCombine or that of the carrier vehicle.
---@param fruitTypeIndex any
---@param outputFillTypeIndex any
function Cutter:getCombine(fruitTypeIndex, outputFillTypeIndex) end

--- Returns true: the AI applies the cutter's crop requirements.
function Cutter:getAllowCutterAIFruitRequirements() end

--- For each usable crop: reads the area in the density map (harvest, spray factors, plowing, lime, weeds, stubble, roller, bee bonus, growth state), updates the current fruit/output type/stage (server), computes the harvest multiplier (g_currentMission:getHarvestScaleMultiplier), accumulates areas and weighted areas, drops the straw ground or the haulm in the stubble area, reads the stone state and marks isWorking. Skipped on a client that is too far.
---@param workArea any
---@param dt any
function Cutter:processCutterArea(workArea, dt) end

--- Windrow pickup: along a line, takes back the litres of the input type via tipToGroundAroundLine, applies the type conversion and the yield of cut windrows (getCutWindrowHarvestFillLevel), activates useWindrow. Client side, deduces the state from the last known pickup.
---@param workArea any
---@param dt any
function Cutter:processPickupCutterArea(workArea, dt) end

--- Drops haulm on the area while cutting is active (last cut less than 150 ms ago, or valueDelay smoothing), clears tyre tracks.
---@param workArea any
---@param dt any
function Cutter:processHaulmDropArea(workArea, dt) end

--- Before processing: looks for the Combine, resets the accumulators and picks the list of crops to test, possibly restricted to the type required by the Combine.
---@param dt any
function Cutter:onStartWorkAreaProcessing(dt) end

--- Server side: converts areas to litres, applies the type conversion, keeps statistics per output type, calls Combine:addCutterArea, updates the statistics (hectares threshed), the AI crop requirement, the effect dirty flags and lastAreaBiggerZeroTime.
---@param dt any
---@param hasProcessed any
function Cutter:onEndWorkAreaProcessing(dt, hasProcessed) end

--- Table load: cutterLoad x (0.25 + 0.75 x speed / speed limit clamped to 0..1).
function Cutter:getCutterLoad() end

--- Wear factor due to stones according to the stone state read (1 by default).
function Cutter:getCutterStoneMultiplier() end

--- Loads the nodes, limits and raycasts of the table's automatic tilt.
---@param xmlFile table
---@param key string
---@param target any
---@return boolean
function Cutter:loadCutterTiltFromXML(xmlFile, key, target) end

--- Tells whether automatic tilt is available.
---@return boolean
function Cutter:getCutterTiltIsAvailable() end

--- Tells whether automatic tilt is active (conditions depend on the table state and settings).
---@param automaticTilt any
---@return boolean
---@return boolean
function Cutter:getCutterTiltIsActive(automaticTilt) end

--- Returns the computed tilt delta, an activity flag and a return-to-neutral flag.
---@return number
---@return boolean
---@return boolean
function Cutter:getCutterTiltDelta() end

--- Left raycast callback: stores the height of the detected ground for the tilt.
---@param hitObjectId any
---@param x any
---@param y any
---@param z any
---@param distance any
---@param nx any
---@param ny any
---@param nz any
---@param subShapeIndex any
---@param hitShapeId any
---@param isLast any
function Cutter:tiltRaycastDetectionCallbackLeft(hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, hitShapeId, isLast) end

--- Right raycast callback: same for the right side.
---@param hitObjectId any
---@param x any
---@param y any
---@param z any
---@param distance any
---@param nx any
---@param ny any
---@param nz any
---@param subShapeIndex any
---@param hitShapeId any
---@param isLast any
function Cutter:tiltRaycastDetectionCallbackRight(hitObjectId, x, y, z, distance, nx, ny, nz, subShapeIndex, hitShapeId, isLast) end

--- Stores the cut height and applies it to the attacher lowering ground distance (lowerDistanceToGround) of the cutter-type joints.
---@param cutHeight any
---@return number
function Cutter:setCutterCutHeight(cutHeight) end

--- Adds the #rotateIfTurnedOn option (false by default) to speed-rotating parts.
---@param superFunc any
---@param speedRotatingPart any
---@param xmlFile any
---@param key any
function Cutter:loadSpeedRotatingPartFromXML(superFunc, speedRotatingPart, xmlFile, key) end

--- With rotateIfTurnedOn, the part is only active if the cutter is turned on.
---@param superFunc any
---@param speedRotatingPart any
function Cutter:getIsSpeedRotatingPartActive(superFunc, speedRotatingPart) end

--- Loads the random movement option conditioned on cutting.
---@param superFunc any
---@param part any
---@param xmlFile any
---@param key any
function Cutter:loadRandomlyMovingPartFromXML(superFunc, part, xmlFile, key) end

--- With moveOnlyIfCut, activates the part only if the cutter has cut during the last 150 ms.
---@param superFunc any
---@param part any
function Cutter:getIsRandomlyMovingPartActive(superFunc, part) end

--- A CUTTER-type area is only active if the table is lowered (unless allowCuttingWhileRaised).
---@param superFunc any
---@param workArea any
function Cutter:getIsWorkAreaActive(superFunc, workArea) end

--- The speed limit also applies when the cutter is turned on and lowered.
---@param superFunc any
function Cutter:doCheckSpeedLimit(superFunc) end

--- Reads the chopper area index (chopperArea#index) of a work area.
---@param superFunc any
---@param workArea any
---@param xmlFile any
---@param key any
function Cutter:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- Adds the work dirt multiplier x (speed / limit) while isWorking.
---@param superFunc any
function Cutter:getDirtMultiplier(superFunc) end

--- Same principle for wear, multiplied by the stone factor.
---@param superFunc any
function Cutter:getWearMultiplier(superFunc) end

--- Refuses attachment to a Combine whose fill types are not compatible with the cutter's output.
---@param superFunc integer
---@param farmId integer
---@param attacherVehicle table
---@return boolean
---@return string
function Cutter:isAttachAllowed(superFunc, farmId, attacherVehicle) end

--- Adds the table load to the engine's consuming load.
---@param superFunc any
function Cutter:getConsumingLoad(superFunc) end

--- Adds the current cut height to the contact threshold of the ground reference nodes.
---@param superFunc any
---@param groundReferenceNode any
function Cutter:getIsGroundReferenceNodeThreshold(superFunc, groundReferenceNode) end

--- Returns true.
function Cutter:getDefaultAllowComponentMassReduction() end

--- Reads the #useFruitCutHeight option (true by default) of the attacher joints.
---@param superFunc table
---@param xmlFile any
---@param key any
---@param inputAttacherJoint any
---@param i any
function Cutter:loadInputAttacherJoint(superFunc, xmlFile, key, inputAttacherJoint, i) end

--- Returns the last valid input fruit for the extra objects that depend on the fruit.
---@param superFunc any
function Cutter:getFruitExtraObjectTypeData(superFunc) end

--- Client side, starts the animationNodes.
function Cutter:onTurnedOn() end

--- Client side, stops the animationNodes; in all cases resets the current fruits and fill types (input, output, AI).
function Cutter:onTurnedOff() end

--- When the AI starts, resets the crop requirements then requires the supported crops the Combine can receive.
function Cutter:onAIImplementStart() end

--- Forces for the AI: borders first, working the initial segment and corner cutting supported.
---@param fieldCourseSettings any
function Cutter:onAIFieldCourseSettingsInitialized(fieldCourseSettings) end

--- Default speed limit: 10.
function Cutter.getDefaultSpeedLimit() end

--- Adds to the debug display the priority output type, the cut height and the buffer distribution per fill type.
---@param values any
function Cutter:updateDebugValues(values) end
