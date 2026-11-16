---@meta
-- FS25 1.25.1.0 : vehicles/specializations/Enterable.lua (generated stub, FS25 Lua Atlas)

--- Vehicle specialization (no prerequisite declared in the lines re-read) for any vehicle a player can get into: occupation state (isEntered = this client drives; isControlled = someone drives, including another player), vehicle cameras (VehicleCamera), mirrors, character at the wheel, rain/hail sounds in the cab, dashboard (time, outside temperature), enter/leave actions, camera switching. CAMERA / CAB VIEW: cameras are loaded from vehicle.enterable.cameras.camera(i) (loadCamerasFromXML) and the active camera is spec.activeCamera (accessible via getActiveCamera). setActiveCameraIndex is the central point of a view change: it switches three systems to "indoor" mode depending on the camera's useOutdoorSounds flag (g_soundManager:setIsIndoor, ambientSoundSystem:setIsIndoor, g_currentMission.environment.environmentMaskSystem:setIsIndoor: exact effect on the visual weather UNVERIFIED, classes absent from the dump), sets g_currentMission.environmentAreaSystem:setReferenceNode(activeCamera.cameraNode) (the vehicle camera serves as reference point for the environment areas: UNVERIFIED), handles mirror visibility and raises the event onCameraChanged(camera, index). A mod that needs to know whether the player is in cab view can read spec.activeCamera.isInside (a field also read to enable head tracking) or listen to onCameraChanged; on leaving the vehicle the three "indoor" flags are reset to false. Also: the camera update is done in onPostUpdate with dt (ms) only if the vehicle is entered by this client; the update of the character and mirrors is in onPostUpdate. WEATHER DATA READ: spec.weatherObject = g_currentMission.environment.weather (Enterable.lua:340); onUpdate (client, controlled vehicle) reads weather:getRainFallScale() > 0 to start or stop the "rain" sound samples (XML vehicle.enterable.sounds) and weather:getIsHailing() for "hail"; the dashboard registers the values "time", "timeHours", "timeMinutes" (environment:getEnvironmentTime) and "outsideTemperature" (weather:getCurrentTemperature). Units/ranges: Weather and Environment absent from the dump, UNVERIFIED. No reading of soil moisture, wind or dirt here. Note: onUpdate tests the rain sound on rain > 0 without the 0.1 threshold used by Washable/VehicleSystem, and ignores the indoor mask; this discrepancy between systems is an observation of the code. NETWORK: the initial stream sends isTabbable, the "controlled" state and the player id to the joining client (onReadStream/onWriteStream); no continuous update stream in this specialization; entering/leaving is driven by the player logic (player:requestToEnterVehicle, g_localPlayer:leaveVehicle), which calls onPlayerEnterVehicle / onPlayerLeaveVehicle on all machines. onUpdate calls rootVehicle:raiseActive() while the vehicle is controlled so that it stays active. Peculiarity: onLoad sets self.needWaterInfo = true (field read elsewhere, usage UNVERIFIED). Declared events: onEnterVehicle(isControlling), onLeaveVehicle(wasEntered), onCameraChanged, onVehicleCharacterChanged. Extension points for a modder: listen to these events (e.g. to enable an effect only when the view is interior), or override getIsActive / getIsActiveForInput / getDistanceToNode / interact (declared as overrides). Note: Enterable.getIsInteractive is registered as an override (line 154) but is not defined in this file (not verified in game: nil function or defined elsewhere). Parts not re-read in detail: character target modifiers (IK), XML sections of initSpecialization, input actions.
---@class Enterable
Enterable = {}

--- Checks the required specializations (not re-read in detail).
---@param specializations any
function Enterable.prerequisitesPresent(specializations) end

--- Registers the XML schema of the specialization (cameras, mirrors, enter/exit nodes, character, sounds, dashboards) and the savegame keys. Not re-read in detail.
function Enterable.initSpecialization() end

--- Declares the events onEnterVehicle, onLeaveVehicle, onCameraChanged, onVehicleCharacterChanged.
---@param vehicleType any
function Enterable.registerEvents(vehicleType) end

--- Registers the functions of the specialization (cameras, character, enter state, leaving, mirrors...). They can be replaced by a mod.
---@param vehicleType any
function Enterable.registerFunctions(vehicleType) end

--- Declares the overrides: getIsActive, getIsActiveForInput, getDistanceToNode, getInteractionHelp, interact, getIsInteractive (not defined here), getCanToggleSelectable, getCanToggleAttach, getActiveFarm, loadDashboardGroupFromXML, getIsDashboardGroupActive, mountDynamic, getIsInUse, loadExtraDependentParts, updateExtraDependentParts, getIsMapHotspotVisible.
---@param vehicleType any
function Enterable.registerOverwrittenFunctions(vehicleType) end

--- Subscribes the specialization to onLoad, onPostLoad, onLoadFinished, onRegisterDashboardValueTypes, onDelete, initial network stream, onPreUpdate, onUpdate, onPostUpdate, onDrawUIInfo, input actions and onSetBroken.
---@param vehicleType any
function Enterable.registerEventListeners(vehicleType) end

--- Loads the mirror maps, cameras, character, enter/exit nodes, hotspot, interaction radius; stores the weather world (spec.weatherObject), loads the rain and hail sounds (client), creates a default reverb reference node 2 m above the vehicle, enables needWaterInfo, and registers the vehicle in VehicleSystem (interactive and enterable lists). Not fully re-read.
---@param savegame any
function Enterable:onLoad(savegame) end

--- Camera post-load; restores from the savegame the active camera index, isTabbable and isLeavingAllowed (unless reset).
---@param savegame any
function Enterable:onPostLoad(savegame) end

--- If the vehicle is already controlled (joining client), adds the player's map hotspot.
---@param savegame any
function Enterable:onLoadFinished(savegame) end

--- Declares the dashboard values time, timeHours, timeMinutes (environment:getEnvironmentTime), operatingTime and outsideTemperature (weather:getCurrentTemperature).
function Enterable:onRegisterDashboardValueTypes() end

--- Makes the player leave if the vehicle is controlled, frees character, cameras, hotspot, sounds, forgets weatherObject and removes itself from the VehicleSystem lists.
function Enterable:onDelete() end

--- Joining client: reads isTabbable and, if the vehicle is controlled, the player id to make it enter (player:onEnterVehicle).
---@param streamId integer
---@param connection Connection
function Enterable:onReadStream(streamId, connection) end

--- Server: writes isTabbable, the controlled state and the id of the controlling player.
---@param streamId integer
---@param connection Connection
function Enterable:onWriteStream(streamId, connection) end

--- Saves each camera, the active camera index, isTabbable and isLeavingAllowed.
---@param xmlFile any
---@param key any
---@param usedModNames any
function Enterable:saveToXMLFile(xmlFile, key, usedModNames) end

--- Writes the controller name into the game statistics if the vehicle is controlled.
---@param xmlFile any
---@param key any
---@return string
function Enterable:saveStatsToXMLFile(xmlFile, key) end

--- Counts down, frame by frame, the dirty states of the character target modifiers and re-triggers them.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Enterable:onPreUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Per frame, only if the vehicle is controlled. Client: updates the character target modifiers, toggles the additional character, starts/stops the rain (weather:getRainFallScale() > 0) and hail (weather:getIsHailing()) sounds on state change, gives the vehicle position and direction to activatableObjectsSystem if active for input. In all cases, calls rootVehicle:raiseActive().
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Enterable:onUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client: updates the character spine (depending on acceleration), the active camera (dt, only if the vehicle is entered locally and after the first update), the character visibility, the character animation and shows the mirrors if the camera uses them.
---@param dt number
---@param isActiveForInput boolean
---@param isActiveForInputIgnoreSelection boolean
---@param isSelected boolean
function Enterable:onPostUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Displays the driver's nickname above the vehicle in multiplayer if the UI is visible, the SHOW_MULTIPLAYER_NAMES setting is on, and the camera is within Enterable.NICKNAME_RENDER_DISTANCE (constant outside the file: UNVERIFIED).
function Enterable:onDrawUIInfo() end

--- Loads all the cameras (VehicleCamera) of the XML vehicle.enterable.cameras.camera(i) and stores their count.
---@param xmlFile any
---@param savegame any
function Enterable:loadCamerasFromXML(xmlFile, savegame) end

--- Loads the targets and node of an additional character (not re-read in detail).
---@param xmlFile any
function Enterable:loadAdditionalCharacterFromXML(xmlFile) end

--- Tells whether the additional character is active (not re-read in detail).
function Enterable:getIsAdditionalCharacterActive() end

--- Loads a position modifier for the character's IK targets (not re-read in detail).
---@param entry any
---@param xmlFile any
---@param xmlKey any
function Enterable:loadCharacterTargetNodeModifier(entry, xmlFile, xmlKey) end

--- Updates an IK target modifier of the character with dt (not re-read in detail).
---@param dt any
---@param modifier any
function Enterable:updateCharacterTargetNodeModifier(dt, modifier) end

--- Marks the state of a character target node as needing recomputation (not re-read in detail).
---@param referenceNode any
---@param forceActive any
function Enterable:setCharacterTargetNodeStateDirty(referenceNode, forceActive) end

--- Resets the default states of the character target nodes (not re-read in detail).
---@param referenceNode any
function Enterable:resetCharacterTargetNodeStateDefaults(referenceNode) end

--- A player enters (called on all machines): marks the vehicle controlled/entered, stores farm and user, forces selection, chooses the camera (first interior camera if head tracking, camera 1 if RESET_CAMERA, otherwise the last one), calls setActiveCameraIndex, informs VehicleSystem, map hotspot, character and enter animation, raises onEnterVehicle and the ENTER_VEHICLE state notification, enables the input actions, registers the vehicle in the traffic system server side if not controlled locally.
---@param isControlling boolean
---@param playerStyle integer
---@param farmId integer
---@param userId any
function Enterable:onPlayerEnterVehicle(isControlling, playerStyle, farmId, userId) end

--- True if the vehicle is entered by this client.
function Enterable:getCanLeave() end

--- True if one can leave a vehicle (not a mount).
function Enterable:getCanLeaveVehicle() end

--- True if one can leave a mount (rideable specialization).
function Enterable:getCanLeaveRideable() end

--- Tells whether leaving is allowed.
function Enterable:getIsLeavingAllowed() end

--- Allows or forbids leaving the vehicle.
---@param isAllowed any
function Enterable:setIsLeavingAllowed(isAllowed) end

--- Reacts to a change of the maximum mirror count setting by recomputing the visible mirrors (body not re-read).
function Enterable:onEnterableMirrorSettingChanged() end

--- Asks the local player to leave the vehicle if leaving is possible and allowed.
function Enterable:doLeaveVehicle() end

--- Player leaves: deactivates the active camera, resets to false the "indoor" flags of sound, ambience and the environment mask system, stops the rain/hail sounds, removes the hotspot, resets the state (controlled, entered), plays the leave animation in reverse, hides the mirrors, raises onLeaveVehicle and the LEAVE_VEHICLE notification, disables the input actions and the traffic, deactivates the vehicle if getDeactivateOnLeave.
function Enterable:onPlayerLeaveVehicle() end

--- Override: the vehicle's map hotspot is visible only if it is not controlled.
---@param superFunc any
function Enterable:getIsMapHotspotVisible(superFunc) end

--- Changes the active camera (back to 1 if out of range): deactivates the old one, activates the new one, sets the indoor flags (sound, ambience, environmentMaskSystem) according to useOutdoorSounds, updates the mirrors, sets the environmentAreaSystem reference node to the camera, raises onCameraChanged. Does nothing if the requested camera is already active.
---@param index integer
function Enterable:setActiveCameraIndex(index) end

--- Adds to the camera list those of an attached tool.
---@param cameras table
function Enterable:addToolCameras(cameras) end

--- Removes tool cameras and, if one was active, goes back to camera 1.
---@param cameras table
function Enterable:removeToolCameras(cameras) end

--- Returns the vehicle's exit node (exitPoint).
---@param player any
function Enterable:getExitNode(player) end

--- Returns the player style stored on entering.
function Enterable:getUserPlayerStyle() end

--- Returns the style of the character currently displayed, or nil.
function Enterable:getCurrentPlayerStyle() end

--- Deletes then reloads the vehicle character with a player style, possibly adapted by a custom vehicle preset.
---@param playerStyle any
function Enterable:setVehicleCharacter(playerStyle) end

--- Callback at the end of character loading (not re-read in detail).
---@param loadingState any
---@param arguments any
function Enterable:vehicleCharacterLoaded(loadingState, arguments) end

--- Reacts to a player style change (not re-read in detail).
---@param style any
---@param userId any
function Enterable:onPlayerStyleChanged(style, userId) end

--- Loads a random character (AI/helpers, not re-read in detail).
---@param helper any
function Enterable:setRandomVehicleCharacter(helper) end

--- Restores the vehicle character (not re-read in detail).
function Enterable:restoreVehicleCharacter() end

--- Deletes the vehicle character (not re-read in detail).
function Enterable:deleteVehicleCharacter() end

--- Returns the operating time in decimal hours (tens of minutes) for the dashboard.
function Enterable:getFormattedOperatingTime() end

--- Override: an entered or controlled vehicle is always active.
---@param superFunc any
function Enterable:getIsActive(superFunc) end

--- Override: active for input only if the parent accepts it, the player is not frozen, and this vehicle or another one in the attached chain is entered.
---@param superFunc any
---@param ignoreSelection any
---@param activeForAI any
function Enterable:getIsActiveForInput(superFunc, ignoreSelection, activeForAI) end

--- Override: if the vehicle is not controlled and a node is closer than the interaction radius of the entry point, returns that distance and sets the "enterable" interaction indicator.
---@param superFunc integer
---@param node any
---@return number
function Enterable:getDistanceToNode(superFunc, node) end

--- Override: returns the enter text if the current interaction is "enterable".
---@param superFunc any
---@return string
function Enterable:getInteractionHelp(superFunc) end

--- Override: asks the player to enter the vehicle if the current interaction is "enterable".
---@param superFunc any
---@param player any
function Enterable:interact(superFunc, player) end

--- Shows or hides the mirrors: when showing, sorts by priority then by angle relative to the camera (only mirrors in the field of view) and shows only the maximum number set by the MAX_NUM_MIRRORS setting.
---@param visible any
function Enterable:setMirrorVisible(visible) end

--- Tells whether the vehicle takes part in switching with the tab key.
function Enterable:getIsTabbable() end

--- Sets isTabbable (nil counts as false).
---@param isTabbable any
function Enterable:setIsTabbable(isTabbable) end

--- True (client) if the vehicle has an entry and exit point, is neither broken nor controlled and the player has access (accessHandler).
function Enterable:getIsEnterable() end

--- True if enterable and allowed to be selected from the menu.
function Enterable:getIsEnterableFromMenu() end

--- True if this client is in the vehicle.
function Enterable:getIsEntered() end

--- True if a player (any) controls the vehicle.
function Enterable:getIsControlled() end

--- True if entered and controlled.
function Enterable:getIsEnteredForInput() end

--- Driver's nickname, by connection server side or by id client side; empty string otherwise.
function Enterable:getControllerName() end

--- Returns the active camera of the vehicle (VehicleCamera).
function Enterable:getActiveCamera() end

--- Returns the vehicle character.
function Enterable:getVehicleCharacter() end

--- Returns true: allows the character visibility update (replaceable).
function Enterable:getAllowCharacterVisibilityUpdate() end

--- Tells whether the character must be deleted on leaving.
function Enterable:getDisableVehicleCharacterOnLeave() end

--- Override: true if entered, otherwise the parent value.
---@param superFunc any
function Enterable:getCanToggleSelectable(superFunc) end

--- Override: false if not entered, otherwise the parent value.
---@param superFunc any
function Enterable:getCanToggleAttach(superFunc) end

--- Override: returns the controller's farm if non-null, otherwise the parent's.
---@param superFunc any
function Enterable:getActiveFarm(superFunc) end

--- Override: additionally reads #isEntered on a dashboard group.
---@param superFunc any
---@param xmlFile any
---@param key any
---@param group any
function Enterable:loadDashboardGroupFromXML(superFunc, xmlFile, key, group) end

--- Override: a dashboard group with #isEntered is active only if the entered state matches.
---@param superFunc any
---@param group any
function Enterable:getIsDashboardGroupActive(superFunc, group) end

--- Override: refuses dynamic mounting of an object while the vehicle is controlled.
---@param superFunc any
---@param object any
---@param objectActorId any
---@param jointNode any
---@param mountType any
---@param forceAcceleration any
function Enterable:mountDynamic(superFunc, object, objectActorId, jointNode, mountType, forceAcceleration) end

--- Override: in use if controlled by a connection other than the one given.
---@param superFunc any
---@param connection any
function Enterable:getIsInUse(superFunc, connection) end

--- Override: reads #updateCharacterTargetModifier on a dependent part.
---@param superFunc any
---@param xmlFile any
---@param baseName any
---@param entry any
function Enterable:loadExtraDependentParts(superFunc, xmlFile, baseName, entry) end

--- Override: after the parent, marks the character state for recomputation for the part if requested.
---@param superFunc any
---@param part any
---@param dt any
function Enterable:updateExtraDependentParts(superFunc, part, dt) end

--- Prepares the registration of input actions (not re-read).
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Enterable:onPreRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Registers the leave, camera switch and head tracking recentering actions (not re-read in detail).
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function Enterable:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- If the vehicle breaks down permanently while entered, makes the local player leave.
function Enterable:onSetBroken() end

--- Input action: leaves the vehicle (doLeaveVehicle).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Enterable.actionEventLeave(self, actionName, inputValue, callbackState, isAnalog) end

--- Input action: goes to the next camera (outside menus, vehicle entered) via setActiveCameraIndex.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Enterable.actionEventCameraSwitch(self, actionName, inputValue, callbackState, isAnalog) end

--- Input action: recenters head tracking (centerHeadTracking).
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
function Enterable.actionEventResetHeadTracking(self, actionName, inputValue, callbackState, isAnalog) end
