---@meta
-- FS25 1.25.1.0 : vehicles/specializations/EnterablePassenger.lua (generated stub, FS25 Lua Atlas)

--- Returns true only if the Enterable specialization is present.
---@param specializations table
---@return boolean
function EnterablePassenger.prerequisitesPresent(specializations) end

--- Registers the ENTERABLE_PASSENGER interaction flag and an 'enterablePassenger' shop configuration type, then registers the XML paths for the default seats and for each passenger configuration.
function EnterablePassenger.initSpecialization() end

--- Registers under a base path the XML keys allowInSingleplayer, allowPassengerOnly, allowVehicleControl and, per seat, node, exitPoint, outdoorCameraIndex, nicknameOffset, cameras and character node.
---@param basePath any
---@param schema any
function EnterablePassenger.registerXMLPaths(basePath, schema) end

--- Registers the vehicle-level functions for seat lookup, entering and leaving seats, camera handling and passenger character management.
---@param vehicleType any
function EnterablePassenger.registerFunctions(vehicleType) end

--- Overrides getInteractionHelp, interact, getDistanceToNode, getIsEnterable, getExitNode, getIsInUse, getDeactivateOnLeave, getIsInteractive, getIsEnteredForInput and getRequiresPower. Note: getIsInteractive is registered but no matching function is defined in this file (UNVERIFIED).
---@param vehicleType any
function EnterablePassenger.registerOverwrittenFunctions(vehicleType) end

--- Subscribes to load/delete, stream, post-update, UI info draw, broken state, enter/leave vehicle and action-event registration events.
---@param vehicleType any
function EnterablePassenger.registerEventListeners(vehicleType) end

--- Loads the seat settings from the base path or the selected passenger configuration: nodes, exit points, cameras (including an optional existing outdoor camera), characters and nickname offset. Sets 'available' (needs seats and multiplayer or allowInSingleplayer), builds UI texts and subscribes to player style changes.
---@param savegame any
function EnterablePassenger:onLoad(savegame) end

--- Makes the local player leave if seated as passenger, evicts other seated players, and deletes passenger cameras and characters.
function EnterablePassenger:onDelete() end

--- Client on join: for each seat, reads whether it is used and by which user, and tells that player it entered the vehicle as passenger.
---@param streamId integer
---@param connection Connection
function EnterablePassenger:onReadStream(streamId, connection) end

--- Server on join: for each seat, writes whether it is used and, if so, the user id.
---@param streamId integer
---@param connection Connection
function EnterablePassenger:onWriteStream(streamId, connection) end

--- Client only, when seats are available: updates the active camera, the action events and the seat characters, and keeps the vehicle active while the local player is a passenger.
---@param dt any
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
---@param isSelected any
function EnterablePassenger:onPostUpdate(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected) end

--- Client: draws the nickname of each seated player above their seat when the GUI is hidden-free, multiplayer names are enabled and the camera is close enough.
function EnterablePassenger:onDrawUIInfo() end

--- Makes the local player leave the vehicle if it is a passenger when the vehicle breaks.
function EnterablePassenger:onSetBroken() end

--- When the driver enters, clears the remembered last user on any seat that matches the new driver. In debug mode, also shows the user's character on every seat.
function EnterablePassenger:onEnterVehicle() end

--- In debug mode only, removes the debug characters from all seats.
function EnterablePassenger:onLeaveVehicle() end

--- Override: returns the 'enter as passenger' text when the passenger interaction flag is set; otherwise the parent text.
---@param superFunc any
---@return string
function EnterablePassenger:getInteractionHelp(superFunc) end

--- Override: with the passenger flag set, asks to enter the vehicle as passenger at the seat closest to the player; otherwise defers to the parent.
---@param superFunc any
---@param player any
function EnterablePassenger:interact(superFunc, player) end

--- Override: also returns true for a passenger when the vehicle allows control from passenger seats.
---@param superFunc any
function EnterablePassenger:getIsEnteredForInput(superFunc) end

--- Override: also returns true when passenger control is allowed and at least one passenger seat is occupied.
---@param superFunc any
function EnterablePassenger:getRequiresPower(superFunc) end

--- Override: if the vehicle is controlled (or passenger-only entry is allowed) and a free seat is closer than the normal enter distance, sets the passenger interaction flag and returns that distance.
---@param superFunc integer
---@param node any
---@return number
function EnterablePassenger:getDistanceToNode(superFunc, node) end

--- Override: with passenger seats available, the driver seat is enterable only when passenger seats are not the proper choice (see getCanUsePassengerSeats) and the parent allows it.
---@param superFunc any
function EnterablePassenger:getIsEnterable(superFunc) end

--- Override: returns the exit point of the seat last used by the given player when there is one; otherwise the parent's exit node.
---@param superFunc any
---@param player any
function EnterablePassenger:getExitNode(superFunc, player) end

--- Override: true while any passenger seat is occupied; otherwise the parent's answer.
---@param superFunc any
---@param connection any
function EnterablePassenger:getIsInUse(superFunc, connection) end

--- Override: returns false (do not deactivate) while any passenger seat is occupied; otherwise the parent's answer.
---@param superFunc any
---@param connection any
function EnterablePassenger:getDeactivateOnLeave(superFunc, connection) end

--- Clears this specialization's action events before Enterable registers its own, so they are not removed right after.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function EnterablePassenger:onPreRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Registers inputs: as passenger, leave, camera switch, zoom and seat switch; as driver, only seat switch (when active for input). Then refreshes the action event states.
---@param isActiveForInput any
---@param isActiveForInputIgnoreSelection any
function EnterablePassenger:onRegisterActionEvents(isActiveForInput, isActiveForInputIgnoreSelection) end

--- Input callback: makes the local player leave the vehicle if seated as passenger.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function EnterablePassenger.actionEventLeave(self, actionName, inputValue, callbackState, isAnalog, isMouse) end

--- Input callback: cycles to the next passenger camera when the local player is a passenger.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function EnterablePassenger.actionEventCameraSwitch(self, actionName, inputValue, callbackState, isAnalog, isMouse) end

--- Input callback: moves to the next free passenger seat, else to the driver seat if free and accessible, else (fallback) to the first free passenger seat, copying the active camera type each time.
---@param self any
---@param actionName any
---@param inputValue any
---@param callbackState any
---@param isAnalog any
---@param isMouse any
function EnterablePassenger.actionEventSwitchSeat(self, actionName, inputValue, callbackState, isAnalog, isMouse) end

--- Updates the seat-switch action: sets its text (next seat, driver or passenger) and activates it only if there is somewhere to switch to.
---@param self any
function EnterablePassenger.updateActionEvents(self) end

--- Returns the index and distance of the closest free passenger seat to the given node, within the minimum enter distance (3); nil index when none qualifies.
---@param playerNode any
function EnterablePassenger:getClosestSeatIndex(playerNode) end

--- Returns true if the given seat entry is not occupied.
---@param passengerSeat any
function EnterablePassenger:getIsPassengerSeatAvailable(passengerSeat) end

--- Returns true if the seat with that index exists and is free.
---@param seatIndex any
function EnterablePassenger:getIsPassengerSeatIndexAvailable(seatIndex) end

--- Returns the index of the first free passenger seat starting at startIndex (default 1), or nil.
---@param startIndex any
function EnterablePassenger:getFirstAvailablePassengerSeat(startIndex) end

--- Returns the nickname of the user in the given seat, or an empty string when unknown.
---@param seatIndex any
function EnterablePassenger:getPlayerNameBySeatIndex(seatIndex) end

--- Returns true when a player should use passenger seats rather than the driver seat: vehicle not broken and either already controlled or not accessible by the player.
function EnterablePassenger:getCanUsePassengerSeats() end

--- Occupies a seat. For the local owner: leaves the previous seat, activates the passenger camera and character, map hotspot and input handling. For others: frees their old seat and sets the character. Marks the seat used with user id and style, and activates the vehicle if it was idle.
---@param isOwner any
---@param seatIndex any
---@param playerStyle any
---@param userId any
function EnterablePassenger:enterVehiclePassengerSeat(isOwner, seatIndex, playerStyle, userId) end

--- Leaves the local player's seat; unless noEventSend is true, first sends an EnterablePassengerLeaveEvent to the server.
---@param noEventSend any
function EnterablePassenger:leaveLocalPassengerSeat(noEventSend) end

--- Frees a seat. For the local owner: deactivates the camera, resets indoor sound and environment flags, hides mirrors, removes the hotspot and input subscriptions. Clears the seat data and deactivates the vehicle if nobody is left and it is uncontrolled.
---@param isOwner any
---@param seatIndex any
function EnterablePassenger:leavePassengerSeat(isOwner, seatIndex) end

--- Returns the index of the seat held by the given user id, or nil.
---@param userId any
function EnterablePassenger:getPassengerSeatIndexByPlayer(userId) end

--- Keeps the camera choice when switching seat: with a seat index, copies the Enterable active camera to that seat; without, copies back to the Enterable cameras. Matches the same camera, else the first with the same inside/outside flag.
---@param seatIndex any
function EnterablePassenger:copyEnterableActiveCameraIndex(seatIndex) end

--- Sets the camera index of a seat (given or next, wrapping to 1) and activates it.
---@param cameraIndex any
---@param seatIndex any
function EnterablePassenger:setPassengerActiveCameraIndex(cameraIndex, seatIndex) end

--- Deactivates the current camera, activates the current seat's chosen camera, updates mirror visibility and the environment area reference node, refreshes characters and keeps the vehicle active.
function EnterablePassenger:enablePassengerActiveCamera() end

--- Unloads the seat's character and, if a player style is given, loads the matching character asynchronously (nil style just removes it).
---@param seatIndex any
---@param playerStyle any
function EnterablePassenger:setPassengerSeatCharacter(seatIndex, playerStyle) end

--- For every occupied seat with a character, updates its visibility and animation by dt.
---@param dt any
function EnterablePassenger:updatePassengerSeatCharacter(dt) end

--- Message handler: reloads the character of the seat held by the user whose style changed.
---@param style any
---@param userId any
function EnterablePassenger:onPassengerPlayerStyleChanged(style, userId) end

--- Load callback: when the character loaded correctly, updates its visibility and IK chains (and forces it visible in debug mode).
---@param self any
---@param loadingState any
---@param arguments any
function EnterablePassenger.vehiclePassengerCharacterLoaded(self, loadingState, arguments) end

--- Console command: toggles the passenger seat debug mode and shows or removes debug characters on the local player's current vehicle, then logs the new state.
function EnterablePassenger.consoleCommandDebugPassengerSeat() end
