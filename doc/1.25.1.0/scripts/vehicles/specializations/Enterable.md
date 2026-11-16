# vehicles/specializations/Enterable.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Enterable.md)*

Source: `dataS/scripts/vehicles/specializations/Enterable.lua` — FS25 1.25.1.0

✍ Vehicle specialization (no prerequisite declared in the lines re-read) for any vehicle a player can get into: occupation state (isEntered = this client drives; isControlled = someone drives, including another player), vehicle cameras (VehicleCamera), mirrors, character at the wheel, rain/hail sounds in the cab, dashboard (time, outside temperature), enter/leave actions, camera switching. CAMERA / CAB VIEW: cameras are loaded from vehicle.enterable.cameras.camera(i) (loadCamerasFromXML) and the active camera is spec.activeCamera (accessible via getActiveCamera). setActiveCameraIndex is the central point of a view change: it switches three systems to "indoor" mode depending on the camera's useOutdoorSounds flag (g_soundManager:setIsIndoor, ambientSoundSystem:setIsIndoor, g_currentMission.environment.environmentMaskSystem:setIsIndoor: exact effect on the visual weather UNVERIFIED, classes absent from the dump), sets g_currentMission.environmentAreaSystem:setReferenceNode(activeCamera.cameraNode) (the vehicle camera serves as reference point for the environment areas: UNVERIFIED), handles mirror visibility and raises the event onCameraChanged(camera, index). A mod that needs to know whether the player is in cab view can read spec.activeCamera.isInside (a field also read to enable head tracking) or listen to onCameraChanged; on leaving the vehicle the three "indoor" flags are reset to false. Also: the camera update is done in onPostUpdate with dt (ms) only if the vehicle is entered by this client; the update of the character and mirrors is in onPostUpdate. WEATHER DATA READ: spec.weatherObject = g_currentMission.environment.weather (Enterable.lua:340); onUpdate (client, controlled vehicle) reads weather:getRainFallScale() > 0 to start or stop the "rain" sound samples (XML vehicle.enterable.sounds) and weather:getIsHailing() for "hail"; the dashboard registers the values "time", "timeHours", "timeMinutes" (environment:getEnvironmentTime) and "outsideTemperature" (weather:getCurrentTemperature). Units/ranges: Weather and Environment absent from the dump, UNVERIFIED. No reading of soil moisture, wind or dirt here. Note: onUpdate tests the rain sound on rain > 0 without the 0.1 threshold used by Washable/VehicleSystem, and ignores the indoor mask; this discrepancy between systems is an observation of the code. NETWORK: the initial stream sends isTabbable, the "controlled" state and the player id to the joining client (onReadStream/onWriteStream); no continuous update stream in this specialization; entering/leaving is driven by the player logic (player:requestToEnterVehicle, g_localPlayer:leaveVehicle), which calls onPlayerEnterVehicle / onPlayerLeaveVehicle on all machines. onUpdate calls rootVehicle:raiseActive() while the vehicle is controlled so that it stays active. Peculiarity: onLoad sets self.needWaterInfo = true (field read elsewhere, usage UNVERIFIED). Declared events: onEnterVehicle(isControlling), onLeaveVehicle(wasEntered), onCameraChanged, onVehicleCharacterChanged. Extension points for a modder: listen to these events (e.g. to enable an effect only when the view is interior), or override getIsActive / getIsActiveForInput / getDistanceToNode / interact (declared as overrides). Note: Enterable.getIsInteractive is registered as an override (line 154) but is not defined in this file (not verified in game: nil function or defined elsewhere). Parts not re-read in detail: character target modifiers (IK), XML sections of initSpecialization, input actions.

- **Enterable** (l.11)

## Functions

| Function | Line | Description |
|---|---|---|
| `Enterable.prerequisitesPresent(specializations: any)` | 20 | ✍ Checks the required specializations (not re-read in detail). |
| `Enterable.initSpecialization()` | 26 | ✍ Registers the XML schema of the specialization (cameras, mirrors, enter/exit nodes, character, sounds, dashboards) and the savegame keys. Not re-read in detail. |
| `Enterable.registerEvents(vehicleType: any)` | 92 | ✍ Declares the events onEnterVehicle, onLeaveVehicle, onCameraChanged, onVehicleCharacterChanged. |
| `Enterable.registerFunctions(vehicleType: any)` | 101 | ✍ Registers the functions of the specialization (cameras, character, enter state, leaving, mirrors...). They can be replaced by a mod. |
| `Enterable.registerOverwrittenFunctions(vehicleType: any)` | 148 | ✍ Declares the overrides: getIsActive, getIsActiveForInput, getDistanceToNode, getInteractionHelp, interact, getIsInteractive (not defined here), getCanToggleSelectable, getCanToggleAttach, getActiveFarm, loadDashboardGroupFromXML, getIsDashboardGroupActive, mountDynamic, getIsInUse, loadExtraDependentParts, updateExtraDependentParts, getIsMapHotspotVisible. |
| `Enterable.registerEventListeners(vehicleType: any)` | 169 | ✍ Subscribes the specialization to onLoad, onPostLoad, onLoadFinished, onRegisterDashboardValueTypes, onDelete, initial network stream, onPreUpdate, onUpdate, onPostUpdate, onDrawUIInfo, input actions and onSetBroken. |
| `Enterable:onLoad(savegame: any)` | 188 | ✍ Loads the mirror maps, cameras, character, enter/exit nodes, hotspot, interaction radius; stores the weather world (spec.weatherObject), loads the rain and hail sounds (client), creates a default reverb reference node 2 m above the vehicle, enables needWaterInfo, and registers the vehicle in VehicleSystem (interactive and enterable lists). Not fully re-read. |
| `Enterable:onPostLoad(savegame: any)` | 372 | ✍ Camera post-load; restores from the savegame the active camera index, isTabbable and isLeavingAllowed (unless reset). |
| `Enterable:onLoadFinished(savegame: any)` | 388 | ✍ If the vehicle is already controlled (joining client), adds the player's map hotspot. |
| `Enterable:onRegisterDashboardValueTypes()` | 398 | ✍ Declares the dashboard values time, timeHours, timeMinutes (environment:getEnvironmentTime), operatingTime and outsideTemperature (weather:getCurrentTemperature). |
| `Enterable:onDelete()` | 422 | ✍ Makes the player leave if the vehicle is controlled, frees character, cameras, hotspot, sounds, forgets weatherObject and removes itself from the VehicleSystem lists. |
| `Enterable:onReadStream(streamId: integer, connection: Connection)` | 461 | ✍ Joining client: reads isTabbable and, if the vehicle is controlled, the player id to make it enter (player:onEnterVehicle). |
| `Enterable:onWriteStream(streamId: integer, connection: Connection)` | 479 | ✍ Server: writes isTabbable, the controlled state and the id of the controlling player. |
| `Enterable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 491 | ✍ Saves each camera, the active camera index, isTabbable and isLeavingAllowed. |
| `Enterable:saveStatsToXMLFile(xmlFile: any, key: any) → string` | 505 | ✍ Writes the controller name into the game statistics if the vehicle is controlled. |
| `Enterable:onPreUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 521 | ✍ Counts down, frame by frame, the dirty states of the character target modifiers and re-triggers them. |
| `Enterable:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 549 | ✍ Per frame, only if the vehicle is controlled. Client: updates the character target modifiers, toggles the additional character, starts/stops the rain (weather:getRainFallScale() > 0) and hail (weather:getIsHailing()) sounds on state change, gives the vehicle position and direction to activatableObjectsSystem if active for input. In all cases, calls rootVehicle:raiseActive(). |
| `Enterable:onPostUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 622 | ✍ Client: updates the character spine (depending on acceleration), the active camera (dt, only if the vehicle is entered locally and after the first update), the character visibility, the character animation and shows the mirrors if the camera uses them. |
| `Enterable:onDrawUIInfo()` | 660 | ✍ Displays the driver's nickname above the vehicle in multiplayer if the UI is visible, the SHOW_MULTIPLAYER_NAMES setting is on, and the camera is within Enterable.NICKNAME_RENDER_DISTANCE (constant outside the file: UNVERIFIED). |
| `Enterable:loadCamerasFromXML(xmlFile: any, savegame: any)` | 680 | ✍ Loads all the cameras (VehicleCamera) of the XML vehicle.enterable.cameras.camera(i) and stores their count. |
| `Enterable:loadAdditionalCharacterFromXML(xmlFile: any)` | 707 | ✍ Loads the targets and node of an additional character (not re-read in detail). |
| `Enterable:getIsAdditionalCharacterActive()` | 722 | ✍ Tells whether the additional character is active (not re-read in detail). |
| `Enterable:loadCharacterTargetNodeModifier(entry: any, xmlFile: any, xmlKey: any)` | 728 | ✍ Loads a position modifier for the character's IK targets (not re-read in detail). |
| `Enterable:updateCharacterTargetNodeModifier(dt: any, modifier: any)` | 792 | ✍ Updates an IK target modifier of the character with dt (not re-read in detail). |
| `Enterable:setCharacterTargetNodeStateDirty(referenceNode: any, forceActive: any)` | 871 | ✍ Marks the state of a character target node as needing recomputation (not re-read in detail). |
| `Enterable:resetCharacterTargetNodeStateDefaults(referenceNode: any)` | 909 | ✍ Resets the default states of the character target nodes (not re-read in detail). |
| `Enterable:onPlayerEnterVehicle(isControlling: boolean, playerStyle: integer, farmId: integer, userId: any)` | 926 | ✍ A player enters (called on all machines): marks the vehicle controlled/entered, stores farm and user, forces selection, chooses the camera (first interior camera if head tracking, camera 1 if RESET_CAMERA, otherwise the last one), calls setActiveCameraIndex, informs VehicleSystem, map hotspot, character and enter animation, raises onEnterVehicle and the ENTER_VEHICLE state notification, enables the input actions, registers the vehicle in the traffic system server side if not controlled locally. |
| `Enterable:getCanLeave()` | 1001 | ✍ True if the vehicle is entered by this client. |
| `Enterable:getCanLeaveVehicle()` | 1008 | ✍ True if one can leave a vehicle (not a mount). |
| `Enterable:getCanLeaveRideable()` | 1015 | ✍ True if one can leave a mount (rideable specialization). |
| `Enterable:getIsLeavingAllowed()` | 1022 | ✍ Tells whether leaving is allowed. |
| `Enterable:setIsLeavingAllowed(isAllowed: any)` | 1028 | ✍ Allows or forbids leaving the vehicle. |
| `Enterable:onEnterableMirrorSettingChanged()` | 1034 | ✍ Reacts to a change of the maximum mirror count setting by recomputing the visible mirrors (body not re-read). |
| `Enterable:doLeaveVehicle()` | 1041 | ✍ Asks the local player to leave the vehicle if leaving is possible and allowed. |
| `Enterable:onPlayerLeaveVehicle()` | 1052 | ✍ Player leaves: deactivates the active camera, resets to false the "indoor" flags of sound, ambience and the environment mask system, stops the rain/hail sounds, removes the hotspot, resets the state (controlled, entered), plays the leave animation in reverse, hides the mirrors, raises onLeaveVehicle and the LEAVE_VEHICLE notification, disables the input actions and the traffic, deactivates the vehicle if getDeactivateOnLeave. |
| `Enterable:getIsMapHotspotVisible(superFunc: any)` | 1125 | ✍ Override: the vehicle's map hotspot is visible only if it is not controlled. |
| `Enterable:setActiveCameraIndex(index: integer)` | 1136 | ✍ Changes the active camera (back to 1 if out of range): deactivates the old one, activates the new one, sets the indoor flags (sound, ambience, environmentMaskSystem) according to useOutdoorSounds, updates the mirrors, sets the environmentAreaSystem reference node to the camera, raises onCameraChanged. Does nothing if the requested camera is already active. |
| `Enterable:addToolCameras(cameras: table)` | 1168 | ✍ Adds to the camera list those of an attached tool. |
| `Enterable:removeToolCameras(cameras: table)` | 1180 | ✍ Removes tool cameras and, if one was active, goes back to camera 1. |
| `Enterable:getExitNode(player: any)` | 1213 | ✍ Returns the vehicle's exit node (exitPoint). |
| `Enterable:getUserPlayerStyle()` | 1220 | ✍ Returns the player style stored on entering. |
| `Enterable:getCurrentPlayerStyle()` | 1226 | ✍ Returns the style of the character currently displayed, or nil. |
| `Enterable:setVehicleCharacter(playerStyle: any)` | 1237 | ✍ Deletes then reloads the vehicle character with a player style, possibly adapted by a custom vehicle preset. |
| `Enterable:vehicleCharacterLoaded(loadingState: any, arguments: any)` | 1265 | ✍ Callback at the end of character loading (not re-read in detail). |
| `Enterable:onPlayerStyleChanged(style: any, userId: any)` | 1279 | ✍ Reacts to a player style change (not re-read in detail). |
| `Enterable:setRandomVehicleCharacter(helper: any)` | 1294 | ✍ Loads a random character (AI/helpers, not re-read in detail). |
| `Enterable:restoreVehicleCharacter()` | 1310 | ✍ Restores the vehicle character (not re-read in detail). |
| `Enterable:deleteVehicleCharacter()` | 1323 | ✍ Deletes the vehicle character (not re-read in detail). |
| `Enterable:getFormattedOperatingTime()` | 1337 | ✍ Returns the operating time in decimal hours (tens of minutes) for the dashboard. |
| `Enterable:getIsActive(superFunc: any)` | 1348 | ✍ Override: an entered or controlled vehicle is always active. |
| `Enterable:getIsActiveForInput(superFunc: any, ignoreSelection: any, activeForAI: any)` | 1359 | ✍ Override: active for input only if the parent accepts it, the player is not frozen, and this vehicle or another one in the attached chain is entered. |
| `Enterable:getDistanceToNode(superFunc: integer, node: any) → number` | 1396 | ✍ Override: if the vehicle is not controlled and a node is closer than the interaction radius of the entry point, returns that distance and sets the "enterable" interaction indicator. |
| `Enterable:getInteractionHelp(superFunc: any) → string` | 1422 | ✍ Override: returns the enter text if the current interaction is "enterable". |
| `Enterable:interact(superFunc: any, player: any)` | 1432 | ✍ Override: asks the player to enter the vehicle if the current interaction is "enterable". |
| `Enterable:setMirrorVisible(visible: any)` | 1450 | ✍ Shows or hides the mirrors: when showing, sorts by priority then by angle relative to the camera (only mirrors in the field of view) and shows only the maximum number set by the MAX_NUM_MIRRORS setting. |
| `Enterable:getIsTabbable()` | 1505 | ✍ Tells whether the vehicle takes part in switching with the tab key. |
| `Enterable:setIsTabbable(isTabbable: any)` | 1511 | ✍ Sets isTabbable (nil counts as false). |
| `Enterable:getIsEnterable()` | 1521 | ✍ True (client) if the vehicle has an entry and exit point, is neither broken nor controlled and the player has access (accessHandler). |
| `Enterable:getIsEnterableFromMenu()` | 1529 | ✍ True if enterable and allowed to be selected from the menu. |
| `Enterable:getIsEntered()` | 1535 | ✍ True if this client is in the vehicle. |
| `Enterable:getIsControlled()` | 1541 | ✍ True if a player (any) controls the vehicle. |
| `Enterable:getIsEnteredForInput()` | 1547 | ✍ True if entered and controlled. |
| `Enterable:getControllerName()` | 1554 | ✍ Driver's nickname, by connection server side or by id client side; empty string otherwise. |
| `Enterable:getActiveCamera()` | 1572 | ✍ Returns the active camera of the vehicle (VehicleCamera). |
| `Enterable:getVehicleCharacter()` | 1578 | ✍ Returns the vehicle character. |
| `Enterable:getAllowCharacterVisibilityUpdate()` | 1584 | ✍ Returns true: allows the character visibility update (replaceable). |
| `Enterable:getDisableVehicleCharacterOnLeave()` | 1590 | ✍ Tells whether the character must be deleted on leaving. |
| `Enterable:getCanToggleSelectable(superFunc: any)` | 1596 | ✍ Override: true if entered, otherwise the parent value. |
| `Enterable:getCanToggleAttach(superFunc: any)` | 1605 | ✍ Override: false if not entered, otherwise the parent value. |
| `Enterable:getActiveFarm(superFunc: any)` | 1614 | ✍ Override: returns the controller's farm if non-null, otherwise the parent's. |
| `Enterable:loadDashboardGroupFromXML(superFunc: any, xmlFile: any, key: any, group: any)` | 1627 | ✍ Override: additionally reads #isEntered on a dashboard group. |
| `Enterable:getIsDashboardGroupActive(superFunc: any, group: any)` | 1639 | ✍ Override: a dashboard group with #isEntered is active only if the entered state matches. |
| `Enterable:mountDynamic(superFunc: any, object: any, objectActorId: any, jointNode: any, mountType: any, forceAcceleration: any)` | 1651 | ✍ Override: refuses dynamic mounting of an object while the vehicle is controlled. |
| `Enterable:getIsInUse(superFunc: any, connection: any)` | 1663 | ✍ Override: in use if controlled by a connection other than the one given. |
| `Enterable:loadExtraDependentParts(superFunc: any, xmlFile: any, baseName: any, entry: any)` | 1674 | ✍ Override: reads #updateCharacterTargetModifier on a dependent part. |
| `Enterable:updateExtraDependentParts(superFunc: any, part: any, dt: any)` | 1686 | ✍ Override: after the parent, marks the character state for recomputation for the part if requested. |
| `Enterable:onPreRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1696 | ✍ Prepares the registration of input actions (not re-read). |
| `Enterable:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1703 | ✍ Registers the leave, camera switch and head tracking recentering actions (not re-read in detail). |
| `Enterable:onSetBroken()` | 1745 | ✍ If the vehicle breaks down permanently while entered, makes the local player leave. |
| `Enterable.actionEventLeave(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1754 | ✍ Input action: leaves the vehicle (doLeaveVehicle). |
| `Enterable.actionEventCameraSwitch(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1760 | ✍ Input action: goes to the next camera (outside menus, vehicle entered) via setActiveCameraIndex. |
| `Enterable.actionEventResetHeadTracking(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any)` | 1781 | ✍ Input action: recenters head tracking (centerHeadTracking). |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerEvent | `onEnterVehicle` | 93 |
| registerEvent | `onLeaveVehicle` | 94 |
| registerEvent | `onCameraChanged` | 95 |
| registerEvent | `onVehicleCharacterChanged` | 96 |
| registerFunction | `onPlayerEnterVehicle` | 102 |
| registerFunction | `doLeaveVehicle` | 103 |
| registerFunction | `onPlayerLeaveVehicle` | 104 |
| registerFunction | `setActiveCameraIndex` | 105 |
| registerFunction | `addToolCameras` | 106 |
| registerFunction | `removeToolCameras` | 107 |
| registerFunction | `getExitNode` | 108 |
| registerFunction | `getUserPlayerStyle` | 109 |
| registerFunction | `getCurrentPlayerStyle` | 110 |
| registerFunction | `setVehicleCharacter` | 111 |
| registerFunction | `vehicleCharacterLoaded` | 112 |
| registerFunction | `onPlayerStyleChanged` | 113 |
| registerFunction | `setRandomVehicleCharacter` | 114 |
| registerFunction | `restoreVehicleCharacter` | 115 |
| registerFunction | `deleteVehicleCharacter` | 116 |
| registerFunction | `getFormattedOperatingTime` | 117 |
| registerFunction | `loadCharacterTargetNodeModifier` | 118 |
| registerFunction | `updateCharacterTargetNodeModifier` | 119 |
| registerFunction | `setCharacterTargetNodeStateDirty` | 120 |
| registerFunction | `resetCharacterTargetNodeStateDefaults` | 121 |
| registerFunction | `setMirrorVisible` | 122 |
| registerFunction | `getIsTabbable` | 123 |
| registerFunction | `setIsTabbable` | 124 |
| registerFunction | `getIsEnterable` | 125 |
| registerFunction | `getIsEnterableFromMenu` | 126 |
| registerFunction | `getIsEntered` | 127 |
| registerFunction | `getIsControlled` | 128 |
| registerFunction | `getIsEnteredForInput` | 129 |
| registerFunction | `getControllerName` | 130 |
| registerFunction | `getActiveCamera` | 131 |
| registerFunction | `getVehicleCharacter` | 132 |
| registerFunction | `getAllowCharacterVisibilityUpdate` | 133 |
| registerFunction | `getDisableVehicleCharacterOnLeave` | 134 |
| registerFunction | `loadCamerasFromXML` | 135 |
| registerFunction | `loadAdditionalCharacterFromXML` | 136 |
| registerFunction | `getIsAdditionalCharacterActive` | 137 |
| registerFunction | `getCanLeave` | 138 |
| registerFunction | `getCanLeaveVehicle` | 139 |
| registerFunction | `getCanLeaveRideable` | 140 |
| registerFunction | `getIsLeavingAllowed` | 141 |
| registerFunction | `setIsLeavingAllowed` | 142 |
| registerFunction | `onEnterableMirrorSettingChanged` | 143 |
| registerOverwrittenFunction | `getIsActive` | 149 |
| registerOverwrittenFunction | `getIsActiveForInput` | 150 |
| registerOverwrittenFunction | `getDistanceToNode` | 151 |
| registerOverwrittenFunction | `getInteractionHelp` | 152 |
| registerOverwrittenFunction | `interact` | 153 |
| registerOverwrittenFunction | `getIsInteractive` | 154 |
| registerOverwrittenFunction | `getCanToggleSelectable` | 155 |
| registerOverwrittenFunction | `getCanToggleAttach` | 156 |
| registerOverwrittenFunction | `getActiveFarm` | 157 |
| registerOverwrittenFunction | `loadDashboardGroupFromXML` | 158 |
| registerOverwrittenFunction | `getIsDashboardGroupActive` | 159 |
| registerOverwrittenFunction | `mountDynamic` | 160 |
| registerOverwrittenFunction | `getIsInUse` | 161 |
| registerOverwrittenFunction | `loadExtraDependentParts` | 162 |
| registerOverwrittenFunction | `updateExtraDependentParts` | 163 |
| registerOverwrittenFunction | `getIsMapHotspotVisible` | 164 |
| registerEventListener | `onLoad` | 170 |
| registerEventListener | `onPostLoad` | 171 |
| registerEventListener | `onLoadFinished` | 172 |
| registerEventListener | `onRegisterDashboardValueTypes` | 173 |
| registerEventListener | `onDelete` | 174 |
| registerEventListener | `onReadStream` | 175 |
| registerEventListener | `onWriteStream` | 176 |
| registerEventListener | `onPreUpdate` | 177 |
| registerEventListener | `onUpdate` | 178 |
| registerEventListener | `onPostUpdate` | 179 |
| registerEventListener | `onDrawUIInfo` | 180 |
| registerEventListener | `onPreRegisterActionEvents` | 181 |
| registerEventListener | `onRegisterActionEvents` | 182 |
| registerEventListener | `onSetBroken` | 183 |

## Messages

- subscribes `MessageType.SETTING_CHANGED` (l.367)
- subscribes `MessageType.INPUT_BINDINGS_CHANGED` (l.987)
- subscribes `MessageType.PLAYER_STYLE_CHANGED` (l.1274)
