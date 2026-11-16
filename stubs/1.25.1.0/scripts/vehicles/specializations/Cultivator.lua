---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Cultivator.lua (generated stub, FS25 Lua Atlas)

--- Specialization for soil-tillage tools (cultivator, disc harrow, power harrow, subsoiler, vineyard tools). NO effect, particle or animation of its own: the file only loads a work sound sample (client). The soil/dust that gets thrown up comes from WorkParticles (WorkParticles.lua:238: active if getDoGroundManipulation() is true and the tool is on a field; Cultivator does not override getDoGroundManipulation, so the default is true, WorkParticles.lua:311, regardless of this script's work state). WORK: processCultivatorArea erases tire tracks (also on a distant client), then, unless the client is farther than Cultivator.CLIENT_DM_UPDATE_RADIUS (constant not defined here: UNVERIFIED), calls, depending on useDeepMode, FSDensityMapUtil.updateCultivatorArea (cultivator mode) or updateDiscHarrowArea (harrow/disc mode), with the tool's angle, the limitToField and limitFruitDestructionToField options, then updateVineCultivatorArea; if isSubsoiler, also updateSubsoilerArea. The FSDensityMapUtil bodies are absent from the dump: exact consequences on the terrain UNVERIFIED. isWorking = speed > 0.5. Area CONDITIONS: active only 2000 ms after attaching and, by default, if the tool is lowered (onlyActiveWhenLowered); spec.isEnabled (true at initialization; nothing in this file modifies it) conditions the cultivation call. Note: updateCultivatorEnabledState and getIsCultivationEnabled are registered (Cultivator.lua:87-88) but no function of that name is defined in the dump, although onStateChange (line 504) and SowingMachine.lua:1208-1209 call them (definition possibly outside the dump, UNVERIFIED; possible runtime failure, not verified in game). Turning on is only tested for power harrows (isPowerHarrow: onStateChange propagates TURN_ON/TURN_OFF between tractor and attached tool, server side). WEATHER/MOISTURE: no data read. NETWORK: no variable or stream; areas are accumulated per pass (workAreaParameters) and sent to farm statistics server side only (cultivatedHectares, cultivatedTime). dt: only used for the cultivated time (dt/60000, in minutes) and the activation delay is measured in game time. The soiling and wear multipliers use spec.speedLimit, a field not defined in this file (other tools use self.speedLimit): if absent, the division would fail (not verified in game, UNVERIFIED). EXTENSION POINTS: registerFunctions functions (processCultivatorArea, processVineCultivatorArea, getCultivatorLimitToField, getUseCultivatorAIRequirements, updateCultivatorAIRequirements, updateCultivatorEnabledState, getIsCultivationEnabled); overrides doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML (type CULTIVATOR), getIsWorkAreaActive, loadWorkModeFromXML (#useDeepMode), getAIImplementUseVineSegment; events onLoad, onDelete, onPostAttach, onDeactivate, onStart/EndWorkAreaProcessing, onStateChange, onWorkModeChanged. For a tillage dust mod: the only data specific to this script that is useful for effects is spec.isWorking and the deep/flat mode; color and particles are handled elsewhere (WorkParticles). Default speed limit: 15.
---@class Cultivator
Cultivator = {}

--- Declares the cultivator area type and the XML schema (work sounds, the useDeepMode key of the work modes, options of the cultivator node). Not read key by key.
function Cultivator.initSpecialization() end

--- Requires the WorkArea specialization.
---@param specializations table
---@return boolean
function Cultivator.prerequisitesPresent(specializations) end

--- Registers processCultivatorArea, processVineCultivatorArea, getCultivatorLimitToField, getUseCultivatorAIRequirements, updateCultivatorAIRequirements, updateCultivatorEnabledState and getIsCultivationEnabled (the last two reference Cultivator.updateCultivatorEnabledState / getIsCultivationEnabled, which are defined nowhere in the dump: probably nil, UNVERIFIED).
---@param vehicleType any
function Cultivator.registerFunctions(vehicleType) end

--- Overrides doCheckSpeedLimit, getDirtMultiplier, getWearMultiplier, loadWorkAreaFromXML, getIsWorkAreaActive, loadWorkModeFromXML and getAIImplementUseVineSegment.
---@param vehicleType any
function Cultivator.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onPostAttach, onDeactivate, onStartWorkAreaProcessing, onEndWorkAreaProcessing, onStateChange and onWorkModeChanged (list not re-read line by line).
---@param vehicleType any
function Cultivator.registerEventListeners(vehicleType) end

--- Reads the direction node, onlyActiveWhenLowered (true), isSubsoiler, isPowerHarrow, useDeepMode (true); loads the work sound (client); initializes the activation delay (2000 ms), isEnabled, limitToField and the area accumulators; computes the AI requirements.
---@param savegame table
function Cultivator:onLoad(savegame) end

--- Frees the sound samples.
function Cultivator:onDelete() end

--- Erases tire tracks then, if enabled and not a distant client, works the soil in the density map (cultivator or harrow depending on useDeepMode, plus vine, plus subsoiler). Accumulates real/statistics/total areas, sets isWorking (speed > 0.5). Returns the real and total areas.
---@param workArea any
---@param dt any
function Cultivator:processCultivatorArea(workArea, dt) end

--- Variant for an area dedicated to vines: calls updateVineCultivatorArea if enabled and within the radius; always returns 0, 0.
---@param workArea any
---@param dt any
function Cultivator:processVineCultivatorArea(workArea, dt) end

--- Returns the limitToField option (true by default).
---@return boolean
function Cultivator:getCultivatorLimitToField() end

--- Returns true; override point to disable the AI requirements.
---@return boolean
function Cultivator:getUseCultivatorAIRequirements() end

--- Sets the ground types required by the AI (deep or flat), excluding rolled soils if a roller is attached, or clears them if a seeder is attached. Unrelated to effects.
function Cultivator:updateCultivatorAIRequirements() end

--- Applies the speed limit when the tool chain is lowered.
---@param superFunc any
---@return boolean
function Cultivator:doCheckSpeedLimit(superFunc) end

--- Adds the work soiling weighted by speed/limit when isWorking (see the note on spec.speedLimit in the module).
---@param superFunc any
---@return number
function Cultivator:getDirtMultiplier(superFunc) end

--- Adds the work wear weighted by speed/limit when isWorking (no stone factor here, unlike other tools).
---@param superFunc any
---@return number
function Cultivator:getWearMultiplier(superFunc) end

--- Forces the CULTIVATOR area type if the type read is DEFAULT.
---@param superFunc table
---@param workArea table
---@param xmlFile integer
---@param key string
---@return boolean
function Cultivator:loadWorkAreaFromXML(superFunc, workArea, xmlFile, key) end

--- For CULTIVATOR: inactive during the post-attach delay and, if required, as long as the tool is not lowered.
---@param superFunc any
---@param workArea any
function Cultivator:getIsWorkAreaActive(superFunc, workArea) end

--- Extends the loading of a work mode: reads #useDeepMode.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param workMode any
function Cultivator:loadWorkModeFromXML(superFunc, xmlFile, key, workMode) end

--- True if more than 1% of the vine segment's area is covered by the tool.
---@param superFunc any
---@param placeable any
---@param segment any
---@param segmentSide any
function Cultivator:getAIImplementUseVineSegment(superFunc, placeable, segment, segmentSide) end

--- Arms the 2000 ms activation delay.
---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
function Cultivator:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

--- Stops the work sound.
function Cultivator:onDeactivate() end

--- Before the pass: isWorking = false; computes limitToField (forced to true without the createFields permission), the density map angle from the direction node, and resets the areas to zero.
---@param dt any
function Cultivator:onStartWorkAreaProcessing(dt) end

--- Server: updates the statistics (cultivatedHectares, cultivatedTime) and the worked area. Client: starts/stops the sound according to isWorking. No visual effect.
---@param dt any
function Cultivator:onEndWorkAreaProcessing(dt) end

--- On attach, detach or AI line start: recomputes the AI requirements and the enabled state. For a power harrow, server: propagates turn on/off between the tool and its carrier or its attached tools.
---@param state any
---@param data any
function Cultivator:onStateChange(state, data) end

--- Adopts useDeepMode from the new work mode and recomputes the AI needs.
---@param workMode any
---@param oldWorkMode any
function Cultivator:onWorkModeChanged(workMode, oldWorkMode) end

--- Default speed limit: 15.
---@return number
function Cultivator.getDefaultSpeedLimit() end
