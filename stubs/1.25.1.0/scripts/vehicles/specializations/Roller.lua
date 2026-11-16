---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Roller.lua (generated stub, FS25 Lua Atlas)

--- Roller specialization (soil and grass rollers). No effects or particles of its own: the file loads neither EffectManager nor animationNodes; only a work sound sample (vehicle.roller.sounds.work) is handled client side. Any dust/soil from a roller therefore comes from other specializations (WorkParticles, via getDoGroundManipulation, see below). WORK: processRollerArea first erases tire tracks (eraseTireTrack, including on a distant client), then, except on a client farther than Roller.CLIENT_DM_UPDATE_RADIUS (constant not defined in this file: value UNVERIFIED), calls updateGrassRollerArea (grass roller) and/or updateRollerArea (soil roller, with the tool direction angle converted to a density map angle). Since the FSDensityMapUtil functions have no body in the dump, their exact effect on the terrain is UNVERIFIED. CONDITIONS: the area is active only if the tool is lowered (onlyActiveWhenLowered, true by default) and 2000 ms have passed since attaching (startActivationTimeout); spec.isWorking = speed > 0.5 (unit of getLastSpeed: km/h per vanilla usage, not re-read in Vehicle). getDoGroundManipulation (override) returns true only if isWorking: it is the switch that WorkParticles.lua:238 checks together with isOnField to enable its ground particles (WorkParticles.getDoGroundManipulation returns true by default, WorkParticles.lua:311). WEATHER/MOISTURE: no data read. NETWORK: no synchronized variable; the dirtyFlag is allocated but never raised in this file. dt: unused outside the signature. EXTENSION POINTS: registered functions processRollerArea, updateRollerAIRequirements; overrides doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier, getIsWorkAreaActive; events onLoad, onDelete, onPostAttach, onDeactivate, onStartWorkAreaProcessing, onEndWorkAreaProcessing. Work area type: roller. Default speed limit: 15.
---@class Roller
Roller = {}

--- Declares the "roller" configuration (design choice) and the roller work area type (3 booleans of addWorkAreaType, meaning not re-read), then registers the XML schema under vehicle.roller and under each rollerConfiguration.
function Roller.initSpecialization() end

--- Registers the XML keys of a roller: directionNode, onlyActiveWhenLowered (true), isSoilRoller (true), isGrassRoller (false), usingAIRequirements (true) and the work sounds.
---@param schema any
---@param basePath any
function Roller.registerRollerXMLPaths(schema, basePath) end

--- Requires the WorkArea specialization.
---@param specializations any
function Roller.prerequisitesPresent(specializations) end

--- Registers processRollerArea and updateRollerAIRequirements on the vehicle type.
---@param vehicleType any
function Roller.registerFunctions(vehicleType) end

--- Overrides doCheckSpeedLimit, getDoGroundManipulation, getDirtMultiplier, getWearMultiplier and getIsWorkAreaActive.
---@param vehicleType any
function Roller.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to onLoad, onDelete, onPostAttach, onDeactivate, onStartWorkAreaProcessing and onEndWorkAreaProcessing.
---@param vehicleType any
function Roller.registerEventListeners(vehicleType) end

--- Reads the roller configuration (or vehicle.roller as fallback), the direction node, the soil/grass modes (soil by default if nothing is given), the onlyActiveWhenLowered option, loads the work sound client side, sets the activation delay (2000 ms) and initializes the AI requirements.
---@param savegame any
function Roller:onLoad(savegame) end

--- Frees the sound samples. Note: if no sound was loaded (dedicated server), spec.samples is nil; the behaviour of deleteSamples on nil is not verified (not verified in game).
function Roller:onDelete() end

--- Erases the tire tracks of the area, then (except on a distant client) applies the roller to the density map: grass and/or soil with the tool angle. Sets spec.isWorking to true if speed > 0.5. Returns the area actually processed (may be nil if neither soil nor grass mode is active: case not re-read).
---@param workArea any
---@param dt any
function Roller:processRollerArea(workArea, dt) end

--- Declares to the AI the required ground types and the forbidden crops depending on the mode (soil/grass); ignored if the roller is combined with a sowing machine that uses the AI requirements. Unrelated to effects.
function Roller:updateRollerAIRequirements() end

--- Applies the vehicle speed limit also while the roller is working (isWorking), in addition to the parent logic.
---@param superFunc any
function Roller:doCheckSpeedLimit(superFunc) end

--- Returns true only if the roller is working (isWorking); used by WorkParticles to allow ground particles. No crop or weather condition.
---@param superFunc any
function Roller:getDoGroundManipulation(superFunc) end

--- Adds the work dirt multiplier when isWorking (not proportional to speed, unlike some other tools).
---@param superFunc any
function Roller:getDirtMultiplier(superFunc) end

--- Adds the work wear multiplier when isWorking.
---@param superFunc any
---@return number
function Roller:getWearMultiplier(superFunc) end

--- For the ROLLER area: inactive during the post-attach delay, or if the tool must be lowered and is not; otherwise delegates to the parent.
---@param superFunc any
---@param workArea any
function Roller:getIsWorkAreaActive(superFunc, workArea) end

--- Before each processing pass: computes the density map angle from the tool direction and resets isWorking to false.
---@param dt any
function Roller:onStartWorkAreaProcessing(dt) end

--- Client side: starts or stops the work sound depending on isWorking. No visual effect.
---@param dt any
---@param hasProcessed any
function Roller:onEndWorkAreaProcessing(dt, hasProcessed) end

--- Arms the 2000 ms activation delay after attaching.
---@param attacherVehicle table
---@param inputJointDescIndex integer
---@param jointDescIndex integer
function Roller:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

--- Stops the work sound.
function Roller:onDeactivate() end

--- Default speed limit: 15.
function Roller.getDefaultSpeedLimit() end
