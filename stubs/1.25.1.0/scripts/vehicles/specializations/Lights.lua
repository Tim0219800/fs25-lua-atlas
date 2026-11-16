---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Lights.lua (generated stub, FS25 Lua Atlas)

--- Vehicle lighting specialization (spec_lights): dipped/main beams, work lights, brake, reverse, turn signals, beacons, interior lights, daytime lights, top/bottom lights. It drives two families of lights described in the vehicle XML: static lights (StaticLight: emissive materials/shaders, no light source) and real lights (RealLight: engine light sources). The StaticLight, SharedLight, StaticLightCompound and BeaconLight classes are in other files; only RealLight.lua is present in the dump (vehicles/specializations/components/RealLight.lua).
--- 
--- DATA MODEL. State is a bit mask spec.lightsTypesMask: bit n matches light type n. The values of the Lights.LIGHT_TYPE_* and Lights.TURNLIGHT_* constants are UNVERIFIED: they are defined in the file header, whose lines are blank in the dump (we only see that LIGHT_TYPE_DEFAULT, LIGHT_TYPE_WORK_BACK, LIGHT_TYPE_WORK_FRONT and LIGHT_TYPE_HIGHBEAM exist). The "base" types go up to maxLightState (at least HIGHBEAM); the specialization adds eight types right after: bottomLight, topLight, brakeLight, turnLightLeft, turnLightRight, turnLightAny, reverseLight, interiorLight (total limit of 31 bits, onLoad). The successive states of the light key come from vehicle.lights.states.state(?)#lightTypes; automaticState#lightTypes (default "0") and #lightTypesWork (default "0 1 2") are used for automatic lighting.
--- 
--- REAL LIGHTS AND PROFILES. Two sets of real lights are loaded: realLights.low and realLights.high. Only one is active: getUseHighProfile compares the LIGHTS_PROFILE setting to GS_PROFILE_HIGH (a setting that Platform.gameplay.lightsProfile can force). In setLightsTypesMask the inactive profile receives a zero mask. For a fog mod: to know whether a headlight is on, read getLightsTypesMask() and test the wanted bit, or listen to the onLightsTypesMaskChanged event; to find the light source of a headlight, use getRealLightFromNode then the fields of the RealLight object. Note in RealLight.lua: light scattering in the air (setLightUseLightScattering, setLightScatteringConeAngle, setLightScatteringIntensity fixed at 1) is enabled by RealLight:updateLightScattering (components/RealLight.lua:212-258) only if the source has a range above 7.5, with the high profile for default/high-beam lights and the very high profile for the other typed lights. This is the native "visible beam" effect; how it renders in fog and how it interacts with the engine fog are UNVERIFIED (engine code and the Environment class are absent from the dump).
--- 
--- NETWORK. The server adds the extra bits itself (turn signals, top/bottom, brake, reverse, interior) and broadcasts VehicleSetLightEvent (mask over totalNumLightTypes bits); the client receives the full mask but recomputes the top/bottom and interior bits locally. Turn signals (VehicleSetTurnLightEvent) and beacons (VehicleSetBeaconLightEvent) have their own event. On connection, onWriteStream sends the mask and the beacon state.
--- 
--- TIMING. No dt in this file: blinking is computed from getShaderTimeSec(); onUpdate keeps calling raiseActive while a turn signal is active. Daytime lights follow onStartMotor / onStopMotor. Automatic lighting (updateAutomaticLights) depends only on environment.isSunOn (Environment is absent from the dump): no reading of fog, rain or visibility appears here. Interior light brightness depends on the time of day (see getInteriorLightBrightness).
--- 
--- EXTENSION POINTS. Declared events: onTurnLightStateChanged, onTopLightsVisibilityChanged, onBrakeLightsVisibilityChanged, onReverseLightsVisibilityChanged, onLightsTypesMaskChanged, onBeaconLightsVisibilityChanged. Functions overridden here: loadDashboardGroupFromXML, getIsDashboardGroupActive. Functions meant to be overridden by other specializations: getIsActiveForInteriorLights (false here, overridden by Motorized) and getDeactivateLightsOnLeave (true here, overridden by Motorized). Message center subscriptions: DAY_NIGHT_CHANGED, change of the LIGHTS_PROFILE setting, change of the REAL_BEACON_LIGHTS setting. Note: they are made in onLoad and no unsubscription appears in this file, including in onDelete (not verified in game).
---@class Lights
Lights = {}

--- Always returns true: no specialization prerequisite.
---@param specializations table
---@return boolean
function Lights.prerequisitesPresent(specializations) end

--- Registers the "beaconLight" configuration type and the XML paths: light states, static lights by category (default, top, bottom, brake, reverse, daytime, turn signals), compounds, shared lights, beacons (with #alwaysActive and configurations), sounds, dashboards and the #isTopLight / #isBottomLight attributes. #reverseLightActivationSpeed defaults to 1 km/h.
function Lights.initSpecialization() end

--- Registers, for one real-light profile (low or high), the sub-keys light, topLight, bottomLight, brakeLight, reverseLight, dayTimeLight, turnLightLeft, turnLightRight and interiorLight through RealLight.registerXMLPaths.
---@param schema any
---@param basePath any
function Lights.registerRealLightSetupXMLPath(schema, basePath) end

--- Declares the six events published by the specialization (turn signals, top lights, brake, reverse, types mask, beacons).
---@param vehicleType any
function Lights.registerEvents(vehicleType) end

--- Registers the public lighting functions (mask, beacons, turn signals, top/brake/reverse/interior lights, access to lights by node, automatic lighting).
---@param vehicleType any
function Lights.registerFunctions(vehicleType) end

--- Overrides loadDashboardGroupFromXML and getIsDashboardGroupActive to add the light type filters.
---@param vehicleType any
function Lights.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to the lifecycle, the network, input actions, vehicle enter/leave, the engine (onStartMotor/onStopMotor), attaching, the AI and the automated train, vehicle physics (onVehiclePhysicsUpdate) and the change of top-light requirement.
---@param vehicleType any
function Lights.registerEventListeners(vehicleType) end

--- Reads the reverse speed threshold (XML value in km/h divided by 3600), the light states and the automatic masks, loads the real lights (low and high profiles), static lights, compounds, shared lights and beacons (configuration and always-active), computes maxLightState and the eight extra types, loads the sounds and subscribes to day/night messages and light settings. Note: the "self.isClient ~= nil" test before loading the sounds is true even on the server (probable intent: self.isClient; not verified in game).
---@param savegame table
function Lights:onLoad(savegame) end

--- Adds the extra types to the type lists of the top/bottom/brake/reverse/turn/interior lights (turn signals flagged as blinking), finalizes each real light (realLight:finalize) and, in the showroom, turns on the daytime lights.
---@param savegame table
function Lights:onLoadFinished(savegame) end

--- Registers the lighting dashboard values (light state, turn signals, beacon). Not reread in detail.
function Lights:onRegisterDashboardValueTypes() end

--- Deletes shared lights, beacons, light XML files still loading, releases the shared I3Ds, clears the compounds and deletes the sounds. No message center unsubscription appears in it.
function Lights:onDelete() end

--- Read on connection: types mask (totalNumLightTypes bits) then beacon state, applied without sending anything back over the network.
---@param streamId integer
---@param connection Connection
function Lights:onReadStream(streamId, connection) end

--- Writes the types mask and the beacon state on connection.
---@param streamId integer
---@param connection Connection
function Lights:onWriteStream(streamId, connection) end

--- Client: while a turn signal is active, computes a 0 to 1 load coefficient from the fraction of shader time (one-second period) and applies it to the left/right turn lights; plays the turn signal sound each period for the active vehicle; keeps the vehicle active. No dt used.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Lights:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client: enables or cuts the "always active" beacons when the vehicle becomes active for lights, updates the interior lights, the input action activity and, if Platform.gameplay.automaticLights, the automatic lighting of the root vehicle not driven by the AI according to environment.isSunOn and the driving direction.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function Lights:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- True if the player is in the vehicle and can control the lights, or if the attacher vehicle is (recursive). With onlyPowered, requires getIsPowered.
---@param onlyPowered any
---@return boolean
function Lights:getIsActiveForLights(onlyPowered) end

--- Returns false by default; Motorized overrides it to return true when the ignition is on.
---@return boolean
function Lights:getIsActiveForInteriorLights() end

--- False if the AI is driving or if no light type is defined; otherwise true only for the vehicle currently occupied by the local player.
---@return boolean
function Lights:getCanToggleLight() end

--- True if the LIGHTS_PROFILE setting (or Platform.gameplay.lightsProfile if set) is greater than or equal to GS_PROFILE_HIGH: selects the real lights of the high profile.
---@return boolean
function Lights:getUseHighProfile() end

--- Moves to the next (or previous) light state in the XML state list, wraps to zero after the last one or if lights were on from state 0, rebuilds the mask keeping the extra bits, then calls setLightsTypesMask.
---@param increment any
function Lights:setNextLightsState(increment) end

--- Core of the system: composes the extra bits (server: turn signals, top/bottom, brake, reverse, interior; client: top/bottom and interior locally), broadcasts VehicleSetLightEvent unless noEventSend, plays the switch sound if the base bits change, applies the mask to all static lights and compounds and to the real lights of the active profile (mask 0 for the other), updates the dashboard and raises onLightsTypesMaskChanged. Entry point to observe to sync a fog effect with headlights.
---@param lightsTypesMask integer
---@param force boolean
---@param noEventSend boolean
---@return boolean
function Lights:setLightsTypesMask(lightsTypesMask, force, noEventSend) end

--- Returns the current mask of active light types.
---@return integer
function Lights:getLightsTypesMask() end

--- Turns the beacons on or off, broadcasts VehicleSetBeaconLightEvent, also sets the "device" state if the vehicle is active for input, updates the dashboard and raises onBeaconLightsVisibilityChanged.
---@param visibility boolean
---@param force boolean
---@param noEventSend boolean
---@return boolean
function Lights:setBeaconLightsVisibility(visibility, force, noEventSend) end

--- Returns the beacon state.
---@return boolean
function Lights:getBeaconLightsVisibility() end

--- Sets the turn signal state (Lights.TURNLIGHT_* constants), broadcasts VehicleSetTurnLightEvent, remembers the active light profile for the turn signals, resets the sound repeat counter, recomputes the mask on the server and raises onTurnLightStateChanged.
---@param state integer
---@param force boolean
---@param noEventSend boolean
---@return boolean
function Lights:setTurnLightState(state, force, noEventSend) end

--- Returns the turn signal state.
---@return integer
function Lights:getTurnLightState() end

--- Chooses between top and bottom lights, recomputes the mask without network broadcast and raises onTopLightsVisibilityChanged.
---@param visibility boolean
---@return boolean
function Lights:setTopLightsVisibility(visibility) end

--- Turns the brake light bit on or off, recomputes the mask and raises onBrakeLightsVisibilityChanged.
---@param visibility boolean
---@return boolean
function Lights:setBrakeLightsVisibility(visibility) end

--- Turns the reverse light bit on or off, recomputes the mask and raises onReverseLightsVisibilityChanged.
---@param visibility boolean
---@return boolean
function Lights:setReverseLightsVisibility(visibility) end

--- Turns the interior lights on or off depending on the time-of-day brightness (off if it is 0); forces the mask to be recomputed without broadcast.
---@param visibility boolean
---@return boolean
function Lights:setInteriorLightsVisibility(visibility) end

--- Returns the interior brightness from 0 to 1 based on the game time (currentHour and currentMinute of environment, absent from the dump): linear decrease until 10 h, zero between 10 h and 16 h, increasing after 16 h; with updateState, recomputes it and reports whether it changed.
---@param updateState boolean
---@return number
---@return boolean
function Lights:getInteriorLightBrightness(updateState) end

--- Turns everything off: mask to 0, beacons and turn signals (hazard kept if requested), brake, reverse, interior; resets the light state to zero.
---@param keepHazardLightsOn any
function Lights:deactivateLights(keepHazardLightsOn) end

--- Deactivates the real beacons and their device state.
function Lights:deactivateBeaconLights() end

--- Override: additionally reads #lightTypes and #excludedLightTypes for a dashboard group.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param group any
function Lights:loadDashboardGroupFromXML(superFunc, xmlFile, key, group) end

--- Override: a group is active only if at least one requested light type is on and no excluded type is.
---@param superFunc any
---@param group any
function Lights:getIsDashboardGroupActive(superFunc, group) end

--- Returns true by default (overridden by Motorized): the lights turn off when leaving the vehicle.
function Lights:getDeactivateLightsOnLeave() end

--- Loads a shared light (SharedLight) from the XML; on success adds it to the list and, if it has a compound, to the compounds list.
---@param xmlFile any
---@param key any
function Lights:loadSharedLight(xmlFile, key) end

--- Reads #isTopLight and #isBottomLight (false by default) of a light.
---@param xmlFile any
---@param key any
---@param light any
function Lights:loadAdditionalLightAttributesFromXML(xmlFile, key, light) end

--- A "top" light is active only if top lights are visible, a "bottom" light only if they are not, the others always.
---@param light any
function Lights:getIsLightActive(light) end

--- Looks up a static light by its node across all categories; nil otherwise.
---@param node any
function Lights:getStaticLightFromNode(node) end

--- Looks up a real light by its node in both profiles; nil otherwise.
---@param node any
function Lights:getRealLightFromNode(node) end

--- Applies the automatic mask (work or not) if on, otherwise cuts everything if a non-zero mask is present.
---@param isTurnedOn any
---@param isWorking any
function Lights:updateAutomaticLights(isTurnedOn, isWorking) end

--- Day/night message callback: shows the "lights" action text only when the sun is down (environment.isSunOn false).
function Lights:lightsWeatherChanged() end

--- Callback for the lighting profile change: informs each real light, then reapplies the mask without broadcast (switches the active real lights).
---@param lightsProfile any
function Lights:onLightsProfileChanged(lightsProfile) end

--- Callback for the "real beacons" setting: informs each beacon.
function Lights:onLightsRealBeaconLightChanged() end

--- Registers the light keys (lights, back, front, front/back work, high beam, turn signals, hazard, beacon) for the occupied vehicle; hides their help text except the lights one, visible at night.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Lights:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Registers the external "lights" action of a trigger if the vehicle has light states.
---@param trigger any
---@param name any
---@param xmlFile any
---@param key any
function Lights:onRegisterExternalActionEvents(trigger, name, xmlFile, key) end

--- On entering, reapplies mask, beacons and turn signals, forcing the state.
---@param isControlling any
function Lights:onEnterVehicle(isControlling) end

--- On leaving, turns off lights and beacons if getDeactivateLightsOnLeave, and cuts the beacons' device state.
function Lights:onLeaveVehicle() end

--- Deactivates the beacons if getDeactivateLightsOnLeave.
function Lights:onDeactivate() end

--- Reacts to the top-light requirement event by calling setTopLightsVisibility.
---@param requiresTopLights any
function Lights:onRequiresTopLightsChanged(requiresTopLights) end

--- Reapplies the mask and turns on the daytime lights.
function Lights:onStartMotor() end

--- Reapplies the mask and turns off the daytime lights (except in the showroom).
function Lights:onStopMotor() end

--- Reapplies the mask (forced) if any lights are on.
function Lights:onStartReverseDirectionChange() end

--- An attached implement copies mask, beacons and turn signals from the attacher vehicle, if it exposes getLightsTypesMask.
---@param attacherVehicle any
---@param inputJointDescIndex any
---@param jointDescIndex any
function Lights:onPostAttach(attacherVehicle, inputJointDescIndex, jointDescIndex) end

--- Turns off all lights of the detached implement.
function Lights:onPostDetach() end

--- Automated train: automatic lighting according to environment.isSunOn, without work mode.
function Lights:onAutomatedTrainTravelActive() end

--- AI driving: automatic lighting according to environment.isSunOn, without work mode.
function Lights:onAIDriveableActive() end

--- End of AI driving: turns off the lights if nobody controls the vehicle and cuts the beacons.
function Lights:onAIDriveableEnd() end

--- Start of AI work: cuts the beacons.
function Lights:onAIFieldWorkerStart() end

--- AI work in progress: automatic lighting according to environment.isSunOn, in work mode.
function Lights:onAIFieldWorkerActive() end

--- AI blocked by an obstacle: turns on the beacons.
function Lights:onAIJobVehicleBlock() end

--- AI resumes driving: cuts the beacons.
function Lights:onAIJobVehicleContinue() end

--- End of AI work: turns off the lights if nobody controls the vehicle and cuts the beacons.
function Lights:onAIFieldWorkerEnd() end

--- Called by the physics: brake lights according to the brake pedal (excluding automatic braking) and reverse lights according to speed (reverseLightActivationSpeed threshold) or a negative throttle pedal, if the reverser direction is normal.
---@param acceleratorPedal any
---@param brakePedal any
---@param automaticBrake any
---@param currentSpeed any
function Lights:onVehiclePhysicsUpdate(acceleratorPedal, brakePedal, automaticBrake, currentSpeed) end

--- Loads a real-light profile (default, top, bottom, brake, reverse, turn signals, interior) through RealLight.loadLightsFromXML; interior lights receive getInteriorLightBrightness as their load function.
---@param xmlFile any
---@param key any
---@param lightTable any
---@param realLightToLight any
function Lights:loadRealLightSetup(xmlFile, key, lightTable, realLightToLight) end

--- Adds an extra light type to the lights of a list and, if requested, flags them as blinking.
---@param lights any
---@param lightType any
---@param isBlinking any
function Lights:applyAdditionalActiveLightType(lights, lightType, isBlinking) end

--- Input callback: toggles the LIGHT_TYPE_DEFAULT type bit in the mask.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleLightFront(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: moves to the next light state (setNextLightsState(1)).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleLights(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: moves to the previous light state (setNextLightsState(-1)).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleLightsBack(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: toggles the rear work lights bit.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleWorkLightBack(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: toggles the front work lights bit.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleWorkLightFront(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: toggles the high beam bit.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleHighBeamLight(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: turns the hazard lights on or off.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleTurnLightHazard(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: turns the left turn signal on or off.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleTurnLightLeft(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: turns the right turn signal on or off.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleTurnLightRight(self, actionName, inputValue, callbackState, isAnalog) end

--- Input callback: toggles the beacons.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Lights.actionEventToggleBeaconLights(self, actionName, inputValue, callbackState, isAnalog) end

--- Registers the TOGGLE_LIGHTS_EXTERNAL input action of an external trigger; its callback moves the vehicle to the next light state.
---@param data any
---@param vehicle any
function Lights.externalActionEventRegister(data, vehicle) end

--- Update of the external action: empty body.
---@param data any
---@param vehicle any
function Lights.externalActionEventUpdate(data, vehicle) end

--- Reads the lighting dashboard attributes (#lightTypes, #excludedLightTypes) and initializes the state of each type.
---@param self any
---@param xmlFile any
---@param key any
---@param dashboard any
---@param isActive any
function Lights.dashboardLightAttributes(self, xmlFile, key, dashboard, isActive) end

--- Computes the state of a lighting dashboard: multi-state (one state per light type that is on) or single value.
---@param self any
---@param dashboard any
---@param newValue any
---@param minValue any
---@param maxValue any
---@param isActive any
function Lights.dashboardLightState(self, dashboard, newValue, minValue, maxValue, isActive) end

--- Development console command: toggles top/bottom lights of the occupied vehicle.
function Lights.consoleCommandTopLights() end

--- Development console command: switches the LIGHTS_PROFILE setting between low and very high (logs the result).
function Lights.consoleCommandProfile() end
