# vehicles/specializations/Rideable.lua

*[Version française](../../../fr/scripts/vehicles/specializations/Rideable.md)*

Source: `dataS/scripts/vehicles/specializations/Rideable.lua` — FS25 1.25.1.0

✍ Specialization for rideable animals (horses). It sits on top of CCTDrivable and Enterable: the horse is moved as a character controller by a server-side kinematic model with gaits (backwards, still, walk, trot, canter, gallop), turning, gravity and jumps, and clients interpolate. It drives conditional animations for the horse and rider, hoof particles and surface-dependent hoof sounds, breathing sounds, reins and equipment visibility. It holds an AnimalCluster (the animal's data) that is saved, streamed to joining clients, and handed back to a husbandry when the horse is left near a stable or breaks. XML under vehicle.rideable (speeds, turn radii, hooves, model nodes, sounds).

- **Rideable** (l.23)

## Functions

| Function | Line | Description |
|---|---|---|
| `Rideable.prerequisitesPresent(specializations: table) → boolean` | 55 | ✍ Returns true only if both CCTDrivable and Enterable specializations are present. |
| `Rideable.initSpecialization()` | 62 | ✍ Registers XML schema entries under vehicle.rideable (gait speeds, min turn radii, turn speed, jump height, proxy, four hooves with slow and fast step particles, model nodes, breath and halt sounds, conditional animations) and the savegame animalType key. |
| `Rideable.registerFunctions(vehicleType: table)` | 143 | ✍ Registers all Rideable functions (jump, gait, steering, kinematics, animation, sound, riding stats, footsteps, cluster accessors, etc.) on the vehicle type. |
| `Rideable.registerEventListeners(vehicleType: table)` | 175 | ✍ Subscribes to load, delete, all stream read/write events (including position update streams), update, interpolation update, draw, action events, enter/leave vehicle, set broken and vehicle character changed. |
| `Rideable.registerOverwrittenFunctions(vehicleType: any)` | 197 | ✍ Overrides world position setters, updateVehicleSpeed, name getters, reset/sell/overview checks, map hotspot rotation, period and day change, image filename, info box, character deletion and interaction help. |
| `Rideable:onLoad(savegame: table)` | 218 | ✍ Initialises state, animation parameters, gait speeds and turn radii, proxy, hooves with copied particle systems, model nodes, conditional animation player, hoof surface sounds cloned from the mission, breathing sounds and network interpolators; enables high precision position sync. With a savegame it restores the AnimalCluster (error state if the subtype is unknown) and registers the horse with the husbandry system. |
| `Rideable:onLoadFinished()` | 450 | ✍ Marks the vehicle active (raiseActive) once loading is finished. |
| `Rideable:setWorldPosition(superFunc: any, x: any, y: any, z: any, xRot: any, yRot: any, zRot: any, i: any, changeInterp: any)` | 456 | ✍ Overridden: after the parent, on the server for component 1, resyncs the internal turn angle from the node heading and, if changeInterp, the turn angle interpolator. |
| `Rideable:setWorldPositionQuaternion(superFunc: any, x: any, y: any, z: any, qx: any, qy: any, qz: any, qw: any, i: any, changeInterp: any)` | 470 | ✍ Overridden: same as setWorldPosition but for the quaternion variant; resyncs the turn angle (server, component 1) after the parent. |
| `Rideable:updateVehicleSpeed(superFunc: any, dt: any)` | 484 | ✍ Overridden: on the server passes the stored interpolation dt to the parent instead of the frame dt; clients pass the normal dt. |
| `Rideable:calculateLegsDistance(leftLegNode: integer, rightLegNode: integer) → number` | 498 | ✍ Returns the average local Z offset (relative to the root node) of two leg nodes, or 0 if one is nil. Used for the ground check offsets in front and back. |
| `Rideable:onDelete()` | 510 | ✍ Unregisters from the husbandry system, deletes sounds, hoof particle systems with their emitter shapes and the animation player. |
| `Rideable:onReadStream(streamId: integer, connection: Connection)` | 544 | ✍ Client on join: reads the on-ground flag (from server), the animal cluster (sub type then data) and the player who should enter, applying each. |
| `Rideable:onWriteStream(streamId: integer, connection: Connection)` | 571 | ✍ Server on join: writes the on-ground flag, the animal cluster if present, and the player to enter if any. |
| `Rideable:onReadUpdateStream(streamId: integer, timestamp: integer, connection: table)` | 590 | ✍ Server side reads steer axis and gait from the rider's client. Client side reads halt timer (resetting gait if halted) and optional cluster update, then refreshes dirt. |
| `Rideable:onWriteUpdateStream(streamId: integer, connection: table, dirtyMask: integer)` | 615 | ✍ Client to server: writes steer axis and gait. Server to client: writes halt timer and the cluster update if a cluster exists. |
| `Rideable:onReadPositionUpdateStream(streamId: integer, connection: Connection)` | 633 | ✍ Reads the on-ground bool from the position update stream into the on-ground interpolator. |
| `Rideable:onWritePositionUpdateStream(streamId: integer, connection: Connection, dirtyMask: any)` | 647 | ✍ Writes the current on-ground flag into the position update stream. |
| `Rideable:endFade()` | 654 | ✍ Empty callback used as end-of-fade handler for the screen fade. |
| `Rideable:saveToXMLFile(xmlFile: any, key: any, usedModNames: any)` | 659 | ✍ Saves the animal sub type name and the cluster data (under .animal) when a cluster exists. |
| `Rideable:setCluster(cluster: any)` | 674 | ✍ Stores the AnimalCluster, sets the mesh atlas UV offset from the visual variation for the animal's sub type and age, then refreshes the dirt shader. |
| `Rideable:updateDirt()` | 696 | ✍ Sets the mesh dirt shader parameter from the cluster's dirt factor, but only on platforms where horse cleaning is needed; otherwise 0. |
| `Rideable:getCluster()` | 708 | ✍ Returns the AnimalCluster of this horse (may be nil). |
| `Rideable:onUpdate(dt: number, isActiveForInput: boolean, isActiveForInputIgnoreSelection: boolean, isSelected: boolean)` | 717 | ✍ Per frame: forces the local player to enter when pending and synced, updates input text and sends steering from a client rider, updates animation, sound (client) and riding stats (server), counts down the halt timer, reads gyroscope steering if enabled, and on the server runs the deferred husbandry handover and the husbandry range check, then deletes the vehicle after handover. |
| `Rideable:onUpdateInterpolation(dt: any, isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 830 | ✍ Server: resets gait if nobody controls, runs testCCTMove and updateKinematic, feeds the position, turn angle and on-ground interpolators and applies the interpolated position and heading. All sides: leave timer, on-ground state, and ground-following orientation via two raycasts (or a close-to-ground check when stationary). |
| `Rideable:onDraw(isActiveForInput: any, isActiveForInputIgnoreSelection: any, isSelected: any)` | 921 | ✍ While the player is on the horse, adds an extra HUD line showing the cluster's riding factor in percent. |
| `Rideable:onSetBroken()` | 931 | ✍ Unlinks the reins. On the server, hands the cluster to the first available husbandry and deletes the horse if one exists, and notifies the last owner whether it went to a stable. |
| `Rideable:testCCTMove(dt: any)` | 958 | ✍ Server check of the queued character-controller moves already simulated: if the real displacement is under 70 percent of what was expected (and expected is above 0.001 per ms), the horse is halted for 900 ms and the halt sound plays. |
| `Rideable:getIsRideableJumpAllowed(allowWhileJump: any)` | 989 | ✍ Returns true if the horse is on the ground (unless allowWhileJump), is at canter gait or faster and is not broken. |
| `Rideable:jump()` | 1009 | ✍ Starts a jump: a client sends JumpEvent to the server, the server increments the horseJumpCount farm stat and tries achievements. Sets vertical speed from jump height (halved at canter) and gravity. |
| `Rideable:setCurrentGait(gait: any)` | 1033 | ✍ Sets the current gait (input value) of the horse. |
| `Rideable:getCurrentGait()` | 1040 | ✍ Returns the current gait value (see Rideable.GAITTYPES, defined outside the visible dump lines). |
| `Rideable:setRideableSteer(axisSteer: any)` | 1046 | ✍ Sets the steering axis to the negated input; ignores a zero value so the last steer is kept until resetInputs. |
| `Rideable:resetInputs()` | 1055 | ✍ Resets the steering axis to 0. |
| `Rideable:updateKinematic(dt: number)` | 1063 | ✍ Server kinematic step: accelerates or decelerates toward the gait top speed (slower acceleration in the air, speed forced to 0 while halted), applies gravity, turns with limited angular acceleration, moves the character controller and queues the move for testCCTMove. Input dt is in ms. |
| `Rideable:groundRaycastCallback(hitObjectId: integer, x: number, y: number, z: number, distance: number) → boolean` | 1138 | ✍ Raycast callback: ignores the horse's own controller node and nodes whose collision mask is only DEFAULT; otherwise records hit height, object and distance and stops the ray. |
| `Rideable:updateAnimation(dt: number)` | 1159 | ✍ Computes the animation parameters (forward, vertical and yaw velocity, on ground, in water, halted, smoothed left-right weight, etc.) from speed and interpolators, feeds them to the horse animation player and, when ridden, to the rider's, then calls updateFootsteps. |
| `Rideable:updateSound(dt: any)` | 1264 | ✍ Client: when on the ground, plays breathing samples on a timer, effort breathing at gallop, otherwise normal breathing with a random idle interval when still. |
| `Rideable:setWorldPositionQuat(x: number, y: number, z: number, qx: number, qy: number, qz: number, qw: number, changeInterp: boolean)` | 1298 | ✍ Sets root node world translation and quaternion, optionally resetting interpolators. Note: it reads networkInterpolators from the spec table, which this file never sets, so changeInterp true would fail (UNVERIFIED if used elsewhere). |
| `Rideable:onRegisterActionEvents(isActiveForInput: any, isActiveForInputIgnoreSelection: any)` | 1310 | ✍ On clients, registers accelerate, brake, steer and jump actions (hidden help text by default) when active for input and stores their ids. |
| `Rideable:onEnterVehicle(isControlling: boolean)` | 1342 | ✍ Client: clears the pending player, resets speeds, sets gait to still and on-ground false. Server: remembers the owner connection as last owner and clears the husbandry check timer. |
| `Rideable:onVehicleCharacterChanged(character: any)` | 1369 | ✍ Client: when a rider appears, links the reins to the rider's hands, shows reins, sets up the rider conditional animation with the same parameters, shows equipment and fades the screen back in if it was faded. |
| `Rideable:onLeaveVehicle()` | 1401 | ✍ Client: resets gait and inputs and fades the screen back in. Server: arms the husbandry check for 5000 ms. All: resets the leave timer to 15000 ms. |
| `Rideable:unlinkReins()` | 1422 | ✍ Client: relinks both rein nodes to their original parents and hides the reins node. |
| `Rideable:setEquipmentVisibility(val: any)` | 1434 | ✍ Client: shows or hides the equipment (saddle) and reins nodes if an equipment node is defined. |
| `Rideable.actionEventAccelerate(self: table, actionName: string, inputValue: number, callbackState: string, isAnalog: boolean)` | 1452 | ✍ Input callback: when entered, controlled, not halted and on the ground, steps the gait up one level (up to the maximum). |
| `Rideable.actionEventBrake(self: table, actionName: string, inputValue: number, callbackState: string, isAnalog: boolean)` | 1468 | ✍ Input callback: when entered, not halted and on the ground, steps the gait down one level (not below 1). |
| `Rideable.actionEventSteer(self: table, actionName: string, inputValue: number, callbackState: string, isAnalog: boolean)` | 1482 | ✍ Input callback: when entered and not halted, passes the input value to setRideableSteer. |
| `Rideable.actionEventJump(self: table, actionName: string, inputValue: number, callbackState: string, isAnalog: boolean)` | 1496 | ✍ Input callback: calls jump when getIsRideableJumpAllowed accepts. |
| `Rideable:updateFootsteps(dt: any, speed: any)` | 1504 | ✍ For each hoof, raycasts to the ground; on touchdown it emits slow or fast step particles tinted with the terrain color at the hoof position and plays the surface sound, and stops emitting on liftoff. Note: in the fast branch the rotation is applied to the slow emitter shape, which looks like a bug. |
| `Rideable:updateRiding(dt: any)` | 1569 | ✍ Server: while moving with a cluster, accumulates riding time scaled by gait (x2 canter, x3 gallop) and periodically raises the cluster's riding and dirt values, updates the horseDistance farm stat and refreshes dirt. |
| `Rideable:getHoofSurfaceSound(x: any, y: any, z: any, hitTerrain: any)` | 1603 | ✍ Returns the hoof sample for a position: on terrain, snow, then field, then shallow or medium water, else by terrain material id; off terrain, the asphalt sample. May return nil if no sample matches. |
| `Rideable:getPosition()` | 1631 | ✍ Returns the world translation (x, y, z) of the root node. |
| `Rideable:getRotation()` | 1637 | ✍ Returns the world rotation (x, y, z) of the root node. |
| `Rideable:setPlayerToEnter(player: any)` | 1643 | ✍ Stores the player who should enter this horse once it is synced, flags the check and wakes the vehicle. |
| `Rideable:getName(superFunc: any)` | 1652 | ✍ Overridden: returns the animal cluster's name (errors if no cluster is set). |
| `Rideable:getFullName(superFunc: any)` | 1659 | ✍ Overridden: same as getName. |
| `Rideable:getCanBeReset(superFunc: any)` | 1665 | ✍ Overridden to always return false: a horse cannot be reset. |
| `Rideable:getCanBeSold(superFunc: any)` | 1671 | ✍ Overridden to always return false: a horse cannot be sold as a vehicle. |
| `Rideable:getMapHotspotRotation(superFunc: any, isPlayerHotspot: any)` | 1677 | ✍ Overridden: returns 0 for non-player hotspots, otherwise defers to the parent. |
| `Rideable:getShowInVehiclesOverview(superFunc: any)` | 1687 | ✍ Overridden to always return false: horses are hidden from the vehicle overview. |
| `Rideable:periodChanged(superFunc: any)` | 1693 | ✍ Overridden: calls the parent then forwards the period change to the cluster. |
| `Rideable:dayChanged(superFunc: any)` | 1703 | ✍ Overridden: calls the parent then forwards the day change to the cluster. |
| `Rideable:getImageFilename(superFunc: any)` | 1714 | ✍ Overridden: returns the store image of the animal visual matching the cluster's sub type and age, else the parent image. |
| `Rideable:deleteVehicleCharacter(superFunc: any)` | 1729 | ✍ Overridden: hides the equipment and unlinks the reins before calling the parent. |
| `Rideable:getInteractionHelp(superFunc: any) → string` | 1739 | ✍ Overridden: when the interaction flag is enterable, returns the ride-animal text with the animal's name; otherwise the parent text. |
| `Rideable:showInfo(superFunc: any, box: any)` | 1751 | ✍ Overridden: shows the cluster info in the box first, then the parent's info. |
| `Rideable:updateDebugValues(values: any)` | 1763 | ✍ Debug: adds one entry per hoof with the last played sample description to the values table. |
| `Rideable:updateInputText()` | 1773 | ✍ Sets the label and visibility of the accelerate, brake and jump actions according to the current gait (for instance walk, trot, canter, gallop, stop), enabling jump only from canter upward. |

## Specialization

| Type | Name | Line |
|---|---|---|
| registerFunction | `getIsRideableJumpAllowed` | 144 |
| registerFunction | `jump` | 145 |
| registerFunction | `setCurrentGait` | 146 |
| registerFunction | `getCurrentGait` | 147 |
| registerFunction | `setRideableSteer` | 148 |
| registerFunction | `resetInputs` | 149 |
| registerFunction | `updateKinematic` | 150 |
| registerFunction | `testCCTMove` | 151 |
| registerFunction | `updateAnimation` | 152 |
| registerFunction | `updateSound` | 153 |
| registerFunction | `updateRiding` | 154 |
| registerFunction | `updateDirt` | 155 |
| registerFunction | `calculateLegsDistance` | 156 |
| registerFunction | `setWorldPositionQuat` | 157 |
| registerFunction | `updateFootsteps` | 158 |
| registerFunction | `getPosition` | 159 |
| registerFunction | `getRotation` | 160 |
| registerFunction | `setEquipmentVisibility` | 161 |
| registerFunction | `getHoofSurfaceSound` | 162 |
| registerFunction | `groundRaycastCallback` | 163 |
| registerFunction | `unlinkReins` | 164 |
| registerFunction | `updateInputText` | 165 |
| registerFunction | `setPlayerToEnter` | 166 |
| registerFunction | `endFade` | 167 |
| registerFunction | `setCluster` | 168 |
| registerFunction | `getCluster` | 169 |
| registerEventListener | `onLoad` | 176 |
| registerEventListener | `onLoadFinished` | 177 |
| registerEventListener | `onDelete` | 178 |
| registerEventListener | `onReadStream` | 179 |
| registerEventListener | `onWriteStream` | 180 |
| registerEventListener | `onReadUpdateStream` | 181 |
| registerEventListener | `onWriteUpdateStream` | 182 |
| registerEventListener | `onReadPositionUpdateStream` | 183 |
| registerEventListener | `onWritePositionUpdateStream` | 184 |
| registerEventListener | `onUpdate` | 185 |
| registerEventListener | `onUpdateInterpolation` | 186 |
| registerEventListener | `onDraw` | 187 |
| registerEventListener | `onRegisterActionEvents` | 188 |
| registerEventListener | `onEnterVehicle` | 189 |
| registerEventListener | `onLeaveVehicle` | 190 |
| registerEventListener | `onSetBroken` | 191 |
| registerEventListener | `onVehicleCharacterChanged` | 192 |
| registerOverwrittenFunction | `setWorldPosition` | 198 |
| registerOverwrittenFunction | `setWorldPositionQuaternion` | 199 |
| registerOverwrittenFunction | `updateVehicleSpeed` | 200 |
| registerOverwrittenFunction | `getName` | 201 |
| registerOverwrittenFunction | `getFullName` | 202 |
| registerOverwrittenFunction | `getCanBeReset` | 203 |
| registerOverwrittenFunction | `getMapHotspotRotation` | 204 |
| registerOverwrittenFunction | `getShowInVehiclesOverview` | 205 |
| registerOverwrittenFunction | `periodChanged` | 206 |
| registerOverwrittenFunction | `dayChanged` | 207 |
| registerOverwrittenFunction | `getImageFilename` | 208 |
| registerOverwrittenFunction | `showInfo` | 209 |
| registerOverwrittenFunction | `deleteVehicleCharacter` | 210 |
| registerOverwrittenFunction | `getCanBeSold` | 211 |
| registerOverwrittenFunction | `getInteractionHelp` | 212 |
