---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Weeder.lua (generated stub, FS25 Lua Atlas)

--- Specialization for weeders / tine harrows (weed control), with a hoeing option (isHoe) and a grassland option (isGrasslandWeeder). No EffectManager effects are loaded; the visual originality is the colouring of ground particles: for each ground particle mapping declared with adjustColor (XML key on the WorkParticles node), onUpdateTick recolours the shader of that particle system. WORK: processWeederArea (server, or client at a distance <= Weeder.CLIENT_DM_UPDATE_RADIUS, a constant not defined here: UNVERIFIED) calls FSDensityMapUtil.updateWeederArea (weed map; body absent from the dump, UNVERIFIED) and, in grassland mode, updateGrassRollerArea; isWorking = speed > 0.5. getStoneArea is read for wear (stones). AREA CONDITIONS: getIsWorkAreaActive requires ground contact of the reference node (if requiresGroundContact) and, if disableBackwards, movingDirection > 0; the lowered state is not tested here (the speed limit follows getIsImplementChainLowered). Note: startActivationTime is armed on attach (2000 ms) but is never consulted in this file (not verified in game: possibly no effect). COLOURING (onUpdateTick, client and server, while isWorking): the base colour is read at the node's world position: on a field, getFieldGroundTyreTrackColor(densityBits) of the fieldGroundSystem (tyre track colour of the ground type), otherwise getTerrainAttributesAtWorldPos (terrain attribute colour); a smoothed transition over 1 s (alpha += dt/1000, vector3ArrayLerp interpolation) then setShaderParameter psColor (final alpha 1). The psColor parameter of the particle shader cannot be verified in the dump. Note: the condition that restarts a transition (lines 144-147) compares components with a logical AND of differences, which only triggers when all three channels change at once (not verified in game). WEATHER/WETNESS: no data read; the ground colour comes from the terrain maps, so it is indirectly tied to what they encode (not re-read). NETWORK: no stream or dirtyFlag; the colouring and the isWorking state are recomputed locally by each client. dt: used for the colour transition (seconds = dt/1000). EXTENSION POINTS: functions processWeederArea, updateWeederAIRequirements; overrides doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML (type WEEDER), getIsWorkAreaActive, loadGroundParticleMapping (adds adjustColor). The ground particles themselves are loaded/driven by WorkParticles (WorkParticles.lua:238: active if getDoGroundManipulation() and on a field; Weeder does not override getDoGroundManipulation, so the default true of WorkParticles.lua:311 applies). Default speed limit: 15.
---@class Weeder
Weeder = {}

--- Declares the weeder work area type, the XML schema (work sounds, vehicle.weeder#isHoe, #isGrasslandWeeder) and adds the adjustColor key to WorkParticles' mapping table.
function Weeder.initSpecialization() end

--- Requires WorkArea and AttacherJoints.
---@param specializations table
---@return boolean
function Weeder.prerequisitesPresent(specializations) end

--- Registers processWeederArea and updateWeederAIRequirements.
---@param vehicleType any
function Weeder.registerFunctions(vehicleType) end

--- Overrides doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getIsWorkAreaActive and loadGroundParticleMapping.
---@param vehicleType any
function Weeder.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onUpdateTick, onDeactivate, onPostAttach, onStartWorkAreaProcessing, onEndWorkAreaProcessing and onStateChange.
---@param vehicleType any
function Weeder.registerEventListeners(vehicleType) end

--- Loads the sounds (client), reads isHoe and isGrasslandWeeder, initialises the surface accumulators, the activation delay and the stone-related wear multiplier data (WEEDER type of the stoneSystem), then the AI requirements.
---@param savegame table
function Weeder:onLoad(savegame) end

--- Releases the work sounds if they exist.
function Weeder:onDelete() end

--- If the tool is working and has colour-adjustable particles: re-reads the ground colour under each node (tyre track colour on a field, terrain attribute otherwise), blends over 1 s and sends it to the psColor shader parameter of the particle system. Runs on any participant that has these particles (client or host). No weather reading.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Weeder:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Applies weeding (and the grassland roller if isGrasslandWeeder) to the density map, accumulates areas, sets isWorking (speed > 0.5) and reads stone presence if the tool is working. Returns the area twice (actual and total identical).
---@param workArea any
---@param dt any
function Weeder:processWeederArea(workArea, dt) end

--- Declares to the AI the targeted weed states (via weedSystem:getWeederReplacements) unless a seeder is attached; unrelated to effects. End of function (lines 230-240) not re-read.
function Weeder:updateWeederAIRequirements() end

--- Forces the WEEDER area type when the type read is DEFAULT.
---@param superFunc table
---@param workArea table
---@param xmlFile integer
---@param key string
---@return boolean
function Weeder:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- For WEEDER: active if ground contact (when required) and, where relevant, forward motion only; looks at neither ignition nor the post-attach delay.
---@param superFunc table
---@param workArea table
---@return boolean
function Weeder:getIsWorkAreaActive(superFunc, workArea) end

--- Applies the speed limit as soon as the implement chain is lowered.
---@param superFunc any
---@return boolean
function Weeder:doCheckSpeedLimit(superFunc) end

--- Adds the work dirt, weighted by speed / speed limit, when isWorking.
---@param superFunc any
---@return number
function Weeder:getDirtMultiplier(superFunc) end

--- Adds the work wear, weighted by speed / limit and by the stone multiplier (spec.stoneLastState).
---@param superFunc any
---@return number
function Weeder:getWearMultiplier(superFunc) end

--- Extends the loading of a ground particle mapping: reads adjustColor and, if true, registers the mapping in spec.colorParticleSystems with a colour buffer.
---@param superFunc XMLFile
---@param xmlFile XMLFile
---@param key string
---@param mapping table
---@param index integer
---@param i3dNode integer
---@return boolean
function Weeder:loadGroundParticleMapping(superFunc, xmlFile, key, mapping, index, i3dNode) end

--- Resets isWorking and the areas before the pass.
---@param dt any
function Weeder:onStartWorkAreaProcessing(dt) end

--- Server: declares the worked area (updateLastWorkedArea). Client: starts/stops the work sound according to isWorking.
---@param dt any
---@param hasProcessed any
function Weeder:onEndWorkAreaProcessing(dt, hasProcessed) end

--- On attach or detach, recomputes the AI requirements.
---@param state any
---@param data any
function Weeder:onStateChange(state, data) end

--- Stops the work sound.
function Weeder:onDeactivate() end

--- Arms startActivationTime (2000 ms), a value not consulted elsewhere in this file.
---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
function Weeder:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

--- Default speed limit: 15.
---@return number
function Weeder.getDefaultSpeedLimit() end
