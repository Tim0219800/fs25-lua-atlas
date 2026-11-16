# vehicles/specializations/EnterablePassenger.lua

*[Version française](../../../fr/scripts/vehicles/specializations/EnterablePassenger.md)*

Source: `dataS/scripts/vehicles/specializations/EnterablePassenger.lua` — FS25 1.25.1.0

✍ Vehicle specialization that adds passenger seats to an Enterable vehicle. Seats, cameras, exit points and optional characters are configured under vehicle.enterable.passengerSeats or a passenger configuration; the seats are active in multiplayer (or in singleplayer if allowInSingleplayer is set). It overrides interaction, enter and exit logic, optionally lets a passenger control the vehicle, and relies on events such as EnterablePassengerLeaveEvent, defined elsewhere (UNVERIFIED). The file starts without its own class declaration, so the EnterablePassenger table comes from elsewhere.


## Functions

| Function | Line | Description |
|---|---|---|
| `EnterablePassenger.prerequisitesPresent(specializations: table) → boolean` | 26 | ✍ Returns true only if the Enterable specialization is present. |
| `EnterablePassenger.initSpecialization()` | 32 | ✍ Registers the ENTERABLE_PASSENGER interaction flag and an 'enterablePassenger' shop configuration type, then registers the XML paths for the default seats and for each passenger configuration. |
| `EnterablePassenger.registerXMLPaths(basePath: any, schema: any)` | 48 | ✍ Registers under a base path the XML keys allowInSingleplayer, allowPassengerOnly, allowVehicleControl and, per seat, node, exitPoint, outdoorCameraIndex, nicknameOffset, cameras and character node. |
| `EnterablePassenger.registerFunctions(vehicleType: any)` | 64 | ✍ Registers the vehicle-level functions for seat lookup, entering and leaving seats, camera handling and passenger character management. |
| `EnterablePassenger.registerOverwrittenFunctions(vehicleType: any)` | 85 | ✍ Overrides getInteractionHelp, interact, getDistanceToNode, getIsEnterable, getExitNode, getIsInUse, getDeactivateOnLeave, getIsInteractive, getIsEnteredForInput and getRequiresPower. Note: getIsInteractive is registered but no matching function is defined in this file (UNVERIFIED). |
| `EnterablePassenger.registerEventListeners(vehicleType: any)` | 100 | ✍ Subscribes to load/delete, stream, post-update, UI info draw, broken state, enter/leave vehicle and action-event registration events. |
| `EnterablePassenger:onLoad(savegame: any)` | 116 | ✍ Loads the seat settings from the base path or the selected passenger configuration: nodes, exit points, cameras (including an optional existing outdoor camera), characters and nickname offset. Sets 'available' (needs seats and multiplayer or allowInSingleplayer), builds UI texts and subscribes to player style changes. |
| `EnterablePassenger:onDelete()` | 197 | ✍ Makes the local player leave if seated as passenger, evicts other seated players, and deletes passenger cameras and characters. |
| `EnterablePassenger:onReadStream(streamId: integer, connection: Connection)` | 233 | ✍ Client on join: for each seat, reads whether it is used and by which user, and tells that player it entered the vehicle as passenger. |
| `EnterablePassenger:onWriteStream(streamId: integer, connection: Connection)` | 250 | ✍ Server on join: for each seat, writes whether it is used and, if so, the user id. |
| `EnterablePassenger:onPostUpdate(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 262 | ✍ Client only, when seats are available: updates the active camera, the action events and the seat characters, and keeps the vehicle active while the local player is a passenger. |
| `EnterablePassenger:onDrawUIInfo()` | 284 | ✍ Client: draws the nickname of each seated player above their seat when the GUI is hidden-free, multiplayer names are enabled and the camera is close enough. |
| `EnterablePassenger:onSetBroken()` | 307 | ✍ Makes the local player leave the vehicle if it is a passenger when the vehicle breaks. |
| `EnterablePassenger:onEnterVehicle()` | 316 | ✍ When the driver enters, clears the remembered last user on any seat that matches the new driver. In debug mode, also shows the user's character on every seat. |
| `EnterablePassenger:onLeaveVehicle()` | 334 | ✍ In debug mode only, removes the debug characters from all seats. |
| `EnterablePassenger:getInteractionHelp(superFunc: any) → string` | 346 | ✍ Override: returns the 'enter as passenger' text when the passenger interaction flag is set; otherwise the parent text. |
| `EnterablePassenger:interact(superFunc: any, player: any)` | 359 | ✍ Override: with the passenger flag set, asks to enter the vehicle as passenger at the seat closest to the player; otherwise defers to the parent. |
| `EnterablePassenger:getIsEnteredForInput(superFunc: any)` | 382 | ✍ Override: also returns true for a passenger when the vehicle allows control from passenger seats. |
| `EnterablePassenger:getRequiresPower(superFunc: any)` | 401 | ✍ Override: also returns true when passenger control is allowed and at least one passenger seat is occupied. |
| `EnterablePassenger:getDistanceToNode(superFunc: integer, node: any) → number` | 425 | ✍ Override: if the vehicle is controlled (or passenger-only entry is allowed) and a free seat is closer than the normal enter distance, sets the passenger interaction flag and returns that distance. |
| `EnterablePassenger:getIsEnterable(superFunc: any)` | 442 | ✍ Override: with passenger seats available, the driver seat is enterable only when passenger seats are not the proper choice (see getCanUsePassengerSeats) and the parent allows it. |
| `EnterablePassenger:getExitNode(superFunc: any, player: any)` | 453 | ✍ Override: returns the exit point of the seat last used by the given player when there is one; otherwise the parent's exit node. |
| `EnterablePassenger:getIsInUse(superFunc: any, connection: any)` | 469 | ✍ Override: true while any passenger seat is occupied; otherwise the parent's answer. |
| `EnterablePassenger:getDeactivateOnLeave(superFunc: any, connection: any)` | 485 | ✍ Override: returns false (do not deactivate) while any passenger seat is occupied; otherwise the parent's answer. |
| `EnterablePassenger:onPreRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 501 | ✍ Clears this specialization's action events before Enterable registers its own, so they are not removed right after. |
| `EnterablePassenger:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 511 | ✍ Registers inputs: as passenger, leave, camera switch, zoom and seat switch; as driver, only seat switch (when active for input). Then refreshes the action event states. |
| `EnterablePassenger.actionEventLeave(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 552 | ✍ Input callback: makes the local player leave the vehicle if seated as passenger. |
| `EnterablePassenger.actionEventCameraSwitch(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 561 | ✍ Input callback: cycles to the next passenger camera when the local player is a passenger. |
| `EnterablePassenger.actionEventSwitchSeat(self: any, actionName: any, inputValue: any, callbackState: any, isAnalog: any, isMouse: any)` | 570 | ✍ Input callback: moves to the next free passenger seat, else to the driver seat if free and accessible, else (fallback) to the first free passenger seat, copying the active camera type each time. |
| `EnterablePassenger.updateActionEvents(self: any)` | 598 | ✍ Updates the seat-switch action: sets its text (next seat, driver or passenger) and activates it only if there is somewhere to switch to. |
| `EnterablePassenger:getClosestSeatIndex(playerNode: any)` | 632 | ✍ Returns the index and distance of the closest free passenger seat to the given node, within the minimum enter distance (3); nil index when none qualifies. |
| `EnterablePassenger:getIsPassengerSeatAvailable(passengerSeat: any)` | 654 | ✍ Returns true if the given seat entry is not occupied. |
| `EnterablePassenger:getIsPassengerSeatIndexAvailable(seatIndex: any)` | 660 | ✍ Returns true if the seat with that index exists and is free. |
| `EnterablePassenger:getFirstAvailablePassengerSeat(startIndex: any)` | 672 | ✍ Returns the index of the first free passenger seat starting at startIndex (default 1), or nil. |
| `EnterablePassenger:getPlayerNameBySeatIndex(seatIndex: any)` | 686 | ✍ Returns the nickname of the user in the given seat, or an empty string when unknown. |
| `EnterablePassenger:getCanUsePassengerSeats()` | 701 | ✍ Returns true when a player should use passenger seats rather than the driver seat: vehicle not broken and either already controlled or not accessible by the player. |
| `EnterablePassenger:enterVehiclePassengerSeat(isOwner: any, seatIndex: any, playerStyle: any, userId: any)` | 721 | ✍ Occupies a seat. For the local owner: leaves the previous seat, activates the passenger camera and character, map hotspot and input handling. For others: frees their old seat and sets the character. Marks the seat used with user id and style, and activates the vehicle if it was idle. |
| `EnterablePassenger:leaveLocalPassengerSeat(noEventSend: any)` | 787 | ✍ Leaves the local player's seat; unless noEventSend is true, first sends an EnterablePassengerLeaveEvent to the server. |
| `EnterablePassenger:leavePassengerSeat(isOwner: any, seatIndex: any)` | 800 | ✍ Frees a seat. For the local owner: deactivates the camera, resets indoor sound and environment flags, hides mirrors, removes the hotspot and input subscriptions. Clears the seat data and deactivates the vehicle if nobody is left and it is uncontrolled. |
| `EnterablePassenger:getPassengerSeatIndexByPlayer(userId: any)` | 861 | ✍ Returns the index of the seat held by the given user id, or nil. |
| `EnterablePassenger:copyEnterableActiveCameraIndex(seatIndex: any)` | 874 | ✍ Keeps the camera choice when switching seat: with a seat index, copies the Enterable active camera to that seat; without, copies back to the Enterable cameras. Matches the same camera, else the first with the same inside/outside flag. |
| `EnterablePassenger:setPassengerActiveCameraIndex(cameraIndex: any, seatIndex: any)` | 933 | ✍ Sets the camera index of a seat (given or next, wrapping to 1) and activates it. |
| `EnterablePassenger:enablePassengerActiveCamera()` | 948 | ✍ Deactivates the current camera, activates the current seat's chosen camera, updates mirror visibility and the environment area reference node, refreshes characters and keeps the vehicle active. |
| `EnterablePassenger:setPassengerSeatCharacter(seatIndex: any, playerStyle: any)` | 974 | ✍ Unloads the seat's character and, if a player style is given, loads the matching character asynchronously (nil style just removes it). |
| `EnterablePassenger:updatePassengerSeatCharacter(dt: any)` | 990 | ✍ For every occupied seat with a character, updates its visibility and animation by dt. |
| `EnterablePassenger:onPassengerPlayerStyleChanged(style: any, userId: any)` | 1002 | ✍ Message handler: reloads the character of the seat held by the user whose style changed. |
| `EnterablePassenger.vehiclePassengerCharacterLoaded(self: any, loadingState: any, arguments: any)` | 1014 | ✍ Load callback: when the character loaded correctly, updates its visibility and IK chains (and forces it visible in debug mode). |
| `EnterablePassenger.consoleCommandDebugPassengerSeat()` | 1030 | ✍ Console command: toggles the passenger seat debug mode and shows or removes debug characters on the local player's current vehicle, then logs the new state. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getClosestSeatIndex` | 65 |
| registerFunction | `getIsPassengerSeatAvailable` | 66 |
| registerFunction | `getIsPassengerSeatIndexAvailable` | 67 |
| registerFunction | `getFirstAvailablePassengerSeat` | 68 |
| registerFunction | `getPlayerNameBySeatIndex` | 69 |
| registerFunction | `getCanUsePassengerSeats` | 70 |
| registerFunction | `enterVehiclePassengerSeat` | 71 |
| registerFunction | `leaveLocalPassengerSeat` | 72 |
| registerFunction | `leavePassengerSeat` | 73 |
| registerFunction | `getPassengerSeatIndexByPlayer` | 74 |
| registerFunction | `copyEnterableActiveCameraIndex` | 75 |
| registerFunction | `setPassengerActiveCameraIndex` | 76 |
| registerFunction | `enablePassengerActiveCamera` | 77 |
| registerFunction | `setPassengerSeatCharacter` | 78 |
| registerFunction | `updatePassengerSeatCharacter` | 79 |
| registerFunction | `onPassengerPlayerStyleChanged` | 80 |
| registerOverwrittenFunction | `getInteractionHelp` | 86 |
| registerOverwrittenFunction | `interact` | 87 |
| registerOverwrittenFunction | `getDistanceToNode` | 88 |
| registerOverwrittenFunction | `getIsEnterable` | 89 |
| registerOverwrittenFunction | `getExitNode` | 90 |
| registerOverwrittenFunction | `getIsInUse` | 91 |
| registerOverwrittenFunction | `getDeactivateOnLeave` | 92 |
| registerOverwrittenFunction | `getIsInteractive` | 93 |
| registerOverwrittenFunction | `getIsEnteredForInput` | 94 |
| registerOverwrittenFunction | `getRequiresPower` | 95 |
| registerEventListener | `onLoad` | 101 |
| registerEventListener | `onDelete` | 102 |
| registerEventListener | `onReadStream` | 103 |
| registerEventListener | `onWriteStream` | 104 |
| registerEventListener | `onPostUpdate` | 105 |
| registerEventListener | `onDrawUIInfo` | 106 |
| registerEventListener | `onSetBroken` | 107 |
| registerEventListener | `onEnterVehicle` | 108 |
| registerEventListener | `onLeaveVehicle` | 109 |
| registerEventListener | `onPreRegisterActionEvents` | 110 |
| registerEventListener | `onRegisterActionEvents` | 111 |

## Messages

- subscribes `MessageType.PLAYER_STYLE_CHANGED` (l.191)
- subscribes `MessageType.INPUT_BINDINGS_CHANGED` (l.742)
