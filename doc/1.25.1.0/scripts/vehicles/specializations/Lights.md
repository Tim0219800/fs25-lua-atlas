# vehicles/specializations/Lights.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Lights.md)*

Source: `dataS/scripts/vehicles/specializations/Lights.lua` — FS25 1.25.1.0

✍ Vehicle lighting specialization (spec_lights): dipped/main beams, work lights, brake, reverse, turn signals, beacons, interior lights, daytime lights, top/bottom lights. It drives two families of lights described in the vehicle XML: static lights (StaticLight: emissive materials/shaders, no light source) and real lights (RealLight: engine light sources). The StaticLight, SharedLight, StaticLightCompound and BeaconLight classes are in other files; only RealLight.lua is present in the dump (vehicles/specializations/components/RealLight.lua).

DATA MODEL. State is a bit mask spec.lightsTypesMask: bit n matches light type n. The values of the Lights.LIGHT_TYPE_* and Lights.TURNLIGHT_* constants are UNVERIFIED: they are defined in the file header, whose lines are blank in the dump (we only see that LIGHT_TYPE_DEFAULT, LIGHT_TYPE_WORK_BACK, LIGHT_TYPE_WORK_FRONT and LIGHT_TYPE_HIGHBEAM exist). The "base" types go up to maxLightState (at least HIGHBEAM); the specialization adds eight types right after: bottomLight, topLight, brakeLight, turnLightLeft, turnLightRight, turnLightAny, reverseLight, interiorLight (total limit of 31 bits, onLoad). The successive states of the light key come from vehicle.lights.states.state(?)#lightTypes; automaticState#lightTypes (default "0") and #lightTypesWork (default "0 1 2") are used for automatic lighting.

REAL LIGHTS AND PROFILES. Two sets of real lights are loaded: realLights.low and realLights.high. Only one is active: getUseHighProfile compares the LIGHTS_PROFILE setting to GS_PROFILE_HIGH (a setting that Platform.gameplay.lightsProfile can force). In setLightsTypesMask the inactive profile receives a zero mask. For a fog mod: to know whether a headlight is on, read getLightsTypesMask() and test the wanted bit, or listen to the onLightsTypesMaskChanged event; to find the light source of a headlight, use getRealLightFromNode then the fields of the RealLight object. Note in RealLight.lua: light scattering in the air (setLightUseLightScattering, setLightScatteringConeAngle, setLightScatteringIntensity fixed at 1) is enabled by RealLight:updateLightScattering (components/RealLight.lua:212-258) only if the source has a range above 7.5, with the high profile for default/high-beam lights and the very high profile for the other typed lights. This is the native "visible beam" effect; how it renders in fog and how it interacts with the engine fog are UNVERIFIED (engine code and the Environment class are absent from the dump).

NETWORK. The server adds the extra bits itself (turn signals, top/bottom, brake, reverse, interior) and broadcasts VehicleSetLightEvent (mask over totalNumLightTypes bits); the client receives the full mask but recomputes the top/bottom and interior bits locally. Turn signals (VehicleSetTurnLightEvent) and beacons (VehicleSetBeaconLightEvent) have their own event. On connection, onWriteStream sends the mask and the beacon state.

TIMING. No dt in this file: blinking is computed from getShaderTimeSec(); onUpdate keeps calling raiseActive while a turn signal is active. Daytime lights follow onStartMotor / onStopMotor. Automatic lighting (updateAutomaticLights) depends only on environment.isSunOn (Environment is absent from the dump): no reading of fog, rain or visibility appears here. Interior light brightness depends on the time of day (see getInteriorLightBrightness).

EXTENSION POINTS. Declared events: onTurnLightStateChanged, onTopLightsVisibilityChanged, onBrakeLightsVisibilityChanged, onReverseLightsVisibilityChanged, onLightsTypesMaskChanged, onBeaconLightsVisibilityChanged. Functions overridden here: loadDashboardGroupFromXML, getIsDashboardGroupActive. Functions meant to be overridden by other specializations: getIsActiveForInteriorLights (false here, overridden by Motorized) and getDeactivateLightsOnLeave (true here, overridden by Motorized). Message center subscriptions: DAY_NIGHT_CHANGED, change of the LIGHTS_PROFILE setting, change of the REAL_BEACON_LIGHTS setting. Note: they are made in onLoad and no unsubscription appears in this file, including in onDelete (not verified in game).

- **Lights** (l.21)

## Functions

| Function | Line | Description |
|---|---|---|
| `Lights.prerequisitesPresent(specializations: table) → boolean` | 68 | ✍ Always returns true: no specialization prerequisite. |
| `Lights.initSpecialization()` | 74 | ✍ Registers the "beaconLight" configuration type and the XML paths: light states, static lights by category (default, top, bottom, brake, reverse, daytime, turn signals), compounds, shared lights, beacons (with #alwaysActive and configurations), sounds, dashboards and the #isTopLight / #isBottomLight attributes. #reverseLightActivationSpeed defaults to 1 km/h. |
| `Lights.registerRealLightSetupXMLPath(schema: any, basePath: any)` | 132 | ✍ Registers, for one real-light profile (low or high), the sub-keys light, topLight, bottomLight, brakeLight, reverseLight, dayTimeLight, turnLightLeft, turnLightRight and interiorLight through RealLight.registerXMLPaths. |
| `Lights.registerEvents(vehicleType: any)` | 146 | ✍ Declares the six events published by the specialization (turn signals, top lights, brake, reverse, types mask, beacons). |
| `Lights.registerFunctions(vehicleType: any)` | 157 | ✍ Registers the public lighting functions (mask, beacons, turn signals, top/brake/reverse/interior lights, access to lights by node, automatic lighting). |
| `Lights.registerOverwrittenFunctions(vehicleType: any)` | 192 | ✍ Overrides loadDashboardGroupFromXML and getIsDashboardGroupActive to add the light type filters. |
| `Lights.registerEventListeners(vehicleType: any)` | 199 | ✍ Subscribes the specialization to the lifecycle, the network, input actions, vehicle enter/leave, the engine (onStartMotor/onStopMotor), attaching, the AI and the automated train, vehicle physics (onVehiclePhysicsUpdate) and the change of top-light requirement. |
| `Lights:onLoad(savegame: table)` | 233 | ✍ Reads the reverse speed threshold (XML value in km/h divided by 3600), the light states and the automatic masks, loads the real lights (low and high profiles), static lights, compounds, shared lights and beacons (configuration and always-active), computes maxLightState and the eight extra types, loads the sounds and subscribes to day/night messages and light settings. Note: the "self.isClient ~= nil" test before loading the sounds is true even on the server (probable intent: self.isClient; not verified in game). |
| `Lights:onLoadFinished(savegame: table)` | 414 | ✍ Adds the extra types to the type lists of the top/bottom/brake/reverse/turn/interior lights (turn signals flagged as blinking), finalizes each real light (realLight:finalize) and, in the showroom, turns on the daytime lights. |
| `Lights:onRegisterDashboardValueTypes()` | 453 | ✍ Registers the lighting dashboard values (light state, turn signals, beacon). Not reread in detail. |
| `Lights:onDelete()` | 525 | ✍ Deletes shared lights, beacons, light XML files still loading, releases the shared I3Ds, clears the compounds and deletes the sounds. No message center unsubscription appears in it. |
| `Lights:onReadStream(streamId: integer, connection: Connection)` | 573 | ✍ Read on connection: types mask (totalNumLightTypes bits) then beacon state, applied without sending anything back over the network. |
| `Lights:onWriteStream(streamId: integer, connection: Connection)` | 587 | ✍ Writes the types mask and the beacon state on connection. |
| `Lights:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 599 | ✍ Client: while a turn signal is active, computes a 0 to 1 load coefficient from the fraction of shader time (one-second period) and applies it to the left/right turn lights; plays the turn signal sound each period for the active vehicle; keeps the vehicle active. No dt used. |
| `Lights:onUpdateTick(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 635 | ✍ Client: enables or cuts the "always active" beacons when the vehicle becomes active for lights, updates the interior lights, the input action activity and, if Platform.gameplay.automaticLights, the automatic lighting of the root vehicle not driven by the AI according to environment.isSunOn and the driving direction. |
| `Lights:getIsActiveForLights(onlyPowered: any) → boolean` | 670 | ✍ True if the player is in the vehicle and can control the lights, or if the attacher vehicle is (recursive). With onlyPowered, requires getIsPowered. |
| `Lights:getIsActiveForInteriorLights() → boolean` | 691 | ✍ Returns false by default; Motorized overrides it to return true when the ignition is on. |
| `Lights:getCanToggleLight() → boolean` | 698 | ✍ False if the AI is driving or if no light type is defined; otherwise true only for the vehicle currently occupied by the local player. |
| `Lights:getUseHighProfile() → boolean` | 719 | ✍ True if the LIGHTS_PROFILE setting (or Platform.gameplay.lightsProfile if set) is greater than or equal to GS_PROFILE_HIGH: selects the real lights of the high profile. |
| `Lights:setNextLightsState(increment: any)` | 728 | ✍ Moves to the next (or previous) light state in the XML state list, wraps to zero after the last one or if lights were on from state 0, rebuilds the mask keeping the extra bits, then calls setLightsTypesMask. |
| `Lights:setLightsTypesMask(lightsTypesMask: integer, force: boolean, noEventSend: boolean) → boolean` | 761 | ✍ Core of the system: composes the extra bits (server: turn signals, top/bottom, brake, reverse, interior; client: top/bottom and interior locally), broadcasts VehicleSetLightEvent unless noEventSend, plays the switch sound if the base bits change, applies the mask to all static lights and compounds and to the real lights of the active profile (mask 0 for the other), updates the dashboard and raises onLightsTypesMaskChanged. Entry point to observe to sync a fog effect with headlights. |
| `Lights:getLightsTypesMask() → integer` | 871 | ✍ Returns the current mask of active light types. |
| `Lights:setBeaconLightsVisibility(visibility: boolean, force: boolean, noEventSend: boolean) → boolean` | 881 | ✍ Turns the beacons on or off, broadcasts VehicleSetBeaconLightEvent, also sets the "device" state if the vehicle is active for input, updates the dashboard and raises onBeaconLightsVisibilityChanged. |
| `Lights:getBeaconLightsVisibility() → boolean` | 919 | ✍ Returns the beacon state. |
| `Lights:setTurnLightState(state: integer, force: boolean, noEventSend: boolean) → boolean` | 929 | ✍ Sets the turn signal state (Lights.TURNLIGHT_* constants), broadcasts VehicleSetTurnLightEvent, remembers the active light profile for the turn signals, resets the sound repeat counter, recomputes the mask on the server and raises onTurnLightStateChanged. |
| `Lights:getTurnLightState() → integer` | 967 | ✍ Returns the turn signal state. |
| `Lights:setTopLightsVisibility(visibility: boolean) → boolean` | 975 | ✍ Chooses between top and bottom lights, recomputes the mask without network broadcast and raises onTopLightsVisibilityChanged. |
| `Lights:setBrakeLightsVisibility(visibility: boolean) → boolean` | 993 | ✍ Turns the brake light bit on or off, recomputes the mask and raises onBrakeLightsVisibilityChanged. |
| `Lights:setReverseLightsVisibility(visibility: boolean) → boolean` | 1011 | ✍ Turns the reverse light bit on or off, recomputes the mask and raises onReverseLightsVisibilityChanged. |
| `Lights:setInteriorLightsVisibility(visibility: boolean) → boolean` | 1029 | ✍ Turns the interior lights on or off depending on the time-of-day brightness (off if it is 0); forces the mask to be recomputed without broadcast. |
| `Lights:getInteriorLightBrightness(updateState: boolean) → number, boolean` | 1051 | ✍ Returns the interior brightness from 0 to 1 based on the game time (currentHour and currentMinute of environment, absent from the dump): linear decrease until 10 h, zero between 10 h and 16 h, increasing after 16 h; with updateState, recomputes it and reports whether it changed. |
| `Lights:deactivateLights(keepHazardLightsOn: any)` | 1076 | ✍ Turns everything off: mask to 0, beacons and turn signals (hazard kept if requested), brake, reverse, interior; resets the light state to zero. |
| `Lights:deactivateBeaconLights()` | 1093 | ✍ Deactivates the real beacons and their device state. |
| `Lights:loadDashboardGroupFromXML(superFunc: any, xmlFile: any, key: any, group: any)` | 1103 | ✍ Override: additionally reads #lightTypes and #excludedLightTypes for a dashboard group. |
| `Lights:getIsDashboardGroupActive(superFunc: any, group: any)` | 1116 | ✍ Override: a group is active only if at least one requested light type is on and no excluded type is. |
| `Lights:getDeactivateLightsOnLeave()` | 1149 | ✍ Returns true by default (overridden by Motorized): the lights turn off when leaving the vehicle. |
| `Lights:loadSharedLight(xmlFile: any, key: any)` | 1155 | ✍ Loads a shared light (SharedLight) from the XML; on success adds it to the list and, if it has a compound, to the compounds list. |
| `Lights:loadAdditionalLightAttributesFromXML(xmlFile: any, key: any, light: any)` | 1171 | ✍ Reads #isTopLight and #isBottomLight (false by default) of a light. |
| `Lights:getIsLightActive(light: any)` | 1180 | ✍ A "top" light is active only if top lights are visible, a "bottom" light only if they are not, the others always. |
| `Lights:getStaticLightFromNode(node: any)` | 1196 | ✍ Looks up a static light by its node across all categories; nil otherwise. |
| `Lights:getRealLightFromNode(node: any)` | 1209 | ✍ Looks up a real light by its node in both profiles; nil otherwise. |
| `Lights:updateAutomaticLights(isTurnedOn: any, isWorking: any)` | 1224 | ✍ Applies the automatic mask (work or not) if on, otherwise cuts everything if a non-zero mask is present. |
| `Lights:lightsWeatherChanged()` | 1241 | ✍ Day/night message callback: shows the "lights" action text only when the sun is down (environment.isSunOn false). |
| `Lights:onLightsProfileChanged(lightsProfile: any)` | 1248 | ✍ Callback for the lighting profile change: informs each real light, then reapplies the mask without broadcast (switches the active real lights). |
| `Lights:onLightsRealBeaconLightChanged()` | 1264 | ✍ Callback for the "real beacons" setting: informs each beacon. |
| `Lights:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1273 | ✍ Registers the light keys (lights, back, front, front/back work, high beam, turn signals, hazard, beacon) for the occupied vehicle; hides their help text except the lights one, visible at night. |
| `Lights:onRegisterExternalActionEvents(trigger: any, name: any, xmlFile: any, key: any)` | 1311 | ✍ Registers the external "lights" action of a trigger if the vehicle has light states. |
| `Lights:onEnterVehicle(isControlling: any)` | 1322 | ✍ On entering, reapplies mask, beacons and turn signals, forcing the state. |
| `Lights:onLeaveVehicle()` | 1332 | ✍ On leaving, turns off lights and beacons if getDeactivateLightsOnLeave, and cuts the beacons' device state. |
| `Lights:onDeactivate()` | 1346 | ✍ Deactivates the beacons if getDeactivateLightsOnLeave. |
| `Lights:onRequiresTopLightsChanged(requiresTopLights: any)` | 1354 | ✍ Reacts to the top-light requirement event by calling setTopLightsVisibility. |
| `Lights:onStartMotor()` | 1360 | ✍ Reapplies the mask and turns on the daytime lights. |
| `Lights:onStopMotor()` | 1371 | ✍ Reapplies the mask and turns off the daytime lights (except in the showroom). |
| `Lights:onStartReverseDirectionChange()` | 1382 | ✍ Reapplies the mask (forced) if any lights are on. |
| `Lights:onPostAttach(attacherVehicle: any, inputJointDescIndex: any, jointDescIndex: any)` | 1392 | ✍ An attached implement copies mask, beacons and turn signals from the attacher vehicle, if it exposes getLightsTypesMask. |
| `Lights:onPostDetach()` | 1402 | ✍ Turns off all lights of the detached implement. |
| `Lights:onAutomatedTrainTravelActive()` | 1408 | ✍ Automated train: automatic lighting according to environment.isSunOn, without work mode. |
| `Lights:onAIDriveableActive()` | 1414 | ✍ AI driving: automatic lighting according to environment.isSunOn, without work mode. |
| `Lights:onAIDriveableEnd()` | 1420 | ✍ End of AI driving: turns off the lights if nobody controls the vehicle and cuts the beacons. |
| `Lights:onAIFieldWorkerStart()` | 1432 | ✍ Start of AI work: cuts the beacons. |
| `Lights:onAIFieldWorkerActive()` | 1438 | ✍ AI work in progress: automatic lighting according to environment.isSunOn, in work mode. |
| `Lights:onAIJobVehicleBlock()` | 1444 | ✍ AI blocked by an obstacle: turns on the beacons. |
| `Lights:onAIJobVehicleContinue()` | 1450 | ✍ AI resumes driving: cuts the beacons. |
| `Lights:onAIFieldWorkerEnd()` | 1456 | ✍ End of AI work: turns off the lights if nobody controls the vehicle and cuts the beacons. |
| `Lights:onVehiclePhysicsUpdate(acceleratorPedal: any, brakePedal: any, automaticBrake: any, currentSpeed: any)` | 1468 | ✍ Called by the physics: brake lights according to the brake pedal (excluding automatic braking) and reverse lights according to speed (reverseLightActivationSpeed threshold) or a negative throttle pedal, if the reverser direction is normal. |
| `Lights:loadRealLightSetup(xmlFile: any, key: any, lightTable: any, realLightToLight: any)` | 1480 | ✍ Loads a real-light profile (default, top, bottom, brake, reverse, turn signals, interior) through RealLight.loadLightsFromXML; interior lights receive getInteriorLightBrightness as their load function. |
| `Lights:applyAdditionalActiveLightType(lights: any, lightType: any, isBlinking: any)` | 1498 | ✍ Adds an extra light type to the lights of a list and, if requested, flags them as blinking. |
| `Lights.actionEventToggleLightFront(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1510 | ✍ Input callback: toggles the LIGHT_TYPE_DEFAULT type bit in the mask. |
| `Lights.actionEventToggleLights(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1522 | ✍ Input callback: moves to the next light state (setNextLightsState(1)). |
| `Lights.actionEventToggleLightsBack(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1530 | ✍ Input callback: moves to the previous light state (setNextLightsState(-1)). |
| `Lights.actionEventToggleWorkLightBack(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1538 | ✍ Input callback: toggles the rear work lights bit. |
| `Lights.actionEventToggleWorkLightFront(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1548 | ✍ Input callback: toggles the front work lights bit. |
| `Lights.actionEventToggleHighBeamLight(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1558 | ✍ Input callback: toggles the high beam bit. |
| `Lights.actionEventToggleTurnLightHazard(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1568 | ✍ Input callback: turns the hazard lights on or off. |
| `Lights.actionEventToggleTurnLightLeft(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1581 | ✍ Input callback: turns the left turn signal on or off. |
| `Lights.actionEventToggleTurnLightRight(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1594 | ✍ Input callback: turns the right turn signal on or off. |
| `Lights.actionEventToggleBeaconLights(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1607 | ✍ Input callback: toggles the beacons. |
| `Lights.externalActionEventRegister(data: any, vehicle: any)` | 1616 | ✍ Registers the TOGGLE_LIGHTS_EXTERNAL input action of an external trigger; its callback moves the vehicle to the next light state. |
| `Lights.externalActionEventUpdate(data: any, vehicle: any)` | 1629 | ✍ Update of the external action: empty body. |
| `Lights.dashboardLightAttributes(self: any, xmlFile: any, key: any, dashboard: any, isActive: any)` | 1634 | ✍ Reads the lighting dashboard attributes (#lightTypes, #excludedLightTypes) and initializes the state of each type. |
| `Lights.dashboardLightState(self: any, dashboard: any, newValue: any, minValue: any, maxValue: any, isActive: any)` | 1647 | ✍ Computes the state of a lighting dashboard: multi-state (one state per light type that is on) or single value. |
| `Lights.consoleCommandTopLights()` | 1669 | ✍ Development console command: toggles top/bottom lights of the occupied vehicle. |
| `Lights.consoleCommandProfile()` | 1680 | ✍ Development console command: switches the LIGHTS_PROFILE setting between low and very high (logs the result). |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onTurnLightStateChanged` | 147 |
| registerEvent | `onTopLightsVisibilityChanged` | 148 |
| registerEvent | `onBrakeLightsVisibilityChanged` | 149 |
| registerEvent | `onReverseLightsVisibilityChanged` | 150 |
| registerEvent | `onLightsTypesMaskChanged` | 151 |
| registerEvent | `onBeaconLightsVisibilityChanged` | 152 |
| registerFunction | `loadRealLightSetup` | 158 |
| registerFunction | `applyAdditionalActiveLightType` | 159 |
| registerFunction | `getIsActiveForLights` | 160 |
| registerFunction | `getIsActiveForInteriorLights` | 161 |
| registerFunction | `getCanToggleLight` | 162 |
| registerFunction | `getUseHighProfile` | 163 |
| registerFunction | `setNextLightsState` | 164 |
| registerFunction | `setLightsTypesMask` | 165 |
| registerFunction | `getLightsTypesMask` | 166 |
| registerFunction | `setTurnLightState` | 167 |
| registerFunction | `getTurnLightState` | 168 |
| registerFunction | `setTopLightsVisibility` | 169 |
| registerFunction | `setBrakeLightsVisibility` | 170 |
| registerFunction | `setBeaconLightsVisibility` | 171 |
| registerFunction | `getBeaconLightsVisibility` | 172 |
| registerFunction | `setReverseLightsVisibility` | 173 |
| registerFunction | `setInteriorLightsVisibility` | 174 |
| registerFunction | `getInteriorLightBrightness` | 175 |
| registerFunction | `deactivateLights` | 176 |
| registerFunction | `getDeactivateLightsOnLeave` | 177 |
| registerFunction | `loadSharedLight` | 178 |
| registerFunction | `loadAdditionalLightAttributesFromXML` | 179 |
| registerFunction | `getIsLightActive` | 180 |
| registerFunction | `getStaticLightFromNode` | 181 |
| registerFunction | `getRealLightFromNode` | 182 |
| registerFunction | `updateAutomaticLights` | 183 |
| registerFunction | `lightsWeatherChanged` | 184 |
| registerFunction | `onLightsProfileChanged` | 185 |
| registerFunction | `onLightsRealBeaconLightChanged` | 186 |
| registerFunction | `deactivateBeaconLights` | 187 |
| registerOverwrittenFunction | `loadDashboardGroupFromXML` | 193 |
| registerOverwrittenFunction | `getIsDashboardGroupActive` | 194 |
| registerEventListener | `onLoad` | 200 |
| registerEventListener | `onLoadFinished` | 201 |
| registerEventListener | `onRegisterDashboardValueTypes` | 202 |
| registerEventListener | `onDelete` | 203 |
| registerEventListener | `onReadStream` | 204 |
| registerEventListener | `onWriteStream` | 205 |
| registerEventListener | `onUpdate` | 206 |
| registerEventListener | `onUpdateTick` | 207 |
| registerEventListener | `onRegisterActionEvents` | 208 |
| registerEventListener | `onRegisterExternalActionEvents` | 209 |
| registerEventListener | `onEnterVehicle` | 210 |
| registerEventListener | `onLeaveVehicle` | 211 |
| registerEventListener | `onStartMotor` | 212 |
| registerEventListener | `onStopMotor` | 213 |
| registerEventListener | `onStartReverseDirectionChange` | 214 |
| registerEventListener | `onPostAttach` | 215 |
| registerEventListener | `onPostDetach` | 216 |
| registerEventListener | `onAutomatedTrainTravelActive` | 217 |
| registerEventListener | `onAIDriveableActive` | 218 |
| registerEventListener | `onAIDriveableEnd` | 219 |
| registerEventListener | `onAIFieldWorkerStart` | 220 |
| registerEventListener | `onAIFieldWorkerActive` | 221 |
| registerEventListener | `onAIJobVehicleBlock` | 222 |
| registerEventListener | `onAIJobVehicleContinue` | 223 |
| registerEventListener | `onAIFieldWorkerEnd` | 224 |
| registerEventListener | `onVehiclePhysicsUpdate` | 225 |
| registerEventListener | `onDeactivate` | 226 |
| registerEventListener | `onRequiresTopLightsChanged` | 227 |

## Messages

- subscribes `MessageType.DAY_NIGHT_CHANGED` (l.404)
- subscribes `MessageType.SETTING_CHANGED` (l.407)
- subscribes `MessageType.SETTING_CHANGED` (l.408)
