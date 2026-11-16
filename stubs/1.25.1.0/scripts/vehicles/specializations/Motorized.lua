---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Motorized.lua (generated stub, FS25 Lua Atlas)

--- Specialization for motorized vehicles (table spec_motorized). Prerequisites: FillUnit and VehicleSettings. It carries the simulation engine (VehicleMotor object, out of scope), the differentials, the gearboxes, the consumables (diesel, DEF, electricity, methane, air), the engine temperature, the sounds, the dashboards and the exhaust effects.
--- 
--- EXHAUST EFFECTS (client only: loadExhaustEffects is only called if self.isClient, Motorized.lua:410-412). Three mechanisms coexist. (1) exhaustParticleSystems: particle systems loaded by ParticleUtil.loadParticleSystem from vehicle.motorized.exhaustParticleSystems.exhaustParticleSystem(?), with minScale (0.5 by default) and maxScale (1). (2) exhaustEffects: a shared I3D mesh loaded asynchronously, which must expose the shader parameter "param" (otherwise ignored); on every client tick, onUpdateTick computes the plume tilt from the displacement of the emission point (a "trailing" effect due to the vehicle speed, not to the wind: there is no wind reading in this file), smooths it with a 0.95/0.05 factor, then sends through setShaderParameter the size (interpolated minRpmScale 0.25 / maxRpmScale 0.95 according to engine speed) and the colour "exhaustColor" (interpolated minRpmColor / maxRpmColor). (3) effects: a generic effect system (g_effectManager, effect classes ABSENT from the dump: behaviour UNVERIFIED) whose density is set to the RPM ratio. The exhaust flaps (exhaustFlap) are nodes rotated with a random noise of +/-0.1 on the RPM ratio.
--- 
--- ENGINE DATA FOR A MOD. getMotorRpmReal (modulated rpm), getMotorRpmPercentage (0..1), getMotorLoadPercentage (smoothed load, roughly -1 to 1; the raw value is spec.actualLoadPercentage, clamped 0..1, computed server side), getMotorState (MotorState.OFF / IGNITION / STARTING / ON). Network side: the server sends the client, in the update stream, the engine speed (11 bits), the load (7 bits) and the clutch; the client therefore rebuilds speed and load, hence correct exhaust effects in multiplayer. By contrast the engine temperature (spec_motorized.motorTemperature, 20 to 120 °C, fan between 85 and 95 °C) is only updated on the server (updateMotorTemperature called in the isServer block of onUpdateTick) and no network send appears in this file (the valueSend field is never used): note, the temperature read on a pure client therefore seems frozen at 20 °C (not verified in game). No code link between this temperature and the exhaust particles exists in this file.
--- 
--- DT AND TIME: onUpdate and onUpdateTick receive dt in ms; temperature and consumption are proportional to dt (heatingPerMS, coolingByWindPerMS, coolingPerMS). The exhaust plume smoothing (0.95/0.05) is per tick and not per dt: its speed therefore depends on the tick rate (note, not verified in game).
--- 
--- EXTENSION POINTS. Declared events (SpecializationUtil.registerEvent): onStartMotor, onStopMotor, onGearDirectionChanged, onGearChanged, onGearGroupChanged, onMotorBlowOffValveChanged, onClutchCreaking. Functions that can be overwritten with registerOverwrittenFunction (already overwritten here): getBrakeForce, addToPhysics, removeFromPhysics, getIsOperating, getDeactivateOnLeave, getDeactivateLightsOnLeave, loadDashboardGroupFromXML, getIsDashboardGroupActive, getIsActiveForInteriorLights, getIsActiveForWipers, getUsageCausesDamage, getName, getCanBeSelected, getIsPowered. To react to start/stop, listen to onStartMotor / onStopMotor (raised elsewhere, in setMotorState whose body is absent from the dump).
--- 
--- DUMP LIMIT: the functions setMotorState and getMotorState are registered (lines 281-282) but their definitions do not appear; lines 2012 to 2150 of the file are empty. Their behaviour is therefore UNVERIFIED here. The VehicleMotor table, MotorState, MotorSetTurnedOnEvent and g_effectManager are not in this file.
---@class Motorized
Motorized = {}

--- Declares the XML schemas of the specialization: engine paths, differentials, consumables, sounds, gearboxes, engine configurations, exhaust effects (exhaustParticleSystems, exhaustEffects, exhaustFlap, effects), dashboards and store values. Reserved for vehicle type initialisation.
function Motorized.initSpecialization() end

--- Registers in the XML schema the keys of an engine configuration (speeds, max speeds, torque, braking, curves, etc.). Not read line by line.
---@param schema any
---@param baseKey any
function Motorized.registerMotorXMLPaths(schema, baseKey) end

--- Registers the XML keys of the differentials (indices, torque ratio, max speed ratio).
---@param schema any
---@param baseKey any
function Motorized.registerDifferentialXMLPaths(schema, baseKey) end

--- Registers the XML keys of a consumable (fill type, usage, capacity, refill for air).
---@param schema any
---@param baseKey any
function Motorized.registerConsumerXMLPaths(schema, baseKey) end

--- Registers the XML keys of the engine, gearbox, air compressor, clutch, blow-off valve, reverse sounds, etc.
---@param schema any
---@param baseKey any
function Motorized.registerSoundXMLPaths(schema, baseKey) end

--- Requires the FillUnit and VehicleSettings specializations on the vehicle type.
---@param specializations any
function Motorized.prerequisitesPresent(specializations) end

--- Declares the events onStartMotor, onStopMotor, onGearDirectionChanged, onGearChanged, onGearGroupChanged, onMotorBlowOffValveChanged and onClutchCreaking, which other specializations or mods can listen to.
---@param vehicleType any
function Motorized.registerEvents(vehicleType) end

--- Registers the vehicle's public functions (loading, engine getters, rpm, load, temperature, gearbox, start/stop). Note: setMotorState and getMotorState are listed there but their definitions are absent from the dump.
---@param vehicleType any
function Motorized.registerFunctions(vehicleType) end

--- Overrides fourteen base vehicle functions (brake, physics, operating state, dashboard, wipers, interior lighting, wear, name, selection, power supply).
---@param vehicleType any
function Motorized.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to vehicle events: lifecycle (onLoad, onPostLoad, onDelete), network streams, onUpdate / onUpdateTick, onStateChange (entering/leaving the vehicle), tank levels, breakdown (onSetBroken), AI, gearbox settings and the gearbox's own events.
---@param vehicleType any
function Motorized.registerEventListeners(vehicleType) end

--- Vehicle loading: reads differentials, engine, sounds, consumables, then, client side only, the exhaust effects. Initialises the engine state (stopped), the start duration (motorStartDuration), the braking parameters, the gear levers, and the engine temperature structure (20 °C initial, 120 °C max, heating 1.5 °C/s at full load, wind cooling 1 °C/s, fan 85/95 °C, 3 °C/s).
---@param savegame table
function Motorized:onLoad(savegame) end

--- Server side: refills consumables under 10 % of capacity, charging the cost to the player (litre price multiplied by 2). Builds the list of tanks required to run (diesel, DEF, electricity, methane) then finishes loading the engine.
---@param savegame any
function Motorized:onPostLoad(savegame) end

--- Registers the dashboard values: engine speed (rpm), load (load, as a percentage), speed, consumption, engine temperature and temperature warning, clutch, gear, group, etc. Useful to know which engine quantities are already exposed and their ranges.
function Motorized:onRegisterDashboardValueTypes() end

--- Releases the engine, the shared I3D files of the exhaust effects, the exhaust particle systems (ParticleUtil.deleteParticleSystems), the sounds, the animations and the effect system (g_effectManager:deleteEffects).
function Motorized:onDelete() end

--- Network read on connection: receives the initial engine state and applies it through setMotorState without sending back.
---@param streamId any
---@param connection any
function Motorized:onReadStream(streamId, connection) end

--- Network write on connection: sends the current engine state.
---@param streamId any
---@param connection any
function Motorized:onWriteStream(streamId, connection) end

--- Reads the update stream. Client side (stream coming from the server): equalised engine speed on 11 bits, raw load on 7 bits, compressor state and clutch position on 5 bits, then gearbox data. Server side (stream coming from a client): clutch state only.
---@param streamId any
---@param timestamp any
---@param connection any
function Motorized:onReadUpdateStream(streamId, timestamp, connection) end

--- Writes the update stream, symmetric to the read. The server writes speed, load, compressor, clutch (only if the engine is running or starting) and, if the dirty flag is raised, the gearbox data. Note: the engine temperature is not sent.
---@param streamId any
---@param connection any
---@param dirtyMask any
function Motorized:onWriteUpdateStream(streamId, connection, dirtyMask) end

--- Every frame, if the engine is starting or running: switches to ON after motorStartTime (server), updates the engine (spec.motor:update(dt)), the raw load (server) and the smoothed load (all), updates consumables and engine properties according to damage (server), and client side the sound parameters (normalised speed and load), compressor, brakes, reverse beeper and gear levers animated with dt. Also accumulates the distance travelled for statistics (server).
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Motorized:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Simulation tick. Server: automatic engine shutdown if no player or occupied vehicle within 250 m (when automatic start is disabled), call to updateMotorTemperature, automatic start/stop logic. Client, engine running: scales the emission and lifetime of the exhaust particles from the RPM ratio, animates the exhaust flaps, sets the density of the effect system, orients and colours the exhaust meshes via shader (see module), then handles the consumption display, the clutch sounds and the ignition lock. Note: for the particles, the code reads minScale/maxScale on the spec.exhaustParticleSystems list and calls ParticleUtil.setEmitCountScale with that list rather than with the current system, whereas minScale/maxScale are stored per system (lines 1216-1219, loadExhaustEffects:1721-1722); apparent defect, real effect UNVERIFIED in game and the body of ParticleUtil is absent from the dump.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Motorized:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Loads the differentials of the chosen configuration (axle or wheel indices, torque ratio and max speed ratio) for later addition to the physics. Not read in detail.
---@param xmlFile XMLFile
---@param configDifferentialIndex integer
function Motorized:loadDifferentials(xmlFile, configDifferentialIndex) end

--- Loads the chosen engine configuration: name, type, consumables, min/max speeds, speeds, acceleration, braking, torque/power curves, gearbox, groups, ratios and damping, with fallback to configuration 0. Instantiates the VehicleMotor. Not read in detail (outside the priority angle).
---@param xmlFile XMLFile
---@param motorId integer
function Motorized:loadMotor(xmlFile, motorId) end

--- Loads a series of gearbox ratios from the XML (ratios, max/min ratios, speeds), taking the max engine speed and the axle ratio into account. Not read in detail.
---@param xmlFile any
---@param gearName any
---@param key any
---@param motorMaxRpm any
---@param axleRatio any
---@param direction any
function Motorized:loadGears(xmlFile, gearName, key, motorMaxRpm, axleRatio, direction) end

--- Loads the gearbox's gear groups (ranges) from the XML. Not read in detail.
---@param xmlFile any
---@param key any
---@param motorMaxRpm any
---@param axleRatio any
function Motorized:loadGearGroups(xmlFile, key, motorMaxRpm, axleRatio) end

--- Loads, client side, the three families of exhaust effects: particle systems (with minScale/maxScale), flaps (exhaustFlap: node, max rotation, axis), shared I3D exhaust meshes (loaded asynchronously, onExhaustEffectI3DLoaded callback) and generic effects via g_effectManager (unknown fill type). Keeps spec.exhaustEffectMaxSteeringSpeed = 0.001, which is not used elsewhere in this file.
---@param xmlFile XMLFile
function Motorized:loadExhaustEffects(xmlFile) end

--- Loading callback of an exhaust mesh: takes the first child of the I3D, keeps it only if it has the shader parameter "param", links it to the vehicle's anchor node, hides it (visibility false at start) and reads minRpmColor, maxRpmColor, minRpmScale, maxRpmScale and upFactor (schema defaults: colour defaults: black for min, a dark bluish tone with alpha 2.0 for max; scales 0.25 and 0.95; upFactor 0.75). Note: the node is hidden here and the place where it is made visible is not in this file (not verified).
---@param i3dNode any
---@param failedReason any
---@param args any
function Motorized:onExhaustEffectI3DLoaded(i3dNode, failedReason, args) end

--- Loads the sound samples for engine, gearbox, air compressor, blow-off valve, brakes, reverse, and the sound synthesis parameters. Not read in detail.
---@param xmlFile XMLFile
---@param baseString any
function Motorized:loadSounds(xmlFile, baseString) end

--- Loads the consumable configuration (key consumerConfiguration): list of consumables with fill type, usage, permanent consumption, air refill, and index by name and by type.
---@param xmlFile any
---@param consumerIndex any
function Motorized:loadConsumerConfiguration(xmlFile, consumerIndex) end

--- True only if the engine state is ON (not during STARTING).
---@return boolean
function Motorized:getIsMotorStarted() end

--- Asks the VehicleMotor whether the gearbox is in neutral.
---@return boolean
function Motorized:getIsMotorInNeutral() end

--- False if a required tank is empty or if the VehicleMotor refuses to run (clutch not engaged, for example).
function Motorized:getCanMotorRun() end

--- Tells whether the engine must stop when leaving the vehicle: configuration option and no external power request (getRequiresPower).
function Motorized:getStopMotorOnLeave() end

--- Returns the warning text to display (empty tank or clutch not engaged), otherwise nil.
function Motorized:getMotorNotAllowedWarning() end

--- If the engine is OFF or IGNITION: sends MotorSetTurnedOnEvent(true) unless noEventSend, then switches to STARTING.
---@param noEventSend boolean
function Motorized:startMotor(noEventSend) end

--- If the engine is ON or STARTING: sends MotorSetTurnedOnEvent(false) unless noEventSend, then switches to OFF.
---@param noEventSend boolean
function Motorized:stopMotor(noEventSend) end

--- Server only. Computes a consumption factor from engine speed, smoothed load, the savegame consumption setting (low 1.0, medium 1.5, high 2.5) and damage, removes fuel (stat "fuelUsage", automatic repurchase for the AI if the option is active), exposes the hourly consumption (spec.lastFuelUsage) and handles the brakes' air consumption and refill.
---@param dt any
---@param accInput any
function Motorized:updateConsumers(dt, accInput) end

--- Server only. Heating proportional to dt, modulated by raw load and engine speed; wind cooling proportional to the square of min(1, speed/30); a fan that switches on above 95 °C and off below 85 °C. Temperature clamped between 20 and 120 °C. Only called while the engine is starting or running: no decay at standstill is coded here (a switched-off engine does not cool, according to this file).
---@param dt any
function Motorized:updateMotorTemperature(dt) end

--- Server: raises the gearbox network flag. Client: updates the dashboard values "gear" and "gearIndex".
---@param direction any
function Motorized:onGearDirectionChanged(direction) end

--- Animates the gear levers toward the target gear and updates sounds and dashboard client side. Not read in detail.
---@param gear any
---@param targetGear any
---@param changeTime any
---@param previousGear any
function Motorized:onGearChanged(gear, targetGear, changeTime, previousGear) end

--- Equivalent of onGearChanged for gear groups. Not read in detail.
---@param targetGroup any
---@param changeTime any
function Motorized:onGearGroupChanged(targetGroup, changeTime) end

--- Plays or stops the blow-off valve (turbo) sound according to the state passed by the engine; stores that state.
---@param blowOffValveState any
function Motorized:onMotorBlowOffValveChanged(blowOffValveState) end

--- Handles clutch creaking: sound, warning and lever animation toward the neutral position. Not read in detail.
---@param isEvent any
---@param groupTransmission any
---@param gearIndex any
---@param groupIndex any
function Motorized:onClutchCreaking(isEvent, groupTransmission, gearIndex, groupIndex) end

--- In manual reverser mode, sends a MotorGearShiftEvent of direction-change type to the server.
function Motorized:onReverseDirectionChanged() end

--- Applies the game settings (direction change mode, gearbox mode) to the engine; the gearbox mode is ignored for an AI-driven vehicle.
---@param gameSettingId any
---@param state any
function Motorized:onVehicleSettingChanged(gameSettingId, state) end

--- Starts the engine without a network event and forces the gearbox to automatic mode for the AI.
---@param job any
function Motorized:onAIJobStarted(job) end

--- Stops the engine without a network event if nobody is in the vehicle, then restores the chosen gearbox mode.
---@param job any
function Motorized:onAIJobFinished(job) end

--- Returns the VehicleMotor object.
function Motorized:getMotor() end

--- Returns the instant (game time in ms) at which the engine will switch from STARTING to ON.
function Motorized:getMotorStartTime() end

--- Returns the engine type read from the XML (#type of the configuration).
function Motorized:getMotorType() end

--- Engine speed normalised from 0 to 1 between min and max rpm, based on the engine's modulated speed.
function Motorized:getMotorRpmPercentage() end

--- Current modulated engine speed in rpm (the engine's getLastModulatedMotorRpm).
function Motorized:getMotorRpmReal() end

--- Smoothed engine load (spec.smoothedLoadPercentage), computed on every onUpdate on all peers.
function Motorized:getMotorLoadPercentage() end

--- Duration in seconds of the last braking, used for the compressed-air sound, 0 s if there is no matching sample.
function Motorized:getMotorBrakeTime() end

--- Returns the stored blow-off valve state.
function Motorized:getMotorBlowOffValveState() end

--- Differential speed in km/h (absolute value), used by a sound modifier; logs an error if the vehicle is not motorized.
function Motorized:getMotorDifferentialSpeed() end

--- Returns the fill unit index of the consumable for a given fill type (nil if absent).
---@param fillTypeIndex any
function Motorized:getConsumerFillUnitIndex(fillTypeIndex) end

--- Returns the usage field of the AIR consumable, or 0 if it does not exist (unit: litres per second, from the usage in updateConsumers; not verified in game).
function Motorized:getAirConsumerUsage() end

--- Override: takes the maximum between the vehicle's brake force and the engine's; if maxBrakeForceMass is defined, interpolates between min and max force according to total mass.
---@param superFunc any
function Motorized:getBrakeForce(superFunc) end

--- Override: additionally reads the dashboard group attributes isMotorStarting, isMotorRunning, electronicsStarting, electronicsStartingTime (2 by default) and electronicsRunning.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param group any
function Motorized:loadDashboardGroupFromXML(superFunc, xmlFile, key, group) end

--- Override: activates or not a dashboard group according to the engine state and the electronics switch-on instant.
---@param superFunc any
---@param group any
function Motorized:getIsDashboardGroupActive(superFunc, group) end

--- Override: the interior lighting is active as soon as the engine is in IGNITION, STARTING or ON.
---@param superFunc any
function Motorized:getIsActiveForInteriorLights(superFunc) end

--- Override: wipers inactive when the engine is OFF.
---@param superFunc any
function Motorized:getIsActiveForWipers(superFunc) end

--- Override: no wear if the engine is neither running nor starting.
---@param superFunc any
function Motorized:getUsageCausesDamage(superFunc) end

--- Override: after the base addition, server side, declares each differential to the engine's physics, updates the engine properties and resets the controls.
---@param superFunc any
---@return boolean
function Motorized:addToPhysics(superFunc) end

--- Override: server side, removes all differentials before the base removal.
---@param superFunc any
function Motorized:removeFromPhysics(superFunc) end

--- Sends to the physics engine (setMotorProperties) the min/max speeds in rad/s, the inertia, the damping and the torque curves of the Lua simulation.
function Motorized:updateMotorProperties() end

--- Passes to the physics (controlVehicle) pedal, max speed, acceleration, speed bounds, ratios and clutch torque; wakes the sleeping physics object if one of the parameters changed.
---@param acceleratorPedal any
---@param maxSpeed any
---@param maxAcceleration any
---@param minMotorRotSpeed any
---@param maxMotorRotSpeed any
---@param maxMotorRotAcceleration any
---@param minGearRatio any
---@param maxGearRatio any
---@param maxClutchTorque any
---@param neededPtoTorque any
function Motorized:controlVehicle(acceleratorPedal, maxSpeed, maxAcceleration, minMotorRotSpeed, maxMotorRotSpeed, maxMotorRotAcceleration, minGearRatio, maxGearRatio, maxClutchTorque, neededPtoTorque) end

--- Override: a motorized vehicle is considered operating if the engine is ON, in addition to the base result.
---@param superFunc any
---@return boolean
function Motorized:getIsOperating(superFunc) end

--- Override: deactivation on leaving only if automatic start is active.
---@param superFunc any
---@return boolean
function Motorized:getDeactivateOnLeave(superFunc) end

--- Override: returns the base result only if automatic start is active and the vehicle has no power request (getRequiresPower); otherwise false.
---@param superFunc any
---@return boolean
function Motorized:getDeactivateLightsOnLeave(superFunc) end

--- Registers the input actions (engine start, gear change, group, direction, clutch) for the active vehicle.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Motorized:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback: shifts one gear up or down (manual gearbox).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventShiftGear(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: direct selection of a gear.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventSelectGear(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: changes gear group.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventShiftGroup(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: direct selection of a group.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventSelectGroup(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: reverses the direction of travel.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventDirectionChange(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: clutch pedal (analogue).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventClutch(self, actionName, inputValue, callbackState, isAnalog) end

--- Updates the activity and text of the input actions according to the engine state and gearbox mode.
---@param self any
function Motorized.updateActionEvents(self) end

--- Tells whether the distance travelled must be counted in the farm statistics.
function Motorized:getTraveledDistanceStatsActive() end

--- Starts the gear lever animation toward a gear and/or group over the given duration.
---@param gear any
---@param group any
---@param time any
---@param isResetPosition any
function Motorized:setGearLeversState(gear, group, time, isResetPosition) end

--- Builds the sequence of rotation interpolations of a gear lever toward a target state.
---@param gearLever any
---@param state any
---@param time any
---@param isResetPosition any
function Motorized:generateShiftAnimation(gearLever, state, time, isResetPosition) end

--- Returns the gear text, the group and the direction to show in the interface.
---@return string
---@return string
function Motorized:getGearInfoToDisplay() end

--- Changes the gearbox travel direction (forward/reverse).
---@param direction integer
function Motorized:setTransmissionDirection(direction) end

--- Returns the direction change mode (automatic or manual).
---@return directionChangeMode
function Motorized:getDirectionChangeMode() end

--- Tells whether manual reversing is allowed.
---@return boolean
function Motorized:getIsManualDirectionChangeAllowed() end

--- Tells whether manual reversing is in force.
---@return boolean
function Motorized:getIsManualDirectionChangeActive() end

--- Returns the gear shift mode (automatic, manual).
---@return gearShiftMode
function Motorized:getGearShiftMode() end

--- Entering the vehicle: starts the engine if automatic start is active and no ignition lock is used. Leaving: stops the engine if required, then immobilises the vehicle (stopVehicle).
---@param state any
---@param vehicle any
---@param isControlling any
function Motorized:onStateChange(state, vehicle, isControlling) end

--- Server: sends null commands to the physics (pedal 0, speed 0).
function Motorized:stopVehicle() end

--- When diesel is added, refills the DEF tank proportionally if it exists.
---@param fillUnitIndex any
---@param fillLevelDelta any
---@param fillType any
---@param toolType any
---@param fillPositionData any
---@param appliedDelta any
function Motorized:onFillUnitFillLevelChanged(fillUnitIndex, fillLevelDelta, fillType, toolType, fillPositionData, appliedDelta) end

--- Stops the engine without a network event when the vehicle is declared broken.
function Motorized:onSetBroken() end

--- Override: returns the name tied to the engine configuration (vehicleName) if defined, otherwise the base name.
---@param superFunc any
function Motorized:getName(superFunc) end

--- Override: if automatic start is disabled, a vehicle is selectable as soon as a motorized vehicle exists in the attached chain (so that engine can be switched on or off); otherwise base result.
---@param superFunc any
function Motorized:getCanBeSelected(superFunc) end

--- Override: an implement is powered if this vehicle or another vehicle of the attached chain has an engine in STARTING/ON; otherwise returns the matching warning.
---@param superFunc any
function Motorized:getIsPowered(superFunc) end

--- Tries to start each engine able to run in the chain of attached vehicles.
---@param vehicle table
function Motorized.tryStartMotor(vehicle) end

--- Input callback: starts or stops the engine (toggle).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventToggleMotorState(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: turns the ignition on (IGNITION) without starting.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventSetMotorStateIgnition(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: starts the engine.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventSetMotorStateOn(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: stops the engine.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Motorized.actionEventSetMotorStateOff(self, actionName, inputValue, callbackState, isAnalog) end

--- Reads the store fuel data (type, capacity) from the vehicle XML. Not read in detail.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Motorized.loadSpecValueFuel(xmlFile, customEnvironment, baseDir) end

--- Store specification value: diesel.
---@param storeItem any
---@param realItem any
---@param configurations any
function Motorized.getSpecValueFuelDiesel(storeItem, realItem, configurations) end

--- Store specification value: electric charge.
---@param storeItem any
---@param realItem any
---@param configurations any
function Motorized.getSpecValueFuelElectricCharge(storeItem, realItem, configurations) end

--- Store specification value: methane.
---@param storeItem any
---@param realItem any
---@param configurations any
function Motorized.getSpecValueFuelMethane(storeItem, realItem, configurations) end

--- Computes the fuel text/value for the store according to the requested fill type.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param fillTypeFilter any
---@param returnValue any
function Motorized.getSpecValueFuel(storeItem, realItem, configurations, fillTypeFilter, returnValue) end

--- Reads the store max speed from the XML. Not read in detail.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Motorized.loadSpecValueMaxSpeed(xmlFile, customEnvironment, baseDir) end

--- Computes the max speed for the store according to the configuration (bounds or value).
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Motorized.getSpecValueMaxSpeed(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

--- Reads the power given in vehicle.storeData.specs.power.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Motorized.loadSpecValuePower(xmlFile, customEnvironment, baseDir) end

--- Computes the min/max power for the store according to the chosen engine configuration.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Motorized.getSpecValuePower(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end

--- Reads the store's transmission information. Not read in detail.
---@param xmlFile any
---@param customEnvironment any
---@param baseDir any
function Motorized.loadSpecValueTransmission(xmlFile, customEnvironment, baseDir) end

--- Computes the transmission text for the store. Not read in detail.
---@param storeItem any
---@param realItem any
---@param configurations any
---@param saleItem any
---@param returnValues any
---@param returnRange any
function Motorized.getSpecValueTransmission(storeItem, realItem, configurations, saleItem, returnValues, returnRange) end
