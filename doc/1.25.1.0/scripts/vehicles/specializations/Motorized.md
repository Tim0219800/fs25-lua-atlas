# vehicles/specializations/Motorized.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Motorized.md)*

Source: `dataS/scripts/vehicles/specializations/Motorized.lua` — FS25 1.25.1.0

✍ Specialization for motorized vehicles (table spec_motorized). Prerequisites: FillUnit and VehicleSettings. It carries the simulation engine (VehicleMotor object, out of scope), the differentials, the gearboxes, the consumables (diesel, DEF, electricity, methane, air), the engine temperature, the sounds, the dashboards and the exhaust effects.

EXHAUST EFFECTS (client only: loadExhaustEffects is only called if self.isClient, Motorized.lua:410-412). Three mechanisms coexist. (1) exhaustParticleSystems: particle systems loaded by ParticleUtil.loadParticleSystem from vehicle.motorized.exhaustParticleSystems.exhaustParticleSystem(?), with minScale (0.5 by default) and maxScale (1). (2) exhaustEffects: a shared I3D mesh loaded asynchronously, which must expose the shader parameter "param" (otherwise ignored); on every client tick, onUpdateTick computes the plume tilt from the displacement of the emission point (a "trailing" effect due to the vehicle speed, not to the wind: there is no wind reading in this file), smooths it with a 0.95/0.05 factor, then sends through setShaderParameter the size (interpolated minRpmScale 0.25 / maxRpmScale 0.95 according to engine speed) and the colour "exhaustColor" (interpolated minRpmColor / maxRpmColor). (3) effects: a generic effect system (g_effectManager, effect classes ABSENT from the dump: behaviour UNVERIFIED) whose density is set to the RPM ratio. The exhaust flaps (exhaustFlap) are nodes rotated with a random noise of +/-0.1 on the RPM ratio.

ENGINE DATA FOR A MOD. getMotorRpmReal (modulated rpm), getMotorRpmPercentage (0..1), getMotorLoadPercentage (smoothed load, roughly -1 to 1; the raw value is spec.actualLoadPercentage, clamped 0..1, computed server side), getMotorState (MotorState.OFF / IGNITION / STARTING / ON). Network side: the server sends the client, in the update stream, the engine speed (11 bits), the load (7 bits) and the clutch; the client therefore rebuilds speed and load, hence correct exhaust effects in multiplayer. By contrast the engine temperature (spec_motorized.motorTemperature, 20 to 120 °C, fan between 85 and 95 °C) is only updated on the server (updateMotorTemperature called in the isServer block of onUpdateTick) and no network send appears in this file (the valueSend field is never used): note, the temperature read on a pure client therefore seems frozen at 20 °C (not verified in game). No code link between this temperature and the exhaust particles exists in this file.

DT AND TIME: onUpdate and onUpdateTick receive dt in ms; temperature and consumption are proportional to dt (heatingPerMS, coolingByWindPerMS, coolingPerMS). The exhaust plume smoothing (0.95/0.05) is per tick and not per dt: its speed therefore depends on the tick rate (note, not verified in game).

EXTENSION POINTS. Declared events (SpecializationUtil.registerEvent): onStartMotor, onStopMotor, onGearDirectionChanged, onGearChanged, onGearGroupChanged, onMotorBlowOffValveChanged, onClutchCreaking. Functions that can be overwritten with registerOverwrittenFunction (already overwritten here): getBrakeForce, addToPhysics, removeFromPhysics, getIsOperating, getDeactivateOnLeave, getDeactivateLightsOnLeave, loadDashboardGroupFromXML, getIsDashboardGroupActive, getIsActiveForInteriorLights, getIsActiveForWipers, getUsageCausesDamage, getName, getCanBeSelected, getIsPowered. To react to start/stop, listen to onStartMotor / onStopMotor (raised elsewhere, in setMotorState whose body is absent from the dump).

DUMP LIMIT: the functions setMotorState and getMotorState are registered (lines 281-282) but their definitions do not appear; lines 2012 to 2150 of the file are empty. Their behaviour is therefore UNVERIFIED here. The VehicleMotor table, MotorState, MotorSetTurnedOnEvent and g_effectManager are not in this file.

- **Motorized** (l.17)

## Functions

| Function | Line | Description |
|---|---|---|
| `Motorized.initSpecialization()` | 23 | ✍ Declares the XML schemas of the specialization: engine paths, differentials, consumables, sounds, gearboxes, engine configurations, exhaust effects (exhaustParticleSystems, exhaustEffects, exhaustFlap, effects), dashboards and store values. Reserved for vehicle type initialisation. |
| `Motorized.registerMotorXMLPaths(schema: any, baseKey: any)` | 125 | ✍ Registers in the XML schema the keys of an engine configuration (speeds, max speeds, torque, braking, curves, etc.). Not read line by line. |
| `Motorized.registerDifferentialXMLPaths(schema: any, baseKey: any)` | 202 | ✍ Registers the XML keys of the differentials (indices, torque ratio, max speed ratio). |
| `Motorized.registerConsumerXMLPaths(schema: any, baseKey: any)` | 214 | ✍ Registers the XML keys of a consumable (fill type, usage, capacity, refill for air). |
| `Motorized.registerSoundXMLPaths(schema: any, baseKey: any)` | 227 | ✍ Registers the XML keys of the engine, gearbox, air compressor, clutch, blow-off valve, reverse sounds, etc. |
| `Motorized.prerequisitesPresent(specializations: any)` | 254 | ✍ Requires the FillUnit and VehicleSettings specializations on the vehicle type. |
| `Motorized.registerEvents(vehicleType: any)` | 260 | ✍ Declares the events onStartMotor, onStopMotor, onGearDirectionChanged, onGearChanged, onGearGroupChanged, onMotorBlowOffValveChanged and onClutchCreaking, which other specializations or mods can listen to. |
| `Motorized.registerFunctions(vehicleType: any)` | 272 | ✍ Registers the vehicle's public functions (loading, engine getters, rpm, load, temperature, gearbox, start/stop). Note: setMotorState and getMotorState are listed there but their definitions are absent from the dump. |
| `Motorized.registerOverwrittenFunctions(vehicleType: any)` | 318 | ✍ Overrides fourteen base vehicle functions (brake, physics, operating state, dashboard, wipers, interior lighting, wear, name, selection, power supply). |
| `Motorized.registerEventListeners(vehicleType: any)` | 337 | ✍ Subscribes the specialization to vehicle events: lifecycle (onLoad, onPostLoad, onDelete), network streams, onUpdate / onUpdateTick, onStateChange (entering/leaving the vehicle), tank levels, breakdown (onSetBroken), AI, gearbox settings and the gearbox's own events. |
| `Motorized:onLoad(savegame: table)` | 366 | ✍ Vehicle loading: reads differentials, engine, sounds, consumables, then, client side only, the exhaust effects. Initialises the engine state (stopped), the start duration (motorStartDuration), the braking parameters, the gear levers, and the engine temperature structure (20 °C initial, 120 °C max, heating 1.5 °C/s at full load, wind cooling 1 °C/s, fan 85/95 °C, 3 °C/s). |
| `Motorized:onPostLoad(savegame: any)` | 571 | ✍ Server side: refills consumables under 10 % of capacity, charging the cost to the player (litre price multiplied by 2). Builds the list of tanks required to run (diesel, DEF, electricity, methane) then finishes loading the engine. |
| `Motorized:onRegisterDashboardValueTypes()` | 611 | ✍ Registers the dashboard values: engine speed (rpm), load (load, as a percentage), speed, consumption, engine temperature and temperature warning, clutch, gear, group, etc. Useful to know which engine quantities are already exposed and their ranges. |
| `Motorized:onDelete()` | 785 | ✍ Releases the engine, the shared I3D files of the exhaust effects, the exhaust particle systems (ParticleUtil.deleteParticleSystems), the sounds, the animations and the effect system (g_effectManager:deleteEffects). |
| `Motorized:onReadStream(streamId: any, connection: any)` | 812 | ✍ Network read on connection: receives the initial engine state and applies it through setMotorState without sending back. |
| `Motorized:onWriteStream(streamId: any, connection: any)` | 819 | ✍ Network write on connection: sends the current engine state. |
| `Motorized:onReadUpdateStream(streamId: any, timestamp: any, connection: any)` | 825 | ✍ Reads the update stream. Client side (stream coming from the server): equalised engine speed on 11 bits, raw load on 7 bits, compressor state and clutch position on 5 bits, then gearbox data. Server side (stream coming from a client): clutch state only. |
| `Motorized:onWriteUpdateStream(streamId: any, connection: any, dirtyMask: any)` | 862 | ✍ Writes the update stream, symmetric to the read. The server writes speed, load, compressor, clutch (only if the engine is running or starting) and, if the dirty flag is raised, the gearbox data. Note: the engine temperature is not sent. |
| `Motorized:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 895 | ✍ Every frame, if the engine is starting or running: switches to ON after motorStartTime (server), updates the engine (spec.motor:update(dt)), the raw load (server) and the smoothed load (all), updates consumables and engine properties according to damage (server), and client side the sound parameters (normalised speed and load), compressor, brakes, reverse beeper and gear levers animated with dt. Also accumulates the distance travelled for statistics (server). |
| `Motorized:onUpdateTick(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 1113 | ✍ Simulation tick. Server: automatic engine shutdown if no player or occupied vehicle within 250 m (when automatic start is disabled), call to updateMotorTemperature, automatic start/stop logic. Client, engine running: scales the emission and lifetime of the exhaust particles from the RPM ratio, animates the exhaust flaps, sets the density of the effect system, orients and colours the exhaust meshes via shader (see module), then handles the consumption display, the clutch sounds and the ignition lock. Note: for the particles, the code reads minScale/maxScale on the spec.exhaustParticleSystems list and calls ParticleUtil.setEmitCountScale with that list rather than with the current system, whereas minScale/maxScale are stored per system (lines 1216-1219, loadExhaustEffects:1721-1722); apparent defect, real effect UNVERIFIED in game and the body of ParticleUtil is absent from the dump. |
| `Motorized:loadDifferentials(xmlFile: XMLFile, configDifferentialIndex: integer)` | 1368 | ✍ Loads the differentials of the chosen configuration (axle or wheel indices, torque ratio and max speed ratio) for later addition to the physics. Not read in detail. |
| `Motorized:loadMotor(xmlFile: XMLFile, motorId: integer)` | 1424 | ✍ Loads the chosen engine configuration: name, type, consumables, min/max speeds, speeds, acceleration, braking, torque/power curves, gearbox, groups, ratios and damping, with fallback to configuration 0. Instantiates the VehicleMotor. Not read in detail (outside the priority angle). |
| `Motorized:loadGears(xmlFile: any, gearName: any, key: any, motorMaxRpm: any, axleRatio: any, direction: any)` | 1596 | ✍ Loads a series of gearbox ratios from the XML (ratios, max/min ratios, speeds), taking the max engine speed and the axle ratio into account. Not read in detail. |
| `Motorized:loadGearGroups(xmlFile: any, key: any, motorMaxRpm: any, axleRatio: any)` | 1658 | ✍ Loads the gearbox's gear groups (ranges) from the XML. Not read in detail. |
| `Motorized:loadExhaustEffects(xmlFile: XMLFile)` | 1713 | ✍ Loads, client side, the three families of exhaust effects: particle systems (with minScale/maxScale), flaps (exhaustFlap: node, max rotation, axis), shared I3D exhaust meshes (loaded asynchronously, onExhaustEffectI3DLoaded callback) and generic effects via g_effectManager (unknown fill type). Keeps spec.exhaustEffectMaxSteeringSpeed = 0.001, which is not used elsewhere in this file. |
| `Motorized:onExhaustEffectI3DLoaded(i3dNode: any, failedReason: any, args: any)` | 1783 | ✍ Loading callback of an exhaust mesh: takes the first child of the I3D, keeps it only if it has the shader parameter "param", links it to the vehicle's anchor node, hides it (visibility false at start) and reads minRpmColor, maxRpmColor, minRpmScale, maxRpmScale and upFactor (schema defaults: colour defaults: black for min, a dark bluish tone with alpha 2.0 for max; scales 0.25 and 0.95; upFactor 0.75). Note: the node is hidden here and the place where it is made visible is not in this file (not verified). |
| `Motorized:loadSounds(xmlFile: XMLFile, baseString: any)` | 1819 | ✍ Loads the sound samples for engine, gearbox, air compressor, blow-off valve, brakes, reverse, and the sound synthesis parameters. Not read in detail. |
| `Motorized:loadConsumerConfiguration(xmlFile: any, consumerIndex: any)` | 1873 | ✍ Loads the consumable configuration (key consumerConfiguration): list of consumables with fill type, usage, permanent consumption, air refill, and index by name and by type. |
| `Motorized:getIsMotorStarted() → boolean` | 1952 | ✍ True only if the engine state is ON (not during STARTING). |
| `Motorized:getIsMotorInNeutral() → boolean` | 1959 | ✍ Asks the VehicleMotor whether the gearbox is in neutral. |
| `Motorized:getCanMotorRun()` | 1969 | ✍ False if a required tank is empty or if the VehicleMotor refuses to run (clutch not engaged, for example). |
| `Motorized:getStopMotorOnLeave()` | 1987 | ✍ Tells whether the engine must stop when leaving the vehicle: configuration option and no external power request (getRequiresPower). |
| `Motorized:getMotorNotAllowedWarning()` | 1993 | ✍ Returns the warning text to display (empty tank or clutch not engaged), otherwise nil. |
| `Motorized:startMotor(noEventSend: boolean)` | 2152 | ✍ If the engine is OFF or IGNITION: sends MotorSetTurnedOnEvent(true) unless noEventSend, then switches to STARTING. |
| `Motorized:stopMotor(noEventSend: boolean)` | 2163 | ✍ If the engine is ON or STARTING: sends MotorSetTurnedOnEvent(false) unless noEventSend, then switches to OFF. |
| `Motorized:updateConsumers(dt: any, accInput: any)` | 2173 | ✍ Server only. Computes a consumption factor from engine speed, smoothed load, the savegame consumption setting (low 1.0, medium 1.5, high 2.5) and damage, removes fuel (stat "fuelUsage", automatic repurchase for the AI if the option is active), exposes the hourly consumption (spec.lastFuelUsage) and handles the brakes' air consumption and refill. |
| `Motorized:updateMotorTemperature(dt: any)` | 2280 | ✍ Server only. Heating proportional to dt, modulated by raw load and engine speed; wind cooling proportional to the square of min(1, speed/30); a fan that switches on above 95 °C and off below 85 °C. Temperature clamped between 20 and 120 °C. Only called while the engine is starting or running: no decay at standstill is coded here (a switched-off engine does not cool, according to this file). |
| `Motorized:onGearDirectionChanged(direction: any)` | 2310 | ✍ Server: raises the gearbox network flag. Client: updates the dashboard values "gear" and "gearIndex". |
| `Motorized:onGearChanged(gear: any, targetGear: any, changeTime: any, previousGear: any)` | 2325 | ✍ Animates the gear levers toward the target gear and updates sounds and dashboard client side. Not read in detail. |
| `Motorized:onGearGroupChanged(targetGroup: any, changeTime: any)` | 2366 | ✍ Equivalent of onGearChanged for gear groups. Not read in detail. |
| `Motorized:onMotorBlowOffValveChanged(blowOffValveState: any)` | 2390 | ✍ Plays or stops the blow-off valve (turbo) sound according to the state passed by the engine; stores that state. |
| `Motorized:onClutchCreaking(isEvent: any, groupTransmission: any, gearIndex: any, groupIndex: any)` | 2408 | ✍ Handles clutch creaking: sound, warning and lever animation toward the neutral position. Not read in detail. |
| `Motorized:onReverseDirectionChanged()` | 2442 | ✍ In manual reverser mode, sends a MotorGearShiftEvent of direction-change type to the server. |
| `Motorized:onVehicleSettingChanged(gameSettingId: any, state: any)` | 2450 | ✍ Applies the game settings (direction change mode, gearbox mode) to the engine; the gearbox mode is ignored for an AI-driven vehicle. |
| `Motorized:onAIJobStarted(job: any)` | 2477 | ✍ Starts the engine without a network event and forces the gearbox to automatic mode for the AI. |
| `Motorized:onAIJobFinished(job: any)` | 2488 | ✍ Stops the engine without a network event if nobody is in the vehicle, then restores the chosen gearbox mode. |
| `Motorized:getMotor()` | 2502 | ✍ Returns the VehicleMotor object. |
| `Motorized:getMotorStartTime()` | 2508 | ✍ Returns the instant (game time in ms) at which the engine will switch from STARTING to ON. |
| `Motorized:getMotorType()` | 2514 | ✍ Returns the engine type read from the XML (#type of the configuration). |
| `Motorized:getMotorRpmPercentage()` | 2520 | ✍ Engine speed normalised from 0 to 1 between min and max rpm, based on the engine's modulated speed. |
| `Motorized:getMotorRpmReal()` | 2528 | ✍ Current modulated engine speed in rpm (the engine's getLastModulatedMotorRpm). |
| `Motorized:getMotorLoadPercentage()` | 2535 | ✍ Smoothed engine load (spec.smoothedLoadPercentage), computed on every onUpdate on all peers. |
| `Motorized:getMotorBrakeTime()` | 2542 | ✍ Duration in seconds of the last braking, used for the compressed-air sound, 0 s if there is no matching sample. |
| `Motorized:getMotorBlowOffValveState()` | 2554 | ✍ Returns the stored blow-off valve state. |
| `Motorized:getMotorDifferentialSpeed()` | 2561 | ✍ Differential speed in km/h (absolute value), used by a sound modifier; logs an error if the vehicle is not motorized. |
| `Motorized:getConsumerFillUnitIndex(fillTypeIndex: any)` | 2572 | ✍ Returns the fill unit index of the consumable for a given fill type (nil if absent). |
| `Motorized:getAirConsumerUsage()` | 2584 | ✍ Returns the usage field of the AIR consumable, or 0 if it does not exist (unit: litres per second, from the usage in updateConsumers; not verified in game). |
| `Motorized:getBrakeForce(superFunc: any)` | 2593 | ✍ Override: takes the maximum between the vehicle's brake force and the engine's; if maxBrakeForceMass is defined, interpolates between min and max force according to total mass. |
| `Motorized:loadDashboardGroupFromXML(superFunc: any, xmlFile: any, key: any, group: any)` | 2612 | ✍ Override: additionally reads the dashboard group attributes isMotorStarting, isMotorRunning, electronicsStarting, electronicsStartingTime (2 by default) and electronicsRunning. |
| `Motorized:getIsDashboardGroupActive(superFunc: any, group: any)` | 2629 | ✍ Override: activates or not a dashboard group according to the engine state and the electronics switch-on instant. |
| `Motorized:getIsActiveForInteriorLights(superFunc: any)` | 2674 | ✍ Override: the interior lighting is active as soon as the engine is in IGNITION, STARTING or ON. |
| `Motorized:getIsActiveForWipers(superFunc: any)` | 2685 | ✍ Override: wipers inactive when the engine is OFF. |
| `Motorized:getUsageCausesDamage(superFunc: any)` | 2696 | ✍ Override: no wear if the engine is neither running nor starting. |
| `Motorized:addToPhysics(superFunc: any) → boolean` | 2708 | ✍ Override: after the base addition, server side, declares each differential to the engine's physics, updates the engine properties and resets the controls. |
| `Motorized:removeFromPhysics(superFunc: any)` | 2751 | ✍ Override: server side, removes all differentials before the base removal. |
| `Motorized:updateMotorProperties()` | 2771 | ✍ Sends to the physics engine (setMotorProperties) the min/max speeds in rad/s, the inertia, the damping and the torque curves of the Lua simulation. |
| `Motorized:controlVehicle(acceleratorPedal: any, maxSpeed: any, maxAcceleration: any, minMotorRotSpeed: any, maxMotorRotSpeed: any, maxMotorRotAcceleration: any, minGearRatio: any, maxGearRatio: any, maxClutchTorque: any, neededPtoTorque: any)` | 2781 | ✍ Passes to the physics (controlVehicle) pedal, max speed, acceleration, speed bounds, ratios and clutch torque; wakes the sleeping physics object if one of the parameters changed. |
| `Motorized:getIsOperating(superFunc: any) → boolean` | 2818 | ✍ Override: a motorized vehicle is considered operating if the engine is ON, in addition to the base result. |
| `Motorized:getDeactivateOnLeave(superFunc: any) → boolean` | 2826 | ✍ Override: deactivation on leaving only if automatic start is active. |
| `Motorized:getDeactivateLightsOnLeave(superFunc: any) → boolean` | 2834 | ✍ Override: returns the base result only if automatic start is active and the vehicle has no power request (getRequiresPower); otherwise false. |
| `Motorized:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 2841 | ✍ Registers the input actions (engine start, gear change, group, direction, clutch) for the active vehicle. |
| `Motorized.actionEventShiftGear(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2925 | ✍ Input callback: shifts one gear up or down (manual gearbox). |
| `Motorized.actionEventSelectGear(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2935 | ✍ Input callback: direct selection of a gear. |
| `Motorized.actionEventShiftGroup(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2953 | ✍ Input callback: changes gear group. |
| `Motorized.actionEventSelectGroup(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2963 | ✍ Input callback: direct selection of a group. |
| `Motorized.actionEventDirectionChange(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2981 | ✍ Input callback: reverses the direction of travel. |
| `Motorized.actionEventClutch(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 2993 | ✍ Input callback: clutch pedal (analogue). |
| `Motorized.updateActionEvents(self: any)` | 3010 | ✍ Updates the activity and text of the input actions according to the engine state and gearbox mode. |
| `Motorized:getTraveledDistanceStatsActive()` | 3052 | ✍ Tells whether the distance travelled must be counted in the farm statistics. |
| `Motorized:setGearLeversState(gear: any, group: any, time: any, isResetPosition: any)` | 3058 | ✍ Starts the gear lever animation toward a gear and/or group over the given duration. |
| `Motorized:generateShiftAnimation(gearLever: any, state: any, time: any, isResetPosition: any)` | 3072 | ✍ Builds the sequence of rotation interpolations of a gear lever toward a target state. |
| `Motorized:getGearInfoToDisplay() → string, string` | 3192 | ✍ Returns the gear text, the group and the direction to show in the interface. |
| `Motorized:setTransmissionDirection(direction: integer)` | 3219 | ✍ Changes the gearbox travel direction (forward/reverse). |
| `Motorized:getDirectionChangeMode() → directionChangeMode` | 3229 | ✍ Returns the direction change mode (automatic or manual). |
| `Motorized:getIsManualDirectionChangeAllowed() → boolean` | 3236 | ✍ Tells whether manual reversing is allowed. |
| `Motorized:getIsManualDirectionChangeActive() → boolean` | 3243 | ✍ Tells whether manual reversing is in force. |
| `Motorized:getGearShiftMode() → gearShiftMode` | 3255 | ✍ Returns the gear shift mode (automatic, manual). |
| `Motorized:onStateChange(state: any, vehicle: any, isControlling: any)` | 3261 | ✍ Entering the vehicle: starts the engine if automatic start is active and no ignition lock is used. Leaving: stops the engine if required, then immobilises the vehicle (stopVehicle). |
| `Motorized:stopVehicle()` | 3282 | ✍ Server: sends null commands to the physics (pedal 0, speed 0). |
| `Motorized:onFillUnitFillLevelChanged(fillUnitIndex: any, fillLevelDelta: any, fillType: any, toolType: any, fillPositionData: any, appliedDelta: any)` | 3293 | ✍ When diesel is added, refills the DEF tank proportionally if it exists. |
| `Motorized:onSetBroken()` | 3307 | ✍ Stops the engine without a network event when the vehicle is declared broken. |
| `Motorized:getName(superFunc: any)` | 3313 | ✍ Override: returns the name tied to the engine configuration (vehicleName) if defined, otherwise the base name. |
| `Motorized:getCanBeSelected(superFunc: any)` | 3323 | ✍ Override: if automatic start is disabled, a vehicle is selectable as soon as a motorized vehicle exists in the attached chain (so that engine can be switched on or off); otherwise base result. |
| `Motorized:getIsPowered(superFunc: any)` | 3340 | ✍ Override: an implement is powered if this vehicle or another vehicle of the attached chain has an engine in STARTING/ON; otherwise returns the matching warning. |
| `Motorized.tryStartMotor(vehicle: table)` | 3371 | ✍ Tries to start each engine able to run in the chain of attached vehicles. |
| `Motorized.actionEventToggleMotorState(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3383 | ✍ Input callback: starts or stops the engine (toggle). |
| `Motorized.actionEventSetMotorStateIgnition(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3403 | ✍ Input callback: turns the ignition on (IGNITION) without starting. |
| `Motorized.actionEventSetMotorStateOn(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3414 | ✍ Input callback: starts the engine. |
| `Motorized.actionEventSetMotorStateOff(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 3432 | ✍ Input callback: stops the engine. |
| `Motorized.loadSpecValueFuel(xmlFile: any, customEnvironment: any, baseDir: any)` | 3443 | ✍ Reads the store fuel data (type, capacity) from the vehicle XML. Not read in detail. |
| `Motorized.getSpecValueFuelDiesel(storeItem: any, realItem: any, configurations: any)` | 3513 | ✍ Store specification value: diesel. |
| `Motorized.getSpecValueFuelElectricCharge(storeItem: any, realItem: any, configurations: any)` | 3519 | ✍ Store specification value: electric charge. |
| `Motorized.getSpecValueFuelMethane(storeItem: any, realItem: any, configurations: any)` | 3525 | ✍ Store specification value: methane. |
| `Motorized.getSpecValueFuel(storeItem: any, realItem: any, configurations: any, fillTypeFilter: any, returnValue: any)` | 3531 | ✍ Computes the fuel text/value for the store according to the requested fill type. |
| `Motorized.loadSpecValueMaxSpeed(xmlFile: any, customEnvironment: any, baseDir: any)` | 3653 | ✍ Reads the store max speed from the XML. Not read in detail. |
| `Motorized.getSpecValueMaxSpeed(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 3692 | ✍ Computes the max speed for the store according to the configuration (bounds or value). |
| `Motorized.loadSpecValuePower(xmlFile: any, customEnvironment: any, baseDir: any)` | 3724 | ✍ Reads the power given in vehicle.storeData.specs.power. |
| `Motorized.getSpecValuePower(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 3730 | ✍ Computes the min/max power for the store according to the chosen engine configuration. |
| `Motorized.loadSpecValueTransmission(xmlFile: any, customEnvironment: any, baseDir: any)` | 3832 | ✍ Reads the store's transmission information. Not read in detail. |
| `Motorized.getSpecValueTransmission(storeItem: any, realItem: any, configurations: any, saleItem: any, returnValues: any, returnRange: any)` | 3848 | ✍ Computes the transmission text for the store. Not read in detail. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onStartMotor` | 261 |
| registerEvent | `onStopMotor` | 262 |
| registerEvent | `onGearDirectionChanged` | 263 |
| registerEvent | `onGearChanged` | 264 |
| registerEvent | `onGearGroupChanged` | 265 |
| registerEvent | `onMotorBlowOffValveChanged` | 266 |
| registerEvent | `onClutchCreaking` | 267 |
| registerFunction | `loadDifferentials` | 273 |
| registerFunction | `loadMotor` | 274 |
| registerFunction | `loadGears` | 275 |
| registerFunction | `loadGearGroups` | 276 |
| registerFunction | `loadExhaustEffects` | 277 |
| registerFunction | `onExhaustEffectI3DLoaded` | 278 |
| registerFunction | `loadSounds` | 279 |
| registerFunction | `loadConsumerConfiguration` | 280 |
| registerFunction | `setMotorState` | 281 |
| registerFunction | `getMotorState` | 282 |
| registerFunction | `getIsMotorStarted` | 283 |
| registerFunction | `getIsMotorInNeutral` | 284 |
| registerFunction | `getCanMotorRun` | 285 |
| registerFunction | `getStopMotorOnLeave` | 286 |
| registerFunction | `getMotorNotAllowedWarning` | 287 |
| registerFunction | `startMotor` | 288 |
| registerFunction | `stopMotor` | 289 |
| registerFunction | `updateMotorProperties` | 290 |
| registerFunction | `controlVehicle` | 291 |
| registerFunction | `updateConsumers` | 292 |
| registerFunction | `updateMotorTemperature` | 293 |
| registerFunction | `getMotor` | 294 |
| registerFunction | `getMotorStartTime` | 295 |
| registerFunction | `getMotorType` | 296 |
| registerFunction | `getMotorRpmPercentage` | 297 |
| registerFunction | `getMotorRpmReal` | 298 |
| registerFunction | `getMotorLoadPercentage` | 299 |
| registerFunction | `getMotorBlowOffValveState` | 300 |
| registerFunction | `getMotorDifferentialSpeed` | 301 |
| registerFunction | `getConsumerFillUnitIndex` | 302 |
| registerFunction | `getAirConsumerUsage` | 303 |
| registerFunction | `getTraveledDistanceStatsActive` | 304 |
| registerFunction | `setGearLeversState` | 305 |
| registerFunction | `generateShiftAnimation` | 306 |
| registerFunction | `getGearInfoToDisplay` | 307 |
| registerFunction | `setTransmissionDirection` | 308 |
| registerFunction | `getDirectionChangeMode` | 309 |
| registerFunction | `getIsManualDirectionChangeAllowed` | 310 |
| registerFunction | `getIsManualDirectionChangeActive` | 311 |
| registerFunction | `getGearShiftMode` | 312 |
| registerFunction | `stopVehicle` | 313 |
| registerOverwrittenFunction | `getBrakeForce` | 319 |
| registerOverwrittenFunction | `addToPhysics` | 320 |
| registerOverwrittenFunction | `removeFromPhysics` | 321 |
| registerOverwrittenFunction | `getIsOperating` | 322 |
| registerOverwrittenFunction | `getDeactivateOnLeave` | 323 |
| registerOverwrittenFunction | `getDeactivateLightsOnLeave` | 324 |
| registerOverwrittenFunction | `loadDashboardGroupFromXML` | 325 |
| registerOverwrittenFunction | `getIsDashboardGroupActive` | 326 |
| registerOverwrittenFunction | `getIsActiveForInteriorLights` | 327 |
| registerOverwrittenFunction | `getIsActiveForWipers` | 328 |
| registerOverwrittenFunction | `getUsageCausesDamage` | 329 |
| registerOverwrittenFunction | `getName` | 330 |
| registerOverwrittenFunction | `getCanBeSelected` | 331 |
| registerOverwrittenFunction | `getIsPowered` | 332 |
| registerEventListener | `onLoad` | 338 |
| registerEventListener | `onPostLoad` | 339 |
| registerEventListener | `onRegisterDashboardValueTypes` | 340 |
| registerEventListener | `onDelete` | 341 |
| registerEventListener | `onReadStream` | 342 |
| registerEventListener | `onWriteStream` | 343 |
| registerEventListener | `onReadUpdateStream` | 344 |
| registerEventListener | `onWriteUpdateStream` | 345 |
| registerEventListener | `onUpdate` | 346 |
| registerEventListener | `onUpdateTick` | 347 |
| registerEventListener | `onRegisterActionEvents` | 348 |
| registerEventListener | `onStateChange` | 349 |
| registerEventListener | `onFillUnitFillLevelChanged` | 350 |
| registerEventListener | `onSetBroken` | 351 |
| registerEventListener | `onGearDirectionChanged` | 352 |
| registerEventListener | `onGearChanged` | 353 |
| registerEventListener | `onGearGroupChanged` | 354 |
| registerEventListener | `onMotorBlowOffValveChanged` | 355 |
| registerEventListener | `onClutchCreaking` | 356 |
| registerEventListener | `onReverseDirectionChanged` | 357 |
| registerEventListener | `onVehicleSettingChanged` | 358 |
| registerEventListener | `onAIJobStarted` | 359 |
| registerEventListener | `onAIJobFinished` | 360 |
